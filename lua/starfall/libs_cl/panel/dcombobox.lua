SF.Panel.DComboBox = {}

local dcomboBox_methods, dcomboBox_metamethods = SF.Typedef( "Panel.DComboBox", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dcomboBox_metamethods )
	return object
end

SF.Panel.DComboBox.wrap = pwrap
SF.Panel.DComboBox.unwrap = punwrap

SF.Panel.DComboBox.Methods = dcomboBox_methods
SF.Panel.DComboBox.Metatable = dcomboBox_metamethods
