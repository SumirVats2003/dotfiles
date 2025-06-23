local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

local config = {}
local keys = {}
local mouse_bindings = {}
local launch_menu = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- config.color_scheme = 'Catppuccin Mocha (Gogh)'
-- config.color_scheme = 'Rosé Pine (Gogh)'
-- config.color_scheme = 'rose-pine'
-- config.color_scheme = 'Rosé Pine Moon (base16)'
-- config.color_scheme = 'tokyonight'
-- config.color_scheme = 'tokyonight_moon'
config.color_scheme = 'OneDark (base16)'
config.font = wezterm.font('CaskaydiaCove Nerd Font')
config.font_size = 14
config.launch_menu = launch_menu
-- config.window_background_opacity = 0.9

-- this adds the ability to use ctrl+v to paste the system clipboard 
config.keys = {
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' }, 
  {key=',', mods = 'CTRL', action = wezterm.action.SplitVertical},
  {key='.', mods = 'CTRL', action = wezterm.action.SplitHorizontal},
  {key='h', mods = 'CTRL | SHIFT', action = wezterm.action{ActivatePaneDirection="Left"}},
  {key='j', mods = 'CTRL | SHIFT', action = wezterm.action{ActivatePaneDirection="Down"}},
  {key='k', mods = 'CTRL | SHIFT', action = wezterm.action{ActivatePaneDirection="Up"}},
  {key='l', mods = 'CTRL | SHIFT', action = wezterm.action{ActivatePaneDirection="Right"}},
}

config.mouse_bindings = mouse_bindings

mouse_bindings = {
  {
    event = { Down = { streak = 3, button = 'Left' } },
    action = wezterm.action.SelectTextAtMouseCursor 'SemanticZone',
    mods = 'NONE',
  },
 {
  event = { Down = { streak = 1, button = "Right" } },
  mods = "NONE",
  action = wezterm.action_callback(function(window, pane)
   local has_selection = window:get_selection_text_for_pane(pane) ~= ""
   if has_selection then
    window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
    window:perform_action(act.ClearSelection, pane)
   else
    window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
   end
  end),
 },
}

local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.pl_left_hard_divider

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

config.tab_max_width = 20

config.default_domain = 'WSL:Ubuntu'
config.window_decorations = "RESIZE"

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

-- local bearded_arc = {
--   foreground = '#c3cfd9',
--   background = '#1c2433',
--   cursor_bg = '#c3cfd9',
--   cursor_fg = '#1c2433',
--   cursor_border = '#c3cfd9',
--   selection_fg = '#1c2433',
--   selection_bg = '#c3cfd9',
--   scrollbar_thumb = '#444c5b',
--   split = '#444c5b',
  
--   ansi = {
--     '#1c2433', -- black
--     '#FF738A', -- red (maroon)
--     '#3CEC85', -- green
--     '#EACD61', -- yellow (olive)
--     '#69C3FF', -- blue (navy)
--     '#22ECDB', -- magenta (purple)
--     '#77aed7', -- cyan (teal)
--     '#c3cfd9', -- white (silver)
--   },
  
--   brights = {
--     '#444c5b', -- bright black (grey)
--     '#FF738A', -- bright red
--     '#3CEC85', -- bright green (lime)
--     '#EACD61', -- bright yellow
--     '#69C3FF', -- bright blue
--     '#22ECDB', -- bright magenta (fuchsia)
--     '#77aed7', -- bright cyan (aqua)
--     '#ABB7C1', -- bright white
--   },
  
--   indexed = { [16] = '#B78AFF' },
--   compose_cursor = '#EACD61',
  
--   copy_mode_active_highlight_bg = { Color = '#3CEC85' },
--   copy_mode_active_highlight_fg = { Color = '#1c2433' },
--   copy_mode_inactive_highlight_bg = { Color = '#69C3FF' },
--   copy_mode_inactive_highlight_fg = { Color = '#1c2433' },
-- }

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

bar.apply_to_config(config, {
  position = 'top',
  separator = {
    space = 1,
    left_icon = wezterm.nerdfonts.cod_remote,
  },
  modules = {
    tabs = {
      active_tab_fg = 7,
      inactive_tab_fg = 3
    },
    workspace = {
      enabled = false,
      color = 8,
    },
  }
})

local poimandres = {
  foreground = '#A6ACCD',
  background = '#1b1e28',
  cursor_bg = '#A6ACCD',
  cursor_fg = '#1b1e28',
  cursor_border = '#A6ACCD',
  selection_fg = '#1b1e28',
  selection_bg = '#A6ACCD',
  scrollbar_thumb = '#3b4258',
  split = '#3b4258',
  
  ansi = {
    '#1b1e28', -- black
    '#D0679D', -- red
    '#5DE4C7', -- green
    '#d9d94a', -- yellow
    '#ADD7FF', -- blue
    '#91B4D5', -- magenta
    '#89DDFF', -- cyan
    '#A6ACCD', -- white
  },
  
  brights = {
    '#3b4258', -- bright black
    '#D0679D', -- bright red
    '#5DE4C7', -- bright green
    '#d9d94a', -- bright yellow
    '#ADD7FF', -- bright blue
    '#91B4D5', -- bright magenta
    '#89DDFF', -- bright cyan
    '#b6d7f4', -- bright white
  },
  
  indexed = { [16] = '#ffffff' },
  compose_cursor = '#5DE4C7',
  
  copy_mode_active_highlight_bg = { Color = '#5DE4C7' },
  copy_mode_active_highlight_fg = { Color = '#1b1e28' },
  copy_mode_inactive_highlight_bg = { Color = '#ADD7FF' },
  copy_mode_inactive_highlight_fg = { Color = '#1b1e28' },
}

local decay = {
  foreground = '#b6beca',
  background = '#171B20',
  cursor_bg = '#b6beca',
  cursor_fg = '#171B20',
  cursor_border = '#b6beca',
  selection_fg = '#171B20',
  selection_bg = '#b6beca',
  scrollbar_thumb = '#485263',
  split = '#485263',
  
  ansi = {
    '#171B20', -- black
    '#e26c7c', -- red
    '#78DBA9', -- green
    '#f1cf8a', -- yellow
    '#86aaec', -- blue
    '#c68aee', -- magenta
    '#70a5eb', -- cyan
    '#b6beca', -- white
  },
  
  brights = {
    '#485263', -- bright black
    '#e26c7c', -- bright red
    '#78DBA9', -- bright green
    '#f1cf8a', -- bright yellow
    '#86aaec', -- bright blue
    '#c68aee', -- bright magenta
    '#70A5EB', -- bright cyan
    '#dee1e6', -- bright white
  },
  
  indexed = { [16] = '#9cd1ff' },
  compose_cursor = '#78DBA9',
  
  copy_mode_active_highlight_bg = { Color = '#78DBA9' },
  copy_mode_active_highlight_fg = { Color = '#171B20' },
  copy_mode_inactive_highlight_bg = { Color = '#86aaec' },
  copy_mode_inactive_highlight_fg = { Color = '#171B20' },
}

local jabuti = {
  foreground = '#c0cbe3',
  background = '#292A37',
  cursor_bg = '#c0cbe3',
  cursor_fg = '#292A37',
  cursor_border = '#c0cbe3',
  selection_fg = '#292A37',
  selection_bg = '#c0cbe3',
  scrollbar_thumb = '#485263',
  split = '#485263',
  
  ansi = {
    "#292A37", -- black
    "#ec6a88", -- red
    "#3FDAA4", -- green
    "#e1c697", -- yellow
    "#64acfa", -- blue
    "#be95ff", -- magenta
    "#3FC6DE", -- cyan
    "#c0cbe3", -- white
  },
  
  brights = {
    "#45475d", -- bright black
    "#ec6a88", -- bright red
    "#3FDAA4", -- bright green
    "#e1c697", -- bright yellow
    "#64acfa", -- bright blue
    "#be95ff", -- bright magenta
    "#3FC6DE", -- bright cyan
    "#d9e0ee", -- bright white
  },
  
  indexed = { [16] = '#8b8da9' },
  compose_cursor = '#3FDAA4',
  
  copy_mode_active_highlight_bg = { Color = '#3FDAA4' },
  copy_mode_active_highlight_fg = { Color = '#292A37' },
  copy_mode_inactive_highlight_bg = { Color = '#3FC6DE' },
  copy_mode_inactive_highlight_fg = { Color = '#292A37' },
}

local nordic = {
  foreground = '#BBC3D4', -- white0_normal
  background = '#1E222A', -- black1
  cursor_bg = '#BBC3D4', -- white0_normal
  cursor_fg = '#1E222A', -- black1
  cursor_border = '#BBC3D4', -- white0_normal
  selection_fg = '#1E222A', -- black1
  selection_bg = '#BBC3D4', -- white0_normal
  scrollbar_thumb = '#3B4252', -- gray2
  split = '#3B4252', -- gray2

  ansi = {
    '#1E222A', -- black1
    '#C5727A', -- red.bright
    '#B1C89D', -- green.bright
    '#EFD49F', -- yellow.bright
    '#81A1C1', -- blue1
    '#BE9DB8', -- magenta.bright
    '#9FC6C5', -- cyan.bright
    '#BBC3D4', -- white0_normal
  },

  brights = {
    '#3B4252', -- gray2 (bright black)
    '#BF616A', -- red.base
    '#A3BE8C', -- green.base
    '#EBCB8B', -- yellow.base
    '#5E81AC', -- blue0
    '#B48EAD', -- magenta.base
    '#8FBCBB', -- cyan.base
    '#E5E9F0', -- white2 (bright white)
  },

  indexed = { [16] = '#ECEFF4' }, -- white3
  compose_cursor = '#B1C89D', -- green.bright

  copy_mode_active_highlight_bg = { Color = '#B1C89D' }, -- green.bright
  copy_mode_active_highlight_fg = { Color = '#1E222A' }, -- black1
  copy_mode_inactive_highlight_bg = { Color = '#81A1C1' }, -- blue1
  copy_mode_inactive_highlight_fg = { Color = '#1E222A' }, -- black1
}

for k, v in pairs(nordic) do
  config.colors[k] = v
end

-- local dimmer = { brightness = 0.02 }
-- config.background = {
--   {
--     source = {
--       File = 'C:\\Users\\sumir\\Downloads\\ac.png',
--     },
--     width = '100%',
--     repeat_x = 'NoRepeat',
--     vertical_align = "Middle",
--     hsb = dimmer,
--   },
-- }

return config
