# 导入sql脚本

### 导入SQL脚本

可以把多个SQL语句写入一个文件中，并导入这个SQL脚本文件：

假如文件路径：`/Users/daliu/Desktop/test.sql`, 内容是：

```sql
insert into student values("3","王小明", 300, "1-4"); // SQL中的字符串也可以用单引号
```

通过命令行导入这个文件：

```sql
mysql> use daliu; // 假设表在数据库daliu中
mysql> source /Users/daliu/Desktop/test.sql
```

source命令导入sql脚本文件，如果出现：Failed to open file 'file_name' , error: 2，先检查文件路径，然后关掉控制台，重新打开。