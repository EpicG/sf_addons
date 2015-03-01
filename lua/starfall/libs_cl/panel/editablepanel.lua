SF.Panel.EditablePanel = {}

local editablePanel_methods, editablePanel_metamethods = SF.Typedef( "Panel.EditablePanel", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, editablePanel_metamethods )
	return object
end

SF.Panel.EditablePanel.wrap = pwrap
SF.Panel.EditablePanel.unwrap = punwrap

SF.Panel.EditablePanel.Methods = editablePanel_methods
SF.Panel.EditablePanel.Metatable = editablePanel_metamethods
