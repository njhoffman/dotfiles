local plugin = {}

-- Overview:
--   "Hello *world!"           ds"         Hello world!
--   [123+4*56]/2              cs])        (123+456)/2
--   "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
--   if *x>3 {                 ysW(        if ( x>3 ) {
--   my $str = *whee!;         vllllS'     my $str = 'whee!';
-- Delete:
--   "Hello *world!"           ds"         Hello world!
--   (123+4*56)/2              ds)         123+456/2
--   <div>Yo!*</div>           dst         Yo!
-- Change:
--   "Hello *world!"           cs"'        'Hello world!'
--   "Hello *world!"           cs"<q>      <q>Hello world!</q>
--   (123+4*56)/2              cs)]        [123+456]/2
--   (123+4*56)/2              cs)[        [ 123+456 ]/2
--   <div>Yo!*</div>           cst<p>      <p>Yo!</p>
-- YouSurround:
--   Hello w*orld!             ysiw)       Hello (world)!
--   Hello w*orld!             yssB        {Hello world!}
--     * yss whole line ignoring whitespace, *yS* *ySS* new line with indent
-- Visual:
--   *vS*  ... wraps entire selection with indent
--   *vgS* ... wraps without indent
-- Targets:
--   t or <    ... xml tag
--   s or P    ... sentence/paragraph
--   w or W    ... word
--   f, F, C-F ... function
-- Function wrap:
--  "hello"                 ysWfprint<cr>     print("hello")
--  "hello"                 ysWFprint<cr>     print( "hello" )
--  "hello"                 ysW<C-f>print<cr> (print "hello")

function plugin.setup(use)
  use {"tpope/vim-surround"}
end

return plugin
