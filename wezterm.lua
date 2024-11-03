-- WEZTERM config

-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "MaterialOcean"
config.color_scheme = "MaterialDesignColors"

------------- Tab bar ----------------------------
--config.enable_tab_bar = true
--config.tab_bar_at_bottom = true
--config.use_fancy_tab_bar = true
------------ Tab bar End -------------------------

config.window_decorations = "TITLE | RESIZE"

config.window_padding = {
	left = 5,
	right = 3,
	top = 0,
	bottom = 0,
}

config.enable_scroll_bar = true

config.window_background_opacity = 0.985

config.font = wezterm.font_with_fallback({
	"Fira Code",
	"JetBrains Mono",
})
config.font_size = 14

-- and finally, return the configuration to wezterm
return config
