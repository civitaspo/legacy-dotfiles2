include_role 'base'
include_cookbook 'homebrew' # install packages from .Brewfile

# install first because install some go products 
node.reverse_merge!(
  rbenv: {
    global: '2.4.0',
    versions: %w[
      2.4.0
    ],
  },
  goenv: {
    global: '1.7.4',
    versions: %w[
      1.7.4
    ], 
  },
  pyenv: { # not implemented
    global: '3.5.2',
    versions: %w[
      3.5.2
    ],
    virtualenv: {
      :'3.5.2' => 'neovim3',
    },
    pip: {
      neovim3: %w[
        neovim
      ],
    },
  }
)
include_recipe "rbenv::user"
include_recipe "goenv::user"

include_cookbook 'google-japanese-ime'
include_cookbook 'zsh'
include_cookbook 'tmux'
include_cookbook 'pyenv'
include_cookbook 'neovim'

# packages which require only dotfiles.
# installed by `brew cask`
dotfile '.hammerspoon'
dotfile '.config/karabiner'
dotfile '.doc'

# github binaries
github_binary 'fzf' do
  version    '0.16.5'
  repository 'junegunn/fzf-bin'
  archive    'fzf-0.16.5-darwin_amd64.tgz'
end

github_binary 'peco' do
  version     'v0.4.9'
  repository  'peco/peco'
  archive     'peco_darwin_amd64.zip'
  binary_path 'peco_darwin_amd64/peco'
end

github_binary 'ghq' do
  version    'v0.7.4'
  repository 'motemen/ghq'
  archive    'ghq_darwin_amd64.zip'
end

github_binary 'whalebrew' do
  version     '0.0.4'
  repository  'bfirsh/whalebrew'
  archive     'whalebrew-Darwin-x86_64'
  binary_path 'whalebrew-Darwin-x86_64'
  extract     false
end

github_binary 'git-lfs' do
  version     'v2.0.1'
  repository  'git-lfs/git-lfs'
  archive     'git-lfs-darwin-amd64-2.0.1.tar.gz'
  binary_path 'git-lfs-2.0.1/git-lfs'
end
