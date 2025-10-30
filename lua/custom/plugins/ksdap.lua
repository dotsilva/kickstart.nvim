-- ~/config/nvim/lua/custom/plugins/ksdebug.lua
--
-- Configuração completa do DAP (Debug Adapter Protocol)
-- Inclui: nvim-dap, nvim-dap-ui, OSV (para Lua)
-- Adaptadores: Bash (via Mason), Lua (via OSV plugin)

return {

  -- 1. Plugin Principal do DAP
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      -- 2. Plugin de UI (Interface Visual)
      {
        'rcarriga/nvim-dap-ui',
        dependencies = { 'nvim-neotest/nvim-nio' },
        config = function()
          local dapui = require 'dapui'
          dapui.setup {
            layouts = {
              {
                elements = {
                  { id = 'scopes', size = 0.25 },
                  { id = 'breakpoints', size = 0.25 },
                  { id = 'stacks', size = 0.25 },
                  { id = 'watches', size = 0.25 },
                },
                size = 40,
                position = 'left',
              },
              {
                elements = {
                  { id = 'repl', size = 0.5 },
                  { id = 'console', size = 0.5 },
                },
                size = 10,
                position = 'bottom',
              },
            },
            controls = {
              enabled = true,
              element = 'repl',
            },
          }

          local dap = require 'dap'
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open()
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close()
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close()
          end

          vim.keymap.set('n', '<leader>du', dapui.toggle, { desc = '[D]ebug: Toggle [U]I' })
        end,
      },

      -- 3. Integração com o Mason (APENAS PARA BASH)
      {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = { 'mason.nvim' },
        opts = {
          -- Lista de adaptadores para instalar automaticamente
          ensure_installed = {
            'bash-debug-adapter',
            -- 'local-lua-debugger-vscode' FOI REMOVIDO
          },
          -- Isso configura automaticamente o bash-debug-adapter
          handlers = {},
        },
      },

      -- 4. O ADAPTADOR LUA (OSV)
      -- Este é o plugin que você sugeriu.
      -- Ele se registra automaticamente no nvim-dap.
      {
        'jbyuki/one-small-step-for-vimkind',
        -- Não precisa de 'config = function()' se você só
        -- quer que ele registre o adaptador.
      },
    },
    config = function()
      local dap = require 'dap'

      -- Atalhos de teclado principais do DAP
      vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = '[D]ebug: Toggle [B]reakpoint' })
      vim.keymap.set('n', '<leader>dc', dap.continue, { desc = '[D]ebug: [C]ontinue' })
      vim.keymap.set('n', '<leader>do', dap.step_over, { desc = '[D]ebug: Step [O]ver' })
      vim.keymap.set('n', '<leader>di', dap.step_into, { desc = '[D]ebug: Step [I]nto' })
      vim.keymap.set('n', '<leader>dO', dap.step_out, { desc = '[D]ebug: Step [O]ut' })
      vim.keymap.set('n', '<leader>dq', dap.terminate, { desc = '[D]ebug: [Q]uit Session' })
      vim.keymap.set('n', '<leader>dr', dap.run_to_cursor, { desc = '[D]ebug: [R]un to Cursor' })

      -- === Configurações de Lançamento (Launch) ===

      -- NOTA: O plugin 'one-small-step-for-vimkind'
      -- registra automaticamente uma configuração 'lua'
      -- que funciona para o arquivo atual.
      -- Não precisamos mais de 'dap.configurations.lua = ...'

      -- Configuração para Bash (permanece a mesma)
      dap.configurations.bash = {
        {
          type = 'bash', -- 'bash-debug-adapter' se registra como 'bash'
          request = 'launch',
          name = 'Launch current file (bashdb)',
          program = '${file}',
          args = {},
          cwd = '${workspaceFolder}',
          stopOnEntry = true,
        },
      }
    end,
  },
}
