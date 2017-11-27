#git clone https://aur.archlinux.org/package-query.git
#cd package-query
#makepkg -si
#cd ..
#git clone https://aur.archlinux.org/yaourt.git
#cd yaourt
#makepkg -si
#cd ..
#rm -dR package-query yaourt
#sudo pacman-key --refresh-keys && sudo pacman -Syyu
#curl "https://pgp.mit.edu/pks/lookup?op=get&search=0x1EB2638FF56C0C53" -o - | gpg --import

sudo pacman -S --noconfirm --needed expac wget yajl 
gpg --recv-keys --keyserver hkp://pgp.mit.edu 1EB2638FF56C0C53
mkdir pacaur && cd pacaur
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower
makepkg -i PKGBUILD --noconfirm
curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur
makepkg -i PKGBUILD --noconfirm

#sublime text
curl -O https://download.sublimetext.com/sublimehq-pub.gpg && \
sudo pacman-key --add sublimehq-pub.gpg && \
sudo pacman-key --lsign-key 8A8F901A && rm sublimehq-pub.gpg
echo -e "\n[sublime-text]\nServer = https://download.sublimetext.com/arch/stable/x86_64" | sudo tee -a /etc/pacman.conf

sudo pacman -Syu --noconfirm hexedit python nitrogen arduino namcap testdisk \
rng-tools steghide foremost exiv2 whois geoip virtualbox xsel ipython2 htop\
nasm gcc php qemu geany vlc python-pip python2-pip aircrack-ng automake rsync \
ruby nodejs npm ruby-native-package-installer screenfetch powerline-vim \
synapse encfs docker dmenu firefox thunar qbittorrent scrot ipython konsole \
tmux kgpg gpg-crypter emacs curl powerline rxvt-unicode dmenu atom xxd \
powerline-fonts ttf-inconsolata awesome-terminal-fonts unrar cups qt4 \
gnome gnome-tweak-tool gnome-shell-extensions arc-gtk-theme sublime-text \
libreoffice-fresh 

#git clone https://github.com/madmaxms/theme-obsidian-2.git
git clone https://github.com/KDE/breeze-gtk.git 
sudo cp -r breeze-gtk/Breeze-* /usr/share/themes
rm -rf breeze-gtk

git clone https://github.com/spwhitton/git-remote-gcrypt.git
cd git-remote-gcrypt
chmod +x install.sh
./install.sh
#cups is for printing
systemctl enable org.cups.cupsd.service
systemctl start org.cups.cupsd.service
 

pacaur -Syu --aur --noconfirm visual-studio-code google-chrome plymouth \
urxvt-fullscreen urxvt-resize-font-git urxvt-tabbedex rxvt-unicode-terminfo rar \
epson-inkjet-printer-201401w zip rslsync teamspeak3 discord chrome-gnome-shell-git \
obsidian-icon-theme numix-folders-git numix-circle-icon-theme-git linux-headers \
numix-icon-theme-git gtk-theme-numix-solarized apparmor apparmor-profiles \
 virtualbox-ext-oracle virtualbox-guest-iso 

#redshiftgui-bin \

nano /etc/mkinitcpio.conf
#ADD plymouth AT END OF HOOKS AFTER fsck
mkinitcpio -p linux
nano /etc/default/grub
# ADD quiet splash on GRUB_CMDLINE_LINUX_DEFAULT
grub-mkconfig -o /boot/grub/grub.cfg
#########################################################
#List Plymouth themes:
plymouth-set-default-theme -l

#Set the themes:
plymouth-set-default-theme -R themenames

#Preview themes:
#Pres CTRL+ALT+F2 DONt try it though :P
#plymouthd
#plymouth --show-splash

systemctl disable gdm
systemctl enable gdm-plymouth
#########################################################
#cryptsetup-bin gnome-tweak-tool filezilla irssi
#synaptic tasksel openjdk-7-* vlc-plugin-libde265 w3af p7zip-full 
#->atom  xampp #smartmontools

#npm -g install react react-dom webpack babel create-react-app serve
# pip install tensorflow sklearn auto-sklearn cPickle numpy pylab matplotlib
./shell_setup.sh install
