SF.Panel.DMenu = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DMenu", SF.Panel.DScrollPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DMenu.wrap = pwrap
SF.Panel.DMenu.unwrap = punwrap

SF.Panel.DMenu.Methods = this_methods
SF.Panel.DMenu.Metatable = this_metamethods
