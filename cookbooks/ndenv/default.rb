## TODO: create itamae plugin
git File.join(ENV['HOME'], '.ndenv') do
  repository 'https://github.com/riywo/ndenv'
end

git File.join(ENV['HOME'], '.ndenv', 'plugins', 'node-build') do
  repository 'https://github.com/riywo/node-build.git'
end

