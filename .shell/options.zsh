# {{{ options

# Watching other users
#WATCHFMT="%n %a %l from %m at %t."
watch=(notme)         # Report login/logout events for everybody except ourself.
LOGCHECK=60           # Time (seconds) between checks for login/logout activity.
REPORTTIME=60         # Display usage statistics for commands running > 60 sec.

# Key timeout and character sequences
KEYTIMEOUT=1
WORDCHARS='*?_-[]~=./&;!#$%^(){}<>'

# History
HISTFILE=$home_dir/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
SAVEHIST=$HISTSIZE

setopt autocd                   # Allow changing directories without `cd`
setopt append_history           # Dont overwrite history
setopt extended_history         # Also record time and duration of commands.
setopt share_history            # Share history between multiple shells
setopt hist_expire_dups_first   # Clear duplicates when trimming internal hist.
setopt hist_find_no_dups        # Dont display duplicates during searches.
# setopt hist_ignore_dups         # Ignore consecutive duplicates.
# setopt hist_ignore_all_dups     # Remember only one unique copy of the command.
setopt inc_append_history        # Add immediately
setopt hist_reduce_blanks       # Remove superfluous blanks.
# setopt hist_save_no_dups        # Omit older commands in favor of newer ones.
setopt hist_ignore_space        # Ignore commands that start with space.

# Changing directories
setopt auto_pushd
setopt pushd_ignore_dups        # Dont push copies of the same dir on stack.
setopt pushd_minus              # Reference stack entries with "-".

setopt extended_glob

unsetopt menucomplete
setopt noautomenu
setopt complete_in_word

# bash-like completion, only common part is completed, rest is listed
unsetopt automenu menucomplete


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# skip verification of insecure directories
# compaudit | xargs chmod g-w,o-w
# }}}
