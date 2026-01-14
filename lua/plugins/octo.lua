return {
  {
    "pwntester/octo.nvim",
    opts = {
      -- enable_builtin = true,
      default_to_projects_v2 = false,
      -- Use environment variables to set hostname
      github_hostname = os.getenv("GH_HOST"),
      -- default_merge_method = "squash",
      -- picker = "telescope",
    },
  },
}
