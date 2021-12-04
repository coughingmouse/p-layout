#!/usr/local/bin/zsh

# Check if the user is not root
if [ "$(id -u)" = "0" ]; then
    echo "Do not run any script as root unless you know you have to." 1>&2
    exit 1
fi

location4All="/Library/Keyboard Layouts"
location4Me="~/Library/Keyboard Layouts"

# Ask to install
while true; do
  echo "For who do you want to install? (Everyone(recommended)/Me/Uninstall/Abort)"
  read -r REPLY
  case $REPLY in
    [Ee]* ) wouldLikeToRemove=false; installLocation=$location4All; sudoComesHere="sudo"; break;;
    [Mm]* ) wouldLikeToRemove=false; installLocation=$location4Me; sudoComesHere=""; break;;
    [Uu]* ) wouldLikeToRemove=true; break;;
    [Aa]* ) exit;;
    * ) echo "Please answer with either e, m, u, or a."; exit;;
  esac
done

# Remove any installed layout
if $wouldLikeToRemove; then
  rm -rf $location4Me/P.bundle $location4Me/International_P.bundle
  if [ -d $location4All/P.bundle ] || [ -d $location4All/International_P.bundle ]; then
    echo "You are going to remove a protected file (a directory, actually). We need to use sudo."
    sudo rm -rf $location4All/P.bundle $location4All/International_P.bundle
  fi
  exit 0
fi

# Install layout
while true; do
    echo "Which one would you like to install? (P layout/International P layout/Abort)"
    read -r REPLY
    case $REPLY in
        [Pp]* ) layout="P.bundle"; break;;
        [Ii]* ) layout="International_P.bundle"; break;;
        [Aa]* ) exit;;
        * ) echo "Please answer with p, i, or a."; exit;;
    esac
done
temp_dir=$(mktemp -d)
if [ -z "$(git clone https://github.com/coughingmouse/p-layout $temp_dir)" ]; then
  echo "Moving layout folder where it should be may require wheel access."
  $sudoComesHere mv $temp_dir/macOS-version/$layout $installLocation/$layout
  $sudoComesHere touch $installLocation
  rm -rf $temp_dir
else
  echo "Could not download layout. Exiting."
  rm -rf $temp_dir
  exit 1
fi

# Restart
while true; do
  echo "Now, you need to reboot your macOS to finish installing the keyboard. Once you log back in, open System Preferences. Once you enter Keyboard - Input Sources, press the + icon, where under English, you should be able to find the layouts.(Okay, let me reboot/I'll reboot later)"
  read -r REPLY
  case $REPLY in
    [Oo]* ) osascript -e 'tell app "loginwindow" to «event aevtrrst»'; echo "Restart yourself if your computer didn't restart on its own."; exit;;
    [Ii]* ) exit;;
    * ) echo "Please answer with either e, m, r, or a.";;
  esac
done
