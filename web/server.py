import web
import os
import re
urls = (
	'/', 'list',
	'/list','list',
	'/add','add',
	'/remove','remove'
)

app = web.application(urls, globals())
render = web.template.render("/root/web/templates/")

def get_now_ip_list():
	s = os.popen("iptables -t nat -L prerouting_rule -n").read().split("\n")[2:]
	l = []
	count = 0
	for i in s:
		count += 1
		i = re.sub(" +"," ",i).split(" ")
		if len(i) > 3:
			item = {}
			item["order"] = count 
			item["target"] = i[0]
			item["prot"] = i[1]
			item["ip"] = i[3]
			l.append(item)
	return l

def is_in_ip_list(ip):
	for i in get_now_ip_list():
		if i["ip"] == ip:
			return True
	return False

class list:
	def GET(self):
		nowip = web.ctx.ip
		iplist = get_now_ip_list()
		flag = is_in_ip_list(nowip) 
		return render.list(nowip,iplist,flag)

class add:
	def GET(self):
		input = web.input()
		if "ip" in input and "target" in input:
			ip = input["ip"]
			target = input["target"]
			if target == "GFW":
				group = "REDSOCKS"
			else:
				group = "REDSOCKS2"
			os.popen("/root/start.sh " + ip + " " + group) 
		raise web.seeother("/list")

class remove:
	def GET(self):
		input = web.input()
		if "order" in input:
			order = input["order"]
			os.popen("/root/stop.sh " + str(order))
		raise web.seeother("/list")
if __name__ == "__main__":
	app.run()
