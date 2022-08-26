local wezterm = require 'wezterm'

local config_misc = {
	window_close_confirmation = "NeverPrompt",
	check_for_updates = true,
	automatically_reload_config = true,
}


return  {

  hide_tab_bar_if_only_one_tab = true,

  -- Color scheme
  -- https://wezfurlong.org/wezterm/config/appearance.html
  --
  -- Catppuccin
  -- https://catppuccin.com
  color_scheme = 'Catppuccin Mocha',

  window_background_opacity = 0.99,

  -- Font configuration
  -- https://wezfurlong.org/wezterm/config/fonts.html
  font = wezterm.font('JetBrains Mono'),
  font_size = 16.0,

  -- Cursor style
  default_cursor_style = 'BlinkingBar',

 }
