return {
  {
    'zbirenbaum/copilot.lua',
    dependencies = {
      "zbirenbaum/copilot-cmp",
      "j-hui/fidget.nvim",
    },
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
        },
        panel = {
          enabled = false
        },
      })

      local f = require('fidget')
      local api = require("copilot.api")
      local v = {
        handler_registered = false,
        status = nil,
        message = nil
      }

      local function try_change_status(new_status, new_message)
        if new_status == v.status then
          if new_message and not v.message == new_message then
            local message = string.format("Status: (%s) - (%s)", new_status, new_message)
            f.notify(message, nil, { annote = "Copilot", key = "Copilot" })
            v.message = new_message
          end
          return
        end

        if new_status == "idle" and v.status == "loading" then
          new_status = "success"
        end

        local message = new_message
          and string.format("Status: (%s) - (%s)", new_status, new_message)
          or string.format("Status: (%s)", new_status)

        f.notify(message, nil, { annote = "Copilot", key = "Copilot" })
        v.status = new_status
        v.new_message = new_message
      end

      local function status_cb(data)
        data.status = string.lower(data.status)

        if data.status == "error" then
          try_change_status("error", data.message)
          return
        elseif data.status == "normal" then
          try_change_status("idle")
        elseif data.status == "inprogress" then
          try_change_status("loading")
        elseif data.status == "warning" then
          try_change_status("warning")
        elseif data.status == "" then
          try_change_status("offline")
        else
          try_change_status(data.status, "New status")
        end
      end

      local function check_status()
        local cp_client = require("copilot.client")
        local client = cp_client.get()

        if not client then
          try_change_status("offline")
          return
        end

        api.check_status(client, {}, function(cserr, status)
          if cserr then
            try_change_status("error", cserr)
            return
          end

          if not status.user then
            try_change_status("error", "Not authenticated. Run ':Copilot auth'")
            return
          elseif status.status == "NoTelemetryConsent" then
            try_change_status("error", "Telemetry terms not accepted")
            return
          elseif status.status == "NotAuthorized" then
            try_change_status("error", "Not authorized")
            return
          end

          local attached = cp_client.buf_is_attached(0)
          if not attached then
            try_change_status("offline")
            return
          end

          try_change_status("idle")
        end)
      end

      vim.api.nvim_create_autocmd({ "BufWinEnter", "InsertEnter", "WinEnter" }, {
        callback = function()
          if not v.handler_registered then
            api.register_status_notification_handler(status_cb)
            v.handler_registered = true
          end
          check_status()
        end,
      })

      vim.api.nvim_create_autocmd({ "BufLeave", "BufWinLeave" }, {
        callback = function()
          if v.handler_registered then
            api.unregister_status_notification_handler(status_cb)
            v.handler_registered = false
          end
        end,
      })
    end
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function ()
      require("copilot_cmp").setup()
    end
  }
}
