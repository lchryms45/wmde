# Window Maker Desktop Environment

0.1a test for Kendal

## Installation

**Install git if you haven't already**:
```bash
sudo pacman -S git
```
**Clone this repository and install**:
```bash
git clone https://github.com/lchryms45/wmde
cd wmde
./Install
```
**mark Install as executable if it isn't already**:
```bash
chmod +x Install
```

Laptop config at the end of installer not done yet. Tested in a vm and seems ok!
Lemme know if anything is super fucked up or whatever.

Haven't bothered writing a help page yet, so to find keyboard shortcuts;
* Right click desktop>Configure Window Maker>Keyboard

Writing a help/settings/theme installer at the mo. Gonna be really gay.
I know you've always wanted that Windows 3.1 theme.

I've already written a tiling window script if you wanna fuck with it.
It's in $HOME/.wmde/scripts
Run that shit, start 'sxhkd' (it's already installed), then the numpad does tiling like this;

7	8	9
TL	TC	TR

4	5	6
L 	C 	R

1 	2 	3
BL	BC 	BR

0 does first two thirds, . does last third

Yeah... so... get preggerz, init. xx.

Oh, and the picom config is working for me. Hopefully it plays nice with you.
