# Hyprland Arch Dual Boot Common Issues (HADBCI)
This Document contains a list of notable things to remember when dealing with a fresh **archlinux** installation, such as failing to mount drives due to hibernation, **wayland** specific gimmicks and fixes, setting up certain utilities specifically for **wayland**, things to note about **hyprland**, applications that were found to be useful/ good alternatives to Windows counterparts, as well as some **SSH** stuff for cloning personal private repositories.

The goal of this Document is to manage everything that should be not only documented, but later converted into an **ansible** script.

----
## Windows screws you again: part 2.
The NTFS partition system and Linux, by default to Linux, or at least archlinux in specific the NTFS system is unknown, while on certain distributions it might be working right away, here it requires specific installation and mounting.
 
*Solution:*
```bash
# example
ntfs-3g /dev/sda1 /mnt/my_drive/
```
Download and install `ntfs-3g` and mount the partition to a directory.
[Source](https://www.linuxquestions.org/questions/linux-newbie-8/error-mounting-mount-unknown-filesystem-type-%27ntfs%27-926355/)

---
## Clipboard? sure hope it does.
So arch comes without a clipboard, normally `xclip` gets the job done but since we're using  wayland that ain't gonna cut it.

*Solution:*
Install package `wl-clipboard` as well as `xclip` just in case.

---

## Taking a screenshot, buckle up.
So `flameshot` doesn't work, god knows why, most likely because wayland is a thing. so we're gonna need a few utilities and piping.

*Solution:*
Install `grim`, `slurp`, and use the following command to screenshot a section:
```bash
grim -g "$(slurp)" - | wl-copy
```

---

## Wallpaper? Nitrogen? Wayland.
Usually my go-to program/ app for a desktop wallpaper would be `nitrogen` it's straight to the point, but it seems that it doesn't work most likely because of wayland; nonetheless, the linux community is so huge that there is an even better solution, enter `swww` (Solution Wayland Wallpaper Woes) which inspired the title of this section. SWWW not only allows you to set a wide range of image filetypes, it also supports **Gifs** to be set as the wallpaper, which I thought was not possible.


*Solution:*
```bash
# (Available from the AUR)
yay install swww
```

---
## GNU Ruins your font.
Braille displays improperly if the package or font `gnu-free-fonts` is installed, so **REMOVE IT**, in order to avoid over an hour of debugging...

*Solution:*
```bash
sudo pacman -R gnu-free-fonts

# For japanese fonts
sudo pacman -S noto-fonts-cjk noto-fonts-emoji noto-fonts
```

