查看防火墙是否开启
systemctl status firewalld

若没有开启则是开启状态
systemctl start firewalld  关闭则start改为stop

查看所有开启的端口
firewall-cmd --list-ports

注：启动防火墙后，默认没有开启任何端口，需要手动开启端口

防火墙开启端口访问
firewall-cmd --zone=public --add-port=80/tcp --permanent
命令含义：  --zone #作用域    --add-port=80/tcp #添加端口，格式为：端口/通讯协议    --permanent #永久生效，没有此参数重启后失效

注：开启后需要重启防火墙才生效
