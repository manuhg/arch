#backup gnome settings
dconf dump /org/gnome/ > dconfgnome
#to load
dconf load /org/gnome/ < dconfgnome
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




#WebGUI can be accessed via following URL: http://localhost:8888
	
#   * Running rslsync system instance (using dedicated rslsync:rslsync account)

  	#   System instance of rslsync is preconfigured (configuration file located
	#   at /etc/rslsync.conf) and can be used directly after installation.

	#   Execute:

	#     to reload system systemd modules:     
	     systemctl daemon-reload
	#     to start rslsync manually:             
	     systemctl start rslsync
	#     to autostart rslsync on system start:  
	     systemctl enable rslsync

	# * Running rslsync user instance (using current user account)

	#   User instance MUST be configured before use. To perform configuration, 
	#   install rslsync-autoconfig package or follow manual configuration steps:

  	#     1. Copy /etc/rslsync/rslsync.conf to ~/.config/rslsync/rslsync.conf for
 	#     the user you wish to configure rslsync:
 	
	       mkdir -p ~/.config/rslsync	
	       cp /etc/rslsync.conf ~/.config/rslsync/rslsync.conf
 
	#     2. Replace user-specific references with the appropriate information,
	#     including the following settings:
 
	#       - storage_path
	#       - pid_file
	#       - webui.listen
	#       - webui.login
	#       - webui.password

	#     3. Make sure folder you specified as storage_path and folder where pid_file will
	#     be located both exist in the filesystem, since rslsync will not create it for you.

	#   Execute:

	#     to reload user systemd modules:       
	systemctl --user daemon-reload
	#     to start rslsync manually:             
	systemctl --user start rslsync
	#     to autostart rslsync on user login:    
	systemctl --user enable rslsync
#+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-#
#+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-#
ufw allow from 106.51.0.0/16 to any port 17
iptables -A INPUT -p tcp -m tcp --dport 17 --src 106.51.0.0/16 -j ACCEPT
iptables -A INPUT -m string --algo bm  --string "ZmEu" -j DROP


#Tab
#Auto complete
^a
#Beginning of line
^e
#End of line
^f
#Forward one character
^b
#Back one character
^h
#Delete one character (backw­ards)
%f
#Forward one word
%b
#Back one word
^w
#Delete one word (backw­ards)
^u
#Clear to beginning of line
^k
#Clear to end of line
^y
#Paste from Kill Ring
^t
#Swap cursor with previous character
%t
#Swap cursor with previous word
^p
#Previous line in history
^n
#Next line in history
^r
#Search backwards in history
^l
#Clear screen
^o
#Execute command but keep line
^z
#Suspend process
#fg
#restore process
#bg
#continue process in background
^c
#Kill current process
^d
#Exit shell
^ - Hold Control while pressing key
% - Hold meta (alt, or command on mac)