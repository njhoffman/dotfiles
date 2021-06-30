#!/bin/bash

export GRC='grc -es --colour=on'



grc_alias_cmds=(
  lsof
  journalctl
  make
  mount
  netstat
  nmap
  sysctl
  systemctl
  tcpdump
)

setopt COMPLETE_ALIASES
for cmd in "${grc_alias_cmds[@]}"; do
  # if the command exists, alias it to pass through grc
  type "$cmd" >/dev/null 2>&1 && alias "$cmd"="$GRC -c conf.$cmd $cmd"
done

# custom ones
alias gmake="$GRC -c conf.gcc gmake"
alias make="$GRC -c conf.gcc make"
alias journalctl="$GRC -c conf.log journalctl"
alias pv="grc -s --colour=on -c conf.log pv"
alias configure="grc ./configure"
# apt-get update: conf.docker-machinels
# apt-cache search: conf.dockersearch
# git commit:
# git add
#

# Name      | Type    | Description
# ------------------------------------------------------------
# apm       | Partial | Coloriser for APM sub-logs.
# distcc    | Full    | Coloriser for distcc(1) logs.
# dpkg      | Full    | Coloriser for dpkg logs.
# exim      | Full    | Coloriser for exim logs.
# fetchmail | Partial | Coloriser for fetchmail(1) sub-logs.
# ftpstats  | Full    | Coloriser for ftpstats (pure-ftpd) logs.
# httpd     | Full    | Coloriser for generic HTTPD access and error logs.
# icecast   | Full    | Coloriser for Icecast(8) logs.
# oops      | Full    | Coloriser for oops proxy logs.
# php       | Full    | Coloriser for PHP logs.
# postfix   | Partial | Coloriser for postfix(1) sub-logs.
# procmail  | Full    | Coloriser for procmail(1) logs.
# proftpd   | Full    | Coloriser for proftpd access and auth logs.
# squid     | Full    | Coloriser for squid access, store and cache logs.
# sulog     | Full    | Coloriser for su(1) logs.
# super     | Full    | Coloriser for super(1) logs.
# syslog    | Full    | Generic syslog(8) log coloriser.
# ulogd     | Partial | Coloriser for ulogd sub-logs.
# vsftpd    | Full    | Coloriser for vsftpd(8) logs.
# xferlog   | Full    | Generic xferlog coloriser.
#
# alias findpid="grc -es --colour=on ps axww -o pid,user,%cpu,%mem,start,time,fname,command | fzfp | sed 's/^ *//' | cut -f1 -d' '"
alias findpid="grc --colour=on -es -c conf.ps ps axww -o pid,user,%cpu,%mem,time,fname,command | fzf-tmux $FZF_TMUX_OPTS --ansi --header-lines=1 --preview='S_COLORS=always pidstat -du --human -p {1}' | sed 's/^ *//' | cut -f1 -d' '"
alias progressc="ccze -A < <(progress)"

function gl_no_graph {
  git log --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr% C(auto)%an" "$@"
}

alias glNoGraph='gl_no_graph'
_gitLogLineToHash="echo {} | grep -o '[a-f0-9]\{7\}' | head -1"
_viewGitLogLine="$_gitLogLineToHash | xargs -I % sh -c 'git show --color=always % | diff-so-fancy'"
_viewGitLogLineUnfancy="$_gitLogLineToHash | xargs -I % sh -c 'git show %'"

# gls - git commit browser with previews and vim integration
gls() {
  glNoGraph |
    fzfp --no-sort --reverse --tiebreak=index --no-multi \
    --ansi --preview="$_viewGitLogLine" \
    --header "enter to view, alt-y to copy hash, alt-v to open in vim" \
    --bind "enter:execute:$_viewGitLogLine   | less -R" \
    --bind "alt-v:execute:$_viewGitLogLineUnfancy | vim -" \
    --bind "alt-y:execute:$_gitLogLineToHash | xclip"
}

# %mem  %cpu, %mem
# args        COMMAND   command with all its arguments as a string.  Modifications to the arguments may be
# blocked     BLOCKED   mask of the blocked signals, see signal(7).  According to the width of the field, a
# bsdstart    START     time the command started.  If the process was started less than 24 hours ago, the
# bsdtime     TIME      accumulated cpu time, user + system.  The display format is usually "MMM:SS", but can
# c           C         processor utilization.  Currently, this is the integer value of the percent usage
# caught      CAUGHT    mask of the caught signals, see signal(7).  According to the width of the field, a 32
# cgname      CGNAME    display name of control groups to which the process belongs.
# cgroup      CGROUP    display control groups to which the process belongs.
# class       CLS       scheduling class of the process.  (alias policy, cls).  Field's possible values are:
# cls         CLS       scheduling class of the process.  (alias policy, cls).  Field's possible values are:
# cmd         CMD       see args.  (alias args, command).
# comm        COMMAND   command name (only the executable name).  Modifications to the command name will not
# command     COMMAND   See args.  (alias args, command).
# cp          CP        per-mill (tenths of a percent) CPU usage.  (see %cpu).
# cputime     TIME      cumulative CPU time, "[DD-]hh:mm:ss" format.  (alias time).
# cputimes    TIME      cumulative CPU time in seconds (alias times).
# drs         DRS       data resident set size, the amount of physical memory devoted to other than
# executable code.
# egid        EGID      effective group ID number of the process as a decimal integer.  (alias gid).
# egroup      EGROUP    effective group ID of the process.  This will be the textual group ID, if it can be
# eip         EIP       instruction pointer.
# esp         ESP       stack pointer.
# etime       ELAPSED   elapsed time since the process was started, in the form [[DD-]hh:]mm:ss.
# etimes      ELAPSED   elapsed time since the process was started, in seconds.
# euid        EUID      effective user ID (alias uid).
# euser       EUSER     effective user name.  This will be the textual user ID, if it can be obtained and the
# f           F         flags associated with the process, see the PROCESS FLAGS section.  (alias flag,
# fgid        FGID      filesystem access group ID.  (alias fsgid).
# fgroup      FGROUP    filesystem access group ID.  This will be the textual group ID, if it can be obtained
# flag        F         see f.  (alias f, flags).
# flags       F         see f.  (alias f, flag).
# fname       COMMAND   first 8 bytes of the base name of the process's executable file.  The output in this
# fuid        FUID      filesystem access user ID.  (alias fsuid).
# fuser       FUSER     filesystem access user ID.  This will be the textual user ID, if it can be obtained
# gid         GID       see egid.  (alias egid).
# group       GROUP     see egroup.  (alias egroup).
# ignored     IGNORED   mask of the ignored signals, see signal(7).  According to the width of the field, a
# ipcns       IPCNS     Unique inode number describing the namespace the process belongs to.  See
# label       LABEL     security label, most commonly used for SELinux context data.  This is for the
# drs         DRS       data resident set size, the amount of physical memory devoted to other than
# egid        EGID      effective group ID number of the process as a decimal integer.  (alias gid).
# eip         EIP       instruction pointer.
# esp         ESP       stack pointer.
# etime       ELAPSED   elapsed time since the process was started, in the form [[DD-]hh:]mm:ss.
# etimes      ELAPSED   elapsed time since the process was started, in seconds.
# euid        EUID      effective user ID (alias uid).
# euser       EUSER     effective user name.  This will be the textual user ID, if it can be obtained and the
# f           F         flags associated with the process, see the PROCESS FLAGS section.  (alias flag,
# fgid        FGID      filesystem access group ID.  (alias fsgid).
# fgroup      FGROUP    filesystem access group ID.  This will be the textual group ID, if it can be obtained
# flag        F         see f.  (alias f, flags).
# flags       F         see f.  (alias f, flag).
# fname       COMMAND   first 8 bytes of the base name of the process's executable file.  The output in this
# fuid        FUID      filesystem access user ID.  (alias fsuid).
# fuser       FUSER     filesystem access user ID.  This will be the textual user ID, if it can be obtained
# gid         GID       see egid.  (alias egid).
# group       GROUP     see egroup.  (alias egroup).
# ignored     IGNORED   mask of the ignored signals, see signal(7).  According to the width of the field, a
# ipcns       IPCNS     Unique inode number describing the namespace the process belongs to.  See
# label       LABEL     security label, most commonly used for SELinux context data.  This is for the
# lstart      STARTED   time the command started.  See also bsdstart, start, start_time, and stime.
# lsession    SESSION   displays the login session identifier of a process, if systemd support has been
# luid        LUID      displays Login ID associated with a process.
# lwp         LWP       light weight process (thread) ID of the dispatchable entity (alias spid, tid).  See
# lxc         LXC       The name of the lxc container within which a task is running.  If a process is not
# machine     MACHINE   displays the machine name for processes assigned to VM or container, if systemd
# maj_flt     MAJFLT    The number of major page faults that have occurred with this process.
# min_flt     MINFLT    The number of minor page faults that have occurred with this process.
# mntns       MNTNS     Unique inode number describing the namespace the process belongs to.  See
# netns       NETNS     Unique inode number describing the namespace the process belongs to.  See
# ni          NI        nice value.  This ranges from 19 (nicest) to -20 (not nice to others), see nice(1).
# nice        NI        see ni.(alias ni).
# nlwp        NLWP      number of lwps (threads) in the process.  (alias thcount).
# numa        NUMA      The node assocated with the most recently used processor.  A -1 means that NUMA
# nwchan      WCHAN     address of the kernel function where the process is sleeping (use wchan if you want
# ouid        OWNER     displays the Unix user identifier of the owner of the session of a process, if
# pcpu        %CPU      see %cpu.  (alias %cpu).
# pending     PENDING   mask of the pending signals.  See signal(7).  Signals pending on the process are
# pgid        PGID      process group ID or, equivalently, the process ID of the process group leader.
# pgrp        PGRP      see pgid.  (alias pgid).
# pid         PID       a number representing the process ID (alias tgid).
# pidns       PIDNS     Unique inode number describing the namespace the process belongs to.  See
# namespaces(7).
# pmem        %MEM      see %mem.  (alias %mem).
# policy      POL       scheduling class of the process.  (alias class, cls).  Possible values are:
# ppid        PPID      parent process ID.
# pri         PRI       priority of the process.  Higher number means lower priority.
# psr         PSR       processor that process is currently assigned to.
# rgid        RGID      real group ID.
# rgroup      RGROUP    real group name.  This will be the textual group ID, if it can be obtained and the
# rss         RSS       resident set size, the non-swapped physical memory that a task has used (in
# rssize      RSS       see rss.  (alias rss, rsz).
# rsz         RSZ       see rss.  (alias rss, rssize).
# rtprio      RTPRIO    realtime priority.
# ruid        RUID      real user ID.
# ruser       RUSER     real user ID.  This will be the textual user ID, if it can be obtained and the field
# s           S         minimal state display (one character).  See section PROCESS STATE CODES for the
# sched       SCH       scheduling policy of the process.  The policies SCHED_OTHER (SCHED_NORMAL),
# seat        SEAT      displays the identifier associated with all hardware devices assigned to a specific
# sess        SESS      session ID or, equivalently, the process ID of the session leader.  (alias session,
# sgi_p       P         processor that the process is currently executing on.  Displays "*" if the process is
# sgid        SGID      saved group ID.  (alias svgid).
# sgroup      SGROUP    saved group name.  This will be the textual group ID, if it can be obtained and the
# sid         SID       see sess.  (alias sess, session).
# sig         PENDING   see pending.  (alias pending, sig_pend).
# sigcatch    CAUGHT    see caught.  (alias caught, sig_catch).
# sigignore   IGNORED   see ignored.  (alias ignored, sig_ignore).
# sigmask     BLOCKED   see blocked.  (alias blocked, sig_block).
# size        SIZE      approximate amount of swap space that would be required if the process were to dirty
# slice       SLICE     displays the slice unit which a process belongs to, if systemd support has been
# spid        SPID      see lwp.  (alias lwp, tid).
# stackp      STACKP    address of the bottom (start) of stack for the process.
# start       STARTED   time the command started.  If the process was started less than 24 hours ago, the
# start_time  START     starting time or date of the process.  Only the year will be displayed if the process
# stat        STAT      multi-character process state.  See section PROCESS STATE CODES for the different
# state       S         see s. (alias s).
# suid        SUID      saved user ID.  (alias svuid).
# supgid      SUPGID    group ids of supplementary groups, if any.  See getgroups(2).
# supgrp      SUPGRP    group names of supplementary groups, if any.  See getgroups(2).
# suser       SUSER     saved user name.  This will be the textual user ID, if it can be obtained and the
# svgid       SVGID     see sgid.  (alias sgid).
# svuid       SVUID     see suid.  (alias suid).
# sz          SZ        size in physical pages of the core image of the process.  This includes text, data,
# tgid        TGID      a number representing the thread group to which a task belongs (alias pid).  It is
# thcount     THCNT     see nlwp.  (alias nlwp).  number of kernel threads owned by the process.
# time        TIME      cumulative CPU time, "[DD-]HH:MM:SS" format.  (alias cputime).
# times       TIME      cumulative CPU time in seconds (alias cputimes).
# tname       TTY       controlling tty (terminal).  (alias tt, tty).
# tpgid       TPGID     ID of the foreground process group on the tty (terminal) that the process is
# trs         TRS       text resident set size, the amount of physical memory devoted to executable code.
# tt          TT        controlling tty (terminal).  (alias tname, tty).
# tty         TT        controlling tty (terminal).  (alias tname, tt).
# ucmd        CMD       see comm.  (alias comm, ucomm).
# ucomm       COMMAND   see comm.  (alias comm, ucmd).
# stackp      STACKP    address of the bottom (start) of stack for the process.
# start       STARTED   time the command started.  If the process was started less than 24 hours ago, the
# start_time  START     starting time or date of the process.  Only the year will be displayed if the process
# stat        STAT      multi-character process state.  See section PROCESS STATE CODES for the different
# state       S         see s. (alias s).
# suid        SUID      saved user ID.  (alias svuid).
# supgid      SUPGID    group ids of supplementary groups, if any.  See getgroups(2).
# supgrp      SUPGRP    group names of supplementary groups, if any.  See getgroups(2).
# suser       SUSER     saved user name.  This will be the textual user ID, if it can be obtained and the
# svgid       SVGID     see sgid.  (alias sgid).
# svuid       SVUID     see suid.  (alias suid).
# sz          SZ        size in physical pages of the core image of the process.  This includes text, data,
# tgid        TGID      a number representing the thread group to which a task belongs (alias pid).  It is
# thcount     THCNT     see nlwp.  (alias nlwp).  number of kernel threads owned by the process.
# tid         TID       the unique number representing a dispatchable entity (alias lwp, spid).  This value
# time        TIME      cumulative CPU time, "[DD-]HH:MM:SS" format.  (alias cputime).
# times       TIME      cumulative CPU time in seconds (alias cputimes).
# tname       TTY       controlling tty (terminal).  (alias tt, tty).
# tpgid       TPGID     ID of the foreground process group on the tty (terminal) that the process is
# trs         TRS       text resident set size, the amount of physical memory devoted to executable code.
# tt          TT        controlling tty (terminal).  (alias tname, tty).
# tty         TT        controlling tty (terminal).  (alias tname, tt).
# ucmd        CMD       see comm.  (alias comm, ucomm).
# ucomm       COMMAND   see comm.  (alias comm, ucmd).
# uid         UID       see euid.  (alias euid).
# uname       USER      see euser.  (alias euser, user).
# unit        UNIT      displays unit which a process belongs to, if systemd support has been included.
# user        USER      see euser.  (alias euser, uname).
# userns      USERNS    Unique inode number describing the namespace the process belongs to.  See
# utsns       UTSNS     Unique inode number describing the namespace the process belongs to.  See
# uunit       UUNIT     displays user unit which a process belongs to, if systemd support has been included.
# vsize       VSZ       see vsz.  (alias vsz).
# vsz         VSZ       virtual memory size of the process in KiB (1024-byte units).  Device mappings are
# wchan       WCHAN     name of the kernel function in which the process is sleeping, a "-" if the process is
