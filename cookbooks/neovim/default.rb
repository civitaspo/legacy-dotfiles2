include_cookbook 'homebrew'

package 'neovim'

dotfile '.config/nvim'

git File.join(ENV['HOME'], '.local', 'share', 'nvim', 'site', 'pack', 'packer', 'start', 'packer.nvim') do
  repository "https://github.com/wbthomason/packer.nvim"
end

