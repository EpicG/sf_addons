SF.Panel.ContextBase = {}

local contextBase_methods, contextBase_metamethods = SF.Typedef( "Panel.ContextBase", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, contextBase_metamethods )
	return object
end

SF.Panel.ContextBase.wrap = pwrap
SF.Panel.ContextBase.unwrap = punwrap

SF.Panel.ContextBase.Methods = contextBase_methods
SF.Panel.ContextBase.Metatable = contextBase_metamethods
