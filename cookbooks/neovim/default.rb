include_cookbook 'homebrew'

package 'neovim'

dotfile '.config/nvim'

# execute 'env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.7.7' do
#   not_if "test -f #{File.join(ENV['HOME'], '.pyenv/versions/3.7.7/bin/python')}"
# end
# execute 'pyenv virtualenv 3.7.7 neovim' do
#   not_if "test -f #{File.join(ENV['HOME'], '.pyenv/versions/neovim/bin/python')}"
# end
# execute "#{File.join(ENV['HOME'], '.pyenv/versions/neovim/bin/pip')} install neovim" do
#   not_if "#{File.join(ENV['HOME'], '.pyenv/versions/neovim/bin/pip')} list | grep neovim >/dev/null"
# end
