local remap = vim.api.nvim_set_keymap
local fn = vim.fn

local prettier = {
  {
    cmd = {
      function(file)
        if not fn.empty(fn.glob(fn.getcwd()..'/.prettierrc')) then
          return string.format("prettier -w --config %s/.prettierrc %s", fn.getcwd(), file)
        else
          -- fallback to global config
          return string.format("prettier -w --config ~/.config/nvimLua/.prettierrc %s", file)
        end
      end
    },
    tempfile_dir = os.getenv("HOME").."/.config/nvimLua"
  }
}

local rustfmt = {
  {
    cmd = { 'rustfmt' },
    tempfile_dir = os.getenv("HOME").."/.config/nvimLua"
  }
}

require'format'.setup {
  javascript = prettier,
  typescript = prettier,
  svelte = prettier,
  html = prettier,
  css = prettier,
  rust = rustfmt,
}
remap('n', 'gf', '<cmd>FormatWrite<CR>', { noremap = true, silent = true })
