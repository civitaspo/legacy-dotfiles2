git File.join(ENV['HOME'], '.secfiles') do
  repository 'https://github.com/civitaspo/.secfiles.git'
end

dotfile '.secret-env.sh'
dotfile '.op'
dotfile '.gem'
