SF.Panel.EditablePanel = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.EditablePanel", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.EditablePanel.wrap = pwrap
SF.Panel.EditablePanel.unwrap = punwrap

SF.Panel.EditablePanel.Methods = this_methods
SF.Panel.EditablePanel.Metatable = this_metamethods
