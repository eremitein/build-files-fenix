time (

bash /lib/udev/init-net-rules.sh
cat /etc/udev/rules.d/70-persistent-net.rules

) &> $0.log
xz -f $0.log
