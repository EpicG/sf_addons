SF.Panel.DColorPalette = {}

local dcolorPalette_methods, dcolorPalette_metamethods = SF.Typedef( "Panel.DColorPalette", SF.Panel.DIconLayout.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dcolorPalette_metamethods )
	return object
end

SF.Panel.DColorPalette.wrap = pwrap
SF.Panel.DColorPalette.unwrap = punwrap

SF.Panel.DColorPalette.Methods = dcolorPalette_methods
SF.Panel.DColorPalette.Metatable = dcolorPalette_metamethods
