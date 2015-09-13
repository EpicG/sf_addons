SF.Panel.DImage = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DImage", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DImage.wrap = pwrap
SF.Panel.DImage.unwrap = punwrap

SF.Panel.DImage.Methods = this_methods
SF.Panel.DImage.Metatable = this_metamethods
