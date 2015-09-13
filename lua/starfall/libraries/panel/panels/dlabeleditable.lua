SF.Panel.DLabelEditable = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DLabelEditable", SF.Panel.DLabel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DLabelEditable.wrap = pwrap
SF.Panel.DLabelEditable.unwrap = punwrap

SF.Panel.DLabelEditable.Methods = this_methods
SF.Panel.DLabelEditable.Metatable = this_metamethods
