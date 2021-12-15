# P Layout

Four easy-to-learn and intuitive layouts made using the concept of a better home row: one for English speakers who overtype t's (thanks to the way we write th and th, yes, the other th) another for the rest of the world (especially Chinese, where i is used very often), and two more for those who are too used to the special letters on Qwerty.

## Installation

### macOS

* Supported layout: English (Default), International

Try the following code on a terminal app. Copy it, open the terminal, paste it, and hit enter.
```zsh
zsh -c "$(curl -fsSL https://github.com/coughingmouse/p-layout/raw/main/macOS-version/install.sh)"
```
The layout is with an amazing app called Ukelele. Installing for everyone enables it on the device before (and on the password dialogs) and after login. After installation, you will have to enable it by somehow adding it to your list of layouts as well as make it default for user and for the login screen. To uninstall,run the installer again.

### Linux (and BSDs?)

Note that this layout is not implemented correctly, although it does have every feature it needs. 

* Supported layouts: English (Default), International, Conservative, Minimalistic

I uploaded the thingy I now use to install the layout [here](https://github.com/coughingmouse/p-layout/tree/main/xkb-version). Note that it will not work on vt, which you are likely using on BSDs. **You need to be using us or us altgr-intl layout** on X11 or Wayland (or i.e. ones that respect xkb). Try running it. I've only tested it on Pop!\_OS, Fedora, and Debian, but it should work almost everywhere.
```sh
sh -c "$(curl -fsSL https://github.com/coughingmouse/p-layout/raw/main/xkb-version/install.sh)"
```
In case the above does not run (i.e. if curl is not installed), try this instead:
```sh
sh -c "$(wget -q https://github.com/coughingmouse/p-layout/raw/main/xkb-version/install.sh -O -)"
```
I've added in some optional code so that you may use CapsLock to change layout you are locked into, and to use fn key as an emoji picker if you are using ibus on Gnome.

### Windows 

* Supported layouts: English (Default), International, Conservative, Minimalistic

I released the layouts I've made with Microsoft Keyboard Layout Creator, a downloadable app. You can build dll and setup the package using the aforementioned software.
Note that spacebar cannot be used for non-space letters without using IME, which MKLC is not for, so the underscore is placed under the escape key. Non-breaking space is not used because when I tried mapping it to shift + space, it caused error everywhere, not just in codes.

1. Download from the [release page](https://github.com/coughingmouse/p-layout/releases/) of this repository, which unintuitively gives an option to download a zip file.
2. Place and unzip to the ```yourchoice_p``` folder where you want to put it permanently. 
3. Open the folder. You should see an executable file. **DO NOT** delete anything in the downloaded repository until you delete the layout with the same executable file. 
4. Okay, now you're safe to run the executable. After uninstalling it, you can delete the enclosing folder. 

## P layout
###  English P layout (Default)
```
⎋ F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12
0 1  2  3  4  5  6  7  8  9  (  )  =   ⌫ 
⇥  q  w  e  r  p  y  u  t  o  '  -  +  \
⇪   a  s  d  f  g  h  j  k  l  i  ;    ↩
⇧    z  x  c  v  b  n  m  ,  .  /      ⇧
fn ⎈  ⌘  ⎇  ␣  ⇮  ⌘  ⎈  ←  ↓  ↑  →
```
```
⎋ F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12
· |  @  #  $  %  ^  &  *  `  [  ]  ~   ⌫
⇥  Q  W  E  R  P  Y  U  T  O  "  {  }  !
⇪   A  S  D  F  G  H  J  K  L  I  :    ↩
⇧    Z  X  C  V  B  N  M  <  >  ?      ⇧
fn ⎈  ⌘  ⎇  _  ⇮  ⌘  ⎈  ←  ↓  ↑  →
```
<!--- template for keyboard borrowed from the [yak-layout](https://github.com/wincent/yak-layout/blob/master/README.md) -->
<!--- symbols are put according to https://jdebp.uk/FGA/iso-9995-7-symbols.html -->

### International P layout
```
⎋ F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12
0 1  2  3  4  5  6  7  8  9  (  )  =   ⌫
⇥  q  w  e  r  t  y  u  i  o  '  -  +  \
⇪   a  s  d  f  g  h  j  k  l  p  ;    ↩
⇧    z  x  c  v  b  n  m  ,  .  /      ⇧
fn ⎈  ⌘  ⎇  ␣  ⇮  ⌘  ⎈  ←  ↓  ↑  →
```
```
⎋ F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12
· |  @  #  $  %  ^  &  *  `  [  ]  ~   ⌫
⇥  Q  W  E  R  T  Y  U  I  O  "  {  }  !
⇪   A  S  D  F  G  H  J  K  L  P  :    ↩
⇧    Z  X  C  V  B  N  M  <  >  ?      ⇧
fn ⎈  ⌘  ⎇  _  ⇮  ⌘  ⎈  ←  ↓  ↑  →
```
* Note that _ is typed with ⇧ + 0 instead on Windows, due to the limitation of the implementation method. There, the interpunct is not typable for now. 

### Conservative English P layout
Only 5 keys differ from Qwerty: i, t, p, ;, and '.
```
⎋ F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12
` 1  2  3  4  5  6  7  8  9  0  -  =   ⌫
⇥  q  w  e  r  p  y  u  t  o  '  [  ]  \
⇪   a  s  d  f  g  h  j  k  l  i  ;    ↩
⇧    z  x  c  v  b  n  m  ,  .  /      ⇧
fn ⎈  ⌘  ⎇  ␣  ⇮  ⌘  ⎈  ←  ↓  ↑  →
```
```
⎋ F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12
~ !  @  #  $  %  ^  &  *  (  )  _  +   ⌫
⇥  Q  W  E  R  P  Y  U  T  O  "  {  }  |
⇪   A  S  D  F  G  H  J  K  L  I  :    ↩
⇧    Z  X  C  V  B  N  M  <  >  ?      ⇧
fn ⎈  ⌘  ⎇  ␣  ⇮  ⌘  ⎈  ←  ↓  ↑  →

```
### Minimalistic P layout
Only 3 keys differ from Qwerty: p, ;, and '.
```
⎋ F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12
` 1  2  3  4  5  6  7  8  9  0  -  =   ⌫
⇥  q  w  e  r  t  y  u  i  o  '  [  ]  \
⇪   a  s  d  f  g  h  j  k  l  p  ;    ↩
⇧    z  x  c  v  b  n  m  ,  .  /      ⇧
fn ⎈  ⌘  ⎇  ␣  ⇮  ⌘  ⎈  ←  ↓  ↑  →
```
```
⎋ F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12
~ !  @  #  $  %  ^  &  *  (  )  _  +   ⌫
⇥  Q  W  E  R  T  Y  U  I  O  "  {  }  |
⇪   A  S  D  F  G  H  J  K  L  P  :    ↩
⇧    Z  X  C  V  B  N  M  <  >  ?      ⇧
fn ⎈  ⌘  ⎇  ␣  ⇮  ⌘  ⎈  ←  ↓  ↑  →
```

## Usage
Put your fingers on [awef jtoi](or [awef jtop], on the international version). That is your home row.

You now use your right pinky to type alphabet without twisting your ankle.
Now you should practice with your new layout. If you're not familiar with typing English, you should start [practicing typing n-grams](https://ranelpadon.github.io/ngram-type/).

Otherwise, practice your layout with [typeracer](https://play.typeracer.com/) (or [gotypist](https://github.com/pb-/gotypist) if you want to do it offline by yourself). You can further experiment with special characters using [mltype](https://github.com/jankrepl/mltype).

I would like to add in a custom touch typing tutor software tailored for the new home row of the English P layout, which I have not made. If you would like to help, please look into [this](https://github.com/susam/quickqwerty) and [gotypist](https://github.com/pb-/gotypist) both of which look like something we could use.

## Characteristics
### Benefits
* Maybe your hands hurt less
* Numbers make sense: most importantly, keyboard mapping for navigation on Youtube video makes sense
* If you are trying to learn a new layout anyway, this will take the least time to get used to.

### Cons
* If you are not trying to learn a new layout, this will take some, although minimal, time to get used to.

<!--
## Motive
### 0
#### 0.0
Learning keyboard layout is very time consuming. 

Learning Qwerty wasn't the best experience you had. But you got away with it.
Learning Dvorak sucks because you have to relearn everything anyway.
TBH you only need to replace P (and T if you are an English user).
If you already learned Dvorak, it still sucks because you can't use copy-paste intuitively, nor play games without tweaking settings every time.

#### 0.1
Ergonomics of normal keyboards stink. Home row assumes that your fingers are robot fingers. And pretty much every alternative keyboard layouts assume this "Home row" to be asdf jkl;.
All ergonomic keyboards are just as bad, because you either have to relearn typing (e.g. Ergodox, planck) and is not any better tbh, or the keyswitches aren't the best (e.g. Microsoft Ergonomic keyboards).

#### 0.2
If you think about it, the position of the special letters suck. Not intuitive nor useful.

### 1
It's not like we have any good alternatives to keyboards.

### 2
What if we could (at least partially) fix all this? With barely any effort?
-->



## Design requirements
* Common shortcuts such as copy-paste and select all preserved (qw, as, zxcv)
* Game compatible (preserves qwer, asdf)
* Preserves modifier keys (Relearning these take a lot of time)
* Preserve hjkl for older audiences still using vi
* Use sane home row
* Work with any ISO compatible keyboard layout (European, US, KR types considered; but JP type to be considered optionally)
* Be as conservative as possible so that normal people may "actually" use it
* (English specific) Move T to the home row

## Answers to some possible questions
are at the [wiki](https://github.com/coughingmouse/p-layout/wiki#answers-to-some-possible-questions).
