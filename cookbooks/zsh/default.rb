include_recipe '../git/default.rb'
package 'zsh'

directory File.join(ENV['HOME'], '.zplugin')

git File.join(ENV['HOME'], '.zplugin', 'bin') do
  repository "https://github.com/zdharma/zplugin.git"
end

# load the below order
# http://zsh.sourceforge.net/Intro/intro_3.html#SEC3
dotfile '.zshenv'
dotfile '.zprofile'
dotfile '.zshrc'
dotfile '.zlogin'
dotfile '.zlogout'

dotfile '.zsh'

execute "echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells" do
  not_if "grep '^/usr/local/bin/zsh' /etc/shells"
end

execute "chsh -s /usr/local/bin/zsh #{node[:user]}" do
  not_if "echo $SHELL | grep /usr/local/bin/zsh"
end

