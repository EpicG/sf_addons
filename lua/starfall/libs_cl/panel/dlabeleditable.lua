SF.Panel.DLabelEditable = {}

local dlabelEditable_methods, dlabelEditable_metamethods = SF.Typedef( "Panel.DLabelEditable", SF.Panel.DLabel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dlabelEditable_metamethods )
	return object
end

SF.Panel.DLabelEditable.wrap = pwrap
SF.Panel.DLabelEditable.unwrap = punwrap

SF.Panel.DLabelEditable.Methods = dlabelEditable_methods
SF.Panel.DLabelEditable.Metatable = dlabelEditable_metamethods
