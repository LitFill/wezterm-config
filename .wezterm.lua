---@class WeztermAction
---@field CloseCurrentPane fun(opt: {confirm: boolean}): function

---@class Wezterm
---@field action WeztermAction
---@field font_with_fallback fun(fonts: string[]): string
---@field font fun(font_name: string, opts?: {}): string
local wezterm = require("wezterm")

---@class SshDomain
---@field name string
---@field remote_address string
---@field username string

---@class Config
---@field color_scheme string
---@field default_prog string[]
---@field enable_tab_bar boolean
---@field font string
---@field hide_tab_bar_if_only_one_tab boolean
---@field keys table[]
---@field ssh_domains SshDomain[]
---@field tab_bar_at_bottom boolean
---@field win32_system_backdrop "Auto"|"Disable"|"Acrylic"|"Mica"|"Tabbed"
---@field window_background_opacity number
---@field window_decorations "NONE" | "TITLE" | "RESIZE" | "TITLE | RESIZE"
local config = {}

-- config.default_prog = { "pwsh" }
config.default_prog = { "wsl" }

config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Fira Code",
	"Iosevka Nerd Font",
})
config.font =
	wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "DemiBold", stretch = "Normal", style = "Normal" })

config.color_scheme = "tokyonight"
config.enable_tab_bar = false
-- config.hide_tab_bar_if_only_one_tab = true
-- config.tab_bar_at_bottom = true
config.window_background_opacity = 0.7
config.win32_system_backdrop = "Auto"

config.window_decorations = "RESIZE"
-- config.window_decorations = "TITLE | RESIZE"

-- for running `wezterm connect <name>`
config.ssh_domains = {
	{
		name = "debian",
		username = "litfill",
		remote_address = "ssh.litfill.site",
	},
}

config.keys = {
	{
		key = "c",
		mods = "CTRL|ALT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},
}

return config
