Thanks to: @aCeTotal for providing this.

1. If you are not ME and you want to use my flake, you SHOULD fork this repo right away and make it your own. You will need to have your own git repo to make your system reproducible.
2. Make sure your BIOS is set to only use UEFI and Secure Boot disabled.
3. Boot up the latest minimal NixOS-image.
4. Change the keyboard layout with: sudo loadkeys no-latin1 (Norwegian layout).
5. bash <(curl -sL http://bit.ly/cmpnixos)
6. Install the base-system and log in. (pw=nixos)
7. Change directory into .dotfiles
8. then run: sudo nixos-rebuild switch --flake .#systemconf .Eg. desktop, laptop or htpc. (Pst. Make your own config, you dont want to use the same stuff as me.)
9. Reboot.


Notes:
For enabling wifi connection in minimal:
  1. sudo -i
  2. sudo systemctl start wpa_supplicant
  3. wpa_cli
  4. add_network
  5. set_network 0 ssid "myhomenetwork"
  6. set_network 0 psk "mypassword"
  7. set_network 0 key_mgmt WPA-PSK
  8. enable_network 0

 Or just " wpa_supplicant -B -i interface -c <(wpa_passphrase 'SSID' 'key' "
