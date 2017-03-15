# TODO: create itamae-plugin-neovim
# brew install neovim/neovim/neovim

directory File.join(ENV['HOME'], '.config', 'nvim')

dotfile '.config/nvim/init.vim'
dotfile '.config/nvim/dein.toml'
dotfile '.config/nvim/deinlazy.toml'
dotfile '.config/nvim/plugins'
