" Webgl Shaders
syn include @GLSL syntax/glsl.vim
syn region ShaderScript
      \ start="<script [^>]*type=\('\|\"\)x-shader/x-\(vertex\|fragment\)\('\|\"\)[^>]*>"
      \ keepend
      \ end="</script>"me=s-1
      \ contains=@GLSL,htmlScriptTag,@htmlPreproc

" PSL
syn clear htmlHead
syn match pslPositive '%?\w\+?%'
syn match pslNegative '%!\w\+!%'
syn match pslValue '"%\S\+%"'
syn match pslImport '%import .*$'
syn match pslMultiline '%MULTILINE%'


" JAVA SCRIPT

syn include @htmlJavaScript syntax/javascript.vim
unlet b:current_syntax
syn region javascript start=+%spidercode%+ keepend end=+%spidercode%+ contains=@htmlJavaScript,htmlCssStyleComment,htmlScriptTag,@htmlPreproc



