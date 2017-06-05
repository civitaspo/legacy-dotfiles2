include_role 'base'
include_cookbook 'homebrew' # install packages from .Brewfile

# install first because install some go products 
node.reverse_merge!(
  rbenv: {
    global: '2.4.0',
    versions: %w[
      2.4.0
      2.3.0
      jruby-9.1.8.0
    ],
  },
  goenv: {
    global: '1.8.1',
    versions: %w[
      1.7.4
      1.8.1
    ], 
  },
  pyenv: { # not implemented
    global: '3.5.2',
    versions: %w[
      3.5.2
      2.7.10
    ],
    virtualenv: {
      :'3.5.2'  => 'neovim3',
      :'2.7.10' => 'vcli',
    },
    pip: {
      neovim3: %w[
        neovim
      ],
      vcli: %w[
        vcli
      ]
    },
  },
  ndenv: {
    # TODO:
  },
  jenv: {
    global: '1.8.0.131',
    version_map: {
      '1.8.0.131' => '/Library/Java/JavaVirtualMachines/jdk1.8.0_131.jdk/Contents/Home',
      '1.7.0.80'  => '/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home',
    },
  }
)
include_recipe "rbenv::user"
include_recipe "goenv::user"

include_cookbook 'google-japanese-ime'
include_cookbook 'zsh'
include_cookbook 'tmux'
include_cookbook 'pyenv'
include_cookbook 'ndenv'
include_cookbook 'jenv'
include_cookbook 'neovim'
include_cookbook 'iterm2'
include_cookbook 'tig'
include_cookbook 'sbin'
include_cookbook 'bin'

# packages which require only dotfiles.
# installed by `brew cask`
dotfile '.hammerspoon'
dotfile '.config/karabiner'
dotfile '.doc'
dotfile '.pryrc'

# keyrepeat
execute "defaults write -g InitialKeyRepeat -int 15" do
  not_if "$(defaults read -g InitialKeyRepeat) -eq 15"
end

execute "defaults write -g KeyRepeat -int 1" do
  not_if "$(defaults read -g KeyRepeat) -eq 1"
end

