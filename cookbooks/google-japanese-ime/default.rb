# installed by `brew cask`
include_cookbook 'homebrew'

execute "rm -rf #{ENV['HOME']}/Library/Application\\ Support/Google/JapaneseInput" do
  not_if "test -d #{ENV['HOME']}/Library/Application\\ Support/Google/JapaneseInput/.git"
end

git "#{ENV['HOME']}/Library/Application\ Support/Google/JapaneseInput" do
  repository "git://github.com/civitaspo/JapaneseInput.git"
end
