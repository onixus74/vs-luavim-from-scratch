local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Close buffer
-- keymap("n", "<C-w>", ":Bdelete!<CR>", opts)
keymap("n", "<C-w>", ":BD<CR>", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<S-k>", ":BufferLineCycleNext<CR>", opts)
keymap("n", "<S-j>", ":BufferLineCyclePrev<CR>", opts)

-- Navigate tabs
keymap("n", "tnn", ":tabnew<CR>", opts)
keymap("n", "tn", ":tabn<CR>", opts)
keymap("n", "tp", ":tabp<CR>", opts)

---- OLD CONFIG without BUFFERLINE
---- keymap("n", "<S-k>", ":bnext<CR>", opts)
---- keymap("n", "<S-j>", ":bprevious<CR>", opts)

-- Move buffers
keymap("n", "<leader>..", ":BufferLineMoveNext<CR>", opts)
keymap("n", "<leader>,,", ":BufferLineMovePrev<CR>", opts)

-- Move text up and down
keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)


-- Insert --
-- Press jk fast to enter
keymap("i", "jj", "<ESC>", opts)
keymap("i", "kk", "<ESC>", opts)
keymap("i", "jk", "<ESC>", opts)


-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)



-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)



-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)



-- Splits
keymap("n", "<leader>v", ":vsplit<CR>", opts)
keymap("n", "<leader>h", ":split<CR>", opts)



-- NvimTree
keymap("n", "<C-n>", ":NvimTreeToggle<CR>", opts)



-- LazyGit
keymap("n", "<leader>gg", ":LazyGit<CR>", opts)



-- Source nvim config
keymap("n", "<leader>so", ":so %<CR>", opts)



-- Git
---- LazyGit
keymap("n", "<leader>gg", ":LazyGit<CR>", opts)

---- ResetHunk
keymap("n", "<leader>hu", ":Gitsigns reset_hunk<CR>", opts)

---- PreviewHunk
keymap("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", opts)

---- NextHunk
keymap("n", "]g", ":Gitsigns next_hunk<CR>", opts)

---- PreviousHunk
keymap("n", "[g", ":Gitsigns prev_hunk<CR>", opts)


-- Diffview
-- TODO: add bindings for Diffview  <28-09-22, onixus74> --

-- Telescope
---- Buffers
keymap("n", "<leader>bb", ":Telescope buffers<CR>", opts)

---- Treesitter
keymap("n", "<leader>ff", ":Telescope treesitter<CR>", opts)

---- ProjectFiles
-- keymap("n", "<C-p>", ":Telescope project_files<CR>", opts)

---- Files (Handled with project_files fun)
keymap("n", "<C-p>", ":Telescope find_files<CR>", opts)

---- GitStatus
keymap("n", "<C-g>", ":Telescope git_status<CR>", opts)

---- Current buffer lines
keymap("n", "<leader>ll", ":Telescope current_buffer_fuzzy_find<CR>", opts)

---- Current directory lines
keymap("n", "<leader>ss", ":Telescope live_grep<CR>", opts)

---- String Grep
keymap("n", "<leader>LL", ":Telescope grep_string<CR>", opts)

---- Git commits
keymap("n", "<leader>gc", ":Telescope git_commits<CR>", opts)

---- Git branches
keymap("n", "<leader>gb", ":Telescope git_branches<CR>", opts)

---- Git worktrees
keymap("n", "<leader>gt", ":Telescope git_worktree git_worktrees<CR>", opts)

keymap("n", "<leader>gtt", ":Telescope git_worktree create_git_worktree<CR>", opts)

---- Flutter commands
keymap("n", "<leader>fc", ":Telescope flutter commands<CR>", opts)



-- Code outline Aerial
keymap("n", "<leader>oo", ":AerialToggle<CR>", opts)



-- Debugging
---- Debugging session start / continue
keymap("n", "<leader>dd", ":DapContinue<CR>", opts)

---- Toggle Repl
keymap("n", "<leader>dr", ":DapToggleRepl<CR>", opts)

---- Toggle Breakpoint
keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts)

---- Debugging session terminate
keymap("n", "<leader>dt", ":DapTerminate<CR>", opts)

---- Toggle Repl
keymap("n", "<leader>du", ":lua require('dapui').toggle()<CR>", opts)



-- Octo
---- pr list
keymap("n", "<leader>il", ":Octo issue list<CR>", opts)

---- pr list
keymap("n", "<leader>pl", ":Octo pr list<CR>", opts)

---- review start
keymap("n", "<leader>pr", ":Octo review start<CR>", opts)

---- review resume
keymap("n", "<leader>prr", ":Octo review resume<CR>", opts)

---- review discard
keymap("n", "<leader>pd", ":Octo review discard<CR>", opts)

---- review submit
keymap("n", "<leader>ps", ":Octo review submit<CR>", opts)

---- review close
keymap("n", "<leader>pc", ":Octo review close<CR>", opts)



-- Potion Maker
keymap("n", "<leader>tt", ":PotionMakerToggleTestFile<CR>", opts)

keymap("n", "<leader>ts", ":PotionMakerExecuteTestAtCursor<CR>", opts)

keymap("n", "<leader>tS", ":PotionMakerExecuteTestForCurrentFile<CR>", opts)



-- Wakatime
keymap("n", "<leader>ww", ":WakaTimeToday<CR>", opts)

-- LLM

-- gen.nvim
-- keymap("n", "<leader>]", ":Gen<CR>", opts)

-- Markdown

keymap("n", "<leader>md", ":Glow<CR>", opts)

-- Knap (Markdown/PDF/... preview)
-- keymap("n", "<leader>mdp", ":lua require('knap').toggle_autopreviewing()<CR>", opts)
