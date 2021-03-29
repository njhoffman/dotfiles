
zplug "desyncr/auto-ls"
colorls="/usr/local/bin/colorls"
#
# auto-ls-custom_function () {
#   if [[ -z "$_CD_WIDGET" ]]; then
#     if [[ -d $PWD/.git ]]; then
#       lines=$(unbuffer git lg-oneline -n 5)
#       tput rmam
#       unbuffer git lg-oneline -n 5 | while read line
#       do
#         # echo -e "-   $line" | emojify
#         echo -e "   $line" | emojify
#       done
#       tput smam
#     fi
#     colorls -1 --git-status --all --sort-dirs
#   fi
# }
#
# # AUTO_LS_CHPWD=false
# AUTO_LS_CHPWD=false
# AUTO_LS_COMMANDS=(custom_function)
AUTO_LS_COMMANDS=("$colorls -1 --git-status --almost-all --sort-dirs")
#
# # "colorls -1 --git-status --almost-all --sort-dirs '[[ -d $PWD/.git ]] && /usr/bin/git log|head'" \
# # AUTO_LS_COMMANDS=("$colorls -1 --git-status --sort-dirs")
# AUTO_LS_NEWLINE=false
# # AUTO_LS_COMMANDS: Use this configuration option to define the functions to run on cwd/enter-key.
# # AUTO_LS_NEWLINE: Configure ls to put a newline (Default: true).
# # AUTO_LS_PATH: Detect command full path to execute (Default: true).
# # AUTO_LS_CHPWD: Enable/disable auto-ls on directory change (Default: true)
#
#
