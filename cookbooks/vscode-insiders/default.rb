# brew cask install visual-studio-code-insiders
include_cookbook 'homebrew'

execute 'env PYTHON_CONFIGURE_OPTS="--enable-framework" pyenv install 3.7.7' do
  not_if "test -f #{File.join(ENV['HOME'], '.pyenv/versions/3.7.7/bin/python')}"
end
execute 'pyenv virtualenv 3.7.7 vscode-lldb' do
  not_if "test -f #{File.join(ENV['HOME'], '.pyenv/versions/vscode-lldb/bin/python')}"
end

