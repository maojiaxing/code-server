-- function bootstrap(url, ref) 
--     local name = url:gsub(".*/", "")
--     local path = vim.fn.stdpath("data") .. "/site/pack/bootstrap/start/" .. name

--     if vim.fn.isdirectory(path) == 0 then
--         print(name .. ": installing in data dir...")

--         vim.fn.system {"git", "clone", url, path}

--         if ref then
--             vim.fn.system {"git", "-C", path, "checkout", ref}
--         end

--         vim.cmd "redraw"

--         print(name .. ": finished installing")
--     end
-- end

-- -- flash.nvim
-- bootstrap("https://github.com/folke/flash.nvim.git", "v2.1.0")

-- -- mini.nvim
-- bootstrap("https://github.com/echasnovski/mini.nvim", "v0.14.0")
