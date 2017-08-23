pacman -S --noconfirm --needed wget yajl
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..
rm -dR package-query yaourt

pacman -S --noconfirm hexedit python nitrogen arduino namcap testdisk \
rng-tools steghide foremost exiv2 whois geoip virtualbox xsel \
nasm gcc php qemu geany vlc python-pip aircrack-ng automake \ 
ruby nodejs npm ruby-native-package-installer screenfetch powerline-vim \
synapse zsh encfs docker dmenu firefox thunar qbittorrent \
tmux kgpg gpg-crypter emacs wget curl powerline rxvt-unicode\
powerline-fonts ttf-inconsolata awesome-terminal-fonts unrar cups
#cups is for printing
systemctl enable org.cups.cupsd.service
systemctl start org.cups.cupsd.service
 

yaourt -S --noconfirm visual-studio-code google-chrome plymouth redshiftgui-bin \
urxvt-fullscreen urxvt-resize-font-git urxvt-tabbedex rxvt-unicode-terminfo rar \
epson-inkjet-printer-201401w

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
./shell_setup.sh install
