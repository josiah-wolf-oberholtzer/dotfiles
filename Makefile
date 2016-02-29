all: .ackrc .gitconfig .vimrc flake8

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
