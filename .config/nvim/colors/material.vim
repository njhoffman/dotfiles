" https://github.com/marko-cerovac/material.nvim

lua << EOF
package.loaded['colorschemes.themes.material'] = nil
package.loaded['colorschemes.themes.material.util'] = nil
package.loaded['colorschemes.themes.material.colors'] = nil
package.loaded['colorschemes.themes.material.theme'] = nil
package.loaded['colorschemes.themes.material.functions'] = nil
require("colorschemes.material")
EOF
