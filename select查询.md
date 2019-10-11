# select查询

```sql
mysql> select * from student;
mysql> select name from student where score > 90;
mysql> select name, score+5 from student;
mysql> select * from student where score * 2 > 180;

# 注：如果在这种算术表达式中使用null, 将导致整个结果为null
mysql> select concat('中国', name) from student;
+------------------------+
| concat('中国', name)   |
+------------------------+
| 中国刘威振             |
| 中国刘方振             |
| 中国李小龙             |
+------------------------+

mysql> select concat('中国', name, null) from student;
+------------------------------+
| concat('中国', name, null)   |
+------------------------------+
| NULL                         |
| NULL                         |
| NULL                         |
+------------------------------+
```

**别名**

```sql
mysql> select score+5 as SCORE_PLUS_5 from student;
+--------------+
| SCORE_PLUS_5 |
+--------------+
|          105 |
|          105 |
|          104 |
+--------------+

mysql> select * from student;
+----+-----------+-------+------------+
| id | name      | score | class      |
+----+-----------+-------+------------+
|  1 | 刘威振    |   100 | 高一3班    |
|  2 | 刘方振    |   100 | 高一2班    |
|  7 | 李小龙    |    99 | 高一7班    |
+----+-----------+-------+------------+

mysql> select name NAME, score+5 分数加5后 from student;
+-----------+---------------+
| NAME      | 分数加5后     |
+-----------+---------------+
| 刘威振    |           105 |
| 刘方振    |           105 |
| 李小龙    |           104 |
+-----------+---------------+

# 别名中如果包括单引号字符，可以把别名用双引号引起来
mysql> select id+5 "My'id'" from student;
+--------+
| My'id' |
+--------+
|      6 |
|      7 |
|     12 |
+--------+

# 也可以为表起别名
mysql> select name 学生名, score+5 分数加5后 from student 学生表;
+-----------+---------------+
| 学生名    | 分数加5后     |
+-----------+---------------+
| 刘威振    |           105 |
| 刘方振    |           105 |
| 李小龙    |           104 |
+-----------+---------------+

# 列名可以当成变量处理，所以运算符可以在多列之间进行运算
mysql> SELECT * FROM student;
+----+-----------+-------+------------+
| id | name      | score | class      |
+----+-----------+-------+------------+
|  1 | 刘威振    |   100 | 高一3班    |
|  2 | 刘方振    |   100 | 高一2班    |
|  3 | 刘德华    |    90 | 高一5班    |
|  4 | 李连杰    |    69 | 高一8班    |
|  5 | 张三丰    |    77 | 高一4班    |
|  6 | 成龙      |    88 | 高一7班    |
|  7 | 李小龙    |    99 | 高一7班    |
+----+-----------+-------+------------+

mysql> select id 编号, concat(name, class) 姓名班级 from student;
+--------+---------------------+
| 编号   | 姓名班级            |
+--------+---------------------+
|      1 | 刘威振高一3班       |
|      2 | 刘方振高一2班       |
|      3 | 刘德华高一5班       |
|      4 | 李连杰高一8班       |
|      5 | 张三丰高一4班       |
|      6 | 成龙高一7班         |
|      7 | 李小龙高一7班       |
+--------+---------------------+

# 甚至可以不出现列名
mysql> select 5+4
    -> from student
    -> where true;
+-----+
| 5+4 |
+-----+
|   9 |
|   9 |
|   9 |
|   9 |
|   9 |
|   9 |
|   9 |
+-----+

# 去重
# 如果name和score都相同，则只选一个
mysql> select distinct name, score from student;

# 如果所有列全一样，则去重
mysql> select distinct * from student;
```

**where**

where表达式中可以使用`> >= < <= <>`等基本比较运算符。SQL中赋值运算符是：`:=`, 其他常用运算符：

```
xx between xx and xx
xx in(xx, xx, xx, ...)
like
is null
```

```
# and
mysql> select * from student where score between 80 and 100;
mysql> select * from student where 2 between id and score;

# in
mysql> select * from student where score in(80, 100);
mysql> select * from student where 2 in(id, score);

# like
mysql> select * from student where name like '李%'; # 以李开头
mysql> select * from student where name like '刘_'; # 以刘开头，后跟一个字符
mysql> select * from student where name like '刘__'; # 以刘开头，后跟两个字符 
mysql> select * from student where name like '__'; # 两个字符
mysql> select * from student where name like '\_%'; # 以下划线_开头，MySQL使用\转义，标准SQL使用关键字escape转义
mysql> select * from student where name like '\_%' escape '\'; # 标准SQL，MySQL不支持
mysql> select * from student where name is null; # 不可使用=null, SQL中null=null返回null
mysql> select * from student where name like '\_%' and score > 25;
mysql> select * from student where (id > 3 or name > '李') and score > 70;

# asc可以省略，即默认也是升序
mysql> select * from student order by score asc; 

# 降序查询
mysql> select * from student order by score desc;

# score降序，name升序(name后面的asc省略了)
mysql> select * from student order by score desc, name;

# 嵌套查询
mysql> select name from student where score in 
				(select score from student2 where score > 90);

mysql> select score from student where name in 
    -> (select name from student2);

# 查询和‘刘威振’在同一个系中的同学
mysql> select name, sdept 
    -> from student
    -> where sdept in
    ->    (select sdept from student where name='刘威振');
这相当于：mysql> select name, sdept from student where student.name="李小龙";

假设有3张表，其中学生表：
mysql> select * from student;
+----+-----------+-------+
| id | name      | score |
+----+-----------+-------+
| 1  | 刘威振    |   100 |
| 2  | 张三丰    |    99 |
| 3  | 王五      |    88 |
+----+-----------+-------+

学生-课程 关系表：
mysql> select * from sc;
+------------+-----------+
| student_id | course_id |
+------------+-----------+
| 1          | 2008      |
| 2          | 2007      |
| 3          | 2008      |
+------------+-----------+

课程表：
mysql> select * from course;
+------+--------------+
| id   | name         |
+------+--------------+
| 2008 | 信息系统     |
| 2007 | 历史系       |
+------+--------------+

从学生表中选择选修“信息系统”的学号和姓名：

select id, name from student where id in
    (select student_id from sc where course_id in 
    		(select id from course where name='信息系统')
    );

上面的查询可以使用连接查询实现：
mysql> select student.id, student.name from student, sc, course where
    -> student.id=sc.student_id and
    -> sc.course_id=course.id and
    -> course.name="信息系统";
```


**谓词**

常用谓词子查询：

| >ANY          | 大于子查询结果中的某个值                     |
| ------------- | -------------------------------------------- |
| >ALL          | 大于子查询结果中的所有值                     |
| <ANY          | 小于子查询结果中的某个值                     |
| <ALL          | 小于子查询结果中的所有值                     |
| >=ANY         | 大于等于子查询结果中的某个值                 |
| >=ALL         | 大于等于子查询结果中的所有值                 |
| <=ALL         | 小于等于子查询结果中的所有值                 |
| <=ANY         | 大于等于子查询结果中的某个值                 |
| =ANY          | 等于子查询结果中的某个值                     |
| =ALL          | 等于子查询结果中的所有值（通常没有实际意义） |
| !=（或<>）ANY | 不等于子查询结果中的某个值                   |
| !=（或<>）ALL | 不等于子查询结果中的任何一个值               |

查询非计算机科学系中比计算机科学系任意一个学生年龄小的学生姓名和年龄：

```sql
mysql> select name, age from student
    -> where age < any (select age from student where sdept='计算机系')
    -> and sdept <> '计算机系';
```

也可以使用内置函数实现：

```sql
mysql> select name, age from student
    -> where age < 
    -> (select min(age) from student where sdept='计算机系')
    -> and sdept <> '计算机系';
```

**子查询**

子查询是指在查询语句中嵌套另一个查询，子查询可支持多层嵌套。

示例：

```sql
mysql> select * 
		-> # 可以把子查询当成数据表（更准确的说是视图）
    -> from (select * from teacher) t
    -> where t.id>3;
```

选出比李连杰考试分数多的学生

```sql
mysql> select * from student where score >
    -> (select score from student where name="李连杰");
```

选出考试成绩大于平均分的学生

```sql
mysql> select * from student where score >
    -> (select avg(score) from student);
```

选出学生编号和老师编号相同的学生

```sql
# =any和in的效果相同，因此下面的in也可换成=any
mysql> select * from student where id in
    -> (select id from teacher);
```

`<ANY`只要小于最大值即可，`>ANY`只要大于最小值即可。
`<ALL`要求小于最小值，`>ALL`要求大于最大值。


选出学生编号大于所有老师编号的学生

```sql
mysql> select * from student
    -> where id > 
    -> all(select id from teacher);
```

选出学号和姓名与老师的编号与姓名相同的学生

```sql
mysql> select * from student where(id, name)=
    -> any(select id, name from teacher);
```

**带有EXISTS谓词的子查询**

带有EXISTS 谓词的子查询不返回任何数据，只产生逻辑真值“true”或逻辑假值“false”

```sql
# 查询所有选修了1号课程的学生姓名
mysql> select name from student
    -> where exists
    -> (select * from course where student_id=student.id and course_id="1");
```

使用存在量词EXISTS后，若内层查询结果为空，则外层的WHERE子句返回真值，否则返回假值。

```
# 查询没有选修1号课程的学生姓名
mysql> select name from student 
    -> where not exists
    -> (select * from course where student_id=student.id and course_id="1");
```

```
# 查询选修了全部课程的学生姓名
# 即：查询这样的学生姓名：不存在一门他没有选修的课
mysql> select name from student
    -> where not exists
    -> (select * from course
    -> where not exists 
    -> (select * from relation_student_course where student_id=student.id and course_id=course.id)
    );
```

