## Note
- Theo mặc định thì các FireWall, nó đều **deny** hết.
- Phần **Ping** cũng tương tự như vậy. Đó là lý do tại sao khi mình connect LAN trực tiếp với Pfsense thì từ *PC ping không được tới Pfsense*, nhưng từ *Pfsense lại ping đc tới PC*.
- Để có thể thực hiện câu lệnh Ping,  thì mình add thêm **Rules** cho pfsense.

### Mình cần thực hiện add thêm protocol ICMP cho cả WAN và LAN của pfsense.



