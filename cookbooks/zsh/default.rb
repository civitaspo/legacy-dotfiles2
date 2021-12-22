include_recipe '../git/default.rb'
package 'zsh'

directory File.join(ENV['HOME'], '.local')
directory File.join(ENV['HOME'], '.local', 'share')
directory File.join(ENV['HOME'], '.local', 'share', 'zinit')

git File.join(ENV['HOME'], '.local', 'share', 'zinit', 'zinit.git') do
  repository "https://github.com/zdharma-continuum/zinit.git"
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

