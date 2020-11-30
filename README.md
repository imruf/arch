---
### Dot repo of archlinux+dwm rice

---
### Dwm
---

##### Key Bindings

##### Mod Key
    Mod1, i.e Alt
    
##### Additional Mod Key
    Mod4, i.e Super

##### Dwm Bindings

- Bar toggle:             Alt+b

##### Window

- Kill Window:            Alt+y
 
- Window Focus
    - Up:                 Alt+k
    - Down:               Alt+j

- Manage Window Size
    - Left/Right:         Alt+h/Alt+l
    - Inc/Dec:            Alt+h/Alt+l
    
- Master/Stack
    - Inc:                Alt+Shift+i
    - Dec:                Atl+Shift+d
    
- Move Stack
    - Up:
       - Alt+Shift+k
       - Super+k
    - Down:
       - Alt+Shift+j
       - Super+j
                         
- Zoom/NxtMaster:         Alt+Enter

##### Tag
- Switch Tag:             Alt+[1-0]
- Switch Last Tag:
  - Alt+Tab
  - Control+Space
 
- Next Tag:               Alt+Control+l
- Previous Tag:           Alt+Control+h

- Manage Tag:
    - Tag Another To Current:
        - Alt+Control+Tag Number
    - View All Tag And And Open Windows:
        - Alt+0
    - Tag Current To All:
        - Alt+Shift+0

##### Layouts
- Tile:                   Alt+t
- Tile(Bstack):           Alt+Shift+t
- Float:                  Alt+f
- Monocle:                Alt+m
- Toggle Layout:          Alt+Space
- Toggle Float:           Alt+Shift+Space
- Move Float:             Alt+Mouse_Left
- Resize Float:           Alt+Mouse_Right

##### Power
- Exit dwm:               Alt+Shift+e
- Suspend:                Alt+Shift+s
- Shutdown:               Alt+Shift+h
- Reboot:                 Alt+Shift+r
- Lock:                   Alt+Shift+l

##### System
- Brightness
    - Inc:                 Fn+BrightnessUp
    - Dec:                 Fn+BrightnessDown

- Volume
    - Inc:                 Fn+VolumeUp
    - Dec:                 Fn+VolumeDown
    - Mute:                Fn+Mute
    
##### App Bindings

- Terminal:               Alt+/

- Scratchpad:
    - dropdown            Super+/
    - gnote               Alt+Shift+n

- dmenu 
    - dmenu:              Alt+;
    - dbang:              Super+;
    - dweb:               Alt+p
    - calc:               Fn+Keypad_Enter
    - powermenu:          Alt+Shift+x4
    - clipmenu:           Shift+Insert

- Files
    - nnn:                Alt+o
    - lf:                 Super+o
    - pcmanfm:            Alt+Shift+o

- Browser
    - qutebrowsr:         Alt+i
    - firefox:            Super+i
    - elinks:             Alt+n

- Music:                  Alt+Shift+m

- Screenshot:
    - FullScreen:          prtsc
    - ActiveWindow:        Shift+prtsc
    - Selection:           Control+prtsc

---
### dmenu
---

* Use ctrl+vim keys to select suggestions.

---
### st
---

##### Key Bindings

##### Mod Key
    Mod4, i.e Super
    
##### TERMMOD Key
    Ctrl+Shift
   
- Copy:                     Ctrl+Shift+c
- Paste:                    Ctrl+Shift+v

- Color:                    Ctrl+Shift+p

- Zoom
    - In:                   Ctrl+Shift+pgup
    - Out:                  Ctrl+Shift+pgdn
    - Reset:                Ctrl+Shift+home
    
- Scroll
    - Up:                   Alt+Ctrl+k
    - Down:                 Alt+Ctrl+j

- Url
    - Select:                Super+l
    - Open:                  Super+u

---
### nnn
---
* Basic vim keys for navigation
* Leader key for bookmark: ,
* CD Root, Home, Last: ~, `, @
* Show Hidden: .
* Show Details: d
* File Stats: f
* Open With: o
* Create Archive: z
* Sort: t
* Select: Space
* Select All: a
* Copy: p
* Paste: v
* Delete: x
* Rename: Ctrl+r
* Rename All: r
* Remote Directory Key: C
* Unmount Remote: u
* Mark: b
* Search: /
* Search And Navigate: i/Ctrl+n
* Plugin: c
* Shell: s
* Quit: ; q

---
### qutebrowser
---

- Url
    - Open:                  o
    - Open In New Tab:       O
    - Open In New Window:    Ctrl+n

- Navigation
    - Page Down:              space
    - Page Down:              Ctrl+F
    - Up:                     k
    - Down:                   j
    - Left:                   h
    - Right:                  l
    - Half Up:                Ctrl+B
    - Half Down:              Ctrl+D
    - Forward:                L/m
    - Back:                   H/u
    - Follow Link:            f
    - Follow Link In New Tab: F, af
    - Tab Next:               J
    - Tab Previous:           K
    - Delete Current Tab:     d
    - Hint Menu:              ;
    - Undo:                   Ctrl+u
    - Reload:                 r/R
    - Stop:                   Ctrl+s
    - Bookmarks:              gb
    - History:                gh
    - Settings:               gx
    - Download:               gd
    - View Source:            gs

- Download
    - Cancel Download:                  ad
    - Clear Download:                   cd
    - Copy Download Link Prompt:        Ctrl+c
    - Download Hinted Links With ari2p: ca

- Search Elvi
    - aur, aw, b2b, b2e, bing, ddg, e2b, gg, git, pkg, sp, ud, ytv, yy

- Play Hinted Media In mpv:                X
- Play Hinted Media With 4p Script:        x

- Toggle
    - Toggle Hint:           t
    - Images:                tp
    - Javascript:            tj

- Zoom
    - In:                     +
    - Out:                    -
    - Reset:                  =

- Search In Page
    - Text:                   /
    - Next:                   n
    - Previous:               N

- Quit:                       ; q

---
### elinks
---

- Navigation
    - Page Down:              Ctrl+f
    - Page up:                Ctrl+b
    - Up:                     k
    - Down:                   j
    - Left:                   h
    - Right:                  l Right
    - Top:                    g
    - Bottom:                 G
    - Open Link:              l
    - Next Link:              n
    - Previous Link:          p
    - Back:                   H
    - Forward:                L
    - Tab Next:               K/Ctrl+l
    - Tab Previous:           J/Ctrl+h
    - Tab Close:              d
    - Undo:                   Ctrl+u
    - Reload:                 r
    - Stop:                   Ctrl+c
    - Bookmark:               b
    - Search:                 f
    - Menu:                   esc
    - Options:                m
    - External Passing:       v
    - View Image:             i

- Url
    - Open:                         u
    - Open In New Tab:              T
    - Open New Tab In Background:   Ctrl+T

- Quit                       ; q

---
### cmus
---
* 1-7 view mode
* Vim Key Navigation
* Quit q
 
- Volume
    - Up:                    +
    - Down:                  -
    - Left Up:               [
    - Left Down:             {
    - Right Up:              ]
    - Right Down:            }

- Player
    - Play:                  P
    - Play Track:            Enter
    - Stop:                  S
    - Pause:                 p
    - Seek +1m:              .
    - Seek -1m:              ,
    - Seek +5:               right
    - Seek -5:               left
    - Shuffle:               s
    - Repeat:                ^R
    - Repeat Album/Artist:    r

- Playlists
    - Add To Library:         a
    - Add To Queue After:     e
    - Add To Playlist:        y
    - Add To Queue Before:    E
    - Delete Track:           D
