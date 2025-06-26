return{
    'MarcHamamji/runner.nvim',
    lazy = true,
    cmd = {"Runner"},
    dependencies = {
      'nvim-telescope/telescope.nvim',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    config = function()
        require('runner').setup({
              position = 'right', -- position of the terminal window when using the shell_handler
                      -- can be: top, left, right, bottom
                      -- will be overwritten when using the telescope mapping to open horizontally or vertically

                width = 80,         -- width of window when position is left or right
                height = 10,        -- height of window when position is top or bottom

                handlers = {
                cpp = function(bufnr)
                    -- local exec = os.getenv("executable") or vim.fn.input("Enter executable: ")
                    local settings = require("nvim.settings")
                    local exec = settings.executable
                    local mode = settings.mode
                    if mode == "release" then vim.cmd("!cd build && cmake .. && make -j4 && ./" .. exec)
                    elseif mode == "debug" then vim.cmd("!cd build && cmake -DCMAKE_BUILD_TYPE=Debug .. && make -j4")
                    end
                end
            } -- discussed in the next section
        })
    end
  }

