# save history in a sqlite3 database
# histdb make
# histdb-top

if [[ "$ZSH_LOADER" == "zplug" ]]; then
  zplug "larkery/zsh-histdb"
  zplug "m42e/zsh-histdb-fzf"
elif [[ "$ZSH_LOADER" == "zinit" ]]; then
  zinit light larkery/zsh-histdb
  zinit light m42e/zsh-histdb-fzf
elif [[ "$ZSH_LOADER" == "antigen" ]]; then
  echo "antigen"
fi

# Query to pull in the most recent command if anything was found similar
# in that directory. Otherwise pull in the most recent command used anywhere
# Give back the command that was used most recently
_zsh_autosuggest_strategy_histdb_top_fallback() {
  local query="
  select commands.argv from
    history left join commands on history.command_id = commands.rowid
    left join places on history.place_id = places.rowid
    where places.dir LIKE
    case when exists(select commands.argv from history
      left join commands on history.command_id = commands.rowid
      left join places on history.place_id = places.rowid
      where places.dir LIKE '$(sql_escape $PWD)%'
      AND commands.argv LIKE '$(sql_escape $1)%')
    then '$(sql_escape $PWD)%'
    else '%'
    end
    and commands.argv LIKE '$(sql_escape $1)%'
    group by commands.argv
    order by places.dir LIKE '$(sql_escape $PWD)%' desc,
    history.start_time desc
    limit 1"
    suggestion=$(_histdb_query "$query")
  }

ZSH_AUTOSUGGEST_STRATEGY=histdb_top_fallback

# bindkey '^R' histdb-fzf-widget
# load_file $HOME/.zplug/repos/larkery/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook

