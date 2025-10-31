-- You can add your own plugins here or in other files in this directory!
-- I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

return {
  -- Iron.nvim plugin for interactive REPL within Neovim

  {
    'Vigemus/iron.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local iron = require 'iron.core'
      local view = require 'iron.view'
      local common = require 'iron.fts.common'

      iron.setup {
        config = {
          scratch_repl = true,
          repl_definition = {
            sh = {
              command = { 'zsh' },
            },
            python = {
              command = { 'python3' },
              format = common.bracketed_paste_python,
              block_dividers = { '# %%', '#%%' },
            },
          },
          repl_filetype = function(_, ft)
            return ft
          end,
          repl_open_cmd = view.split.vertical.botright '30%',
          ignore_blank_lines = true,
        },
        keymaps = {
          toggle_repl = '<localleader>rr', -- \rr
          restart_repl = '<localleader>rR', -- \rR
          send_motion = '<localleader>sc', -- \sc
          visual_send = '<localleader>sc', -- \sc
          send_file = '<localleader>sf', -- \sf
          send_line = '<localleader>sl', -- \sl
          send_paragraph = '<localleader>sp', -- \sp
          send_until_cursor = '<localleader>su', -- \su
          send_mark = '<localleader>sm', -- \sm
          send_code_block = '<localleader>sb', -- \sb
          send_code_block_and_move = '<localleader>sn', -- \sn
          mark_motion = '<localleader>mc', -- \mc
          mark_visual = '<localleader>mc', -- \mc
          remove_mark = '<localleader>md', -- \md
          cr = '<localleader>rc', -- \rc
          interrupt = '<localleader>ri', -- \ri
          exit = '<localleader>rq', -- \rq
          clear = '<localleader>cl', -- \cl
        },
        highlight = {
          italic = true,
        },
      }

      -- dodatne komande za fokus/sakrij repl
      vim.keymap.set('n', '<localleader>rf', '<cmd>IronFocus<cr>') -- \rf
      vim.keymap.set('n', '<localleader>rh', '<cmd>IronHide<cr>') -- \rh
    end,
  },
}
