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
+ Usage Guide

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

Once complete, assign the appropriate privileges, and login as the user.<br>

If this is your first time setting this up. Run these commands:<br>

`git init --bare $HOME/.dot` To create our dotfiles folder.<br>
`alias config='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME` Set git to alias to config.<br>
`config config --local status.showUntrackedFiles no` So every file is not tracked, just what we add.<br>
`echo "alias config='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'" >> $HOME/.bashrc` bashrc alias.<br>

You can use the easy snippet here: `curl https://gist.myrepos.dev/scratch.sh | bash`<br>

If you are already tracking your dotfiles and this a fresh install, you can run these commands:<br>
`alias config='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'` Alias config<br>
`echo ".dot" >> .gitignore` Avoid weird recursion problems where you clone.<br>
`git clone --bare https://github.com/Randy-Jordan/dot.git $HOME/.dot` Clone repo<br>
`alias config='/usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME'` Current shell scope<br>

You may already have some dotfiles, so we will back them up to avoid conficts.<br>
`mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}`
<br>
Now we can run the checkout command to get our dotfiles from the repo.<br>
`config checkout`<br>
Make sure to set untracked files setting.<br>
`config config --local status.showUntrackedFiles no`<br>

These commands have also been made into an easy bash script: `curl https://gist.myrepos.dev/config.sh | bash`<br>

`config status` To see status of your dotfiles.<br>
`config add .xyzfile` To start adding dotfiles. <br>

## Credits / Resources
[Tom Preston-Werner - README Driven Development](https://tom.preston-werner.com/2010/08/23/readme-driven-development.html)<br>
[Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)

## License
This project is licensed under GPLv3 - see the [LICENSE](LICENSE) file for details.
