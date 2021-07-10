

if exists("b:current_syntax")
  finish
endif

" vim-polyglot html headings


" [link](URL) | [link][id] | [link][] | ![image](URL)
syn region mkdFootnotes matchgroup=mkdDelimiter start="\[^"    end="\]"
execute 'syn region mkdID matchgroup=mkdDelimiter    start="\["    end="\]" contained oneline' . s:conceal
execute 'syn region mkdURL matchgroup=mkdDelimiter   start="("     end=")"  contained oneline' . s:conceal
execute 'syn region mkdLink matchgroup=mkdDelimiter  start="\\\@<!!\?\[\ze[^]\n]*\n\?[^]\n]*\][[(]" end="\]" contains=@mkdNonListItem,@Spell nextgroup=mkdURL,mkdID skipwhite' . s:concealends

" Autolink without angle brackets.
" mkd  inline links:      protocol     optional  user:pass@  sub/domain                    .com, .co.uk, etc         optional port   path/querystring/hash fragment
"                         ------------ _____________________ ----------------------------- _________________________ ----------------- __
syn match   mkdInlineURL /https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z0-9][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?[^] \t]*/

" Autolink with parenthesis.
syn region  mkdInlineURL matchgroup=mkdDelimiter start="(\(https\?:\/\/\(\w\+\(:\w\+\)\?@\)\?\([A-Za-z0-9][-_0-9A-Za-z]*\.\)\{1,}\(\w\{2,}\.\?\)\{1,}\(:[0-9]\{1,5}\)\?[^] \t]*)\)\@=" end=")"

" Autolink with angle brackets.
syn region mkdInlineURL matchgroup=mkdDelimiter start="\\\@<!<\ze[a-z][a-z0-9,.-]\{1,22}:\/\/[^> ]*>" end=">"

"HTML headings
syn region htmlH1       matchgroup=mkdHeading     start="^\s*#"                   end="$" contains=mkdLink,mkdInlineURL,@Spell
syn region htmlH2       matchgroup=mkdHeading     start="^\s*##"                  end="$" contains=mkdLink,mkdInlineURL,@Spell
syn region htmlH3       matchgroup=mkdHeading     start="^\s*###"                 end="$" contains=mkdLink,mkdInlineURL,@Spell
syn region htmlH4       matchgroup=mkdHeading     start="^\s*####"                end="$" contains=mkdLink,mkdInlineURL,@Spell
syn region htmlH5       matchgroup=mkdHeading     start="^\s*#####"               end="$" contains=mkdLink,mkdInlineURL,@Spell
syn region htmlH6       matchgroup=mkdHeading     start="^\s*######"              end="$" contains=mkdLink,mkdInlineURL,@Spell
syn match  htmlH1       /^.\+\n=\+$/ contains=mkdLink,mkdInlineURL,@Spell
syn match  htmlH2       /^.\+\n-\+$/ contains=mkdLink,mkdInlineURL,@Spell

" tpope markdown headings

" syn cluster markdownInline contains=markdownLineBreak,markdownLinkText,markdownItalic,markdownBold,markdownCode,markdownEscape,@htmlTop,markdownError,markdownValid

" syn match markdownH1 "^.\+\n=\+$" contained contains=@markdownInline,markdownHeadingRule,markdownAutomaticLink
" syn match markdownH2 "^.\+\n-\+$" contained contains=@markdownInline,markdownHeadingRule,markdownAutomaticLink

" syn match markdownHeadingRule "^[=-]\+$" contained

" syn region markdownH1 matchgroup=markdownH1Delimiter start=" \{,3}#\s"      end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
" syn region markdownH2 matchgroup=markdownH2Delimiter start=" \{,3}##\s"     end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
" syn region markdownH3 matchgroup=markdownH3Delimiter start=" \{,3}###\s"    end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
" syn region markdownH4 matchgroup=markdownH4Delimiter start=" \{,3}####\s"   end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
" syn region markdownH5 matchgroup=markdownH5Delimiter start=" \{,3}#####\s"  end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained
" syn region markdownH6 matchgroup=markdownH6Delimiter start=" \{,3}######\s" end="#*\s*$" keepend oneline contains=@markdownInline,markdownAutomaticLink contained

" syn region markdownAutomaticLink matchgroup=markdownUrlDelimiter start="<\%(\w\+:\|[[:alnum:]_+-]\+@\)\@=" end=">" keepend oneline
