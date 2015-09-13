SF.Panel.URLLabel = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.URLLabel", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.URLLabel.wrap = pwrap
SF.Panel.URLLabel.unwrap = punwrap

SF.Panel.URLLabel.Methods = this_methods
SF.Panel.URLLabel.Metatable = this_metamethods
