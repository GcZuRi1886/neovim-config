vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Grep" })
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "List Buffers" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "Help Tags" })
vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<CR>", { desc = "Diagnostics" })
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle File Tree" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "Go to Definition" })
vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", { desc = "References" })
vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { desc = "Hover Doc" })
vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Rename Symbol" })
vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code Action" })
vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", { desc = "Prev Diagnostic" })
vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", { desc = "Next Diagnostic" })
vim.keymap.set("n", "<C-s>", ":w<CR>", { silent = true,  desc = "Save File" })
vim.keymap.set("i", "<C-s>", "<Esc>:w<CR>a", { silent = true, desc = "Save File in Insert Mode" })


-- Accept Copilot suggestion
vim.keymap.set("i", "<C-l>", 'copilot#Accept("<CR>")', {
  expr = true,
  silent = true,
  desc = "Copilot Accept",
})

-- Neotest keymaps
vim.keymap.set("n", "<leader>tn", function() require("neotest").run.run() end, { desc = "Run Nearest Test" })
vim.keymap.set("n", "<leader>tf", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run File Tests" })
vim.keymap.set("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle Test Summary" })
vim.keymap.set("n", "<leader>to", function() require("neotest").output.open({ enter = true }) end, { desc = "Open Test Output" })
vim.keymap.set("n", "<leader>tl", function() require("neotest").run.run_last() end, { desc = "Run Last Test" })
vim.keymap.set("n", "<leader>tD", function() require("neotest").run.run({ strategy = "dap" }) end, { desc = "Debug Nearest Test" })
vim.keymap.set("n", "<leader>ta", function() require("neotest").run.run({ suite = true }); require("neotest").summary.open() end, { desc = "Run All Tests and open summary" })
vim.keymap.set("n", "<leader>tA", function() require("neotest").run.run({ suite = true }) end, { desc = "Run All Tests" })
vim.keymap.set("n", "<leader>tc", function() require("neotest").run.stop() end, { desc = "Stop Test" })
vim.keymap.set("n", "<leader>td", function() require("neotest").run.run(vim.fn.expand("%:p:h")) end, { desc = "Run Tests in Current Directory" })
