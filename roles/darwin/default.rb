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
include_cookbook 'iterm2'
include_cookbook 'sbin'
include_cookbook 'bin'

# packages which require only dotfiles.
# installed by `brew cask`
dotfile '.hammerspoon'
dotfile '.config/karabiner'
dotfile '.doc'
