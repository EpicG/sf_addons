SF.Panel.DTree = {}

local dtree_methods, dtree_metamethods = SF.Typedef( "Panel.DTree", SF.Panel.DScrollPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dtree_metamethods )
	return object
end

SF.Panel.DTree.wrap = pwrap
SF.Panel.DTree.unwrap = punwrap

SF.Panel.DTree.Methods = dtree_methods
SF.Panel.DTree.Metatable = dtree_metamethods
