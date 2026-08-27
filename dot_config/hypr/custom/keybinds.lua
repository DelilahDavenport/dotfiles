local mainMod = "SUPER"
hl.bind("CTRL+SUPER+ALT+Slash", hl.dsp.exec_cmd("xdg-open ~/.config/hypr/custom/keybinds.lua"), {description = "Edit user keybinds"} )

hl.bind(mainMod .. " + A", hl.dsp.layout("togglesplit"))    -- dwindle only

hl.bind(mainMod .. " + SHIFT + D", hl.dsp.exec_cmd("fish ~/.config/hypr/custom/scripts/dev-workspace.fish"),{ description = "Open dev workspace layout" })
