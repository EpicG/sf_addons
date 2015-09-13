SF.Panel.Button = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.Button", SF.Panel.DLabel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.Button.wrap = pwrap
SF.Panel.Button.unwrap = punwrap

SF.Panel.Button.Methods = this_methods
SF.Panel.Button.Metatable = this_metamethods
