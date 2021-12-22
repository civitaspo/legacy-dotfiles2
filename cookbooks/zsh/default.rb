include_cookbook 'homebrew'
include_cookbook 'git'

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


zsh_path =
  case node[:platform]
  when 'darwin' then '/opt/homebrew/bin/zsh'
  else '/usr/local/bin/zsh'
  end

execute "echo '#{zsh_path}' | sudo tee -a /etc/shells" do
  not_if "grep '^#{zsh_path}' /etc/shells"
end

execute "sudo chsh -s #{zsh_path} #{node[:user]}" do
  not_if "echo $SHELL | grep #{zsh_path}"
end

