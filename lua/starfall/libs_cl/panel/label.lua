SF.Panel.Label = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.Label", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.Label.wrap = pwrap
SF.Panel.Label.unwrap = punwrap

SF.Panel.Label.Methods = this_methods
SF.Panel.Label.Metatable = this_metamethods
