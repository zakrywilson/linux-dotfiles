# Kitty Installation on Linux

## Desktop integration on Linux

It's always a pain to create a desktop app on Linux. This script below will copy Kovid's two desktop scripts for Kitty and then replace the local paths in the scripts for the icon path and executable path. The version below uses a custom Kitty icon (the dark cute one), which is saved in `./icons`.

Sources:
- https://sw.kovidgoyal.net/kitty/binary/#desktop-integration-on-linux
- https://github.com/kovidgoyal/kitty/issues/347

TODO: Make a script that does this

```
ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications/
cp ~/.local/kitty.app/share/applications/kitty-open.desktop ~/.local/share/applications/
sed -i "s|Icon=kitty|Icon=/home/$USER/.dotfiles/config/kitty/icons/kitty-dark.png|g" ~/.local/share/applications/kitty*.desktop
sed -i "s|Exec=kitty|Exec=/home/$USER/.local/kitty.app/bin/kitty|g" ~/.local/share/applications/kitty*.desktop
```

