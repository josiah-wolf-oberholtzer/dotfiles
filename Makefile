all: .ackrc .gitconfig .vimrc flake8

.ackrc:
	rm -f ~/.ackrc
	ln -s ackrc ~/.ackrc

.gitconfig:
	rm -f ~/.gitconfig
	ln -s gitconfig ~/.gitconfig

.vimrc:
	rm -f ~/.vimrc
	ln -s vimrc ~/.vimrc

flake8:
	mkdir -p ~/.config
	rm -f ~/.config/flake8
	ln -s flake8 ~/.config/flake8
