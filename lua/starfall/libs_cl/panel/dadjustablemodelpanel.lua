SF.Panel.DAdjustableModelPanel = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DAdjustableModelPanel", SF.Panel.DModelPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DAdjustableModelPanel.wrap = pwrap
SF.Panel.DAdjustableModelPanel.unwrap = punwrap

SF.Panel.DAdjustableModelPanel.Methods = this_methods
SF.Panel.DAdjustableModelPanel.Metatable = this_metamethods
