# alter

```sqL
# 修改列名
alter table relation_student_course change id course_id varchar(255);
```

修改列名，各个数据库不一样：
oracle: ALTER TABLE 表名 RENAME COLUMN 列名 TO 新列名
sqlserver:exec sp_rename '[表名].[列名]','[表名].[新列名]'
mysql:ALTER TABLE 表名 CHANGE 列名 新列名 列类型