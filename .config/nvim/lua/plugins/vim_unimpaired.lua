local plugin = {}

function set_config()
  -- *[a*     |:previous :next|
  -- *[A*     |:first :last|
  -- *[b*     |:bprevious :bnext|
  -- *[B*     |:bfirst :blast|
  -- *[l*     |:lprevious :lnext|
  -- *[L*     |:lfirst :llast|
  -- *[<C-L>* |:lpfile :lnfile|
  -- *[q*     |:cprevious :cnext|
  -- *[Q*     |:cfirst :clast|
  -- *[<C-Q>* |:cpfile :cnfile| Must have flow control disabled: stty -ixon)
  -- *[t*     |:tprevious :tnext|
  -- *[T*     |:tfirst :tlast|
  -- *[<C-T>* |:ptprevious :ptnext|
  -- *[f*     go to next/previous file in directory
  -- *[n*     go to next scm conflict marker or diff/patch hunk
  -- *[ *     insert blank lines
  -- *[e*     exchange line
  --
  --  On	   Off	Toggle	Option
  -- *[ob*	*]ob*	*yob*	'background' (dark is off, light is on)
  -- *[oc*	*]oc*	*yoc*	'cursorline'
  -- *[od*	*]od*	*yod*	'diff' (actually |:diffthis| / |:diffoff|)
  -- *[oh*	*]oh*	*yoh*	'hlsearch'
  -- *[oi*	*]oi*	*yoi*	'ignorecase'
  -- *[ol*	*]ol*	*yol*	'list'
  -- *[on*	*]on*	*yon*	'number'
  -- *[or*	*]or*	*yor*	'relativenumber'
  -- *[os*	*]os*	*yos*	'spell'
  -- *[ou*	*]ou*	*you*	'cursorcolumn'
  -- *[ov*	*]ov*	*yov*	'virtualedit'
  -- *[ow*	*]ow*	*yow*	'wrap'
  -- *[ox*	*]ox*	*yox*	'cursorline' 'cursorcolumn' (x as in crosshairs)
  --
  -- pasting
  -- *]p*    Linewise paste after, preserve indent
  -- *]P*    Linewise paste before, preserve indent
  -- *>p*    Paste after linewise, increasing indent.
  -- *>P*    Paste before linewise, increasing indent.
  -- *=p*    Paste after linewise, reindenting.
  -- *=P*    Paste before linewise, reindenting.
end

function plugin.setup(use)
  use {
    "tpope/vim-unimpaired"
  }
end

return plugin
