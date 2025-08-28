require('tabby').setup({
  line = function(line)
    return {
      line.tabs().foreach(function(tab)
        return {
          tab.number(),
          tab.name(),
          tab.close_btn(),
          hl = {
            bg = tab.is_active() and '#2e3440' or '#3b4252',
            fg = tab.is_active() and '#d8dee9' or '#eceff4',
          },
          margin = { left = 1, right = 1 },
}end),
hl='TabLine',
    }
  end,
  head = function()
    return {
      ' ',
      hl = { bg = '#2e3440', fg = '#d8dee9' },
    }
  end,
  tail = function()
    return {
      ' ',
      hl = { bg = '#2e3440', fg = '#d8dee9' },
    }
  end,
})
