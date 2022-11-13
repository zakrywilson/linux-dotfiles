# dotfiles for Linux

Dotfiles for Linux, particularly for Debian-based systems with the Apt package manager.

1. Ensure you have a public key set up for GitHub (if not, [create one](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent#generating-a-new-ssh-key))

1. Install software
    ```
    sudo apt-get update
    sudo apt-get install --reinstall build-essential
    sudo apt-get install git, fzf, zsh, lazygit, tree, rg, bat
    ```
    
    Note: build-essential is required, as nvim-treesitter might have compile issues without it.

1. Install dotfiles
    ```
    git clone git@github.com:zakrywilson/linux-dotfiles.git ~/.dotfiles && \
        cd ~/.dotfiles && \
        ./install
    ```

1. Other tweaks
    - Update Vimium to only work for Google Search by going into the extension in Chrome adding the URL: `https://www.google.com/`

## To-Do's

- [ ] LSPs
    - [ ] Lua
    - [ ] Rust
    - [ ] Python
- [ ] DotBot: setup scripts:
    - [x] 1password
    - [ ] Brave
    - [ ] Kitty
    - [ ] Lazygit
    - [ ] Neovim
    - [ ] Oh-My-Zsh
- [ ] SysConf
