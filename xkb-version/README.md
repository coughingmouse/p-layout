# p layout (xkb version)

An implementation of the [P layouts](https://github.com/coughingmouse/p-layout).

***This code replaces the us layout (and assumes it is being used) without backing up. You need internet connection to change it back.***

Note: This does not change your vt keyboard. (Usually...? But on Pop OS 21.10, it seems this also works on vt.) Especially a bit whoopsy on BSDs. Lastly and least importantly, layouts of level 3+ are not changed.

* Requires a distro with X11 (or Wayland?)
* Requires internet connection
* Requires curl (or wget) and sudo installed and set up for use for current user
* You are using us or us altgr-intl (and not us-intl or anything like that) layout

The following "replaces" current keyboard with Qwerpy or the default us layout on X11 or Wayland.

```sh
sh -c "$(curl -fsSL https://github.com/coughingmouse/p-layout/raw/main/xkb-version/install.sh)"
```

In case the above does not run (i.e. if curl is not installed), try this instead:

```sh
sh -c "$(wget -q https://github.com/coughingmouse/p-layout/raw/main/xkb-version/install.sh -O -)"
```

## Changes

* ? Made it available with default us and altgr-intl layouts.
* 2021-11-16 Made it recover default us layout, install dependencies, kinda remove bash dependency, and set some xkb-options.
* 2021-11-27 wget support added
* 2021-11-28 applied better layout

## To do (The ones left now are likely not going to be done by the original author)

* Make it so that it creates a new layout and set it as default keyboard, or do something like that. Read [what someone else did](https://github.com/rgeber/xkb-layout-us-intl-de).
* test it on ksh/csh etc (only tested on bash, zsh, and dash), Wayland, and BSDs.
