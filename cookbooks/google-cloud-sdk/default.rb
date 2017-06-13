directory File.join(ENV['HOME'], 'opt')
directory File.join(ENV['HOME'], 'opt', 'google-cloud-sdk')

def google_cloud_sdk_package_name(version)
  case node[:platform]
  when 'darwin'
    "google-cloud-sdk-#{version}-darwin-x86_64"
  else
    # "google-cloud-sdk-#{version}-linux-x86_64"
    raise 'not supported now'
  end
end

directory File.join(ENV['HOME'], 'opt')

node[:"google-cloud-sdk"][:versions].each do |version|
  google_cloud_sdk_package_name = google_cloud_sdk_package_name(version)

  directory "/tmp/#{google_cloud_sdk_package_name}"
  execute "download google-cloud-sdk" do
    download_file = "#{google_cloud_sdk_package_name}.tar.gz"
    command <<EOF
cd /tmp
curl -L -s "https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/#{download_file}" -o "#{download_file}"
tar zxvf #{download_file} -C /tmp/#{google_cloud_sdk_package_name}/
mv /tmp/#{google_cloud_sdk_package_name}/google-cloud-sdk #{ENV['HOME']}/opt/google-cloud-sdk/#{google_cloud_sdk_package_name}
EOF
    not_if "test -x #{ENV['HOME']}/opt/google-cloud-sdk/#{google_cloud_sdk_package_name}"
  end
end

current_version = node[:"google-cloud-sdk"][:current] || node[:"google-cloud-sdk"][:versions].sort.last
current_google_cloud_sdk_package_name = google_cloud_sdk_package_name(current_version)
link "current" do
  cwd "#{ENV['HOME']}/opt/google-cloud-sdk/"
  to current_google_cloud_sdk_package_name
  force true
end

# Here is depended on python2
# execute "yes | #{ENV['HOME']}/opt/google-cloud-sdk/current/bin/gcloud components install beta" do
#   not_if "test -d #{ENV['HOME']}/opt/google-cloud-sdk/current/lib/surface/beta"
# end


