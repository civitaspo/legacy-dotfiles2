include_role 'base'
include_cookbook 'homebrew' # install packages from .Brewfile

# install first because install some go products 
node.reverse_merge!(
  rbenv: {
    global: '2.5.0',
    versions: %w[
      2.5.0
    ],
  },
  goenv: {
    global: '1.9.0',
    versions: %w[
      1.8.1
      1.9.0
    ], 
  },
  pyenv: { # not implemented
    global: '3.5.2',
    versions: %w[
      3.5.2
      2.7.10
    ],
    virtualenv: {
      :'3.5.2'  => 'neovim3',
      :'2.7.10' => 'vcli',
      :'2.7.10' => 'google-cloud-sdk',
      :'2.7.10' => 'jenkins-job-builder',
    },
    pip: {
      neovim3: %w[
        neovim
      ],
      vcli: %w[
        vcli
      ],
      :'jenkins-job-builder' => %w[
        jenkins-job-builder
      ]
    },
  },
  ndenv: {
    # TODO:
  },
  jenv: {
    global: '1.8',
    version_map: {
      '11' => '/Library/Java/JavaVirtualMachines/jdk-11.jdk/Contents/Home',
      '1.8' => '/Library/Java/JavaVirtualMachines/jdk1.8.0_181.jdk/Contents/Home'
    },
  },
  scalaenv: {
    global: 'scala-2.11.8',
    versions: %w[
      scala-2.11.8
      scala-2.12.3
    ],
  },
  sbtenv: {
    global: 'sbt-0.13.15',
    versions: %w[
      sbt-0.13.15
    ],
  },
  :"google-cloud-sdk" => {
    versions: %w[
      169.0.0
    ]
  },
)
include_recipe "rbenv::user"
include_recipe "goenv::user"
include_recipe "scalaenv::user"
include_recipe "sbtenv::user"

include_cookbook 'google-japanese-ime'
include_cookbook 'zsh'
include_cookbook 'tmux'
include_cookbook 'pyenv'
include_cookbook 'ndenv'
include_cookbook 'jenv'
include_cookbook 'google-cloud-sdk'
include_cookbook 'neovim'
include_cookbook 'iterm2'
include_cookbook 'tig'
include_cookbook 'scripts'
include_cookbook 'sbin'
include_cookbook 'bin'

# packages which require only dotfiles.
# installed by `brew cask`
dotfile '.config/karabiner'
dotfile '.doc'
dotfile '.pryrc'
dotfile '.secret-env.sh'
dotfile '.hammerspoon'
dotfile '.onelogin-aws.config'
dotfile '.op'

# keyrepeat
execute "defaults write -g InitialKeyRepeat -int 15" do
  not_if "[ $(defaults read -g InitialKeyRepeat) -eq 15 ]"
end

execute "defaults write -g KeyRepeat -int 1" do
  not_if "[ $(defaults read -g KeyRepeat) -eq 1 ]"
end

