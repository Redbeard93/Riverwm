![alt text](https://github.com/Redbeard93/Riverwm/blob/main/desktop.png)
# Riverwm on Archlinux setup walkthrough (keep updating)
## Archlinux
1. Install river & dependencies, decorations & gadgets


```
bash-completion
neovim(#put-> export EDITOR='nvim' in /etc/environment)
river
ghostty
fprintd(for fingerprint)
git
wl-clipboard
cliphist
fzf(for quick file subtree navigation)
firefox(noto-fonts for rime infinite symbols)
grim
waybar
brightnessctl
wlr-randr
wlopm
slurp
swayidle
waylock
swww
mako
fuzzel
wev
fastfetch
fcitx5-im(#if use gnome3 do this command in cli: gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/IMModule':<'fcitx'>}")
fcitx5-rime
rime-frost-git
wqy-zenhei(for waybar tags)
wqy-microhei
ttf-noto-nerd(for symbols)
noto-fonts-emoji(for rime)
ttf-roboto
noto-fonts
noto-fonts-cjk
adobe-source-han-sans-cn-fonts
adobe-source-han-serif-cn-fonts
ttf-dejavu
yazi
fd(for file searching)
ffmpeg(for video thumbnails)
p7zip(for archive extraction and preview)
jq(for JSON preview)
poppler(for PDF preview)
ripgrep(for file content searching)
zoxide(for historical directories navigation)
imagemagick(for SVG, Font, HEIC, and JPEG XL preview)
mpv
starship
bluez
bluez-utils
cups
cups-pdf
ntfs-3g
libreoffice-fresh
libreoffice-fresh-zh-tw
zathura
zathura-pdf-poppler
unzip
openscad
freecad
lutris
wine-staging
paru
wechat
power-profiles-daemon
shotcut
kdenlive
mihomo
htop
piper(mouse)
fw-ectool-git(fancontrol)
tree-sitter-cli(nvim)
luarocks(nvim)
nodejs
npm
tectonic(nvim)
mermaid-cli
presenterm(slides)
dmidecode(framework laptop bios check)
fwupd(framework laptop bios update)
visual-studio-code-bin
gnome-keyring(for vscode github authorization)
docker
docker-compose
opencode-bin
postman-bin(n8n)
```

`power-profiles-daemon` `sudo systemctl enable power-profiles-daemon.service`
`wf-recorder`
`/etc/bluetooth/main.conf set AutoEnable=false`


`#if use gnome3 do this command in cli: gsettings set org.gnome.settings-daemon.plugins.xsettings overrides "{'Gtk/IMModule':<'fcitx'>}"`


`#put-> EDITOR=nvim in /etc/environment to set yazi to open files via neovim globally ex.'sudo yazi'`


`to use swayidle properly, active` `IdleAction & IdleActionSec` `in etc/systemd/logind.conf`


Framework laptop should create `/etc/conf.d/wireless-regdom` then add`WIRELESS_REGDOM="US"` to use wifi5G


2. Change keyboard layout:

> Set a permanent environment variable
> 
> In order to configure a new environment variable to be persistent, we’ll need to edit the Bash configuration files. This can be done through three different files, depending on exactly how you plan to access the environment variable.
> 
> - ~/.bashrc – Variables stored here will reside in the user’s home directory and are only accessible by that user. The variables get loaded any time a new shell is opened.
>
> - /etc/profile – Variables stored here will be accessible by all users and are loaded whenever a new shell is opened.
>
> - /etc/environment – Variables stored here are accessible system-wide.
>
>Add a new variable to the~/.bashrc or /etc/profile configuration files by appending a line to the end of it with this syntax. Notice we precede each new variable with export.
>
> `export MY_SITE='linuxconfig.org'`
>
> Afterwards, you can load the new environment variables into the current session with the following command.
>
> `source ~/.bashrc`
>
> OR
>
> `source /etc/profile`
> 
> if adding an environment variable to the /etc/environment file, you don’t need to precede the line with “export”.
>
> `MY_SITE='linuxconfig.org'`
> 
> Using the methods above, your variable configurations will persist until you delete them.
> 
> How to Unset an Environment Variable
> 
> To unset an environment variable, use the unset command:
>
> `unset [VARIABLE_NAME]`
>
> example:
> 
> ```
> XKB_DEFAULT_LAYOUT=se,ru
> XKB_DEFAULT_VARIANT=,phonetic
> XKB_DEFAULT_OPTIONS=ctrl:nocaps,grp:alt_shift_toggle,grp_led:caps
> ```
>
> This command permanently removes variables exported through a terminal command.
>
> Variables stored in configuration files are also removed from the current shell session. However, they are set again upon next logging in.
>
> To permanently unset a variable you stored in a file, go to the file, and remove the line containing the variable definition.

3. if you don`t have seatd & rely on logind(which is with linux by default) put this under /etc/environment 

check https://unix.stackexchange.com/questions/656328/libseat-backend-seatd-c70-could-not-connect-to-socket-run-seatd-sock-no-su

`LIBSEAT_BACKEND=logind`

4. put 'river' at the bottom of `~/.bash_profile`

5. git clone all files from this repo & put them under `$HOME/.config/`

6. for IME, I use `fcitx5-im fcitx5-rime`

7. To make  haikarainen/light work without sudo, add user to a secondary group----video group `sudo usermod -a -G video user`

8. To use bluetooth Headset, install `pipewire pipewire-alsa pipewire-pulse bluez bluez-utils`  (in terms of using headphone plugin, in Pavucontrol interface, go to Configuration, select Pro Audio, restart applications, should be good to go (don`t know why it kind of work only that way))

9. To make vbetool work without sudo password, add `ALL ALL=(ALL) NOPASSWD:/usr/bin/vbetool` at the bottom line of `/etc/sudoers`

10. Hibernate settings(for example)

firstly, add `options resume=/dev/sdiJ`(wherever your swap disk is) in your (for example) systemd-boot bootloader such as 
`/boot/loader/entries/arch.conf`, then， configure the initramfs, add `resume` in `HOOKS=(base udev autodetect keyboard modconf block filesystems fsck)` somewhere behind udev (mandatory), then run `sudo mkinitcpio -P`

(https://wiki.archlinux.org/title/Power_management/Suspend_and_hibernate) 

(https://www.reddit.com/r/archlinux/comments/anki3y/hibernation_using_systemdbootbootctl/)

(https://wiki.archlinux.org/title/systemd-boot#Loader_configuration)

(https://www.cnblogs.com/sztom/p/10612593.html)

11. To use OBS, install `qt5-wayland` `qt5ct` and `obs-studio`.to capture PC screen, install `xdg-desktop-portal` `xdg-desktop-portal-wlr`, to use obs as vitual camera for example zoom stuff, install `v4l2loopback-dkms` and add user to video group(which happens at step 7.

add this to `~/.bash_profile`
```
# QT5 FIX
export QT_QPA_PLATFORMTHEME="qt5ct"
# Wayland Fix
export QT_QPA_PLATFORM="wayland;xcb"
# export XDG_CURRENT_DESKTOP=river
# export XDG_SESSION_DESKTOP=river
# export XDG_CURRENT_SESION_TYPE=wayland
# export GDK_BACKEND="wayland,x11"
# export MOZ_ENABLE_WAYLAND=1
```
https://support.zoom.us/hc/en-us/articles/6634039380877-Sharing-your-screen-on-Wayland

12. Gaming from `lutris`
       
       install `qt5-wayland qt6-wayland lib32-gtk2` first
       
       run yuzu with `QT_QPA_PLATFORM=xcb yuzu` (2022 yuzu doen`t support wayland yet)
       

    1. game on ps2 simulator(eg: the king of fighters 98 ultimate on sony ps2): download libs from 

       "https://github.com/PCSX2/pcsx2/wiki/Installing-on-Linux#arch-linux" 
       
       then
    
       download `pcsx2` `lib32-gtk2` `qt6-wayland` and pcsx2 bios files from 
       
       "https://romsmania.cc/download/bios/pcsx2-playstation-2-bios-3"
    
    2. RedAlert2 problem solving: 
    
       Installation: "https://www.youtube.com/watch?v=gInm74cTmW8&t=177s"

     > Installed CD-ROM (pre-origin era) version of Red Alert 2 + Yuri's Revenge
     > 
     > As mentioned in the comments and how-to above, changed ddraw load order, downloaded and used ddwrapper, changed ra2.ini config, ran the program on exclusive 32-bit wine with Windows XP version. Still encountered the black screen bug or disappearing menus.
     > 
     > Finally downloaded launcher from cncnet.org/.
     > Ran it in the same 32-bit wine prefix that I installed the game into.
     > Pointed the directory of the game.
     > Launcher downloaded some files/fixes and installed into the directory.
     > [Note - requires winetricks (for noobs like me) to install microsoft XNA 4.0 framework, DirectX 9-11, dotNETFramework 4.5.]
     > 
     > Launched the newly available CnCNetYRLauncher.exe in the game directory from wine.
     > Everything worked as it should.
     > Tried campaign, single player skirmish with 4 other opponents. No slow-downs.
     > https://forums.lutris.net/t/starcaft-2-not-launching/8977

     > anyway to play those games without vulkan and butchering the performance ?
     > 
     > You're aware that Linux Gaming is going strong in Vulkan PRECISELY because it DOES NOT butcher performance as heavily as OpenGL translation
     > layers, right?
     > 
     > If you want to play Windows exclusive games with D3D's OpenGL, you can disable the use of DXVK in your Proton config file "user_settings.py" or
     > directly by setting "PROTON_USE_WINED3D=1" in your game launch options in Steam.
     > 
     > Or in Lutris, by simply not checking the "DXVK" box.
     > 
     > thinkpad x220 cannot support vulkan
     > https://www.reddit.com/r/linux_gaming/comments/gaku6y/gaming_on_linux_without_vulkan/
     
    3.  How I can run stuff on xwayland
    
        just need to add QT_QPA_PLATFORM=xcb before the command to launch the program. You can add it before the program command in terminal for example         if you want that particular instance to run in xwayland.

        For more permanent solution, copy the application's shortcut from /usr/share/applications to $HOME/.local/applications, and add it in the Exec=           line. It would look like Exec=env QT_QPA_PLATFORM=xcb program . Same can also be achieved by a menu editor if gui is more preferable 
        
        Or
        
        You can supposedly have the Exec= line be Exec=bash -c "source /opt/qt512/bin/qt512-env.sh && /opt/qt512/bin/yuzu" (assuming that latter path is         correct). Alternatively you can setup global environment variables by placing a file in /etc/profile.d/. Look at the existing ones in there for           examples; be sure to in that case append or prepend to LD_LIBRARY_PATH rather than replace it outright; something like export
        LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/qt512/lib so as to play nice with potential other packages that may want to do similar.
        
        https://forums.linuxmint.com/viewtopic.php?t=308332
        
        ----------------------------------------------------------------------------------------------------------------------
        
        Solution for cannot exec yuzu runner in lutris under xwayland: write a bash script an make it executable
        
        write 
        
        ```
        
        #!/bin/bash

        QT_QPA_PLATFORM=xcb yuzu

        
        ```
        in yuzu-xwayland.sh then in terminal run command `chmod u+x yuzu-xwayland.sh`

