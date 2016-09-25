#/bin/ash
iptables -t nat -L REDSOCKS -n
iptables -t nat -L REDSOCKS2 -n
iptables -t nat -L prerouting_rule -n
