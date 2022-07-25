#!/bin/sh

# In case Gnome is being used, 
if [ "$(gsettings get org.gnome.desktop.input-sources xkb-options)" ]; then

  # Enable option to switch language with generalized lock
  echo "Do you want to switch layout with the generalized lock key? This works only when xkb does. I can't change it back, though. (y/N)"
  read -r REPLY
  case $REPLY in
    [Yy]* ) xkb_options=$(gsettings get org.gnome.desktop.input-sources xkb-options)
            if [ ! "$(echo "$xkb_options" | grep 'shift:breaks_caps')" ]; then
              if [ "$xkb_options" = "@as []" ]; then
                xkb_options="['shift:breaks_caps']"
                gsettings set org.gnome.desktop.input-sources xkb-options "$xkb_options"
              else
                xkb_options="$(echo "$xkb_options" | sed 's/.$//'), 'shift:breaks_caps']"
                gsettings set org.gnome.desktop.input-sources xkb-options "$xkb_options"
              fi
            fi
            if [ ! "$(echo "$xkb_options" | grep 'grp:caps_toggle')" ]; then
              if [ "$xkb_options" = "@as []" ]; then
                xkb_options="['grp:caps_toggle']"
                gsettings set org.gnome.desktop.input-sources xkb-options "$xkb_options"
              else
                xkb_options="$(echo "$xkb_options" | sed 's/.$//'), 'grp:caps_toggle']"
                gsettings set org.gnome.desktop.input-sources xkb-options "$xkb_options"
              fi
              echo "From now, lock into another layout with the Generalized lock key, also known as CapsLock. Lock Caps with Shift + Generalized_lock instead. If you customized your lock key, this may not function as intended."
            fi;;
    * ) ;;
    esac
else
  echo "I'm afraid I can't do that, $(whoami). I can't find the options to tweak xkb."
fi
