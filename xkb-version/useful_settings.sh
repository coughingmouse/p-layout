#!/bin/sh

# In case Gnome is being used, 
if [ "$(gsettings get org.gnome.desktop.input-sources xkb-options)" ]; then

  # Enable option to toggle language with caps toggle
  echo "Do you want to toggle layout with caps toggle key? This works only when xkb does. (y/N)"
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

  ## to add Thinkpad X230-specific patch
  ## gsettings set org.gnome.desktop.input-sources xkb-options "['compose:prsc']" 
  #if [ ! "$(gsettings get org.gnome.desktop.input-sources xkb-options | grep 'compose:prsc')" ]; then
  #  echo "Do you want to add X230-specific patch to use PrSc key to compose? (y/N)"
  #  read -r REPLY
  #  case $REPLY in
  #    [Yy]* ) xkb_options=$(gsettings get org.gnome.desktop.input-sources xkb-options);
  #            xkb_options="$(echo "$xkb_options" | sed 's/.$//'), 'compose:prsc']";
  #            gsettings set org.gnome.desktop.input-sources xkb-options "$xkb_options";
  #            echo "From now, press PrSc to compose.";;
  #    * ) ;;
  #  esac
  #fi
fi

# Use fn key to access ibus emoji
# Note that the value changed is actually at desktop.ibus.panel.emoji
if [ "$(gsettings get org.freedesktop.ibus.panel.emoji hotkey)" ]; then
  echo "Do you want to Fn key for emoji? This works only when ibus does. (y/N)"
  read -r REPLY
  case $REPLY in
    [Yy]* ) hotkey=$(gsettings get org.freedesktop.ibus.panel.emoji hotkey)
            if [ ! "$(echo "$hotkey" | grep 'WakeUp')" ]; then
              if [ "$hotkey" = "@as []" ]; then
                hotkey="['WakeUp']"
                gsettings set org.freedesktop.ibus.panel.emoji hotkey "$hotkey"
              else
                hotkey="$(echo "$hotkey" | sed 's/.$//'), 'WakeUp']"
                gsettings set org.freedesktop.ibus.panel.emoji hotkey "$hotkey"
              fi
              echo "Now fn key acts as a emoji picker, too."
            fi;;
    * ) ;;
  esac
fi

