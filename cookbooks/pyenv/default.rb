## TODO: create itamae plugin
git File.join(ENV['HOME'], '.pyenv') do
  repository 'https://github.com/yyuu/pyenv.git'
end

git File.join(ENV['HOME'], '.pyenv', 'plugins', 'pyenv-virtualenv') do
  repository 'https://github.com/yyuu/pyenv-virtualenv.git'
end

# env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.5.2
# pyenv virtualenv 3.5.2 neovim3
# pyenv activate neovim3
# pip install neovim
