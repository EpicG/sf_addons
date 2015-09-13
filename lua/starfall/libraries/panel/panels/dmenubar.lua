SF.Panel.DMenuBar = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DMenuBar", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DMenuBar.wrap = pwrap
SF.Panel.DMenuBar.unwrap = punwrap

SF.Panel.DMenuBar.Methods = this_methods
SF.Panel.DMenuBar.Metatable = this_metamethods
