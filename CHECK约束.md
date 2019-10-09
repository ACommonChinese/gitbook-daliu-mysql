# CHECK约束

```sql
mysql> create table employee(
    -> id int auto_increment,
    -> name varchar(255),
    -> salary decimal,
    -> primary key(id),
    -> # 建立CHECK约束, 对于MySQL无效，需要使用触发器解决这种需求
    -> check(salary>0)
    -> );
```