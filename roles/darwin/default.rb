include_role 'base'
include_cookbook 'homebrew'

include_cookbook 'zsh'
include_cookbook 'starship'
include_cookbook 'karabiner-elements'
include_cookbook 'neovim'
include_cookbook 'scripts'
include_cookbook 'sbin'
include_cookbook 'secrets'
include_cookbook 'bin'
include_cookbook 'kitty'
include_cookbook 'font'
include_cookbook 'tmux'
include_cookbook 'asdf'
include_cookbook 'hammerspoon'
include_cookbook 'tig'
include_cookbook 'docker'
include_cookbook 'kubectl'

# packages which require only dotfiles.
dotfile '.ideavimrc'  # installed by JetBrains All Product Pack

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

execute "defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false" do
  not_if "[ $(defaults read NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled) -eq 0 ]"
end
