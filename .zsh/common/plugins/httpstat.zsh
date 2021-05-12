# httpstat.sh: pretty curl -v with graphs and colors
# env HTTPSTAT_SHOW_BODY=true httpstat www.google.com
 zplug "b4b4r07/httpstat", as:command, use:'(*).sh', rename-to:'$1'

