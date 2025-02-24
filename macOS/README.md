# macOS (Sonoma 14.0)

## fresh.sh
This script install all necessary tools that I regularly use, including development runtimes (Python, Node, etc), applications (Discord, Bitwarden, etc), shell themes/plugins, and application autoupdates.

```sh
git clone https://github.com/landoncrabtree/fresh.git
cd macOS
./fresh.sh # core install
./yabai.sh # optional yabai and skhd install
```
<<<<<<< HEAD

Jetbrains Toolbox Plugins:
* .ignore by Jetbrains
* CodeGlance Pro by Nasller
* GitHub Copilot by GitHub
* One Dark theme by Mark Skelton
* Atom Material Icons by Atom Material Themes & Plugins
* GitToolBox by Lukasz Zielinski

### BetterTouchTool (yabai)

Remove swipe animation using Yabai + BetterTouchTool.

Swipe Left
```
/opt/homebrew/bin/yabai -m space --focus $(/opt/homebrew/bin/yabai -m query --spaces --display mouse | /opt/homebrew/bin/jq ".[].index" | grep $((1 + `/opt/homebrew/bin/yabai -m query --spaces --space mouse | /opt/homebrew/bin/jq ".index"`)))
```

Swipe Right
```
/opt/homebrew/bin/yabai -m space --focus $(/opt/homebrew/bin/yabai -m query --spaces --display mouse | /opt/homebrew/bin/jq ".[].index" | grep $((`/opt/homebrew/bin/yabai -m query --spaces --space mouse | /opt/homebrew/bin/jq ".index"` - 1)))
```
=======
>>>>>>> 7c08ad8 (new dotfiles)
