# dot 

## Description
Personal dot files and home directory configuration scripts. Quickly configure new installations. 

## Table of Contents

- [Description](#description)
- [Files \ Folders](#files--folders) 
- [Usage](#usage)
- [Credits / Resources](#credits--resources)
- [License](#license)

## Files / Folders

- [x] .zshrc 
- [x] .gitconfig
- [x] .vimrc
- [x] .tmux.conf
- [x] .prettierrc
- [x] eslint.config.js

- [ ] /sh - Bash scripts, set as a PATH in .zshrc 
- [ ] /md - Guides and notes written in markdown.
- [ ] /eg - "For example" files + XDG Templates folder. Used as reference by md. 
- [ ] /cad - Solidworks and CAD files.
- [ ] /repo - All my repositories. 
- [ ] /vm - Virtual Machines
- [ ] /gui - XDG Desktop
- [ ] /dl - XDG Downloads  
## Usage
When configuring a new install, pipe the scripts hosted [Here](https://www.gist.myrepos.xyz) into bash like so.<br>
`curl https://gist.myrepos.xyz/config.sh | /bin/bash`<br>

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
