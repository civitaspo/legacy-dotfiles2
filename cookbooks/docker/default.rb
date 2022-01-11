include_cookbook 'homebrew'

cask 'docker'
package 'docker'
package 'docker-compose'

directory File.join(ENV['HOME'], '.docker')
directory File.join(ENV['HOME'], '.docker/cli-plugins')

# ln -sfn /opt/homebrew/opt/docker-compose/bin/docker-compose ~/.docker/cli-plugins/docker-compose
link File.join(ENV['HOME'], '.docker/cli-plugins/docker-compose') do
  to '/opt/homebrew/opt/docker-compose/bin/docker-compose'
  user node[:user]
  force true
end
