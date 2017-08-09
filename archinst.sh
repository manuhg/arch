cd /etc/netctl
wifi-menu
netctl start wlp2s0f0....
timedatectl set-ntp true
mkfs.fat -F32 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mkfs.ext4 /dev/sda3 -L Arch
mount /dev/sda3 /mnt
mkdir /mnt/boot
mount /dev/sda1 /mnt/boot
nano /etc/pacman.d/mirrorlist
pacstrap /mnt base base-devel
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
ln -sf /etc/localtime /usr/share/zoneinfo/Asia/Kolkata
hwclock --systohc
nano /etc/locale.gen
locale-gen
nano /etc/locale.conf
# LANG=en_US.UTF-8
echo mvspherical > /etc/hostname
nano /etc/hosts
mkinitcpio -p linux
passwd
pacman -Syu intel-ucode grub efibootmgr os-prober zsh arduino wireless_tools wpa_supplicant wpa_actiond dialog sudo
systemctl enable net-autowireless.service
#nano /etc/pacman.conf
#[multilib]
#Include = /etc/pacman.d/mirrorlist
groupadd spherical
useradd -m -g spherical -G users,dialout,wheel,storage,power -s /bin/zsh gk1000
passwd gk1000
visudo
pacman -S alsa-utils alsamixer xorg-server xorg-xinit xorg-server-utils mesa
#synaptics for laptop 
pacman -S xf86-video-intel xf86-synaptics xf86-video-vesa
#xf86-video-vesa is generic & fallback driver
# kde5 plasma -sddm , gnome GDM , lightgdm -universal
# pacman -Rcs => recursive remove
pacman -S plasma kde-applications
#gnome gnome-extra
#lightgdm i3
systemctl enable sddm
systemctl disable apache
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
pacman -S hexedit  python   nitrogen  testdisk rng-tools steghide foremost exiv2 cryptsetup-bin whois geoip-bin virtualbox  nasm gcc g++ php qemu-utils geany vlc python-pip aircrack-ng build-essential automake libevent-dev libssl-dev ruby  nodejs npm gem  screenfetch synapse tty-clock pm-utils zsh python-tk
yaourt -S visual-studio-code-oss google-chrome
#gnome-tweak-tool thunar filezilla irssi
#synaptic tasksel openjdk-7-* vlc-plugin-libde265 w3af p7zip-full 
#->atom  xampp #smartmontools
npm -g install react react-dom webpack babel create-react-app

DWM, i3, openbox, bspwm

pip install matplotlib numpy
