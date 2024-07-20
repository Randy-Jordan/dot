# dot 

## Description
Personal dot files and home directory configuration scripts. Quickly configure new installations. 

## Table of Contents

- [Description](#description)
- [Features](#features) 
- [Usage](#usage)
- [Credits / Resources](#credits--resources)
- [License](#license)

## Features / TODOS

- [x] .zshrc 
- [x] .gitconfig
- [x] .vimrc
- [x] .tmux.conf
- [ ] /sh - Bash scripts, set as a PATH in .zshrc 
- [ ] /md - Guides and notes written in markdown.
- [ ] /eg - "For example" files, used as a reference for md files. 
- [ ] /cad - Solidworks and CAD files.
 
## Usage
When configuring a new install, pipe the scipts hosted on gist.myrepos.xyz into bash like so.<br>
`git clone --bare https://myrepos.xyz/Randy-Jordan/dot.git $HOME/.dot
function config {
   /usr/bin/git --git-dir=$HOME/.dot/ --work-tree=$HOME $@
}
mkdir -p .config-backup
config checkout
if [ $? = 0 ]; then
  echo "Checked out config.";
  else
    echo "Backing up pre-existing dot files.";
    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
fi;
config checkout
config config status.showUntrackedFiles no` 

## Credits / Resources
I followed these guides on setting up a bare repository for your personal dot files.<br>
[Dotfiles: Best way to store in a bare git repository](https://www.atlassian.com/git/tutorials/dotfiles)<br>
[StreakyCobra](https://news.ycombinator.com/item?id=11071754)<br>

## License
This project is licensed under GPLv3 - see the [LICENSE](LICENSE) file for details.
