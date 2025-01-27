-- lua/config/diagnostics.lua
vim.diagnostic.config({
    virtual_text = {
        -- Format without truncation but force word wrap
        format = function(diagnostic)
            -- 1. Clean up the message (remove newlines, extra spaces)
            local message = diagnostic.message:gsub("\n", " "):gsub("%s+", " ")
            -- 2. Split into words for manual wrapping
            local max_line_length = 90 -- Your desired wrap column
            local lines = {}
            for line in message:gmatch("%S+") do -- Split into words
                if #lines == 0 or (#lines[#lines] + #line + 1 > max_line_length) then
                    table.insert(lines, line)
                else
                    lines[#lines] = lines[#lines] .. " " .. line
                end
            end
            -- 3. Join lines with newline characters (forces vertical wrapping)
            return table.concat(lines, "\n")
        end,
        wrap = true, -- Required to display multiple lines
        spacing = 4,
        prefix = "●",
    },
})
