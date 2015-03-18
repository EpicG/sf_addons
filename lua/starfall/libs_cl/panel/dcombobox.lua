SF.Panel.DComboBox = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DComboBox", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DComboBox.wrap = pwrap
SF.Panel.DComboBox.unwrap = punwrap

SF.Panel.DComboBox.Methods = this_methods
SF.Panel.DComboBox.Metatable = this_metamethods
