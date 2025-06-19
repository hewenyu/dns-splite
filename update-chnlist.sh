#!/bin/bash

rm -rf ./smartdns/chnlist.conf
rm -rf ./smartdns/accelerated-domains.china.conf

# 1. 下载最新版 accelerated-domains.china.conf
wget -O ./smartdns/accelerated-domains.china.conf https://github.com/felixonmars/dnsmasq-china-list/raw/master/accelerated-domains.china.conf

# 2. 转换为 SmartDNS 格式
grep '^server=/' ./smartdns/accelerated-domains.china.conf | \
  sed -E 's#^server=/([^/]+)/.*$#nameserver /\1/cn#' \
  > ./smartdns/chnlist.conf


rm -rf ./smartdns/accelerated-domains.china.conf

echo "转换完成，已生成 smartdns/chnlist.conf"