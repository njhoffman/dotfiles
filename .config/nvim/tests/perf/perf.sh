#!/bin/bash

# profile start profile.log -> profile func * -> profile pause (look at end for functions)

# vim -c\ q --startuptime >(tail -n1)

# sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
# vim -c\ q --startuptime /tmp/vim.log && tail -n1 $_

# vim -V 2>&1 | perl -MTime::HiRes=time -ne '$a = time unless defined $a; print time - $a, ": ", $_' | tee vilog

# locate function: :set more | verbose function {function_name}

# vim --startuptime timeCost.txt timeCost.txt
# testing syntax highlighting: :syntime on -> scroll -> :syntime report, :syntax off && repeat

# plugin slowness generally comes from autocommands: :autocmd! [group] {event}.

# :redir @a -> :set all -> :redir END

# startup times: 034.230 - 075.597 -> 1457
# all post ops cause more startup time

|          |  alacritty |  termite   |
| ---------|-------------------------|
| startup  |  146 - 282 |  277 - 288 |


85291 lines

syntime md
---------
0.379894   9716   0       0.000481    0.000039  shDerefSpecial     \({[#!]\)\@<=[[:alnum:]*@_]\+
0.246367   26570  26570   0.000585    0.000009  VimwikiCellSeparator \%(|\)\|\%(-\@<=+\-\@=\)\|\%([|+]\@<=-\+\)

syntime
--------
3.265729   276899 106985   0.000768   0.000012  jsNumber           \c[+-]\?\%(0b[01]\%(_\?[01]\)*\|0o\o\%(_\?\o\)*\|0x\x\%(_\?\x\)*\|\%(\%(\%(0\|[1-9]\%(_\?\d\%(
2.294367   254897 135367   0.000742   0.000009  jsRegexpGroup      \%([^\\]\%(\\\\\)*\\\)\@<!)
2.015076   57884  23308   0.000797    0.000035  jsRegexpRange      \%([^\\]\%(\\\\\)*\\\)\@<!]
1.042428   357464 186933   0.000811   0.000003  jsFunctionCall     \<\K\k*\>\%(\_s*<\%(\_[^&|)]\{-1,}\%([&|]\_[^&|)]\{-1,}\)*\)>\)\?\%(\_s*\%(?\.\)\?\_s*(\)\@=
0.936821   188780 2883    0.000956    0.000005  jsTemplateStringTag \<\K\k*\>\%(\_s*`\)\@=
0.694510   547379 418909   0.000339   0.000001  jsIdentifier       \<\K\k*\>

# Maps: 1334  SetAll: 108  AutoCmd: 4570  Functions: 2171  Plugins: 127
