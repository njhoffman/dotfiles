-- :TableModeToggle
vim.g.table_mode_toggle_map = "<leader>tm"

-- :TableModeRealign
vim.g.table_mode_relign_map = "<leader>tr"

-- (visual) :Tableize
vim.g.table_mode_tableize_map = "<leader>tt"

-- (visual) :Tableize/<delim>, :Tableize/;
vim.g.table_mode_tableize_op_map = "<leader>T"
vim.g.table_mode_delete_row_map = "<leader>tdd"
vim.g.table_mode_delete_column_map = "<leader>tdc"
vim.g.table_mode_insert_column_after_map = "<leader>tic"
vim.g.table_mode_insert_column_before_map = "<leader>tiC"

-- :TableAddFormula, :TableEvalFormulaLine
vim.g.table_mode_add_formula_map = "<leader>tfa"
vim.g.table_mode_eval_expr_map = "<leader>tfe"

-- use i|, a| for inner and around text objects

-- Enter the first line, delimiting columns by the | symbol. The plugin reacts by inserting spaces between the text and the separator if you omit them:

-- | name | address | phone |
-- In the second line (without leaving Insert mode), enter | twice. The plugin will write a properly formatted horizontal line:

-- | name | address | phone |
-- |------+---------+-------|

-- Go on until the table is ready:

-- | name            | address                  | phone      |
-- |-----------------+--------------------------+------------|
-- | John Adams      | 1600 Pennsylvania Avenue | 0123456789 |
-- |-----------------+--------------------------+------------|
-- | Sherlock Holmes | 221B Baker Street        | 0987654321 |
-- |-----------------+--------------------------+------------|
-- Then you can return to the first line and above it enter ||:
--
-- Use ":" for alignment
