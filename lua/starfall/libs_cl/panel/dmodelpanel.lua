SF.Panel.DModelPanel = {}

local dmodelPanel_methods, dmodelPanel_metamethods = SF.Typedef( "Panel.DModelPanel", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dmodelPanel_metamethods )
	return object
end

SF.Panel.DModelPanel.wrap = pwrap
SF.Panel.DModelPanel.unwrap = punwrap

SF.Panel.DModelPanel.Methods = dmodelPanel_methods
SF.Panel.DModelPanel.Metatable = dmodelPanel_metamethods
