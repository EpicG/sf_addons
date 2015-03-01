SF.Panel.DCheckBox = {}

local dcheckBox_methods, dcheckBox_metamethods = SF.Typedef( "Panel.DCheckBox", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dcheckBox_metamethods )
	return object
end

SF.Panel.DCheckBox.wrap = pwrap
SF.Panel.DCheckBox.unwrap = punwrap

SF.Panel.DCheckBox.Methods = dcheckBox_methods
SF.Panel.DCheckBox.Metatable = dcheckBox_metamethods
