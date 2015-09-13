SF.Panel.DProgress = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DProgress", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DProgress.wrap = pwrap
SF.Panel.DProgress.unwrap = punwrap

SF.Panel.DProgress.Methods = this_methods
SF.Panel.DProgress.Metatable = this_metamethods
