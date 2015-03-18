SF.Panel.DColorPalette = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DColorPalette", SF.Panel.DIconLayout.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DColorPalette.wrap = pwrap
SF.Panel.DColorPalette.unwrap = punwrap

SF.Panel.DColorPalette.Methods = this_methods
SF.Panel.DColorPalette.Metatable = this_metamethods
