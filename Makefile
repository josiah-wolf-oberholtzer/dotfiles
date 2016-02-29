all: .ackrc .gitconfig .vimrc flake8 vundle

.ackrc:
	rm -f ~/.ackrc
	ln -fs $(abspath ./ackrc) ~/.ackrc

.gitconfig:
	ln -fs $(abspath ./gitconfig) ~/.gitconfig

.vimrc:
	ln -fs $(abspath ./vimrc) ~/.vimrc

flake8:
	mkdir -p ~/.config
	ln -fs $(abspath ./flake8) ~/.config/flake8

vundle:
	mkdir -p ~/.vim/bundle
	rm -Rf ~/.vim/bundle/Vundle.vim
	git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	vim +BundleInstall +qall
