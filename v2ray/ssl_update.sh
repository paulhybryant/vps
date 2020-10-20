#!/usr/bin/env bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

v2ray_qr_config_file="/usr/local/vmess_qr.json"
# domain=$(grep '\"add\"' $v2ray_qr_config_file | awk -F '"' '{print $4}')


systemctl stop nginx &> /dev/null
sleep 1
"/root/.acme.sh"/acme.sh --cron --home "/root/.acme.sh" &> /dev/null
# "/root/.acme.sh"/acme.sh --installcert -d ${domain} --fullchainpath /data/v2ray.crt --keypath /data/v2ray.key --ecc
"/root/.acme.sh"/acme.sh --installcert \
  -d xn--4gqp3kj4hgvhbnaj0m7o1g.tk \
  -d www.xn--4gqp3kj4hgvhbnaj0m7o1g.tk \
  -d aria2.xn--4gqp3kj4hgvhbnaj0m7o1g.tk \
  -d baidupcs.xn--4gqp3kj4hgvhbnaj0m7o1g.tk \
  -d calibre.xn--4gqp3kj4hgvhbnaj0m7o1g.tk \
  -d nextcloud.xn--4gqp3kj4hgvhbnaj0m7o1g.tk \
  -d zsxq.xn--4gqp3kj4hgvhbnaj0m7o1g.tk \
  --fullchainpath /data/v2ray.crt --keypath /data/v2ray.key --ecc
sleep 1
systemctl start nginx &> /dev/null
