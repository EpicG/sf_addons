SF.Panel.DColorButton = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DColorButton", SF.Panel.DLabel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DColorButton.wrap = pwrap
SF.Panel.DColorButton.unwrap = punwrap

SF.Panel.DColorButton.Methods = this_methods
SF.Panel.DColorButton.Metatable = this_metamethods
