include_recipe '../git/default.rb'
package 'zsh'

git File.join(ENV['HOME'], '.zplug') do
  repository "https://github.com/zplug/zplug.git"
end

# load the below order
# http://zsh.sourceforge.net/Intro/intro_3.html#SEC3
dotfile '.zshenv'
dotfile '.zprofile'
dotfile '.zshrc'
dotfile '.zlogin'
dotfile '.zlogout'

dotfile '.zsh'

execute "chsh -s /usr/local/bin/zsh #{node[:user]}" do
  only_if "echo $SHELL | grep /usr/local/bin/zsh"
  user 'root'
end

