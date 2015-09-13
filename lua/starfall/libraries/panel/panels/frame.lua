SF.Panel.Frame = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.Frame", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
		debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.Frame.wrap = pwrap
SF.Panel.Frame.unwrap = punwrap

SF.Panel.Frame.Methods = this_methods
SF.Panel.Frame.Metatable = this_metamethods
