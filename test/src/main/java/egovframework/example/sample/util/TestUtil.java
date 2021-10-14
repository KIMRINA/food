package egovframework.example.sample.util;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public class TestUtil {
	
	public static String filePath = "D:\\";
    public static String fileName = "엑셀다운로드";
	
	public static void excelDownload(HttpServletResponse res, HttpServletRequest req, Map<Integer, Object[]> data)
			throws UnsupportedEncodingException {

		// 빈 Workbook 생성
		Workbook workbook = new XSSFWorkbook();

		// 빈 Sheet를 생성
		Sheet sheet = workbook.createSheet("employee data");

//        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		// Sheet를 채우기 위한 데이터들을 Map에 저장
//        Map<Integer, Object[]> data = new TreeMap<>();
//        data.put(0, new Object[]{"NO", "CATEGORY", "SUBJECT", "WRITER", "DATE"});
//        
//        for(int i=0; i<list.size(); i++) {
//			Date curDate = list.get(i).getPboard_date();
//			String newDate = format.format(curDate);
//			data.put(list.get(i).getPboard_no(), new Object[]{list.get(i).getPboard_no(), list.get(i).getPboard_category(), 
//					list.get(i).getPboard_subject(), list.get(i).getPcate_name(), newDate});
//		}

		// data에서 keySet를 가져온다. 이 Set 값들을 조회하면서 데이터들을 sheet에 입력한다.
		Set<Integer> keyset = data.keySet();
		int rownum = 0;

		// 알아야할 점, TreeMap을 통해 생성된 keySet는 for를 조회시, 키값이 오름차순으로 조회된다.
		for (Integer key : keyset) {
			Row row = sheet.createRow(rownum++);
			Object[] objArr = data.get(key);
			int cellnum = 0;
			for (Object obj : objArr) {
				Cell cell = row.createCell(cellnum++);
				if (obj instanceof String) {
					cell.setCellValue((String) obj);
				} else if (obj instanceof Integer) {
					cell.setCellValue((Integer) obj);
				}
			}
		}

		// 여기서부터는 각 브라우저에 따른 파일이름 인코딩작업
		String browser = req.getHeader("User-Agent");
		if (browser.indexOf("MSIE") > -1) {
			fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.indexOf("Trident") > -1) { // IE11
			fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.indexOf("Firefox") > -1) {
			fileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.indexOf("Opera") > -1) {
			fileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.indexOf("Chrome") > -1) {

			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < fileName.length(); i++) {
				char c = fileName.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}

			fileName = sb.toString();

		} else if (browser.indexOf("Safari") > -1) {
			fileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
		} else {
			fileName = "\"" + new String(fileName.getBytes("UTF-8"), "8859_1") + "\"";
		}

		OutputStream os = null;

		try {
			res.setHeader("Content-Disposition",
					"attachment;filename=" + new String(fileName.getBytes("euc-kr"), "8859_1") + ".xlsx");
			os = res.getOutputStream();
			workbook.write(os);
			// ((OutputStream) workbook).close();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			if (workbook != null) {
				try {
					workbook.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (os != null) {
				try {
					os.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}

	}

}
