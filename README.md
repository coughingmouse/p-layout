# P Layout

Two easy-to-learn and intuitive layouts: one for English speakers who overtype t's (thanks to the way we write th and th, yes, the other th) and another for the rest of the world (especially Chinese, where i is used very often).

## P layout
###  Default layout
```
⎋ F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12  ⌽
0  1  2  3  4  5  6  7  8  9  (  )  =  ⌫
⇥  q  w  e  r  p  y  u  t  o  '  -  +  \
⇪   a  s  d  f  g  h  j  k  l  i  ;    ↩
⇧    z  x  c  v  b  n  m  ,  .  /      ⇧
fn ⎈  ⌘  ⎇  ␣  ⇮  ⌘  ⎈  ←  ↓  ↑  →
```
```
⎋ F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12  ⌽
·  |  @  #  $  %  ^  &  *  `  [  ]  ~  ⌫
⇥  Q  W  E  R  P  Y  U  T  O  "  {  }  !
⇪   A  S  D  F  G  H  J  K  L  I  :    ↩
⇧    Z  X  C  V  B  N  M  <  >  ?      ⇧
fn ⎈  ⌘  ⎇  _  ⇮  ⌘  ⎈  ←  ↓  ↑  →
```
<!--- template for keyboard borrowed from the [yak-layout](https://github.com/wincent/yak-layout/blob/master/README.md) -->
<!--- symbols are put according to https://jdebp.uk/FGA/iso-9995-7-symbols.html -->

### (International) P layout
```
⎋ F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12  ⌽
0  1  2  3  4  5  6  7  8  9  (  )  =  ⌫
⇥  q  w  e  r  t  y  u  i  o  '  -  +  \
⇪   a  s  d  f  g  h  j  k  l  p  ;    ↩
⇧    z  x  c  v  b  n  m  ,  .  /      ⇧
fn ⎈  ⌘  ⎇  ␣  ⇮  ⌘  ⎈  ←  ↓  ↑  →
```
```
⎋ F1 F2 F3 F4 F5 F6 F7 F8 F9 F10 F11 F12  ⌽
·  |  @  #  $  %  ^  &  *  `  [  ]  ~  ⌫
⇥  Q  W  E  R  T  Y  U  I  O  "  {  }  !
⇪   A  S  D  F  G  H  J  K  L  P  :    ↩
⇧    Z  X  C  V  B  N  M  <  >  ?      ⇧
fn ⎈  ⌘  ⎇  _  ⇮  ⌘  ⎈  ←  ↓  ↑  →
```
<!---  template for keyboard borrowed from the [yak-layout](https://github.com/wincent/yak-layout/blob/master/README.md) -->

* Note that _ is typed with ⇧ + 0 instead on Windows, due to the limitation of the implementation method. There, the interpunct is not typable for now. 

## Usage
Put your fingers on [awef jtoi](or [awef jtop], on the international version). That is your home row.
You now use your right pinky to type alphabet without twisting your ankle.

## Characteristics
### Benefits
* Maybe your hands hurt less
* Numbers make sense: most importantly, keyboard mapping for navigation on Youtube video makes sense
* If you are trying to learn a new layout anyway, this will take the least time to get used to.

### Cons
* If you are not trying to learn a new layout, this will take some, although minimal, time to get used to.

<!--
## Introduction
### 0
#### 0.0
Learning keyboard layout always sucks. 

Learning Qwerty sucked. But you got away with it.
Learning Dvorak sucks because you have to relearn everything anyway.
TBH you only need to replace P (and T if you are an English user).
If you already learned Dvorak, it still sucks because you can't use copy-paste intuitively, nor play games without tweaking settings every time.

#### 0.1
If you think about it, the position of the special letters suck. Not intuitive nor useful.

#### 0.2
Ergonomics of normal keyboards suck. Home row assumes that your fingers are robot fingers. And pretty much every alternative keyboard layouts assume this "Home row" to be asdf jkl;.
All ergonomic keyboards suck as well, because you either have to relearn typing (e.g. Ergodox, planck) and is not any better tbh, or the keyswitches suck (e.g. Microsoft Ergonomic keyboards).

### 1
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

## Possibly FAQ
<!--
* Why are the positions of / and \ still quite arbitrary?

To US keyboard users, yes, it may seem rather arbitrary. But for others, it may look symmatric, because \ is placed elsewhere.

* Why is the position of ` as arbitrary as it was before?

Because no one uses it tbh. At least now it's on the right side of the keyboard along with all the other accents.

* Why not put - and ~ together?

Because they are not interchangable in any specific language, afaik.
-->

* How can I try this?

For Windows, I uploaded the layout I've made with Microsoft Keyboard Layout Creator, a downloadable app. Download the repository as a zip file and open p_en folder. You should see an executable file. Run it and **DO NOT** delete anything in the downloaded repository until you delete the layout with the same executable file. Note that spacebar cannot be used for non-space letters without using IME, which MKLC is not for, so the underscore is placed under the escape key. Non-breaking space is not used because when I tried mapping it to shift + space, it caused error everywhere, not just in codes.

On Mac, I uploaded the layout I made with an amazing app called Ukelele on this repository. You should somehow place the buldle file at "/Library/Keyboard Layouts" (or at "~/Library/Keyboard Layouts" if you want to install the keyboard for a specific user) so that the layout can be used on the device before (and on the password dialogs) and after login. sudo touch the Keyboard Layouts folder to inform Mac that you did something to your keyboard layout. You should restart your computer after that; logging out and back in won't do. Then you will have to somehow add it to your list of layouts as well as make it default for user and for the login screen. To uninstall, remove the file and touch the parent folder again. This all could probably be automated, but I'm too lazy to make a script. Also the name of the layout is not updated from the prototype. Maybe you can help?

For Linux and BSDs, I uploaded the thingy I now use to install the layout. The following "replaces" current keyboard with Qwerpy or the default us layout on X11 or Wayland. Try running it.
```sh
sh -c "$(curl -fsSL https://github.com/coughingmouse/p-layout/raw/main/xkb-version/install.sh)"
```
In case the above does not run (i.e. if curl is not installed), try this instead:
```sh
sh -c "$(wget -q https://github.com/coughingmouse/p-layout/raw/main/xkb-version/install.sh -O -)"
```

