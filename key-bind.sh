#!/usr/bin/bash


sudo su
echo -e "[ids]" >>/etc/keyd/default.conf
echo -e "" >>/etc/keyd/default.conf
echo -e "*" >>/etc/keyd/default.conf
echo -e "" >>/etc/keyd/default.conf
echo -e "[main]" >>/etc/keyd/default.conf
echo -e "" >>/etc/keyd/default.conf
echo -e "capslock = overload(control, esc)" >>/etc/keyd/default.conf
echo -e "" >>/etc/keyd/default.conf
echo -e "alt = layer(nav)" >>/etc/keyd/default.conf
echo -e "" >>/etc/keyd/default.conf
echo -e "[nav]" >>/etc/keyd/default.conf
echo -e "" /default.conf >>/etc/keyd
echo -e "h = left" >>/etc/keyd/default.conf
echo -e "j = down" >>/etc/keyd/default.conf
echo -e "k = up" >>/etc/keyd/default.conf
echo -e "l = right" >>/etc/keyd/default.conf
