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
sudo pacman -Syu haveged
sudo systemctl start haveged
sudo systemctl enable haveged

sudo rm -fr /etc/pacman.d/gnupg
sudo pacman-key --init
sudo pacman-key --populate archlinux

sudo pacman -S --noconfirm --needed expac wget yajl
gpg --recv-keys --keyserver hkp://pgp.mit.edu 6689E64E3D3664BB 1EB2638FF56C0C53
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

sudo pacman -Syu --noconfirm hexedit python nitrogen arduino namcap testdisk  \
rng-tools steghide foremost exiv2 whois geoip virtualbox xsel ipython2 htop   \
nasm gcc php qemu geany vlc python-pip python2-pip aircrack-ng automake rsync \
ruby nodejs npm ruby-native-package-installer screenfetch powerline-vim unzip \
synapse encfs docker dmenu firefox thunar qbittorrent scrot ipython lshw go   \
tmux gpg-crypter emacs curl powerline rxvt-unicode atom xxd gparted unrar qt4 \
powerline-fonts ttf-inconsolata awesome-terminal-fonts cups sublime-text      \
gnome gnome-tweak-tool gnome-shell-extensions arc-gtk-theme jdk8-openjdk      \
libreoffice-fresh linux-headers rxvt-unicode-terminfo virtualbox-guest-iso    \
 flatpak-builder glfw-x11 strace dnstracer
# teamspeak3

curl -L https://github.com/bbatsov/prelude/raw/master/utils/installer.sh | sh
rm -rf ~/.emacs.d/.git

#git clone https://github.com/madmaxms/theme-obsidian-2.git
git clone https://github.com/KDE/breeze-gtk.git
sudo cp -r breeze-gtk/Breeze-* /usr/share/themes
rm -r fbreeze-gtk

git clone https://github.com/spwhitton/git-remote-gcrypt.git
cd git-remote-gcrypt
chmod +x install.sh
./install.sh
#cups is for printing
systemctl enable org.cups.cupsd.service
systemctl start org.cups.cupsd.service

pacaur -Syu --aur --noconfirm visual-studio-code-bin google-chrome toilet figlet \
plymouth urxvt-fullscreen urxvt-resize-font-git urxvt-tabbedex rar cowsay banner \
apparmor apparmor-profiles virtualbox-ext-oracle hfsprogs dmg2img nvm fortune rev\
numix-circle-icon-theme-git numix-icon-theme-git gtk-theme-numix-solarized cmatrix \
rslsync numix-folders-git cowthink sl leiningen ccv \

pacaur -S clamav clamtk clamtk-gnome brave-git thunar-sendto-clamtk clamav-unofficial-sigs && \
 sudo freshclam && clamav-unofficial-sigs.sh --install-all && clamav-unofficial-sigs.sh

#discord
#redshiftgui-bin \
#sudo chmod 644 /usr/share/applications/* -v

#nano /etc/mkinitcpio.conf
#ADD plymouth AT END OF HOOKS AFTER fsck
#mkinitcpio -p linux
#nano /etc/default/grub
# ADD quiet splash on GRUB_CMDLINE_LINUX_DEFAULT
#grub-mkconfig -o /boot/grub/grub.cfg
#########################################################
#List Plymouth themes:
#plymouth-set-default-theme -l

#Set the themes:
#plymouth-set-default-theme -R themenames

#Preview themes:
#Pres CTRL+ALT+F2 DONt try it though :P
#plymouthd
#plymouth --show-splash

#systemctl disable gdm
#systemctl enable gdm-plymouth
#########################################################
#cryptsetup-bin gnome-tweak-tool filezilla irssi
#synaptic tasksel openjdk-7-* vlc-plugin-libde265 w3af p7zip-full
#->atom  xampp #smartmontools

npm -g install react react-dom webpack babel create-react-app serve preact preact-cli
# pip install tensorflow sklearn auto-sklearn cPickle numpy pylab matplotlib
./shell_setup.sh install
