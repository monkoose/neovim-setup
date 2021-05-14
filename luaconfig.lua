-- hop.nvim
require"hop".setup {
  keys = "fjdkhgslioewurmc",
  jump_on_sole_occurrence = false
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
require"lspconfig".sumneko_lua.setup{
  cmd = { "lua-language-server" },
  settings = {
    Lua = { diagnostics = { globals = { "vim" } } }
  }
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
