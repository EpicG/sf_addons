SF.Panel.DProperties = {}

local dproperties_methods, dproperties_metamethods = SF.Typedef( "Panel.DProperties", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dproperties_metamethods )
	return object
end

SF.Panel.DProperties.wrap = pwrap
SF.Panel.DProperties.unwrap = punwrap

SF.Panel.DProperties.Methods = dproperties_methods
SF.Panel.DProperties.Metatable = dproperties_metamethods
