SF.Panel.DTextEntry = {}

local small_methods, small_metamethods = SF.Typedef( "Panel.DTextEntry", SF.Panel.TextEntry.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, small_metamethods )
	return object
end

SF.Panel.DTextEntry.wrap = pwrap
SF.Panel.DTextEntry.unwrap = punwrap

SF.Panel.DTextEntry.Methods = small_methods
SF.Panel.DTextEntry.Metatable = small_metamethods
