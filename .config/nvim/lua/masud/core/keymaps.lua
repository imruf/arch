vim.g.mapleader = ","

local keymap = vim.keymap

keymap.set("i", "jj", "<ESC>",{ desc = "Exit From Insert Mode" })


keymap.set("n", " ", "<PageDown>",{ desc = "PageDown" })


keymap.set("n", "<leader>ch", "<cmd>ColorHighlight",{ desc = "ColorHighlight" })
keymap.set("n", "<leader>nh", ":nohl<CR>",{ desc = "Disable Search Highlight" })

keymap.set("n", "<leader>wv", "<C-w>v",{ desc = "Vertical Window Split" })
keymap.set("n", "<leader>wh", "<C-w>s",{ desc = "Horizontal Window Split" })
keymap.set("n", "<leader>we", "<C-w>=",{ desc = "Resize Splitted Window" })
keymap.set("n", "<leader>wx", "<cmd>close<CR>",{ desc = "Close Window" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>",{ desc = "New Tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>",{ desc = "Close Tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>",{ desc = "Next Tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>",{ desc = "Previous Tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>",{ desc = "Open Current File In New Tab" })

keymap.set("n", "<leader>bn", "<cmd>bnext<CR>",{ desc = "Buffer Next" })
keymap.set("n", "<leader>bp", "<cmd>bprev<CR>",{ desc = "Buffer Previous" })
keymap.set("n", "<leader>bx", "<cmd>bdelete<CR>",{ desc = "Close Buffer" })

keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })
keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle File Explorer On Current File" })
keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse File Explorer" })
keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh File Explorer" })

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

keymap.set("n", "<leader>cs", "<cmd>setlocal spell! spelllang=en_us<cr>", { desc = "Check Spelling" })

keymap.set("n", "<leader>cf", "<cmd>w! | !compiler %:p<cr>", { desc = "Compile File" })
keymap.set("n", "<leader>co", "<cmd>!opout %:p<cr>", { desc = "Preview Compiled File" })

keymap.set("n", "<leader>vu", "<cmd>Urlview<cr>", { desc = "Preview Compiled File" })

-- Neovim yank options set to system clipboard access 
-- keymap.set("v", "<leader>yy", "<cmd>!xclip -f -sel clip<cr>", { desc = "Yank To System Clipboard" })
-- keymap.set("n", "<leader>pp", "<cmd>mz:-1r !xclip -o -sel clip<cr>", { desc = "Paste System Clipboard" })
