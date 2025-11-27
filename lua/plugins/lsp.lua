return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
    local lspconfig = vim.lsp.config
    local start = vim.lsp.start

    -- Keymaps for LSP buffers
    local on_attach = function(_, bufnr)
      local bufmap = function(mode, lhs, rhs)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr })
      end
		
	  bufmap("n", "<leader>ft", vim.lsp.buf.format)
      bufmap("n", "gd", vim.lsp.buf.definition)
      bufmap("n", "gD", vim.lsp.buf.declaration)
      bufmap("n", "gi", vim.lsp.buf.implementation)
      bufmap("n", "gr", vim.lsp.buf.references)
      bufmap("n", "K", vim.lsp.buf.hover)
      bufmap("n", "<leader>rn", vim.lsp.buf.rename)
      bufmap("n", "<leader>ca", vim.lsp.buf.code_action)
      bufmap("n", "[d", vim.diagnostic.goto_prev)
      bufmap("n", "]d", vim.diagnostic.goto_next)
      bufmap("n", "<leader>e", vim.diagnostic.open_float)
    end

    -- Register clangd with new API
    vim.lsp.config.clangd = {
      cmd = { "clangd" },
      on_attach = on_attach,
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    }

    -- Automatically start clangd on C/C++ files
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp", "objc", "objcpp" },
      callback = function()
        start(vim.lsp.config.clangd)
      end,
    })
  end,
}

