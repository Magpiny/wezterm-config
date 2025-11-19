-- WEZTERM config

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "MaterialOcean"
config.color_scheme = "Tokyo Night Storm" --"MaterialDesignColors"

-- Enable font Ligatures
config.harfbuzz_features = { "calt=1", "clig=1", "liga=1" }

------------- Tab bar ----------------------------
config.enable_tab_bar = false -- Removes the top bar coz i don't like it
--config.tab_bar_at_bottom = true
--config.use_fancy_tab_bar = true
------------ Tab bar End -------------------------

config.window_decorations = "TITLE | RESIZE"

config.window_padding = {
	left = 4,
	right = 4,
	top = 0,
	bottom = 0,
}

-- Open links at mouse cursor
config.mouse_bindings = {
	-- Ctrl-click will open the link under the mouse cursor
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

-- Scrolling Effect
config.enable_scroll_bar = true

local act = wezterm.action

config.keys = {
	{ key = "UpArrow", mods = "SHIFT", action = act.ScrollByLine(-1) },
	{ key = "DownArrow", mods = "SHIFT", action = act.ScrollByLine(1) },
}

-- window bg opacity
config.window_background_opacity = 0.95

-- font configs
--config.font = wezterm.font_with_fallback({
--	"Fira Code",
--	"JetBrains Mono",
--})
--
config.font = wezterm.font_with_fallback({
	{ family = "JetBrains Mono", weight = "Medium" },
	"Noto Color Emoji",
})

config.font_size = 16
config.freetype_load_target = "Light" --light/Normal/Bold

config.inactive_pane_hsb = {
	hue = 1.0,
	saturation = 0.7, -- Less vibrant
	brightness = 0.9,
}

-- copy to clipboard
config.keys = {
	{
		key = "C",
		mods = "CTRL",
		action = wezterm.action.CopyTo("ClipboardAndPrimarySelection"),
	},
}

-- ---> Adjust pane size
config.leader = { key = "a", mods = "CTRL" }
config.keys = {
	{
		key = "h",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Left", 5 }),
	},
	{
		key = "j",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Down", 5 }),
	},
	{ key = "k", mods = "LEADER", action = act.AdjustPaneSize({ "Up", 5 }) },
	{
		key = "l",
		mods = "LEADER",
		action = act.AdjustPaneSize({ "Right", 5 }),
	},
}

-- Split pane vertically
config.keys = {

	-- Split pane horizontally
	-- This will create a new split and run your default program inside it
	{
		key = "%",
		mods = "LEADER",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- This will create a new split and run your default program inside it
	{
		key = '"',
		mods = "CTRL|SHIFT",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},

	{
		key = "n",
		mods = "CTRL|SHIFT",
		action = wezterm.action.SpawnCommandInNewTab({ args = { "nvim" } }),
	},

	-- QUIT Applications eventually killing all tabs
	{ key = "q", mods = "CTRL", action = wezterm.action.QuitApplication },
}

-- Enable GPU Acceleration
config.front_end = "OpenGL"

-- and finally, return the configuration to wezterm
return config
--------> Config by: Magpiny BO --------------->
-----
