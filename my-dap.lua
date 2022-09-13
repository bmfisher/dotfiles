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
      logToFile = 'true';
      stopOnEntry = 'true';
      justMyCode = 'false';
    },
  }
  dap.defaults.fallback.focus_terminal = true


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

