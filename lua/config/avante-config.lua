---NOTE: user will be merged with defaults and
---we add a default var_accessor for this table to config values.

local Utils = require("avante.utils")

---@class avante.CoreConfig: avante.Config
local M = {}
---@class avante.Config
M._defaults = {
    debug = false,
    ---@alias Provider "claude" | "openai" | "azure" | "gemini" | "vertex" | "cohere" | "copilot" | string
    provider = "gemini", -- Only recommend using Claude
    -- WARNING: Since auto-suggestions are a high-frequency operation and therefore expensive,
    -- currently designating it as `copilot` provider is dangerous because: https://github.com/yetone/avante.nvim/issues/1048
    -- Of course, you can reduce the request frequency by increasing `suggestion.debounce`.
    auto_suggestions_provider = "gemini",
    ---@alias Tokenizer "tiktoken" | "hf"
    -- Used for counting tokens and encoding text.
    -- By default, we will use tiktoken.
    -- For most providers that we support we will determine this automatically.
    -- If you wish to use a given implementation, then you can override it here.
    tokenizer = "tiktoken",
    ---@type AvanteSupportedProvider
    openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4o",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
    },
    ---@type AvanteSupportedProvider
    copilot = {
        endpoint = "https://api.githubcopilot.com",
        model = "gpt-4o-2024-08-06",
        proxy = nil, -- [protocol://]host[:port] Use this proxy
        allow_insecure = false, -- Allow insecure server connections
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
    },
    ---@type AvanteAzureProvider
    azure = {
        endpoint = "", -- example: "https://<your-resource-name>.openai.azure.com"
        deployment = "", -- Azure deployment name (e.g., "gpt-4o", "my-gpt-4o-deployment")
        api_version = "2024-06-01",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
    },
    ---@type AvanteSupportedProvider
    claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-5-sonnet-20241022",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 8000,
    },
    ---@type AvanteSupportedProvider
    gemini = {
        endpoint = "https://generativelanguage.googleapis.com/v1beta/models",
        model = "gemini-exp-1206",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
    },
    ---@type AvanteSupportedProvider
    vertex = {
        endpoint = "https://LOCATION-aiplatform.googleapis.com/v1/projects/PROJECT_ID/locations/LOCATION/publishers/google/models",
        model = "gemini-1.5-flash-latest",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
    },
    ---@type AvanteSupportedProvider
    cohere = {
        endpoint = "https://api.cohere.com/v2",
        model = "command-r-plus-08-2024",
        timeout = 30000, -- Timeout in milliseconds
        temperature = 0,
        max_tokens = 4096,
    },
    ---To add support for custom provider, follow the format below
    ---See https://github.com/yetone/avante.nvim/wiki#custom-providers for more details
    ---@type {[string]: AvanteProvider}
    vendors = {
        ---@type AvanteSupportedProvider
        ["claude-haiku"] = {
            __inherited_from = "claude",
            model = "claude-3-5-haiku-20241022",
            timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 8000,
        },
        ---@type AvanteSupportedProvider
        ["claude-opus"] = {
            __inherited_from = "claude",
            model = "claude-3-opus-20240229",
            timeout = 30000, -- Timeout in milliseconds
            temperature = 0,
            max_tokens = 8000,
        },
    },
    ---Specify the special dual_boost mode
    ---1. enabled: Whether to enable dual_boost mode. Default to false.
    ---2. first_provider: The first provider to generate response. Default to "openai".
    ---3. second_provider: The second provider to generate response. Default to "claude".
    ---4. prompt: The prompt to generate response based on the two reference outputs.
    ---5. timeout: Timeout in milliseconds. Default to 60000.
    ---How it works:
    --- When dual_boost is enabled, avante will generate two responses from the first_provider and second_provider respectively. Then use the response from the first_provider as provider1_output and the response from the second_provider as provider2_output. Finally, avante will generate a response based on the prompt and the two reference outputs, with the default Provider as normal.
    ---Note: This is an experimental feature and may not work as expected.
    dual_boost = {
        enabled = false,
        first_provider = "openai",
        second_provider = "claude",
        prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
        timeout = 60000, -- Timeout in milliseconds
    },
    ---Specify the behaviour of avante.nvim
    ---1. auto_focus_sidebar              : Whether to automatically focus the sidebar when opening avante.nvim. Default to true.
    ---2. auto_suggestions = false, -- Whether to enable auto suggestions. Default to false.
    ---3. auto_apply_diff_after_generation: Whether to automatically apply diff after LLM response.
    ---                                     This would simulate similar behaviour to cursor. Default to false.
    ---4. auto_set_keymaps                : Whether to automatically set the keymap for the current line. Default to true.
    ---                                     Note that avante will safely set these keymap. See https://github.com/yetone/avante.nvim/wiki#keymaps-and-api-i-guess for more details.
    ---5. auto_set_highlight_group        : Whether to automatically set the highlight group for the current line. Default to true.
    ---6. jump_to_result_buffer_on_finish = false, -- Whether to automatically jump to the result buffer after generation
    ---7. support_paste_from_clipboard    : Whether to support pasting image from clipboard. This will be determined automatically based whether img-clip is available or not.
    ---8. minimize_diff                   : Whether to remove unchanged lines when applying a code block
    behaviour = {
        auto_focus_sidebar = true,
        auto_suggestions = true, -- Experimental stage
        auto_suggestions_respect_ignore = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        jump_result_buffer_on_finish = false,
        support_paste_from_clipboard = true,
        minimize_diff = true,
        enable_cursor_planning_mode = true,
    },
    history = {
        max_tokens = 900000,
        storage_path = vim.fn.stdpath("state") .. "/avante",
        paste = {
            extension = "png",
            filename = "pasted-%Y-%m-%d-%H-%M-%S",
        },
    },
    highlights = {
        ---@type AvanteConflictHighlights
        diff = {
            current = "DiffText",
            incoming = "DiffAdd",
        },
    },
    mappings = {
        ---@class AvanteConflictMappings
        diff = {
            ours = "co",
            theirs = "ct",
            all_theirs = "ca",
            both = "cb",
            cursor = "cc",
            next = "]x",
            prev = "[x",
        },
        suggestion = {
            accept = "<M-l>",
            next = "<M-]>",
            prev = "<M-[>",
            dismiss = "<C-]>",
        },
        jump = {
            next = "]]",
            prev = "[[",
        },
        submit = {
            normal = "<CR>",
            insert = "<C-s>",
        },
        -- NOTE: The following will be safely set by avante.nvim
        ask = "<leader>aa",
        edit = "<leader>ae",
        refresh = "<leader>ar",
        focus = "<leader>af",
        toggle = {
            default = "<leader>at",
            debug = "<leader>ad",
            hint = "<leader>ah",
            suggestion = "<leader>as",
            repomap = "<leader>aR",
        },
        sidebar = {
            apply_all = "A",
            apply_cursor = "a",
            switch_windows = "<Tab>",
            reverse_switch_windows = "<S-Tab>",
            remove_file = "d",
            add_file = "@",
        },
        files = {
            add_current = "<leader>ac", -- Add current buffer to selected files
        },
    },
    windows = {
        ---@alias AvantePosition "right" | "left" | "top" | "bottom" | "smart"
        position = "right",
        wrap = true, -- similar to vim.o.wrap
        width = 25, -- default % based on available width in vertical layout
        height = 30, -- default % based on available height in horizontal layout
        sidebar_header = {
            enabled = true, -- true, false to enable/disable the header
            align = "center", -- left, center, right for title
            rounded = true,
        },
        input = {
            prefix = "> ",
            height = 8, -- Height of the input window in vertical layout
        },
        edit = {
            border = "rounded",
            start_insert = false, -- Start insert mode when opening the edit window
        },
        ask = {
            floating = true, -- Open the 'AvanteAsk' prompt in a floating window
            border = "rounded",
            start_insert = true, -- Start insert mode when opening the ask window
            ---@alias AvanteInitialDiff "ours" | "theirs"
            focus_on_apply = "ours", -- which diff to focus after applying
        },
    },
    --- @class AvanteConflictConfig
    diff = {
        autojump = true,
        --- Override the 'timeoutlen' setting while hovering over a diff (see :help timeoutlen).
        --- Helps to avoid entering operator-pending mode with diff mappings starting with `c`.
        --- Disable by setting to -1.
        override_timeoutlen = 500,
    },
    --- @class AvanteHintsConfig
    hints = {
        enabled = true,
    },
    --- @class AvanteRepoMapConfig
    repo_map = {
        ignore_patterns = { "%.git", "%.worktree", "__pycache__", "node_modules" }, -- ignore files matching these
        negate_patterns = {}, -- negate ignore files matching these.
    },
    --- @class AvanteFileSelectorConfig
    file_selector = {
        --- @alias FileSelectorProvider "native" | "fzf" | "mini.pick" | "snacks" | "telescope" | string
        provider = "native",
        -- Options override for custom providers
        provider_opts = {},
    },
    suggestion = {
        debounce = 600,
        throttle = 600,
    },
}

---@type avante.Config
M._options = {}

---@class avante.ConflictConfig: AvanteConflictConfig
---@field mappings AvanteConflictMappings
---@field highlights AvanteConflictHighlights
M.diff = {}

---@type Provider[]
M.providers = {}

---@param opts? avante.Config
function M.setup(opts)
    vim.validate({ opts = { opts, "table", true } })

    local merged = vim.tbl_deep_extend(
        "force",
        M._defaults,
        opts or {},
        ---@type avante.Config
        {
            behaviour = {
                support_paste_from_clipboard = M.support_paste_image(),
            },
        }
    )

    M._options = merged
    M.providers = vim.iter(M._defaults)
        :filter(function(_, value)
            return type(value) == "table" and value.endpoint ~= nil
        end)
        :fold({}, function(acc, k)
            acc = vim.list_extend({}, acc)
            acc = vim.list_extend(acc, { k })
            return acc
        end)

    vim.validate({ provider = { M._options.provider, "string", false } })

    M.diff = vim.tbl_deep_extend(
        "force",
        {},
        M._options.diff,
        { mappings = M._options.mappings.diff, highlights = M._options.highlights.diff }
    )

    if next(M._options.vendors) ~= nil then
        for k, v in pairs(M._options.vendors) do
            M._options.vendors[k] = type(v) == "function" and v() or v
        end
        vim.validate({ vendors = { M._options.vendors, "table", true } })
        M.providers = vim.list_extend(M.providers, vim.tbl_keys(M._options.vendors))
    end
end

---@param opts? avante.Config
function M.override(opts)
    vim.validate({ opts = { opts, "table", true } })

    M._options = vim.tbl_deep_extend("force", M._options, opts or {})
    M.diff = vim.tbl_deep_extend(
        "force",
        {},
        M._options.diff,
        { mappings = M._options.mappings.diff, highlights = M._options.highlights.diff }
    )

    if next(M._options.vendors) ~= nil then
        for k, v in pairs(M._options.vendors) do
            M._options.vendors[k] = type(v) == "function" and v() or v
            if not vim.tbl_contains(M.providers, k) then
                M.providers = vim.list_extend(M.providers, { k })
            end
        end
        vim.validate({ vendors = { M._options.vendors, "table", true } })
    end
end

M = setmetatable(M, {
    __index = function(_, k)
        if M._options[k] then
            return M._options[k]
        end
    end,
})

M.support_paste_image = function()
    return Utils.has("img-clip.nvim") or Utils.has("img-clip")
end

M.get_window_width = function()
    return math.ceil(vim.o.columns * (M.windows.width / 100))
end

---@param provider Provider
---@return boolean
M.has_provider = function(provider)
    return M._options[provider] ~= nil or M.vendors[provider] ~= nil
end

---get supported providers
---@param provider Provider
---@return AvanteProviderFunctor
M.get_provider = function(provider)
    if M._options[provider] ~= nil then
        return vim.deepcopy(M._options[provider], true)
    elseif M.vendors and M.vendors[provider] ~= nil then
        return vim.deepcopy(M.vendors[provider], true)
    else
        error("Failed to find provider: " .. provider, 2)
    end
end

M.BASE_PROVIDER_KEYS = {
    "endpoint",
    "model",
    "deployment",
    "api_version",
    "proxy",
    "allow_insecure",
    "api_key_name",
    "timeout",
    -- internal
    "local",
    "_shellenv",
    "tokenizer_id",
    "use_xml_format",
    "role_map",
    "__inherited_from",
}

return M
