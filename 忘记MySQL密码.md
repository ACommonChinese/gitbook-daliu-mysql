# 忘记MySQL密码

如果不小心忘记MySQL密码，可以如下更改（以MacOS为示例）

忘记MySQL密码:
参考: [https://www.jianshu.com/p/8b8a2d0a2051](https://www.jianshu.com/p/8b8a2d0a2051)

1. `sudo vim /etc/my.cnf`  在mysqld下添加: `skip-grant-tables`并保存
2. 点击电脑端系统偏好设置中的MySQL图标并输入电脑密码开启MySQL
3. `mysql -u root -p` 不需要密码直接按回车
4. 使用sql语句修改密码:
```sql
# 示例:
mysql> update mysql.user set authentication_string=password('110') where user='root';
```
5. 重新编辑 `/etc/my.cnf`删除刚加入的`skip-grant-tables`, 重启MySQL

上面的`/etc/my.cnf`是MySQL的配置文件，查看MySQL的配置文件路径可能通过命令：

```sql
如果不清楚MySQL当前使用的配置文件路径，可以尝试这样查看:
[mysql@linuxtest ~]$ mysqld --verbose --help|grep -A 1 'Default options'
或者是执行：
[mysql@linuxtest ~]$ mysql --verbose --help|grep -A 1 'Default options'
```