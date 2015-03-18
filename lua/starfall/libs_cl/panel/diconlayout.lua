SF.Panel.DIconLayout = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DIconLayout", SF.Panel.DDragBase.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DIconLayout.wrap = pwrap
SF.Panel.DIconLayout.unwrap = punwrap

SF.Panel.DIconLayout.Methods = this_methods
SF.Panel.DIconLayout.Metatable = this_metamethods
