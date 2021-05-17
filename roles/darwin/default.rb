include_role 'base'
include_cookbook 'homebrew' # install packages from .Brewfile

include_cookbook 'google-japanese-ime'
include_cookbook 'zsh'
include_cookbook 'tmux'
include_cookbook 'neovim'
include_cookbook 'vscode-insiders'
include_cookbook 'tig'
include_cookbook 'scripts'
include_cookbook 'sbin'
include_cookbook 'bin'

# packages which require only dotfiles.
# installed by `brew cask`
dotfile '.config/karabiner'
dotfile '.config/alacritty'
dotfile '.doc'
dotfile '.pryrc'
dotfile '.secret-env.sh'
dotfile '.hammerspoon'
dotfile '.op'
dotfile '.gem'
dotfile '.ideavimrc'

# keyrepeat
execute "defaults write -g InitialKeyRepeat -int 15" do
  not_if "[ $(defaults read -g InitialKeyRepeat) -eq 15 ]"
end

execute "defaults write -g KeyRepeat -int 1" do
  not_if "[ $(defaults read -g KeyRepeat) -eq 1 ]"
end

# Dock is hidden unless the cursor is hovered over it for 65535 seconds.
execute "defaults write com.apple.dock autohide-delay -float 65535" do
  not_if "[ $(defaults read com.apple.dock autohide-delay) -eq 65535 ]"
end
