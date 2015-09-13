SF.Panel.DListView = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DListView", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DListView.wrap = pwrap
SF.Panel.DListView.unwrap = punwrap

SF.Panel.DListView.Methods = this_methods
SF.Panel.DListView.Metatable = this_metamethods
