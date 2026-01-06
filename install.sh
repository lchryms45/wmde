#!/bin/bash

PACMAN_BASE="sddm picom polkit-gnome dconf-editor gparted downgrade etcher-bin \
alacritty pacman gvfs gvfs-google gvfs-mtp gvfs-nfs gvfs-smb czkawka-gui gnome-disk-utility filezilla \
network-manager-applet arandr lxappearance gpick kvantum parcellite pasystray qbittorrent qjackctl \
mousepad rofi screengrab solaar vlc geeqie pavucontrol galculator mupdf xorg-xset xorg-mkfontscale wmctrl sxhkd \
xscreensaver openssh gufw udiskie xdg-desktop-portal xorg-xev"
PACMAN_APPS="audacity ardour blender fs-uae-launcher fs-uae gimp gimp-plugin-gmic godot handbrake inkscape kdenlive \
libreoffice-fresh nicotine+ obs-studio soundconverter vscodium android-file-transfer yabridge yabridgectl"
YAY_BASE="windowmaker windowmaker-extra sddm-conf picom-conf selectdefaultapplication-fork-git ttf-envy-code-r"
YAY_APPS="surfshark-client"
YAY_DOCKAPPS="wmamixer wmclock wmcube wmnd wmsystemtray wmbattery"

# Function to ask a yes or no question
ask_yes_no() {
    while true; do
        read -p "$1 (y/n): " answer
        case $answer in
            [Yy]* ) return 0;;  # Yes
            [Nn]* ) return 1;;  # No
            * ) echo "Please answer yes or no.";;
        esac
    done
}

echo "CachyOS Window Maker Installation"
echo "---------------------------------"

# paru or yay
if ask_yes_no "Replace paru with yay?"; then
    echo "Installing yay..."
    sudo pacman -S --needed git base-devel
    mkdir git && cd git
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    echo "Removing paru..."
    sudo pacman -Rns paru
    cd
else
    echo "Then yer on your own. Seeya."
    exit
fi

# Base packages
if ask_yes_no "Install base packages?"; then
    echo "Installing base packages...."
    sudo pacman -S $PACMAN_BASE && yay -S $YAY_BASE
else
    echo "Skipped installing base packages"
fi

# Dockapps
if ask_yes_no "Install Dockapps?"; then
    echo "Installing Dockapps..."
    yay -S $YAY_DOCKAPPS
else
    echo "Skipped installing Dockapps"
fi

# Pacman apps
if ask_yes_no "Install apps? (Main Repository)"; then
    echo "Installing..."
    sudo pacman -S $PACMAN_APPS
else
    echo "Skipped installing apps"
fi

# Aur apps
if ask_yes_no "Install apps? (Arch User Repository)"; then
    echo "Installing..."
    yay -S $YAY_APPS
else
    echo "Skipped installing AUR apps"
fi

echo "Done."
