### [Tham khảo](https://phoenixnap.com/kb/how-to-install-nginx-on-ubuntu-20-04)

### Install
```
sudo apt-get update
sudo apt-get install nginx
nginx -v
```

### Enable service
```
sudo systemctl status nginx
sudo systemctl start nginx
sudo systemctl enable nginx
```

### Thiết lập Traffic cho Nginx
```
sudo ufw app list
sudo ufw allow 'nginx full'
sudo ufw reload
```

### Sửa tên của trang web server
```
cd /var/www/html/
ls
nano index.nginx-debian.html
```


