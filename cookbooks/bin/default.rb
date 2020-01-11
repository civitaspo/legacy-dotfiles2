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

wget_binary 'ecs-cli' do
  case node[:platform]
  when 'darwin'
    url 'https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-darwin-amd64-latest'
  else
    raise 'not supported now'
  end
end

wget_binary 'emojify' do
  url 'https://raw.githubusercontent.com/mrowa44/emojify/master/emojify'
end

# github binaries
github_binary 'fzf' do
  version    '0.20.0'
  repository 'junegunn/fzf-bin'
  case node[:platform]
  when 'darwin'
    archive    'fzf-0.20.0-darwin_amd64.tgz'
  else
    raise 'not supported now'
  end
end

github_binary 'peco' do
  version     'v0.5.7'
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
  version    'v1.0.1'
  repository 'motemen/ghq'
  case node[:platform]
  when 'darwin'
    archive     'ghq_darwin_amd64.zip'
    binary_path 'ghq_darwin_amd64/ghq'
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
  version     'v2.9.2'
  repository  'git-lfs/git-lfs'
  archive     'git-lfs-darwin-amd64-v2.9.2.tar.gz'
end

github_binary 'jq' do
  version     'jq-1.6'
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

github_binary 'kustomize' do
  version 'v2.0.3'
  repository  'kubernetes-sigs/kustomize'
  case node[:platform]
  when 'darwin'
    archive     'kustomize_2.0.3_darwin_amd64'
    binary_path 'kustomize_2.0.3_darwin_amd64'
  when 'ubuntu'
    archive     'kustomize_2.0.3_ubuntu_amd64'
    binary_path 'kustomize_2.0.3_ubuntu_amd64'
  else
    raise 'not supported now'
  end
  extract    false
end
