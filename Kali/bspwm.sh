#!/bin/bash

# Perform updates
sudo apt update -y


# Set up XFCE4 and BSPWM for tiling + navigation
sudo apt install bspwm picom sxhkd -y
mkdir -p ~/.config
cd ~/.config
mkdir bspwm
mkdir picom
mkdir sxhkd
mkdir autostart
cp /usr/share/doc/bspwm/examples/bspwmrc bspwm/
cp /usr/share/doc/bspwm/examples/sxhkdrc sxhkd/
wget https://raw.githubusercontent.com/landoncrabtree/fresh/main/Kali/picom.conf -O picom/picom.conf
chmod +x bspwm/bspwmrc
xfconf-query -c xfwm4 -p /general/use_compositing -s false

echo "[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=bspwm
Comment=
Exec=bspwm
OnlyShowIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false" > ~/.config/autostart/bspwm.desktop

echo "[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=picom
Comment=
Exec=picom --config /home/kali/.config/picom/picom.conf -b
OnlyShowIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false" > ~/.config/autostart/picom.desktop

echo "[Desktop Entry]
Encoding=UTF-8
Version=0.9.4
Type=Application
Name=sxhkd
Comment=
Exec=sxhkd
OnlyShowIn=XFCE;
RunHook=0
StartupNotify=false
Terminal=false
Hidden=false" > ~/.config/autostart/sxhkd.desktop

echo "Done! Set xfwm4 to never restart and log out and back in"
