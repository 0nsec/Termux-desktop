#!/data/data/com.termux/files/usr/bin/env bash

clear 

#this script will configure a graphical user interface 
#(xfce4) in termux
#creator: @0nsec
cd $HOME

echo -e '\e[1;36m installing packages, it is necessary  \e[1m'
echo -e '''
\e[1;31m Download speed depends on
 your internet connection \e[1m'''

sleep 3

clear

echo -e '\e[1;36m installing xfce4 and basic apps...\e[1m'

sleep 1

apt update && apt upgrade -y
apt install -y git
git clone https://github.com/0nsec/Termux-desktop

apt install -y x11-repo 
apt update
apt install -y xfce4 tigervnc xfce4-goodies termux-desktop-xfce breeze-cursor-theme kvantum ttf-microsoft-cascadia audacious leafpad pavucontrol-qt hexchat geany
apt install -y otter-browser

echo "boostrap data..."
rm -rf $HOME/.backup
mkdir $HOME/.backup
mv $HOME/.config $HOME/.backup
mv $HOME/.vnc $HOME/.backup
cd $HOME
git clone https://github.com/0nsec/Termux-desktop
tar -xvf data.tar.xz
rm data.tar.xz

echo "setup folders..."

mkdir $HOME/Desktop 
mkdir $HOME/Downloads 
mkdir $HOME/Templates 
mkdir $HOME/Public 
mkdir $HOME/Documents 
mkdir $HOME/Pictures 
mkdir $HOME/Videos 
termux-setup-storage

ln -s $HOME/storage/music Music 

cd $HOME

echo -e """\e[1;32menjoy!!
To start the vnc server, use the command: vncserver \nto stop it, use the command: vncserver -kill: 1 \nReplace the: 1 with the port on which the vnc service is running\e[1m"""

exit
