SF.Panel.DVScrollBar = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DVScrollBar", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DVScrollBar.wrap = pwrap
SF.Panel.DVScrollBar.unwrap = punwrap

SF.Panel.DVScrollBar.Methods = this_methods
SF.Panel.DVScrollBar.Metatable = this_metamethods
