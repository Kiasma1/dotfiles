local function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('i', 'jj', '<esc>')
