#!/bin/bash
# Modify default IP
sed -i 's/192.168.1.1/192.168.1.9/g' package/base-files/files/bin/config_generate
# Timezone
sed -i "s/timezone='UTC'/timezone='CST-8'/" package/base-files/files/bin/config_generate
sed -i "/timezone='CST-8'/a set system.@system[-1].zonename='Asia/Shanghai'" ./package/base-files/files/bin/config_generate
# firewall custom
echo "iptables -t nat -I POSTROUTING -o eth0 -j MASQUERADE" >> package/network/config/firewall/files/firewall.user
#修改版本号
sed -i 's/OpenWrt/Bobotoy AutoBuild $(TZ=UTC-8date "+%Y.%m.%d") @ OpenWrt/g' package/lean/default-settings/files/zzz-default-settings

#添加额外软件包
#git clone https://github.com/lisaac/luci-app-dockerman.git package/luci-app-dockerman
#svn co https://github.com/bin20088/openwrt-package/trunk/package/brook package/brook
#svn co https://github.com/bin20088/openwrt-package/trunk/package/chinadns-ng package/chinadns-ng
#svn co https://github.com/bin20088/openwrt-package/trunk/package/tcping package/tcping
#git clone https://github.com/tty228/luci-app-serverchan.git package/luci-app-serverchan
#git clone https://github.com/bin20088/luci-app-koolddns.git package/luci-app-koolddns
#赋予koolddns权限
#chmod 0755 package/luci-app-koolddns/root/etc/init.d/koolddns
#chmod 0755 package/luci-app-koolddns/root/usr/share/koolddns/aliddns
#./scripts/feeds update -a
#./scripts/feeds install -a
