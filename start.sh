#/bin/ash
iptables -t nat -A prerouting_rule -s $1 -p tcp -j $2 -v

