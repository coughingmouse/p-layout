#!bin/sh
# Not Finished

# Check dependencies: sudo, curl or wget

# Check that the user is not root

# Install or uninstall
while true; do
	echo "Install or uninstall?(Install/Uninstall/Abort)"
	read -r REPLY
	case $REPLY in
		[Ii]* ) install_layout=true; uninstall_layout=false; break;;
		[Uu]* ) install_layout=false; uninstall_layout=true; break;;
		* ) exit;;
	esac
done

if $install_layout; then
	tmp_dir=$(mktemp -d -t p-layout-XXXXXXXXXX)

	# Download layout keymap
	echo "Downloading the layout..."
	if [ -z "$(curl -L https://github.com/coughingmouse/p-layout/raw/main/FreeBSD-version/us.p.kbd > $tmp_dir/us.p.kbd)" ]; then
		if [ -z "$(curl -L https://github.com/coughingmouse/p-layout/raw/main/FreeBSD-version/INDEX.keymaps > $tmp_dir/INDEX.keymaps" ]; then
			curl -L https://github.com/coughingmouse/p-layout/raw/main/FreeBSD-version/rc.config > $tmp_dir/rc.config
		fi
	fi
	if [ $? -ne 0 ]; then
		echo "Eror downloading the P layout. Please try again."
		rm -rf $tmp_dir
		exit 1
	fi
	echo "Done. Now setting up..."
	
	# Load layout keymap
	cp $tmp_dir/us.p.kbd /usr/share/vt/keymaps/
	chown root:wheel /usr/share/vt/keymaps/us.p.kbd

	# Activate layout
	kbdmap

	# Enable layout
	if [ -z "$(cat /etc/rc.conf | grep $(cat $tmp_dir/rc.conf))" ]; then
		echo $(cat $tmp_dir/rc.conf) | doas tee -a /etc/rc.conf
		echo $(cat $tmp_dir/INDEX.keymaps) | doas tee -a /usr/share/vt/keymaps
	fi
	rm -rf $tmp_dir
	
	# Add keymap to rc.conf
	if [ -z "$(cat /etc/rc.conf | grep 'keymap="us.p"')" ]; then
		if [ -z "$(cat /etc/rc.conf | grep 'keymap=')" ]; then
			grep -v "keymap=" /etc/rc.conf | doas tee -a /etc/rc.conf
		fi
		echo 'keymap="us.p"' | doas tee -a /etc/rc.conf
	fi
fi

if $uninstall_layout; then
	doas rm /usr/share/vt/keymaps/us.p.kbd
	# Delete VGA text mode
	echo "Removing hw.vga.textmode option from /boot/loader.conf"
	grep -v "hw.vga.textmode=" /boot/loader.conf | doas tee -a /boot/loader.conf
	# delete rc.conf and INDEX.keymaps
fi

