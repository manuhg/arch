pacman -S --needed git wget yajl
git clone https://aur.archlinux.org/package-query.git
cd package-query
makepkg -si
cd ..
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..
rm -dR package-query yaourt
pacman -S hexedit  python   nitrogen arduino  testdisk rng-tools steghide foremost exiv2  whois geoip virtualbox  nasm gcc  php qemu geany vlc python-pip aircrack-ng  automake ruby  nodejs npm ruby-native-package-installer  screenfetch synapse zsh encfs docker
yaourt -S visual-studio-code-oss google-chrome
#cryptsetup-bin gnome-tweak-tool thunar filezilla irssi
#synaptic tasksel openjdk-7-* vlc-plugin-libde265 w3af p7zip-full 
#->atom  xampp #smartmontools
npm -g install react react-dom webpack babel create-react-app

DWM, i3, openbox, bspwm

pip install matplotlib numpy 
