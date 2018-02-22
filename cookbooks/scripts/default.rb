link File.join(ENV['HOME'], 'scripts') do
  to File.expand_path("../../../scripts", __FILE__)
  user node[:user]
  force true
end
