define :dotfile, source: nil do
  source = params[:source] || params[:name]
  link File.join(ENV['HOME'], params[:name]) do
    to File.expand_path("../../../config/#{source}", __FILE__)
    user node[:user]
    force true
  end
end

define :github_binary, version: nil, repository: nil, archive: nil, binary_path: nil, extract: true do
  cmd = params[:name]
  bin_path = "#{ENV['HOME']}/bin/#{cmd}"
  archive = params[:archive]
  url = "https://github.com/#{params[:repository]}/releases/download/#{params[:version]}/#{archive}"
  do_extract = params[:extract]

  if archive.end_with?('.zip')
    extracter = "unzip -o"
  elsif archive.end_with?('.tar.gz', '.tgz')
    extracter = "tar xvzf"
  else
    raise "unexpected ext archive: #{archive}" if do_extract
  end

  execute "curl -fSL -o /tmp/#{archive} #{url}" do
    not_if "test -f #{bin_path}"
  end

  if do_extract
    execute "#{extracter} /tmp/#{archive}" do
      not_if "test -f #{bin_path}"
      cwd "/tmp"
    end
  end

  execute "mv /tmp/#{params[:binary_path] || cmd} #{bin_path} && chmod +x #{bin_path}" do
    not_if "test -f #{bin_path}"
  end
end

