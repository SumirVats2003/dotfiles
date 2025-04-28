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
      inactive_tab_fg = 2
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
    '#5DE4C7', -- yellow
    '#ADD7FF', -- blue
    '#91B4D5', -- magenta
    '#89DDFF', -- cyan
    '#A6ACCD', -- white
  },
  
  brights = {
    '#3b4258', -- bright black
    '#D0679D', -- bright red
    '#5DE4C7', -- bright green
    '#5DE4C7', -- bright yellow
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

for k, v in pairs(poimandres) do
  config.colors[k] = v
end

return config
