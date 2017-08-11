pacman -S --needed wget yajl
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..
rm -dR package-query yaourt

pacman -S hexedit python nitrogen arduino namcap testdisk \
rng-tools steghide foremost exiv2 whois geoip virtualbox \
nasm gcc php qemu geany vlc python-pip aircrack-ng automake \ 
ruby nodejs npm ruby-native-package-installer screenfetch \
synapse zsh encfs docker dmenu firefox thunar qbittorrent \
tmux kgpg gpg-crypter emacs wget curl

yaourt -S visual-studio-code google-chrome plymouth redshiftgui-bin
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
#./preztosetup.sh
bash
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

#########################################################
#cryptsetup-bin gnome-tweak-tool filezilla irssi
#synaptic tasksel openjdk-7-* vlc-plugin-libde265 w3af p7zip-full 
#->atom  xampp #smartmontools
npm -g install react react-dom webpack babel create-react-app serve

#DWM, i3, openbox, bspwm

#pip install matplotlib numpy
https://github.com/clvv/fasd.git
cd fasd
sudo make install