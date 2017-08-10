#connect to wifi
iwconfig
iwlist scan
wpa_supplicant -i wlp2s0f0 -c <(wpa_passphrase [SSID] [PASSPHRASE])
dhcp wlp2s0f0
git remote set-url origin git+ssh://git@github.com/harshalbhatia/chotu.git

#toilet libcaca
git commit -m  "$(date +%Y%m%d)"
git clone ssh://root@198.199.121.120:17/home/git/alldev.git
git remote -v
git remote set-url origin ssh://root@198.199.121.120:17/home/git/alldev.git
