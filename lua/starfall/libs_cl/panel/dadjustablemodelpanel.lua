SF.Panel.DAdjustableModelPanel = {}

local DAdjustableModelPanel_methods, DAdjustableModelPanel_metamethods = SF.Typedef( "Panel.DAdjustableModelPanel", SF.Panel.DModelPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, DAdjustableModelPanel_metamethods )
	return object
end

SF.Panel.DAdjustableModelPanel.wrap = pwrap
SF.Panel.DAdjustableModelPanel.unwrap = punwrap

SF.Panel.DAdjustableModelPanel.Methods = DAdjustableModelPanel_methods
SF.Panel.DAdjustableModelPanel.Metatable = DAdjustableModelPanel_metamethods
