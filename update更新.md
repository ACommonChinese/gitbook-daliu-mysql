# update更新

```
# 把所有行的name改为'孙悟空'
mysql> update student set name = '孙悟空';

# 改多列
mysql> update student set name = '孙悟空', score = 100;

mysql> update student set name = '猪八戒' where score <= 90;
```

