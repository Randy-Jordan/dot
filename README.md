# dot 

## Description
Basic personal dot files and home directory configuration guide. Quickly configure new installations. 

## Table of Contents

- [Description](#description)
- [Breakdown](#breakdown) 
- [Usage](#usage)
- [Credits / Resources](#credits--resources)
- [License](#license)

## Breakdown
This repo only contains the most basic dot files. More specific ones will be noted and linked. Currently, the files are:

- [x] .gitconfig
- [x] .vimrc
- [x] .tmux.conf
- [x] .zshrc
- [x] [This README, use it to plan](https://tom.preston-werner.com/2010/08/23/readme-driven-development.html).

This is a breakdown of my home directory. Some are their own repo that needs downloaded, others are the XDG defaults but renamed.<br> 

- [ ] /sh - Bash scripts, set as a PATH in .zshrc 
- [ ] /md - Guides and notes written in markdown.
- [ ] /eg - "For example" files + XDG Templates folder. Used as reference by md. All dotfiles are here, not just the basic ones.
- [ ] /cad - Solidworks and CAD files. 
- [ ] /repo - All my repositories. 
- [ ] /vm - Virtual Machines
- [ ] /gui - XDG Desktop
- [ ] /dl - XDG Downloads  

## Usage
[All examples can be found in /eg](https://myrepos.xyz/Randy-Jordan/eg)<br>
[All scripts and lists can be found in /sh]()<br>
[Scripts are also hosted here for ease of use](https://gist.myrepos.xyz/)<br>

If we are root we need to modify the XDG-dirs.defaults before we login as user otherwise we have to manually change everything.<br>

After you have the default directories, you can start using the scripts as you see fit. There are various lists of packages you cant install like so.<br>
`curl https://gist.myrepos.xyz/cdev.list | xargs apt install -y`<br>


After you have your preferred set of packages and folders you can pull this repo for the dotfiles. This repo is meant to have the most basic set of dotfiles. More specific ones, such as CAD,   
`curl https://https://gist.myrepos.xyz/config.sh | /bin/bash`

## Credits / Resources
I followed these guides on setting up a bare repository for your personal dot files.<br>
[Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)<br>
[StreakyCobra](https://news.ycombinator.com/item?id=11071754)<br>
[Corey Schafer-Automate Your Development Environment Setup with Scripts and Dotfiles](https://www.youtube.com/watch?v=ra5kMCXO-6I)<br> 

When it comes to setting up the home directory you need to modify the xdg-user-dirs. <br>
[Wiki Arch - XDG User Directories](https://wiki.archlinux.org/title/XDG_user_directories)<br>
[SuperUser - Changing default home directory folder locations](https://superuser.com/questions/1785778/linux-change-default-location-of-directories-like-downloads-documents-pictur)<br>
[Brodie Robertson - Clean up your home directory with XDG Ninja](https://www.youtube.com/watch?v=Tp4fkmJ6qXk)

## License
This project is licensed under GPLv3 - see the [LICENSE](LICENSE) file for details.
