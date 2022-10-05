### Error
```
Troubleshooting
If you receive an error, similar to this one:
SQL: DELETE FROM nagios_logentries WHERE logentry_time < FROM_UNIXTIME(1293570334)
SQL: SQL Error [ndoutils] :</b> Table './nagios/nagios_logentries' is marked as
crashed and last (automatic?) repair failedCLEANING ndoutils TABLE 'notifications'...
```

### Documents
```
https://assets.nagios.com/downloads/nagiosxi/docs/Repairing_The_Nagios_XI_Database.pdf
https://support.nagios.com/kb/article/nagios-xi-crashed-database-tables-24.html
https://www.skynats.com/blog/fixing-event-data-getting-stale-in-nagios/
```

-------------------------------------------------------------------------------------
### Fix
- Check 
```
awk '/"nagiosxi" => array\(/{getline;print}' /usr/local/nagiosxi/html/config.inc.php
```

```
sudo su
/usr/local/nagiosxi/scripts/repair_databases.sh
```

```
sudo su
systemctl stop mysql.service
cd /var/lib/mysql/nagios
myisamchk -r -f nagios_<corrupted_table>
systemctl start mysql.service
rm -f /usr/local/nagiosxi/var/dbmaint.lock
php /usr/local/nagiosxi/cron/dbmaint.php
```

```
sudo su
service nagios stop
service ndo2db stop
service mysqld stop
/usr/local/nagiosxi/scripts/repairmysql.sh nagios
```

```
sudo su
cd /tmp
wget http://assets.nagios.com/downloads/nagiosxi/patches/dbmaint.zip
unzip dbmaint.zip
chmod +x dbmaint.php
cp dbmaint.php /usr/local/nagiosxi/cron
```

```
sudo su
service mysqld start
rm -f /usr/local/nagiosxi/var/dbmaint.lock
/usr/local/nagiosxi/cron/dbmaint.php
```

```
sudo su
service ndo2db start
service Nagios start
```

```
sudo su
service mysqld stop
cd /var/lib/mysql/nagios
myisamchk -r -f nagios_<corrupted_table>
service mysqld start
rm -f /usr/local/nagiosxi/var/dbmaint.lock /usr/local/nagiosxi/cron/dbmaint.php
```














