DOTFILES := $(shell pwd)
dotfiles:
	backup shell tmux vim git alias
all: 
	brew plug zsh silversearcher backup shell tmux vim git alias
brew: 
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
plug:
	curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
zsh:
	brew install zsh
silversearcher: 
	brew install the_silver_searcher

shell:
	ln -fs $(DOTFILES)/_zshrc ${HOME}/.zshrc
vim:
	ln -fs $(DOTFILES)/_vimrc ${HOME}/.vimrc
tmux:
	ln -fs $(DOTFILES)/_tmux.conf ${HOME}/.tmux.conf
alias:
	ln -fs $(DOTFILES)/_aliases ${HOME}/.aliases
git:
	ln -fs $(DOTFILES)/_gitconfig ${HOME}/.gitconfig
	ln -fs $(DOTFILES)/_gitconfig_shared ${HOME}/.gitconfig_shared
	ln -fs $(DOTFILES)/_gitconfig_home ${HOME}/.gitconfig_home
	ln -fs $(DOTFILES)/_gitconfig_work ${HOME}/.gitconfig_work
	ln -fs $(DOTFILES)/_gitignore ${HOME}/.gitignore
	ln -fs $(DOTFILES)/_git_template ${HOME}/.git_template
backup:
	if [ -z "${HOME}/.tmux.conf" ] ; then mv ${HOME}/.zshrc mv ${HOME}/.zshrc_old ; fi
	if [ -z "${HOME}/.vimrc" ] ; then mv ${HOME}/.vimrc mv ${HOME}/.vimrc_old ; fi
	if [ -z "${HOME}/.zshrc" ] ; then mv ${HOME}/.zshrc mv ${HOME}/.zshrc_old ; fi
	if [ -z "${HOME}/.gitconfig" ] ; then mv ${HOME}/.gitconfig mv ${HOME}/.gitconfig_old ; fi
	if [ -z "${HOME}/.gitignore" ] ; then mv ${HOME}/.gitconfig mv ${HOME}/.gitignore_old ; fi
	if [ -z "${HOME}/.git_template" ] ; then mv ${HOME}/.git_template mv ${HOME}/.git_template_old ; fi

