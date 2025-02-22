-- These are the basic's for using wezterm.
-- Mux is the mutliplexes for windows etc inside of the terminal
-- Action is to perform actions on the terminal
local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

-- These are vars to put things in later (i dont use em all yet)
local config = {}
local keys = {}
local mouse_bindings = {}
local launch_menu = {}

-- This is for newer wezterm vertions to use the config builder 
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Default config settings
-- These are the default config settins needed to use Wezterm
-- Just add this and return config and that's all the basics you need

-- Color scheme, Wezterm has 100s of them you can see here:
-- https://wezfurlong.org/wezterm/colorschemes/index.html
-- config.color_scheme = 'Catppuccin Mocha'
config.color_scheme = 'tokyonight'
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 14
config.launch_menu = launch_menu

-- this adds the ability to use ctrl+v to paste the system clipboard 
config.keys = {
  { key = 'V', mods = 'CTRL', action = act.PasteFrom 'Clipboard' }, 
  {key=',', mods = 'CTRL', action = wezterm.action.SplitVertical},
  {key='.', mods = 'CTRL', action = wezterm.action.SplitHorizontal},
}

config.mouse_bindings = mouse_bindings

-- There are mouse binding to mimc Windows Terminal and let you copy
-- To copy just highlight something and right click. Simple
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

-- The filled in variant of the > symbol
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

-- wezterm.on(
--   'format-tab-title',
--   function(tab, tabs, panes, config, hover, max_width)
--     local edge_background = '#010821'
--     local background = '#101b33'
--     local foreground = '#808080'

--     if tab.is_active then
--       background = '#172030'
--       foreground = '#c0c0c0'
--     elseif hover then
--       background = '#252d40'
--       foreground = '#909090'
--     end

--     local edge_foreground = background

--     local title = tab_title(tab)

--     -- ensure that the titles fit in the available space,
--     -- and that we have room for the edges.
--     title = wezterm.truncate_right(title, max_width - 2)

--     return {
--       { Background = { Color = edge_background } },
--       { Foreground = { Color = edge_foreground } },
--       { Text = SOLID_LEFT_ARROW },
--       { Background = { Color = background } },
--       { Foreground = { Color = foreground } },
--       { Text = title },
--       { Background = { Color = edge_background } },
--       { Foreground = { Color = edge_foreground } },
--       { Text = SOLID_RIGHT_ARROW },
--     }
--   end
-- )

-- config.window_frame = {
--   -- The font used in the tab bar.
--   -- Roboto Bold is the default; this font is bundled
--   -- with wezterm.
--   -- Whatever font is selected here, it will have the
--   -- main font setting appended to it to pick up any
--   -- fallback fonts you may have used there.

--   -- The size of the font in the tab bar.
--   -- Default to 10.0 on Windows but 12.0 on other systems
--   font_size = 10.0,
--   font = require('wezterm').font 'JetBrains Mono Nerd Font',

--   -- The overall background color of the tab bar when
--   -- the window is focused
--   active_titlebar_bg = '#333333',

--   -- The overall background color of the tab bar when
--   -- the window is not focused
--   inactive_titlebar_bg = '#333333',
-- }

-- config.colors = {
--   tab_bar = {
--     -- The color of the inactive tab bar edge/divider
--     inactive_tab_edge = '#575757',
--   },
-- }


-- This is used to make my foreground (text, etc) brighter than my background
config.foreground_text_hsb = {
  -- hue = 1.0,
  -- saturation = 1.2,
  -- brightness = 1.1,
}

config.tab_max_width = 20

-- IMPORTANT: Sets WSL2 UBUNTU-22.04 as the defualt when opening Wezterm
config.default_domain = 'WSL:Ubuntu'
config.window_decorations = "RESIZE"

local bar = wezterm.plugin.require("https://github.com/adriankarlen/bar.wezterm")

bar.apply_to_config(config, {
  position = 'top',
  separator = {
    space = 1,
    left_icon = wezterm.nerdfonts.cod_remote,
    -- right_icon = wezterm.nerdfonts.fa_long_arrow_left,
    -- field_icon = wezterm.nerdfonts.indent_line,
  },
  modules = {
    tabs = {
      active_tab_fg = 2
    },
    workspace = {
      enabled = false,
      -- icon = wez.nerdfonts.cod_window,
      color = 8,
    },
  }
})

return config