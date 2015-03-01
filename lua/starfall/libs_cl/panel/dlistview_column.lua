SF.Panel.DListView_Column = {}

local dlistView_Column_methods, dlistView_Column_metamethods = SF.Typedef( "Panel.DListView_Column", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dlistView_Column_metamethods )
	return object
end

SF.Panel.DListView_Column.wrap = pwrap
SF.Panel.DListView_Column.unwrap = punwrap

SF.Panel.DListView_Column.Methods = dlistView_Column_methods
SF.Panel.DListView_Column.Metatable = dlistView_Column_metamethods
