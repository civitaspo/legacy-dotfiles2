execute "Install Homebrew" do
  command 'yes | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'
  not_if "which brew >/dev/null"
end

dotfile '.Brewfile'

execute "brew bundle --global" do
  not_if "brew bundle check --global"
end
