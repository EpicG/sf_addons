SF.Panel.DDrawer = {}

local ddrawer_methods, ddrawer_metamethods = SF.Typedef( "Panel.DDrawer", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, ddrawer_metamethods )
	return object
end

SF.Panel.DDrawer.wrap = pwrap
SF.Panel.DDrawer.unwrap = punwrap

SF.Panel.DDrawer.Methods = ddrawer_methods
SF.Panel.DDrawer.Metatable = ddrawer_metamethods
