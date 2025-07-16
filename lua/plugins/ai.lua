return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    opts = function()
      local user = vim.env.USER or "User"
      user = user:sub(1, 1):upper() .. user:sub(2)
      return {
        auto_insert_mode = true,
        question_header = "  " .. user .. " ",
        answer_header = "  Copilot ",
        window = {
          width = 0.4,
        },
        prompts = {
          GoTest = {
            prompt = "Generate test for my code with testify library",
            -- system_prompt = "You are very good at explaining stuff",
            -- mapping = "<leader>ccmc",
            description = "Use this to generate a test using the testify library",
          },
        },
      }
    end,
  },
  {
    "greggh/claude-code.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim", -- Required for git operations
    },
    config = function()
      require("claude-code").setup()
    end,
  },
}
