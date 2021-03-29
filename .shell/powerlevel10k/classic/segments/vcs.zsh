
#####################################[ vcs: git status ]######################################
# Branch icon. Set this parameter to '\uF126 ' for the popular Powerline branch icon.
typeset -g POWERLEVEL9K_VCS_BRANCH_ICON='\uF126 '
POWERLEVEL9K_VCS_BRANCH_ICON=${(g::)POWERLEVEL9K_VCS_BRANCH_ICON}

# Untracked files icon. It's really a question mark, your font isn't broken.
# Change the value of this parameter to show a different icon.
typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'
POWERLEVEL9K_VCS_UNTRACKED_ICON=${(g::)POWERLEVEL9K_VCS_UNTRACKED_ICON}

# Formatter for Git status.
#
# Example output: master ⇣42⇡42 *42 merge ~42 +42 !42 ?42.
#
# You can edit the function to customize how Git status looks.
#
# VCS_STATUS_* parameters are set by gitstatus plugin. See reference:
# https://github.com/romkatv/gitstatus/blob/master/gitstatus.plugin.zsh.
function my_git_formatter() {
  emulate -L zsh

  if [[ -n $P9K_CONTENT ]]; then
    # If P9K_CONTENT is not empty, use it. It's either "loading" or from vcs_info (not from
    # gitstatus plugin). VCS_STATUS_* parameters are not available in this case.
    typeset -g my_git_format=$P9K_CONTENT
    return
  fi

  if (( $1 )); then
    # Styling for up-to-date Git status.
    local       meta='%244F'  # grey foreground
    local      clean='%76F'   # green foreground
    local   modified='%178F'  # yellow foreground
    local  untracked='%39F'   # blue foreground
    local conflicted='%196F'  # red foreground
  else
    # Styling for incomplete and stale Git status.
    local       meta='%244F'  # grey foreground
    local      clean='%244F'  # grey foreground
    local   modified='%244F'  # grey foreground
    local  untracked='%244F'  # grey foreground
    local conflicted='%244F'  # grey foreground
  fi

  local res
  local where  # branch or tag
  if [[ -n $VCS_STATUS_LOCAL_BRANCH ]]; then
    res+="${clean}${POWERLEVEL9K_VCS_BRANCH_ICON}"
    where=${(V)VCS_STATUS_LOCAL_BRANCH}
  elif [[ -n $VCS_STATUS_TAG ]]; then
    res+="${meta}#"
    where=${(V)VCS_STATUS_TAG}
  fi

  # If local branch name or tag is at most 32 characters long, show it in full.
  # Otherwise show the first 12 … the last 12.
  (( $#where > 32 )) && where[13,-13]="…"
  res+="${clean}${where//\%/%%}"  # escape %

  # Display the current Git commit if there is no branch or tag.
  # Tip: To always display the current Git commit, remove `[[ -z $where ]] &&` from the next line.
  [[ -z $where ]] && res+="${meta}@${clean}${VCS_STATUS_COMMIT[1,8]}"

  # Show tracking branch name if it differs from local branch.
  if [[ -n ${VCS_STATUS_REMOTE_BRANCH:#$VCS_STATUS_LOCAL_BRANCH} ]]; then
    res+="${meta}:${clean}${(V)VCS_STATUS_REMOTE_BRANCH//\%/%%}"  # escape %
  fi

  # ⇣42 if behind the remote.
  (( VCS_STATUS_COMMITS_BEHIND )) && res+=" ${clean}⇣${VCS_STATUS_COMMITS_BEHIND}"
  # ⇡42 if ahead of the remote; no leading space if also behind the remote: ⇣42⇡42.
  (( VCS_STATUS_COMMITS_AHEAD && !VCS_STATUS_COMMITS_BEHIND )) && res+=" "
  (( VCS_STATUS_COMMITS_AHEAD  )) && res+="${clean}⇡${VCS_STATUS_COMMITS_AHEAD}"
  # *42 if have stashes.
  (( VCS_STATUS_STASHES        )) && res+=" ${clean}*${VCS_STATUS_STASHES}"
  # 'merge' if the repo is in an unusual state.
  [[ -n $VCS_STATUS_ACTION     ]] && res+=" ${conflicted}${VCS_STATUS_ACTION}"
  # ~42 if have merge conflicts.
  (( VCS_STATUS_NUM_CONFLICTED )) && res+=" ${conflicted}~${VCS_STATUS_NUM_CONFLICTED}"
  # +42 if have staged changes.
  (( VCS_STATUS_NUM_STAGED     )) && res+=" ${modified}+${VCS_STATUS_NUM_STAGED}"
  # !42 if have unstaged changes.
  (( VCS_STATUS_NUM_UNSTAGED   )) && res+=" ${modified}!${VCS_STATUS_NUM_UNSTAGED}"
  # ?42 if have untracked files. It's really a question mark, your font isn't broken.
  # See POWERLEVEL9K_VCS_UNTRACKED_ICON above if you want to use a different icon.
  # Remove the next line if you don't want to see untracked files at all.
  (( VCS_STATUS_NUM_UNTRACKED  )) && res+=" ${untracked}${POWERLEVEL9K_VCS_UNTRACKED_ICON}${VCS_STATUS_NUM_UNTRACKED}"

  typeset -g my_git_format=$res
}
functions -M my_git_formatter 2>/dev/null

# Disable the default Git status formatting.
typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
# Install our own Git status formatter.
typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${$((my_git_formatter(1)))+${my_git_format}}'
typeset -g POWERLEVEL9K_VCS_LOADING_CONTENT_EXPANSION='${$((my_git_formatter(0)))+${my_git_format}}'
# Enable counters for staged, unstaged, etc.
typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED,CONFLICTED,COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=-1

# Icon color.
typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_COLOR=76
typeset -g POWERLEVEL9K_VCS_LOADING_VISUAL_IDENTIFIER_COLOR=244
# Custom icon.
# typeset -g POWERLEVEL9K_VCS_VISUAL_IDENTIFIER_EXPANSION='⭐'
# Custom prefix.
# typeset -g POWERLEVEL9K_VCS_PREFIX='%244Fon '

# Show status of repositories of these types. You can add svn and/or hg if you are
# using them. If you do, your prompt may become slow even when your current directory
# isn't in an svn or hg reposotiry.
typeset -g POWERLEVEL9K_VCS_BACKENDS=(git)

# These settings are used for respositories other than Git or when gitstatusd fails and
# Powerlevel10k has to fall back to using vcs_info.
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=76
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=76
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=178

