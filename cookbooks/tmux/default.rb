
case node[:platform]
when 'darwin'
  package 'reattach-to-user-namespace'
end

package 'tmux'
dotfile '.tmux.conf'

directory File.join(ENV['HOME'], '.tmux')
directory File.join(ENV['HOME'], '.tmux', 'plugins')
git File.join(ENV['HOME'], '.tmux/plugins/tpm') do
  repository "https://github.com/tmux-plugins/tpm.git"
end

dotfile '.tmux/platform-specific.conf' do
  source ".tmux/#{node[:platform]}.conf"
end

