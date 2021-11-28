#!/bin/sh

# Use neovim for vim if present.
command -v nvim >/dev/null && alias vim="nvim" vimdiff="nvim -d"


##################################################
### Checking If Commands if Found in Our ENV $PATH
##################################################


# rust alias
if [ -x "$(command -v cargo)" ]; then
alias \
    rs="cargo" \
    ;
fi

# vlang alias
if [ -x "$(command -v v)" ]; then
alias \
    vc="v run" \
    ;
fi

# neovim aliases
if [ -x "$(command -v nvim)" ]; then
alias \
    sv="sudo nvim" \
    ;
fi
# git aliases
#     gs="git status" \
#     important to remove dd alias if you need to use that command
if [ -x "$(command -v git)" ]; then
alias \
        g="git" \
	gl="git log --all --decorate --oneline --graph" \
	gdif="git diff" \
        gr="git restore" \
	gcm="git commit -am" \
	gaa="git add ." \
	ss="git status" \
	ginit="git init && git add . && git commit -m 'init'" \
	nah="git reset --hard;git clean -df" \
	wip="git add . && git commit -m 'wip'" \
	dot="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME add" \
	dots="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME status" \
	dif="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME diff" \
        dop="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME push" \
        com="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME commit" \
	diff="diff --color=auto" \
	;
fi

# Replacement for ls command aliases
if [ -x "$(command -v exa)" ]; then
alias \
    l="exa -l --color=always --group-directories-first" \
    ls="exa -D --color=always --group-directories-first" \
    ll="exa -l --color=always --group-directories-first" \
    la="exa -FSal --color=always --group-directories-first" \
    ;
else
    l="ls" \
    ls="ls -d */" \
    ll="ls -lh" \
    la="ls -la" \
fi

# Alternative to cat command
if [ -x "$(command -v bat)" ]; then
alias \
    b="bat" \
    ;
fi



################################################################
### Commands Here are Already Available in Our System by Default
################################################################


################################################################
### File Management Shortcuts
################################################################

alias \
        r="$FILE" \
	c="clear && pbcopy < /dev/null" \
	e="explorer.exe" \
	grep="grep --color=auto" \
	cp="cp -iv" \
	mv="mv -iv" \
	mkd="mkdir -pv" \
	hsc="history -c" \
	path="echo -e ${PATH//:/\\\n}" \

################################################################
### Shortcuts for Handing File and Directory Permissions
################################################################

alias \
	chx="chmod +x" \
	chax="sudo chmod a+x" \
	000="sudo chmod 000" \
	555="sudo chmod 555" \
	600="sudo chmod 600" \
	644="sudo chmod 644" \
	750="sudo chmod 750" \
	755="sudo chmod 755" \
	775="sudo chmod 775" \
	777="sudo chmod 777" \
	mine="sudo chown -R $(whoami)" \
	root="sudo su -" \
	iroot="sudo chown -R root" \
	perm="stat --printf '%a %n \n'" \

################################################################
### Shortcut for Encryptions
################################################################

# gpg encryption
# verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
# receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

# remove all swap file
alias rmswp='rm ~/.local/share/nvim/swap/*.swp'


################################################################
### Quick Shortcut Changing Directories
################################################################
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'


alias a="cd ~/Code && ls -a" \
h="cd ~/ && ls -a" \
dl="cd ~/Downloads && ls -a" \
cf="cd ~/.config && ls -a" \
sc="cd ~/.local/bin && ls -a" \



################################################################
### Quick Shortcut Editting Config Files
################################################################

alias cfa="$EDITOR ~/.config/aliasrc.sh" \
cfA="$EDITOR ~/.config/alacritty/alacritty.yml" \
cfp="$EDITOR ~/.zprofile" \
cfs="$EDITOR ~/.config/starship/config.toml" \
cfv="$EDITOR ~/.config/nvim/init.vim" \
cfz="$EDITOR $HOME/.zshrc" \
etc="$EDITOR /etc/hosts" \


################################################################
### Source Config Files Quickly
################################################################

alias rz='source $HOME/.zshrc' \
rp='source ~/.zprofile' \
ra='source ~/.config/aliasrc.sh' \
rz='source ~/.zshrc' \
