#connect to wifi
iwconfig
iwlist scan
wpa_supplicant -i wlp2s0f0 -c <(wpa_passphrase [SSID] [PASSPHRASE])
dhcp wlp2s0f0

#toilet libcaca
git commit -m  "$(date +%Y%m%d)"
git clone ssh://gk1000@198.199.121.120:17/home/git/arch.git
git remote -v
git remote set-url origin ssh://gk1000@198.199.121.120:17/home/gk1000/arch.git
#or for github
git remote add origin git@github.com:gk1000/DCNlab.git
#to remove
git remote remove origin

#to encrypt
encfs unencrypted_dir encrypted_dir
#to decrypt
encfs encrypted_dir unencrypted_dir
#to umount to send back to encrypted state
fusermount -u /~/unencrypted_dir
#find group of a user
groups gk1000

#gpg
gpg --cipher-algo aes256 -c xyz.tar
gpg -ac something.txt  # creates ASCII armored output
gpg -d something.txt.asc 
gpg -o xyz.tar -d xyz.tar.gpg
gpg --use-embedded-filename xyz.gpg
#for key gen entropy
rngd -r /dev/urandom

# dd
dd if=blah.iso of=/dev/sdd bs=4M status=progress && sync

#To prevent history from recording duplicated entries (such as ls -l entered many times during single shell session), the hist_ignore_all_dups option can be set:

setopt hist_ignore_all_dups
#A useful trick to PREVENT particular entries from being recorded into a history by preceding them with at least one space.

setopt hist_ignore_space
#if tzfiles get screwed up
pacman -S tzdata
# to set timezone more easily
tzselect

#mem used by chrome
ps -A --sort -rss -o comm,rss | grep docker | awk '{ sum+=$2} END { print sum/1024 } '
#copy prev command
echo "$!!" | pbcopy
#resilio sync
systemctl start rslsync

#hash sum mismatch ubuntu
rm /var/lib/apt/lists

#
