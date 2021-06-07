#!/bin/bash

tail -f \
  ~/.cache/nvim/lsp.log \
  ~/.cache/nvim/dap.log \
  ~/.cache/nvim/packer.nvim.log \
  /tmp/nvim-dap.log \
  /tmp/efm.log | ccze -A

# grc -es -c conf.log --colour=auto tail -f ~/.local/share/nvim/vlog.nvim.log
