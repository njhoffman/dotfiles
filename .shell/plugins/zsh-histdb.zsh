# save history in a sqlite3 database
zplug "larkery/zsh-histdb"

# histdb make
# histdb-top

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

export HISTFILESIZE=1000000000
export HISTSIZE=1000000000

load_file $HOME/.zplug/repos/larkery/zsh-histdb/sqlite-history.zsh
