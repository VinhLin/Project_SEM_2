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
```

-------------------------------------------------------------------------------------
### Fix
```
sudo su
/usr/local/nagiosxi/scripts/repair_databases.sh
```


