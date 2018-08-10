include_recipe '../functions/default.rb'

# wget binaries
wget_binary 'fzf-tmux' do
  url 'https://raw.githubusercontent.com/junegunn/fzf/master/bin/fzf-tmux'
end

wget_binary 'embulk' do
  url 'https://dl.embulk.org/embulk-latest.jar'
end

wget_binary 'digdag' do
  url 'https://dl.digdag.io/digdag-latest'
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

github_binary 'jq' do
  version     'jq-1.5'
  repository  'stedolan/jq'
  case node[:platform]
  when 'darwin'
    archive     'jq-osx-amd64'
    binary_path 'jq-osx-amd64'
  when 'ubuntu'
    archive     'jq-linux64'
    binary_path 'jq-linux64'
  else
    raise 'not supported now'
  end
  extract     false
end

github_binary 'jid' do
  version     '0.7.2'
  repository  'simeji/jid'
  case node[:platform]
  when 'darwin'
    archive     'jid_darwin_amd64.zip'
    binary_path 'jid_darwin_amd64'
  when 'ubuntu'
    archive     'jid_linux_amd64.zip'
    binary_path 'jid_darwin_amd64'
  else
    raise 'not supported now'
  end
end
