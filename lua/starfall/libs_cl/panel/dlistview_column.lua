SF.Panel.DListView_Column = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DListView_Column", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DListView_Column.wrap = pwrap
SF.Panel.DListView_Column.unwrap = punwrap

SF.Panel.DListView_Column.Methods = this_methods
SF.Panel.DListView_Column.Metatable = this_metamethods
