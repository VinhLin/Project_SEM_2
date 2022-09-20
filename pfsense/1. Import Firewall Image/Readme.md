### Tham khảo
```
https://networkhunt.com/add-pfsense-firewall-in-eve-ng/
https://www.vdtutorials.com/install-pfsense-2-6-0-firewall/
https://www.eve-ng.net/index.php/3380-2/
https://www.pfsense.org/download/
```

### [Download](https://atxfiles.netgate.com/mirror/downloads/)
- Download file `pfSense-CE-memstick-serial-2.6.0-RELEASE-amd64.img.gz` về.
- Sau đó copy sang EVE-NG:
```
sudo scp pfSense-CE-memstick-serial-2.6.0-RELEASE-amd64.img.gz root@172.16.225.128:
```

### [Thực hiện cấu hình cho EVE-NG](https://www.eve-ng.net/index.php/documentation/howtos/howto-add-pfsense-fw-2-4/)
```
mkdir /opt/unetlab/addons/qemu/pfsense-2.6.0/
mv pfSense-CE-memstick-serial-2.6.0-RELEASE-amd64.img.gz /opt/unetlab/addons/qemu/pfsense-2.6.0/
cd /opt/unetlab/addons/qemu/pfsense-2.6.0/
gunzip pfSense-CE-memstick-serial-2.6.0-RELEASE-amd64.img.gz
mv pfSense-CE-memstick-serial-2.6.0-RELEASE-amd64.img install.img
/opt/qemu/bin/qemu-img create -f qcow2 virtioa.qcow2 2G
/opt/qemu/bin/qemu-system-x86_64 -hda install.img -hdb virtioa.qcow2 -nographic
```
- Tiếp theo là mình cài đặt theo [video hướng dẫn](https://www.youtube.com/watch?v=2UZp8fOeqxs).
```
Install pfSense
Guided Disk Setup (BIOS)
DOS Partitions
ada1s1b -> Finish -> Commit
```
- Đợi nó cài đặt. **Nếu cài đặt thất bại, mình xóa thư mục và làm lại các bước trên**.
- Sau khi đã cài đặt thành công thì thực hiện lệnh: `poweroff`
- Trên EVE, thực hiện tiếp các lệnh:
```
/opt/unetlab/wrappers/unl_wrapper -a fixpermissions
reboot
```
- Mình đã add vô thành công, có thấy **pfSense** trong Node. Và có thể sử dụng.



