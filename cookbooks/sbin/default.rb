include_cookbook 'git'

git File.join(ENV['HOME'], 'sbin') do
  repository 'git@github.com:civitaspo/sbin.git'
end
