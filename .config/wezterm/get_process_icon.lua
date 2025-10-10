local wezterm = require("wezterm")

local process_icons = { -- for get_process function
	["bash"] = wezterm.nerdfonts.cod_terminal_bash,
	["btm"] = wezterm.nerdfonts.mdi_chart_donut_variant,
	["cargo"] = wezterm.nerdfonts.dev_rust,
	["curl"] = wezterm.nerdfonts.mdi_flattr,
	["docker"] = wezterm.nerdfonts.linux_docker,
	["docker-compose"] = wezterm.nerdfonts.linux_docker,
	["dotnet"] = wezterm.nerdfonts.md_language_csharp,
	["emacs-30.2"] = "",
	["fish"] = wezterm.nerdfonts.dev_terminal,
	["flatpak"] = " ",
	["gh"] = wezterm.nerdfonts.dev_github_badge,
	["git"] = wezterm.nerdfonts.dev_git,
	["go"] = wezterm.nerdfonts.seti_go,
	["htop"] = wezterm.nerdfonts.mdi_chart_donut_variant,
	["kubectl"] = wezterm.nerdfonts.linux_docker,
	["kuberlr"] = wezterm.nerdfonts.linux_docker,
	["lazydocker"] = wezterm.nerdfonts.linux_docker,
	["lua"] = wezterm.nerdfonts.seti_lua,
	["make"] = wezterm.nerdfonts.seti_makefile,
	["node"] = wezterm.nerdfonts.dev_nodejs_small,
	["nvim"] = wezterm.nerdfonts.custom_neovim,
	["pacman"] = wezterm.nerdfonts.dev_archlinux,
	["paru"] = wezterm.nerdfonts.dev_archlinux,
	["psql"] = wezterm.nerdfonts.dev_postgresql,
	["pwsh"] = wezterm.nerdfonts.seti_powershell,
	["ruby"] = wezterm.nerdfonts.cod_ruby,
	["ssh"] = wezterm.nerdfonts.dev_terminal,
	["stern"] = wezterm.nerdfonts.linux_docker,
	["sudo"] = wezterm.nerdfonts.fa_hashtag,
	["vim"] = wezterm.nerdfonts.dev_vim,
	["wget"] = wezterm.nerdfonts.mdi_arrow_down_box,
	["yazi"] = wezterm.nerdfonts.cod_folder_opened,
	["zsh"] = wezterm.nerdfonts.dev_terminal,
}

local function get_process_icon(foreground_process_name)
	if foreground_process_name == nil then
		return ""
	end

	local process_name = foreground_process_name:match("([^/\\]+)%.exe$") or foreground_process_name:match("([^/\\]+)$")
	-- local icon = process_icons[process_name] or wezterm.nerdfonts.seti_checkbox_unchecked
	local icon = process_icons[process_name] or wezterm.nerdfonts.linux_archlinux
	-- return process_name
	return icon
end

return get_process_icon
