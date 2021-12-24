include_cookbook 'homebrew'
include_cookbook 'font'

cask 'kitty'

dotfile '.config/kitty'

git File.join(ENV['HOME'], '.config/kitty/kitty-themes') do
  repository "https://github.com/kovidgoyal/kitty-themes.git"
end
