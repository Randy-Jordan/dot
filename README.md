# Dot 

## Description
There is no place like $HOME. All my dotfiles, and a guide for bootstrapping a new install. 

## Table of Contents

- [Description](#description)
- [Features](#features) 
- [Usage](#usage)
- [Credits / Resources](#credits--resources)
- [License](#license)

## Features / TODOS
+ Easy to copy.
+ Defaults to revert to.
+ Templates for easy productivity.
- [ ] Guide

## Usage
Just copy and paste, or follow the guide below. 

If you're starting out as root, do not login as user until you've altered /etc/xdg/user-dirs.defaults.<br>

[For example](https://myrepos.dev/Randy-Jordan/eg), you can see the [custom configuration](https://myrepos.dev/Randy-Jordan/eg/src/branch/main/xdg/custom_user-dirs), or the [default](https://myrepos.dev/Randy-Jordan/eg/src/branch/main/xdg/user-dirs.defaults).
Marked folders are mapped to xdg features. The ones linked to repositories need to be downloaded as needed. They are as follows:

- [x] DESKTOP=gui
- [x] DOWNLOAD=dl
- [x] TEMPLATES=eg
- [ ] MARKDOWN=md
- [x] PUBLICSHARE=pub
- [x] DOCUMENTS=media/docs
- [x] MUSIC=media/music
- [x] PICTURES=media/pics
- [x] VIDEOS=media/vids
- [ ] PDF=media/pdf
- [ ] CAD=cad
- [ ] REPO=repo
- [ ] SCRIPTS=sh
- [ ] VIRTUALMACHINES=vm

Once complete, assign the appropriate privileges, and login as the user. Run the command:

`git init --bare $HOME/.dot` To create our config folder.<br>
`alias config='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME` To set an alias to interact with our config.<br>
`config config --local status.showUntrackedFiles no` So every file in $HOME is not tracked, just the ones we add.<br>
`echo "alias config='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'" >> $HOME/.bashrc` Adds the alias to our bashrc.

TODO: Set up script to pipe into bash for convenience.

## Credits / Resources
[Tom Preston-Werner - README Driven Development](https://tom.preston-werner.com/2010/08/23/readme-driven-development.html)<br>
[Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)

## License
This project is licensed under GPLv3 - see the [LICENSE](LICENSE) file for details.
