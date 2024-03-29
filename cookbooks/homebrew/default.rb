execute "Install Homebrew" do
  command 'HAVE_SUDO_ACCESS=1 NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"'
  not_if "which brew >/dev/null"
end

[
  '~/.linuxbrew',
  '/home/linuxbrew/.linuxbrew',
  '/opt/homebrew',
].each do |brew_dir|
  execute "eval \"$(#{brew_dir}/bin/brew shellenv)\"" do
    subscribes :run, "execute[Install Homebrew]", :immediately
    action :nothing
    only_if "test -d #{brew_dir}"
  end
end

dotfile '.Brewfile'

define :cask do
  name = params[:name]
  package name do
    not_if "ls -1 $(brew --prefix)/Caskroom | grep '^#{name}$'"
  end
end

define :tap do
  name = params[:name]
  execute "brew tap #{name}" do
    not_if "brew tap | grep '^#{name}$'"
  end
end


# NOTE: It takes very long time, so execute this manually.
# execute "HOMEBREW_FORCE_BREWED_CURL=1 brew bundle --global" do
#   not_if "brew bundle check --global"
# end
