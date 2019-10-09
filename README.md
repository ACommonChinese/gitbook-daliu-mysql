# gitbook-daliu-mysql
mysql学习记录

SQL语句分类(SQL语句不区分大小写)：
1. DML（Data Manipulation Language，数据操作语言）比如：insert  update  delete
2. DDL (Data Definition Language, 数据定义语言) 比如：create  alter  drop  truncate
3. DCL (Data Control Language， 数据控制语言，为数据库用户授权) 比如：grant  revoke
4. 事务控制：比如：commit  rollback  savepoint

![](images/2.png)
![](images/3.png)

MySQL数据库的一个实例(Server Instance)可以同时包含多个数据库，查看当前实例下包含的数据库：

```
show databases;
```

常用MySQL命令：
**注：**SQL关键字不区分大小写，create和CREATE同义，但标识符区分。标识符可用于定义表名、列名、也可用于定义变量。标识符必须以字符开头，可包含字母、数字和三个特殊字符(# _ $)， 建议以`_`连接多个单词。

```java
mysql> mysql -u [username] -p  // 然后输入密码
mysql> create database [IF NOT EXISTS] 数据库名; // 创建数据库
mysql> drop database 数据库名; // 删除数据库
mysql> use 数据库名; // 进入指定数据库
mysql> show tables; // 查看当前数据库下多少个表格
mysql> desc 表名; // 查看表结构


mysql> create table if not exists student(id varchar(256), name varchar(256), score float, class text); // 创建名为student的表格, MySQL使用information_schema数据库里的TABLES表保存数据库实例中的所有数据表
mysql> create table student_copy as select * from student; // 使用子查询建
表，新表student_copy的表结构和数据与student相同


mysql> alter table student add sex int default 1; // 为表student添加新列sex, 默认值为1, 这会让现有所有行增加sex为1，add增加列定义必须是原表中不存在的
mysql> alter table student add(hometown text, height float default 0.0); // 增加hometown和height两列，由于hometown未指定默认值，因此为NULL
mysql> alter table student modify name text; // 修改name类型为text, modify修改的列名必须是原表中已存在的
mysql> alter table student drop score; // 删除列score
mysql> alter table student rename to my_student; // 修改表名student -> my_student
mysql> alter table my_student change name student_name varchar(256); // 修改列名name -> student_name


mysql> drop table student_copy; // 删除表格student_copy, 表结构，表对象，表数据，相关索引，约束全删除
mysql> truncate student; // 清空表数据，MySQL:如果该表被外键约束参照，truncate会变成delete操作
```