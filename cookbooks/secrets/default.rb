include_cookbook 'git'

secfiles_path = File.join(ENV['HOME'], '.secfiles')

git secfiles_path do
  repository 'git@github.com:civitaspo/.secfiles.git'
end

define :secfile, source: nil do
  source = params[:source] || params[:name]
  link File.join(ENV['HOME'], params[:name]) do
    to File.join(secfiles_path, source)
    user node[:user]
    force true
  end
end

secfile '.secret-env.sh'
secfile '.op'
secfile '.gem'
secfile '.gitconfig.secret'
