# Dotfiles Quick Installer
[![dotfiles](https://github.com/yuk7/dotfiles/assets/29954265/7dca9b76-24c6-4959-bf7b-52ccddf0e01f)](https://github.com/yuk7/dotfiles)

The Dotfiles Quick Installer provides a cross-platform easy/one-liner installation experience for dotfiles.

If Git is available, Git will be used as the download mode, otherwise Zip will be used.

## How-to-Use
### Quick install (online)
#### GNU/Linux, MSYS2, macOS
```bash
curl -L git.io/yuk7dot | bash
```
#### Windows
```cmd
curl -L git.io/yuk7dot -o install.bat & install.bat
```
#### Download from browser
https://git.io/yuk7dot

## Requirements
### *NIX
#### Git download mode
* Bash
* Git
#### zip download mode
* Bash
* curl or wget
* bsdtar or unzip

### Windows
#### Git download mode
* Command Prompt
* Git
#### zip download mode
* Command Prompt
* PowerShell

# 2-in-1 Script
In this project, we have created a 2-in-1 script that combines a batch file and a shell script.
## Generate 2-in-1 Script
Download [shell_batch_combiner](https://github.com/yuk7/shell_batch_combiner) and run this command to generate 2-in-1 mixed script `install.mxsc`:
```bash
combiner.sh install.bat install.sh install.mxsc
```
