  # The list of segments shown on the left. Fill it with the most important segments.
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
      # =========================[ Line #1 ]=========================
      os_icon                 # os identifier
      root_indicator
      dir                     # current directory
      dir_writable
      vcs                     # git status
      # =========================[ Line #2 ]=========================
      newline
      # prompt_char           # prompt symbol
  )

  # The list of segments shown on the right. Fill it with less important segments.
  # Right prompt on the last prompt line (where you are typing your commands) gets
  # automatically hidden when the input line reaches it. Right prompt above the
  # last prompt line gets hidden if it would overlap with left prompt.
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
      # =========================[ Line #1 ]=========================
      status                  # exit code of the last command
      command_execution_time  # duration of the last command
      background_jobs         # presence of background jobs
      direnv                  # direnv status (https://direnv.net/)
      virtualenv              # python virtual environment (https://docs.python.org/3/library/venv.html)
      anaconda                # conda environment (https://conda.io/)
      pyenv                   # python environment (https://github.com/pyenv/pyenv)
      goenv                   # go environment (https://github.com/syndbg/goenv)
      nodenv                  # node.js version from nodenv (https://github.com/nodenv/nodenv)
      nvm                     # node.js version from nvm (https://github.com/nvm-sh/nvm)
      nodeenv                 # node.js environment (https://github.com/ekalinin/nodeenv)
      # node_version          # node.js version
      # go_version            # go version (https://golang.org)
      # rust_version          # rustc version (https://www.rust-lang.org)
      # dotnet_version        # .NET version (https://dotnet.microsoft.com)
      rbenv                   # ruby version from rbenv (https://github.com/rbenv/rbenv)
      rvm                     # ruby version from rvm (https://rvm.io)
      fvm                     # flutter version management (https://github.com/leoafarias/fvm)
      luaenv                  # lua version from luaenv (https://github.com/cehoffman/luaenv)
      jenv                    # java version from jenv (https://github.com/jenv/jenv)
      plenv                   # perl version from plenv (https://github.com/tokuhirom/plenv)
      kubecontext             # current kubernetes context (https://kubernetes.io/)
      terraform               # terraform workspace (https://www.terraform.io)
      aws                     # aws profile (https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
      # aws_eb_env            # aws elastic beanstalk environment (https://aws.amazon.com/elasticbeanstalk/)
      # azure                 # azure account name (https://docs.microsoft.com/en-us/cli/azure)
      # gcloud                # google cloud cli acccount and project (https://cloud.google.com/)
      # google_app_cred       # google application credentials (https://cloud.google.com/docs/authentication/production)
      context                 # user@hostname
      nordvpn                 # nordvpn connection status, linux only (https://nordvpn.com/)
      ranger                  # ranger shell (https://github.com/ranger/ranger)
      nnn                     # nnn shell (https://github.com/jarun/nnn)
      vim_shell               # vim shell indicator (:sh)
      # midnight_commander    # midnight commander shell (https://midnight-commander.org/)
      vi_mode                 # vi mode (you don't need this if you've enabled prompt_char)
      # vpn_ip                # virtual private network indicator
      # ram                   # free RAM
      load                    # CPU load
      todo                    # todo items (https://github.com/todotxt/todo.txt-cli)
      time                    # current time
      # =========================[ Line #2 ]=========================
      newline
      # public_ip             # public IP address
      # proxy                 # system-wide http/https/ftp proxy
      battery               # internal battery
      # example               # example user-defined segment (see prompt_example function below)
  )


