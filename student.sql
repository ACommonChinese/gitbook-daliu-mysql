DROP TABLE student;

CREATE TABLE IF NOT EXISTS student(
	id int auto_increment primary key,
	name varchar(255),
	sdept varchar(255),
	score float,
	class varchar(255)
);

INSERT INTO student(name, sdept, score, class) values("李小龙", "历史系", 99, "高一"),
("李小龙","地理系", 99, "高一7班");
("刘德华","数学系", 90, "高一5班"),
("刘德华","历史系", 98, "高一7班"),
("刘方振","物理系", 100, "高一2班"),
("李连杰","外语系", 69, "高一8班"),
("张三丰","文学系", 77, "高一4班"),
("成龙","历史系", 88, "高一7班"),


SELECT * FROM student;