SF.Panel.Material = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.Material", SF.Panel.Button.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.Material.wrap = pwrap
SF.Panel.Material.unwrap = punwrap

SF.Panel.Material.Methods = this_methods
SF.Panel.Material.Metatable = this_metamethods

