#!/bin/bash

/usr/bin/echo "=========================================FIREWALLSINFO=========================================" > /tmp/systeminfo
/usr/bin/systemctl disable firewalld
/usr/bin/systemctl stop firewalld
/usr/bin/systemctl status firewalld >> /tmp/systeminfo
/usr/sbin/iptables -F
/usr/sbin/sestatus >> /tmp/systeminfo

/usr/bin/echo "=========================================HOSTNAME SETUP========================================" >> /tmp/systeminfo
/usr/bin/echo "server1.ashok.ins.com" > /etc/hostname
/usr/bin/echo "192.168.1.141	server1.ashok.ins.com	server1" > /etc/hosts
/usr/bin/cat /etc/hostname >> /tmp/systeminfo
/usr/bin/cat /etc/hosts >> /tmp/systeminfo

/usr/bin/echo "=========================================NETWORK SETUP================================" >> /tmp/systeminfo
/usr/bin/cat /tmp/nicduplicate > /etc/sysconfig/network-scripts/ifcfg-ens33
/usr/bin/systemctl restart network
/usr/sbin/ifconfig -a >> /tmp/systeminfo

/usr/bin/echo "=========================================SYSTEM INFO============================================" >> /tmp/systeminfo
/usr/sbin/parted -l >> /tmp/systeminfo
/usr/bin/netstat -rn >> /tmp/systeminfo
/usr/bin/df -h >> /tmp/systeminfo

/usr/bin/echo "=========================================USER INFO==============================================" >> /tmp/systeminfo
/usr/bin/cat /etc/passwd >> /tmp/systeminfo
/usr/bin/cat /etc/shadow >> /tmp/systeminfo
/usr/bin/cat /etc/group >> /tmp/systeminfo
