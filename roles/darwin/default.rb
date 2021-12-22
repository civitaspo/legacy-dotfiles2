include_role 'base'
include_cookbook 'homebrew' # install packages from .Brewfile

include_cookbook 'zsh'
include_cookbook 'starship'
include_cookbook 'tmux'
include_cookbook 'neovim'
include_cookbook 'scripts'
include_cookbook 'sbin'
include_cookbook 'secrets'
include_cookbook 'bin'

# packages which require only dotfiles.
# installed by `brew cask`
dotfile '.pryrc'
dotfile '.hammerspoon'
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

# Do not show other letters by hold pressing keys.
execute "defaults write -g ApplePressAndHoldEnabled -bool false" do
  not_if "[ $(defaults read -g ApplePressAndHoldEnabled ) -eq 0 ]"
end
