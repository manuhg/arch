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
pacman -Syu intel-ucode grub efibootmgr os-prober 
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=Arch --debug
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S dnsutils wireless_tools wpa_supplicant wpa_actiond dialog sudo zsh git openssh
#systemctl enable net-autowireless.service
exit
reboot
#nano /etc/pacman.conf
#[multilib]
#Include = /etc/pacman.d/mirrorlist
groupadd spherical 
groupadd dialout
useradd -m -g spherical -G users,dialout,wheel,storage,power -s /bin/zsh gk1000
passwd gk1000
visudo
# alsamixer
pacman -S alsa-utils  xorg-server xorg-xinit xorg-apps mesa  
#synaptics for laptop 
pacman -S xf86-video-intel xf86-input-synaptics xf86-video-vesa
#xf86-video-vesa is generic & fallback driver
# kde5 plasma -sddm , gnome GDM , lightgdm -universal
# pacman -Rcs => recursive remove
#pacman -S sddm plasma kde-applications
pacman -S gdm gnome gnome-extra
#lightgdm i3
systemctl enable gdm
systemctl disable httpd
./install_rest_arch.sh