SF.Panel.DTextEntry = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DTextEntry", SF.Panel.TextEntry.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DTextEntry.wrap = pwrap
SF.Panel.DTextEntry.unwrap = punwrap

SF.Panel.DTextEntry.Methods = this_methods
SF.Panel.DTextEntry.Metatable = this_metamethods
