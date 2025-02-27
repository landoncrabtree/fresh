# macOS (Sonoma 14.0)

## fresh.sh
This script install all necessary tools that I regularly use, including development runtimes (Python, Node, etc), applications (Discord, Bitwarden, etc), shell themes/plugins, application autoupdates, dotfiles, and more.

```sh
git clone https://github.com/landoncrabtree/fresh.git
cd macOS
./fresh.sh # core install
```

## yabai.sh

This script installs yabai and skhd, and configures them for macOS. Note: It requires SIP to be disabled.

```sh
./yabai.sh
```

### BetterTouchTool (yabai)

Remove swipe animation using Yabai + BetterTouchTool.

Swipe Left
```sh
/opt/homebrew/bin/yabai -m space --focus $(/opt/homebrew/bin/yabai -m query --spaces --display mouse | /opt/homebrew/bin/jq ".[].index" | grep $((1 + `/opt/homebrew/bin/yabai -m query --spaces --space mouse | /opt/homebrew/bin/jq ".index"`)))
```

Swipe Right
```sh
/opt/homebrew/bin/yabai -m space --focus $(/opt/homebrew/bin/yabai -m query --spaces --display mouse | /opt/homebrew/bin/jq ".[].index" | grep $((`/opt/homebrew/bin/yabai -m query --spaces --space mouse | /opt/homebrew/bin/jq ".index"` - 1)))
```

### Battery / Sleep (Macbooks, primarily)

- `sudo pmset disableassertion InternalPreventSleep`
- <https://bugzilla.mozilla.org/show_bug.cgi?id=1821102>
- All typical sleep settings & disable notifications on sleep (SleepAid to diagnose).
