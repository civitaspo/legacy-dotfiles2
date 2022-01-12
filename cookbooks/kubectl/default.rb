include_cookbook 'asdf'

%w(
  krew
  kubectl
  kustomize
).each do |plugin|
  asdf_plugin plugin
end

directory File.join(ENV['HOME'], '.krew')
