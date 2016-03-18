#Build Environment Setup
##Directory Structure
make directory structure like this:

./buildroot-21xx.xx/ 	(main buildroot package)
./buildroot-config/ 	(this repo)
	board/				(BSPs for individual boards)
	configs/			(buildroot defconfigs)
	package/			(custom packages available)
	...

##instructions
in buildroot main dir
1. sudo apt-get install build-essential libncurses?-dev libqt4-dev libglib2.0-dev libgtk2.0-dev libglade2-dev git rsync
1. Create the initial defconfig from our git repo's template.
`make wandboard_defconfig`
1. Configure the distro.
`make BR2_EXTERNAL=../buildroot-config xconfig`
  1. Update where we save our buildroot config.  Go to *Build options*, change *Location to save buildroot config* to `$(BR2_EXTERNAL)/configs/wandboard_defconfig`
  1. Update where we save linux kernel config.  Go to kernel>linux kernel>kernel configuration, select "Using a custom (def)config file".  Change "Configuration file path" to `$(BR2_EXTERNAL)/board/wandboard/linux.config`

#Notes
* When you make changes to the main buildroot defconfig that you want to change, run `make savedefconfig` to save the changes in this repo
* When you make changes to the kernel configuration that should be kept, run `make linux-update-defconfig` to save them in this git repo
