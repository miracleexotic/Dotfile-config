-- import wilder plugin safely
local setup, wilder = pcall(require, "wilder")
if not setup then
  return
end

wilder.set_option('renderer', wilder.popupmenu_renderer(
  wilder.popupmenu_border_theme({
    highlighter = {
      wilder.basic_highlighter()
    },
    highlights = {
      accent = wilder.make_hl('WilderAccent', 'Pmenu', {{a = 1}, {a = 1}, {foreground = '#f4468f'}}),
      border = 'Normal', -- highlight to use for the border
    },
    left = {' ', wilder.popupmenu_devicons()},
    right = {' ', wilder.popupmenu_scrollbar()},
  
    -- 'single', 'double', 'rounded' or 'solid'
    -- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
    border = 'rounded',
  })
))

-- enable wilder
wilder.setup({
  modes = {':', '/', '?'}
})

