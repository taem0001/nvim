-- Simple compile & run helpers for C/C++

-- :Make -> compile current file to ./a.out using gcc/g++
vim.api.nvim_create_user_command("Make", function()
  local file = vim.fn.expand("%")
  local ext = vim.fn.expand("%:e")
  local cmd

  if ext == "c" then
    cmd = string.format("gcc -Wall -Wextra -g %s -o a.out", file)
  elseif ext == "cpp" or ext == "cc" or ext == "cxx" then
    cmd = string.format("g++ -Wall -Wextra -g %s -o a.out", file)
  else
    print("Not a C/C++ file")
    return
  end

  vim.cmd("!" .. cmd)
end, {})

-- :Run -> run ./a.out
vim.api.nvim_create_user_command("Run", function()
  vim.cmd("!./a.out")
end, {})

