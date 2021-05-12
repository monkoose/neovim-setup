-- hop.nvim
require'hop'.setup {
  keys = 'fjdkhgslioewurmc',
  jump_on_sole_occurrence = false
}

-- nvim-lspconfig
local nvim_lsp = require('lspconfig')
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
require'lspconfig'.sumneko_lua.setup{
  cmd = { "lua-language-server" },
  settings = {
    Lua = { diagnostics = { globals = { 'vim' } } }
  }
}

-- nvim-compe
require'compe'.setup {
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
