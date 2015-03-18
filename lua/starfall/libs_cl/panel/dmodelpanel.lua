SF.Panel.DModelPanel = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DModelPanel", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DModelPanel.wrap = pwrap
SF.Panel.DModelPanel.unwrap = punwrap

SF.Panel.DModelPanel.Methods = this_methods
SF.Panel.DModelPanel.Metatable = this_metamethods
