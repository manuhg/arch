#to update packages from yaourt
yaourt -Syu --aur --noconfirm
#connect to wifi
iwconfig
iwlist scan
wpa_supplicant -i wlp2s0f0 -c <(wpa_passphrase [SSID] [PASSPHRASE])
dhcp wlp2s0f0

git config --global pack.windowMemory "50m"
git config --global pack.SizeLimit "100m" 
git config --global pack.threads "1"
git config --global pack.window 2
#git repack --window 2 --window-memory "50m"

#toilet libcaca
git commit -m  "$(date +%Y%m%d)"
#for vps
git clone ssh://gk1000@198.199.121.120:17/home/git/arch.git
git remote -v
git remote set-url origin ssh://gk1000@198.199.121.120:17/home/gk1000/arch.git
#for github.com
git remote add origin ssh://git@github.com/gk1000/unmin-coinhive.git
git push -u origin master
#or for github
git remote add origin git@github.com:gk1000/DCNlab.git
#to remove
git remote remove origin

#multiple push locs
git remote set-url origin --push --add <a remote>
git remote set-url origin --push --add <another remote>

#You can configure multiple remote repositories with the git remote command:
git remote add alt alt-machine:/path/to/repo
git remote add origin ssh://198.199.121.120:17/home/gk1000/scripts.git 
git remote add alt https://gk1000@bitbucket.org/gk1000/scripts.git
#To fetch from all the configured remotes and update tracking branches, but not merge into HEAD, do:
git remote update
#To fetch the master branch from alt and pull it into your current head, do:
git pull alt master

git fsck
git gc
git repack -adf --window=200 --depth=200

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

#view hidden files dolphin 
Alt .

modprobe nbd
qemu-nbd -c /dev/nbd0 /media/gk1000/1010/Virtual/ta.vdi
cryptsetup luksOpen /dev/nbd0 cryptEd
mount /dev/mapper/cryptEd /mnt
umount /mnt
cryptsetup luksClose  cryptEd
qemu-nbd -d /dev/nbd0

