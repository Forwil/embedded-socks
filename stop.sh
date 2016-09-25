#/bin/ash
iptables -t nat -D prerouting_rule $1  -v

