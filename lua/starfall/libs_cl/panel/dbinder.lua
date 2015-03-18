SF.Panel.DBinder = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DBinder", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DBinder.wrap = pwrap
SF.Panel.DBinder.unwrap = punwrap

SF.Panel.DBinder.Methods = this_methods
SF.Panel.DBinder.Metatable = this_metamethods
