SF.Panel.DListView = {}

local dlistView_methods, dlistView_metamethods = SF.Typedef( "Panel.DListView", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dlistView_metamethods )
	return object
end

SF.Panel.DListView.wrap = pwrap
SF.Panel.DListView.unwrap = punwrap

SF.Panel.DListView.Methods = dlistView_methods
SF.Panel.DListView.Metatable = dlistView_metamethods
