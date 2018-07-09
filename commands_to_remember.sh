# to fix unrecognised option pacman --color=never
nano /etc/pacman.conf => uncomment "#color"
#i3 tap to click
synclient TapButton1=1
#nitrogen multi monitor support
nitrogen --force-setter=xinerama

#remove ignroing dependecny breaks
pacman -Rdd <pkg>

#DOWNGRADE GCC
downgrade gcc
#backup gnome settings
dconf dump /org/gnome/ > dconfgnome
#to load
dconf load /org/gnome/ < dconfgnome
#to update packages from yaourt
yaourt -Syu --aur --noconfirm
#connect to wifi
iwconfig
iwlist scan
wpa_supplicant -i wlp2s0f0 -c <$(wpa_passphrase [SSID] [PASSPHRASE])
dhcp wlp2s0f0

##########################################################################################################################
#grub
rw init=/bin/bash

#Using a LiveCD
#With a LiveCD a couple methods are available: change root and use the passwd command, or erase the password field entry directly editing the password file. Any Linux capable LiveCD can be used, albeit to change root it must match your installed architecture type. Here we only describe how to reset your password with chroot, since manual editing the password file is significantly more risky.

#Change root
#Boot the LiveCD and mount the root partition of your main system.
#Use the

passwd --root MOUNT_POINT USER_NAME command #to set the new password (you won't be prompted for an old one).

#Unmount the root partition.
#Reboot, and enter your new password. If you can't remember it, go to step 1.
#Using GRUB to invoke bash
#Select the appropriate boot entry in the GRUB menu and press e to edit the line.
#Select the kernel line and press e again to edit it.
#Append
init=/bin/bash # at the end of line.
#Press Ctrl-X to boot (this change is only temporary and will not be saved to your menu.lst). After booting you will be at the bash prompt.
#Your root file system is mounted as readonly now, so remount it as read/write mount -n -o remount,rw /.
#Use the passwd command to create a new root password.
#Reboot by typing
reboot -f #and do not lose your password again!
##########################################################################################################################

#copy based on checksum, preserve perms
rsync -rcpv dir1 dir2

scp -P 22 -r user@server:~/dir ~/dir
#crontab
0 1,12 * * * /usr/bin/certbot renew --quiet

#changes made in resp commits
git log -p

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

#push to all branches
git remote | xargs -L1 git push --all
git config  --global alias.pushall '!git remote | xargs -L1 git push'

#push to all pull only from origin
git remote add origin https://exampleuser@example.com/path/to/repo1
git remote set-url --push --add origin https://exampleuser@example.com/path/to/repo1
####################################################################################
##########recursive clone###########################################################
####################################################################################
#With version 1.9 of Git and later, you can even download the submodules simultaneously:

git clone --recursive -j8 git://github.com/foo/bar.git
cd bar
#Editor's note: simultaneously in this case means: in parallel; that is,
#-j8 is an optional performance optimization that fetches up to 8 submodules at a time in parallel - see man git-clone.
#With version 1.6.5 of Git and later, you can use:

git clone --recursive git://github.com/foo/bar.git
cd bar
#For already cloned repos, or older Git versions, just use:

git clone git://github.com/foo/bar.git
cd bar
git submodule update --init --recursive
####################################################################################
####################################################################################
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

#git submodule
git submodule add https://somerepo.git
#to encrypt
encfs unencrypted_dir encrypted_dir
#to decrypt
encfs encrypted_dir unencrypted_dir
#to umount to send back to encrypted state
fusermount -u /~/unencrypted_dir
#find group of a user
groups gk1000

#xz
xz -z9ef something.tar

#gpg
gpg --recv-keys --keyserver hkp://pgp.mit.edu 6689E64E3D3664BB

gpg --cipher-algo aes256 -c xyz.tar
gpg -ac something.txt  # creates ASCII armored output
gpg -d something.txt.asc
gpg -o xyz.tar -d xyz.tar.gpg
gpg --use-embedded-filename xyz.gpg
#for key gen entropy
rngd -r /dev/urandom
chown root $(tty) # in case of permission denied
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
echo "!!" | pbcopy
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

#install from file offline
pacman -U blah.tar.gz
#optimize database access speed#
pacman -Sc && pacman-optimize
#
#+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-#
#+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-#
## DANGER ZONE ##
##Removing unused packages (orphans)##

#For recursively removing orphans and their configuration files:#
pacman -Rns $(pacman -Qtdq)
#If no orphans were found, pacman errors with error: no targets specified. This is expected as no arguments were passed to pacman -Rns.
#Note: The arguments -Qt list only true orphans. To include packages which are optionally required by another package, pass the -t flag twice (i.e., -Qtt).

##Removing everything but base group##
#If it is ever necessary to remove all packages except the base group, try this one liner:#
pacman -R $(comm -23 <(pacman -Qq | sort) <((for i in $(pacman -Qqg base); do pactree -ul "$i"; done) | sort -u))
##
ufw allow from 106.51.0.0/16 to any port 17
iptables -A INPUT -p tcp -m tcp --dport 17 --src 106.51.0.0/16 -j ACCEPT
iptables -A INPUT -m string --algo bm  --string "ZmEu" -j DROP
