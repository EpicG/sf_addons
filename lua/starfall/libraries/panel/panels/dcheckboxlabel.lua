SF.Panel.DCheckBoxLabel = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DCheckBoxLabel", SF.Panel.DLabel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DCheckBoxLabel.wrap = pwrap
SF.Panel.DCheckBoxLabel.unwrap = punwrap

SF.Panel.DCheckBoxLabel.Methods = this_methods
SF.Panel.DCheckBoxLabel.Metatable = this_metamethods
