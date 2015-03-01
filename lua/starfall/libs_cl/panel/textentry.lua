SF.Panel.TextEntry = {}

local textEntry_methods, textEntry_metamethods = SF.Typedef( "Panel.TextEntry", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, textEntry_metamethods )
	return object
end

SF.Panel.TextEntry.wrap = pwrap
SF.Panel.TextEntry.unwrap = punwrap

SF.Panel.TextEntry.Methods = textEntry_methods
SF.Panel.TextEntry.Metatable = textEntry_metamethods
