include_recipe '../functions/default.rb'

fzf_tmux_bin = File.join(ENV['HOME'], 'bin', 'fzf-tmux')
execute "curl -fSL -o #{fzf_tmux_bin} https://raw.githubusercontent.com/junegunn/fzf/master/bin/fzf-tmux" do
  not_if "test -x #{fzf_tmux_bin}"
end
execute "chmod 755 #{fzf_tmux_bin}" do
  not_if "test -x #{fzf_tmux_bin}"
end

# github binaries
github_binary 'fzf' do
  version    '0.16.5'
  repository 'junegunn/fzf-bin'
  case node[:platform]
  when 'darwin'
    archive    'fzf-0.16.5-darwin_amd64.tgz'
  else
    raise 'not supported now'
  end
end

github_binary 'peco' do
  version     'v0.4.9'
  repository  'peco/peco'
  case node[:platform]
  when 'darwin'
    archive     'peco_darwin_amd64.zip'
    binary_path 'peco_darwin_amd64/peco'
  else
    raise 'not supported now'
  end
end

github_binary 'ghq' do
  version    'v0.7.4'
  repository 'motemen/ghq'
  case node[:platform]
  when 'darwin'
    archive    'ghq_darwin_amd64.zip'
  else
    raise 'not supported now'
  end
end

github_binary 'whalebrew' do
  version     '0.0.4'
  repository  'bfirsh/whalebrew'
  case node[:platform]
  when 'darwin'
    archive     'whalebrew-Darwin-x86_64'
    binary_path 'whalebrew-Darwin-x86_64'
  else
    raise 'not supported now'
  end
  extract     false
end

github_binary 'git-lfs' do
  version     'v2.0.1'
  repository  'git-lfs/git-lfs'
  archive     'git-lfs-darwin-amd64-2.0.1.tar.gz'
  binary_path 'git-lfs-2.0.1/git-lfs'
end


