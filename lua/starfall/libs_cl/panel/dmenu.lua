SF.Panel.DMenu = {}

local dmenu_methods, dmenu_metamethods = SF.Typedef( "Panel.DMenu", SF.Panel.DScrollPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dmenu_metamethods )
	return object
end

SF.Panel.DMenu.wrap = pwrap
SF.Panel.DMenu.unwrap = punwrap

SF.Panel.DMenu.Methods = dmenu_methods
SF.Panel.DMenu.Metatable = dmenu_metamethods
