SF.Panel.DShape = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DShape", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DShape.wrap = pwrap
SF.Panel.DShape.unwrap = punwrap

SF.Panel.DShape.Methods = this_methods
SF.Panel.DShape.Metatable = this_metamethods
