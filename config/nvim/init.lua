local modules = {
  "options",
  "autocmds",
  "mappings",
}

for _, module in ipairs(modules) do
  local ok, err = pcall(require, module)
  if not ok then
    error("Error loading " .. module .. "\n\n" .. err)
  end
end

vim.cmd [[ colorscheme nordfox ]]

vim.cmd [[ highlight Comment cterm=italic gui=italic ]]
