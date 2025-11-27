-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.uv and vim.loop then
  vim.uv = vim.loop
end

if not vim.uv.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Collect plugin specs from modules
local plugins = {
  require("plugins.treesitter"),
  require("plugins.lsp"),
  require("plugins.cmp"),
  require("plugins.telescope")
}

require("lazy").setup(plugins)

