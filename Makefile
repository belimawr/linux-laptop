install-all-packages:
	$(MAKE) install-base-packages
	$(MAKE) install-extra-packages
	$(MAKE) install-yay
	$(MAKE) install-aur-packages

install-base-packages:
	sudo pacman -Sy --needed $(<packages/base.txt)

install-extra-packages:
	sudo pacman -Sy --needed $(<packages/devel.txt)

install-yay:
	scripts/install-yay.sh

install-aur-packages:
	yay -S --needed $(<packages/aur.txt)

configure-user:
	chsh -s /bin/zsh
	cd scripts && ./configure-user.sh

configure-system:
	cd scripts && sudo ./configure-system.sh
