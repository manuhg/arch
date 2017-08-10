#connect to wifi
iwconfig
iwlist scan
wpa_supplicant -i wlp2s0f0 -c <(wpa_passphrase [SSID] [PASSPHRASE])
dhcp wlp2s0f0
git remote set-url origin git+ssh://git@github.com/harshalbhatia/chotu.git

#toilet libcaca
git commit -m  "$(date +%Y%m%d)"
git clone ssh://gk1000@198.199.121.120:17/home/git/arch.git
git remote -v
git remote set-url origin ssh://gk1000@198.199.121.120:17/home/gk1000/arch.git

#for key gen entropy
rngd -r /dev/urandom

#to decrypt
encfs encrypted_dir unencrypted_dir
#to encrypt
encfs unencrypted_dir encrypted_dir

#find group of a user
groups gk1000

#gpg
gpg --cipher-algo aes256 -c xyz.tar
gpg -o xyz.tar -d xyz.tar.gpg
gpg --use-embedded-filename xyz.gpg