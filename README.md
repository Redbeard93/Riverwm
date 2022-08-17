![alt text](https://github.com/EN-KS/Riverwm/blob/main/screenshot1.png)
# Riverwm setup walkthrough (keep updating)
## Archlinux init
1. Install river & dependencies:

`sudo pacman -S river zig libxkbcommon wayland wayland-protocols wlroots libevdev pixman pkg-config scdoc alsa-utils vbetool`

Install decorations & gadgets

`otf-font-awesome(for waybar icons) otf-fira-code-nerd-font(for powermenu and nvim icons) polkit-gnome waybar rofi-lbonn-wayland-git swaybg swayidle swaylock grim slurp wf-recorder kitty python-pillow dunst iw networkmanager network-manager-applet(optional) wl-clipboard(for neovim clipboard) fd ripgrep zathura zathura-pdf-mupdf(PDF viewer)`

2. Change keyboard layout:

I use halmak keyboard layout, for convenience, which is achieved by configuring us(dvorak) by hand(in my halmak repository).

if use bash, put these two lines in `/etc/environment`

```
XKB_DEFAULT_LAYOUT='us(dvorak)'
XKB_DEFAULT_OPTIONS=ctrl:swapcaps
``` 


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

6. for IME, I use `fcitx5-im fcitx5-rime glfw-wayland`

7. To make  haikarainen/light work without sudo, add user to a secondary group----video group `sudo usermod -a -G video user`

8. To use bluetooth Headset, install `pipewire pipewire-alsa pipewire-pulse bluez bluez-utils pavucontrol pamixer`  

9. To make vbetool work without sudo password, add `ALL ALL=(ALL) NOPASSWD:/usr/bin/vbetool` at the bottom line of `/etc/sudoers`
