SF.Panel.DCheckBox = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DCheckBox", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DCheckBox.wrap = pwrap
SF.Panel.DCheckBox.unwrap = punwrap

SF.Panel.DCheckBox.Methods = this_methods
SF.Panel.DCheckBox.Metatable = this_metamethods
