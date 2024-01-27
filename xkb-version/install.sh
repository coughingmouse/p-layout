#!/bin/sh

# Check OS
os=$(uname)
if [ "$os" = 'Linux' ]; then
  format='kmap.gz'
  loadmap='loadkeys us'
elif [ "$os" = 'FreeBSD' ]; then
  format='kbd'
  loadmap='kbdmap'
else
  echo "Unsupported OS ${os}."
  exit 1
fi

# Check dependencies: sudo, curl, or wget
if [ -z "$(command -v sudo)" ] || ([ -z "$(command -v curl)" ] && [ -z "$(command -v wget)" ]); then
  if [ -z "$(command -v sudo)" ]; then
    echo "sudo is not installed. doas is not supported. Note that after installing sudo, you may have to set it up manually after installation."
  fi
  # Try installing dependencies
  echo "Installing dependencies including sudo..."
  if [ -z "$(command -v apt-get)" ]; then
    sudo apt-get install -y curl
  elif [ -z "$(command -v dnf)" ]; then
    sudo dnf install -y curl
  elif [ -z "$(command -v yum)" ]; then
    sudo yum install -y curl
  elif [ -z "$(command -v pacman)" ]; then
    sudo pacman -S --noconfirm curl
  elif [ -z "$(command -v zypper)" ]; then
    sudo zypper install -y curl 
  elif [ -z "$(command -v apk)" ]; then
    sudo apk add -y curl
  elif [ -z "$(command -v pkg)" ]; then
    su -c "pkg install -y sudo curl"
  elif [ -z "$(command -v pkg_add)" ]; then
    su -c "pkg_add -y sudo curl"
  else
    echo "Unable to install dependencies. Please install sudo and curl."
    exit 1
  fi
fi

# Check that the user is not root
if [ "$(id -u)" = "0" ]; then
    echo "Do not run any script as root unless you know you have to." 1>&2
    exit 1
fi

# Install or uninstall
while true; do
	echo "Note that this script will reset your xkb us keyboard layout. Which P layout would you like to install? (English(Default)/International/Revert us layout to default/Abort)"
    read -r REPLY
    case $REPLY in
        [Ee]* ) WouldGet=true; WouldRemove=false; which_layout=ep; break;;
        [Ii]* ) WouldGet=true; WouldRemove=false; which_layout=ip; break;;
        [Rr]* ) WouldGet=false; WouldRemove=true; break;;
	[Aa]* ) exit;;
        * ) echo "Please answer with e, i, r, or a."; exit;;
    esac
done

tmp_dir=$(mktemp -d -t p-layout-XXXXXXXXXX)

if $WouldGet; then 
  echo "Downloading the xkb layout..."
  if [ -z "$(curl -sL https://github.com/coughingmouse/p-layout/raw/main/xkb-version/$which_layout > $tmp_dir/us)" ]; then
    wget -q https://github.com/coughingmouse/p-layout/raw/main/xkb-version/$which_layout -O $tmp_dir/us
  fi
  # make error from curl output error message and stop shell script
  if [ $? -ne 0 ]; then
    echo "Error downloading the P layout. Please try again."
    exit 1
  fi
  echo "Done. Now setting up..."
  if [ -e /usr/share/X11/xkb/symbols/us ]; then 

    # or you could make /usr/share/X11/xkb/symbols/p

    # change /etc/default/keyboard
    # L='p' && sudo sed -i 's/XKBLAYOUT=\"\w*"/XKBLAYOUT=\"'$L'\"/g' /etc/default/keyboard
    # setupcon -f # setupcon should reload keyboard for console but??????? -f only disables it

    # for gnome only; kde version needed
    # gsettings set org.gnome.desktop.input-sources sources "[('xkb', 'us'), ('ibus', 'hangul'), ('ibus', 'mozc-jp'), ('ibus', 'libpinyin'), ('xkb', 'p')]"
    # Somethings isnt right, tho

    echo "Changing layout needs wheel access, so here we use 'sudo', which might prompt you a password request."
    sudo mv $tmp_dir/us /usr/share/X11/xkb/symbols/us
    
    setxkbmap us
    # use "loadkeys p" for vt
    if ! sudo setupcon --save-keyboard /etc/console-setup/cached_UTF-8_del.$format
    then
      if [ -z "$(curl -sL https://github.com/coughingmouse/p-layout/raw/main/xkb-version/$which_layout.cached_UTF-8_del.$format > $tmp_dir/cached_UTF-8_del.$format)" ]; then
        wget -q https://github.com/coughingmouse/p-layout/raw/main/xkb-version/$which_layout.cached_UTF-8_del.$format -O $tmp_dir/cached_UTF-8_del.$format
      fi
    fi
    sudo mv $tmp_dir/cached_UTF-8_del.$format /etc/console-setup/cached_UTF-8_del.$format
    sudo $loadmap
    
    rm -rf $tmp_dir

  else
    echo "There's something wrong. Layout symbol file /usr/share/X11/xkb/symbols/us doesn't exist. Are you really using X11 or Wayland?"
    exit 1;
  fi
fi


if $WouldRemove; then 
  # Recover from backup or download layout.
  if [ -e /usr/share/X11/xkb/symbols/us.backup ]; then
    echo "Recovering from backup file. Changing layout needs wheel access, so here we use 'sudo', which might prompt you a password request."
    sudo mv /usr/share/X11/xkb/symbols/us.backup /usr/share/X11/xkb/symbols/us
    setxkbmap us

  else
    echo "Downloading us layout from freedesktop..."
    if [ -z "$(curl -sL https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/raw/master/symbols/us > $tmp_dir/us)" ]; then
      wget -q https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config/-/raw/master/symbols/us -O $tmp_dir/us
    fi
    if [ $? -ne 0 ]; then
      echo "Could not download from freedesktop.org. Trying github.com..."
      if [ -z "$(curl -sL https://github.com/freedesktop/xkeyboard-config/raw/master/symbols/us > $tmp_dir/us)" ]; then
        wget -q https://github.com/freedesktop/xkeyboard-config/raw/master/symbols/us -O $tmp_dir/us
      fi
      # make error from curl output error message and stop shell script
      if [ $? -ne 0 ]; then
        echo "Error downloading the xkb layout. Please try again."
        exit 1
      fi
    fi
    echo "Reverting P layout back to default us layout. Changing layout needs wheel access, so here we use 'sudo', which might prompt you a password request."
    sudo mv $tmp_dir/us /usr/share/X11/xkb/symbols/us
    setxkbmap us
    # Update on Console
    sudo setupcon --save-keyboard /etc/console-setup/cached_UTF-8_del.$format
    sudo $loadmap
  fi  
  exit 0;
fi

rm -rf $tmp_dir

while true; do
    echo "Are you interested in trying out another optional mod? (y/N)"
    read -r REPLY
    case $REPLY in
        [Yy]* ) sh -c "$(curl -fsSL https://github.com/coughingmouse/p-layout/raw/main/xkb-version/useful_settings.sh)"; break;;
	* ) exit;;
    esac
done

