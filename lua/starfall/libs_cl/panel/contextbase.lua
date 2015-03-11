SF.Panel.ContextBase = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.ContextBase", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

SF.Panel.ContextBase.wrap = pwrap
SF.Panel.ContextBase.unwrap = punwrap

SF.Panel.ContextBase.Methods = this_methods
SF.Panel.ContextBase.Metatable = this_metamethods
