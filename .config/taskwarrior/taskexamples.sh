# taskwarrior
# https://taskwarrior.org/docs/examples.html
task add Read Taskwarrior documents later
task add Rake the leaves project:'Home & Garden'
task add priority:H Pay bills
task next
task 2 done
task sync
task
# show all config variables
task show all
task 1 delete

# if using tasksh no need to type 'task' before each command
task list
task projects
task waiting

task add project:CI "My short but informative task summary"
task add project:CI priority:H "My short but informative task summary"
task add project:CI +Server +bug due:today "My short but informative task summary"
task add project:CI wait:november until:2016-11-10 "My short but informative task summary"

task add Do the thing due:2015-06-08T09:00 recur:weekly
task add Pay rent due:28th recur:monthly until:now+1yr

task 1 start
task 7 stop
task 3 done
task 4 delete
task 2 wait

task add Example
task 1 annotate -- ~/checklist.txt
task 1 annotate www.taskwarrior.org
taskopen 1

task context define work +work or +freelance
task context define home -work -freelance -school
task context home
