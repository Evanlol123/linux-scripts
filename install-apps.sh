#!/bin/bash

#install python and bluetooth
sudo apt install default-jdk python3 python3-pip blueman libspa-0.2-bluetooth

#install google chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt-get install -f

# Install Spotify
wget -qO - https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list > /dev/null
sudo apt-get update && sudo apt-get install spotify-client

#install steam
sudo apt install steam
steam
set -e 
if [ ! "$HOME_DIR" ]; then 
sudo HOME_DIR="$HOME" $0 
exit 0 
fi 
fix_perms() { 
local target_file="$1" 
chown root:root "$target_file" 
chmod u+s "$target_file" 
} 
fix_perms /usr/bin/bwrap 
steam_bwraps="$(find "$HOME_DIR/.steam/" -name 'srt-bwrap')" 
for bwrap_bin in $steam_bwraps; do 
cp /usr/bin/bwrap "$bwrap_bin" 
fix_perms "$bwrap_bin" 
done
steam
