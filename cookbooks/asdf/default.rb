package 'asdf'

define :asdf_plugin, url: nil do
  name = params[:name]
  url = params[:url]

  cmd =
    if url
      "asdf plugin add #{name} #{url}"
    else
      "asdf plugin add #{name}"
    end

  execute cmd do
    not_if "asdf plugin list | grep '^#{name}$'"
  end
end

dotfile '.asdfrc'

%w(
  1password-cli
  bat
  deno
  embulk
  exa
  fd
  gcloud
  ghq
  golang
  istioctl
  java
  jq
  kind
  ko
  kotlin
  krew
  kubebuilder
  kubectl
  kustomize
  python
  ripgrep
  ruby
  terraform
  yq
).each do |plugin|
  asdf_plugin plugin
end

