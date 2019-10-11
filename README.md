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

SQL关键字不区分大小写，create和CREATE同义，但标识符区分。标识符可用于定义表名、列名、也可用于定义变量。标识符必须以字符开头，可包含字母、数字和三个特殊字符(# _ $)， 建议以`_`连接多个单词。

```java
mysql> mysql -u [username] -p  // 然后输入密码
mysql> create database [IF NOT EXISTS] 数据库名; // 创建数据库
mysql> drop database 数据库名; // 删除数据库
mysql> use 数据库名; // 进入指定数据库
mysql> show tables; // 查看当前数据库下多少个表格
mysql> desc 表名; // 查看表结构
```