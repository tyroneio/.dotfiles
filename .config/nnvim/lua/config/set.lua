-- =========================
-- Leader Key Configuration
-- =========================
vim.g.mapleader = " " -- Set global leader key to space
vim.g.maplocalleader = " " -- Set local leader key to space

-- =========================
-- UI / Display Settings
-- =========================
vim.o.number = true -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers
vim.o.signcolumn = "yes" -- Always show the sign column
vim.o.cursorline = true -- Highlight the current line
vim.o.list = true -- Show invisible characters
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- Define invisible characters
vim.o.scrolloff = 25 -- Keep cursor centered with padding around view

-- =========================
-- Editing Behavior
-- =========================
vim.o.mouse = "a" -- Enable mouse support
vim.o.breakindent = true -- Enable indent-aware line wrapping
vim.o.confirm = false -- Prompt to save before closing unsaved buffers

-- =========================
-- Search Behavior
-- =========================
vim.o.ignorecase = true -- Ignore case in searches...
vim.o.smartcase = true -- ...unless uppercase letters are used

-- =========================
-- File Handling / Persistence
-- =========================
vim.o.undofile = true -- Save undo history to an external file

-- =========================
-- Window Management
-- =========================
vim.o.splitright = true -- Vertical splits open to the right
vim.o.splitbelow = true -- Horizontal splits open below

-- =========================
-- Command Behavior
-- =========================
vim.o.inccommand = "split" -- Show live preview of :substitute in split

-- =========================
-- Performance / Responsiveness
-- =========================
vim.o.updatetime = 250 -- Faster completion and diagnostics update
vim.o.timeoutlen = 300 -- Shorter timeout for mapped sequences

-- =========================
-- Editors
-- =========================
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
