return {
  {
    'christoomey/vim-tmux-runner',
    cmd = {
      "VtrAttachToPane",
      "VtrOpenRunner",
      "VtrFocusRunner",
    },
    keys = {
      { '<leader>va', '<cmd>VtrAttachToPane<cr>' },
      { '<leader>or', '<cmd>VtrOpenRunner<cr>' },
      { '<leader>fr', '<cmd>VtrFocusRunner<cr>' }
    }
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
