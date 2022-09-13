--require('dap-python').setup('~/dev/lb_venv/bin/python')
local dap = require('dap')
  dap.adapters.python = {
    type = 'executable';
    cwd = '/Users/brandonfisher/dev/ets/etsadmin/etsadmin';
    command = '/Users/brandonfisher/dev/lb_venv/bin/python';
    args = { '-m', 'debugpy.adapter' };
  }
  dap.configurations.python = {
    {
      type = 'python';
      request = 'launch';
      name = 'python debug configuration';
      console = 'integratedTerminal';
      python = '/Users/brandonfisher/dev/lb_venv/bin/python';
      cwd = '/Users/brandonfisher/dev/ets/etsadmin/etsadmin';
      program = vim.fn.getcwd() .. '/manage.py';
      args = { 'runserver', '--settings=etsadmin.settings.local', '--noreload' };
      justMyCode = 'false';
    },
  }
  dap.defaults.fallback.focus_terminal = true

require("dapui").setup({
  icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open = "o",
    remove = "d",
    edit = "e",
    repl = "r",
    toggle = "t",
  },
  -- Expand lines larger than the window
  -- Requires >= 0.7
  expand_lines = vim.fn.has("nvim-0.7"),
  -- Layouts define sections of the screen to place windows.
  -- The position can be "left", "right", "top" or "bottom".
  -- The size specifies the height/width depending on position. It can be an Int
  -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  -- Elements are the elements shown in the layout (in order).
  -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  layouts = {
    {
      elements = {
      -- Elements can be strings or table with id and size keys.
        { id = "scopes", size = 0.25 },
        "breakpoints",
        "stacks",
        "watches",
      },
      size = 40, -- 40 columns
      position = "left",
    },
    {
      elements = {
        "repl",
        "console",
      },
      size = 0.25, -- 25% of total lines
      position = "bottom",
    },
  },
  floating = {
    max_height = nil, -- These can be integers or a float between 0 and 1.
    max_width = nil, -- Floats will be treated as percentage of your screen.
    border = "single", -- Border style. Can be "single", "double" or "rounded"
    mappings = {
      close = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
  render = {
    max_type_length = nil, -- Can be integer or nil.
    max_value_lines = 100, -- Can be integer or nil.
  }
})

local opts = { noremap = true, silent = true }

vim.api.nvim_set_keymap("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>", opts)
vim.api.nvim_set_keymap("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>b", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>lp", "<cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", opts)
vim.api.nvim_set_keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>", opts)

vim.api.nvim_set_keymap("n", "<leader>db", "<cmd>lua require'dapui'.open()<CR> <cmd>lua require'dap'.continue()<CR>", opts)
