SELECT pboard_no, pboard_subject, pboard_content, pboard_date, pboard_category
FROM PICBOARD
ORDER BY pboard_no;

CREATE TABLE picCategory (
	pcate_rname	varchar2(30)	NOT NULL PRIMARY key,
	pcate_name	varchar2(30)	NOT NULL
);
DROP TABLE picCategory;
COMMIT;

INSERT ALL 
INTO picCategory(pcate_rname,pcate_name) values('hansik','한식')
INTO picCategory(pcate_rname,pcate_name) values('joongsik','중식')
INTO picCategory(pcate_rname,pcate_name) values('yangsik','양식')
INTO picCategory(pcate_rname,pcate_name) values('ilsik','일식')
INTO picCategory(pcate_rname,pcate_name) values('bunsik','분식')
INTO picCategory(pcate_rname,pcate_name) values('dessert','디저트')
INTO picCategory(pcate_rname,pcate_name) values('chicken','치킨')
INTO picCategory(pcate_rname,pcate_name) values('pizza','피자')
INTO picCategory(pcate_rname,pcate_name) values('asiafood','아시아음식')
INTO picCategory(pcate_rname,pcate_name) values('fastfood','패스트푸드')
SELECT * FROM DUAL;

SELECT * FROM picCategory;

SELECT pboard_no, pboard_subject, pboard_content, pboard_date, pboard_category, pcate_name
FROM PICBOARD b, picCategory c
WHERE b.pboard_category = c.PCATE_RNAME 
ORDER BY pboard_no DESC;