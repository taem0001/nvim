return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },

  config = function()
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

    -- Clangd
    vim.lsp.config.clangd = {
      cmd = { "clangd" },
      on_attach = on_attach,
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "c", "cpp", "objc", "objcpp" },
      callback = function()
        start(vim.lsp.config.clangd)
      end,
    })

    -- JavaScript/TypeScript (tsserver)
    vim.lsp.config.tsserver = {
      cmd = { "typescript-language-server", "--stdio" },
      on_attach = on_attach,
      capabilities = vim.lsp.protocol.make_client_capabilities(),
    }

    vim.api.nvim_create_autocmd("FileType", {
      pattern = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
      },
      callback = function()
        start(vim.lsp.config.tsserver)
      end,
    })
	
	-- HTML
	vim.lsp.config.html = {
  		cmd = { "vscode-html-language-server", "--stdio" },
  		on_attach = on_attach,
  		capabilities = vim.lsp.protocol.make_client_capabilities(),
	}

	vim.api.nvim_create_autocmd("FileType", {
  		pattern = { "html" },
  		callback = function()
    		start(vim.lsp.config.html)
  		end,
	})

  end,
}

