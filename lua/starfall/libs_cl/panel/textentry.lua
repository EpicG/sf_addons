SF.Panel.TextEntry = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.TextEntry", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.TextEntry.wrap = pwrap
SF.Panel.TextEntry.unwrap = punwrap

SF.Panel.TextEntry.Methods = this_methods
SF.Panel.TextEntry.Metatable = this_metamethods
