-- hop.nvim
require"hop".setup {
  keys = "fjdkhgslioewurmc",
  jump_on_sole_occurrence = false,
  teasing = false,
}

-- nvim-lspconfig
local nvim_lsp = require("lspconfig")
-- html, css
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
nvim_lsp.html.setup {
  capabilities = capabilities,
}
nvim_lsp.cssls.setup {
  capabilities = capabilities,
}

nvim_lsp.rust_analyzer.setup{}
nvim_lsp.pyls.setup{}
nvim_lsp.tsserver.setup{}
nvim_lsp.vimls.setup{}
nvim_lsp.svelte.setup{}
nvim_lsp.bashls.setup{}
nvim_lsp.clangd.setup{}

require'lspconfig'.sumneko_lua.setup {
  cmd = { "lua-language-server" };
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- nvim-lsp-diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
      spacing = 6
    },
    signs = false,
    underline = {
      severity_limit = "Warning",
    },
    severity_sort = true,
  }
)

-- nvim-compe
require"compe".setup {
  preselect = "disable";

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}

-- nvim-fzf
require("fzf").default_window_options = { border = false }

-- pretty print wrapper for lua tables
function _G.pretty_print(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end

------------------------------------------
------------------------ CHORD CANCELATION
------------------------------------------
local keys = {}
-- Table of suffixes for which cord cancelation is applied
local suffixes = {'x','s','d','c','a','i', '<esc>', ''}

local function load_keys()
  keys = {}
  for _, map in pairs(vim.api.nvim_get_keymap('n')) do
    keys[vim.api.nvim_replace_termcodes(map.lhs, true, false, true)] = true
  end
end

local function create_map(key)
  for _, suffix in pairs(suffixes) do
    local raw_suffix = vim.api.nvim_replace_termcodes(suffix, true, false, true)
    if keys[key..raw_suffix] == nil then
      vim.api.nvim_set_keymap('n', key..raw_suffix, '<nop>', {noremap=true})
      keys[key .. raw_suffix] = true
    end
  end
end

-- Applies cord cancelation to all keymaps currently set
-- starting with prefix. prefix is a string
-- It can be any keymap start like "<leader>" or "<space>t"
local function cancel(prefix)
  load_keys()
  local prefix_raw = vim.api.nvim_replace_termcodes(prefix, true, false, true)
  for key, _ in pairs(keys) do
    if vim.startswith(key, prefix_raw) then
      for i=#key-1,#prefix_raw,-1 do
        local k = key:sub(1,i)
        create_map(k)
      end
    end
  end
end

cancel('<space>')

-- nvim-fzf-providers
require("fzf-providers.symbols")
require("fzf-providers.locations")
