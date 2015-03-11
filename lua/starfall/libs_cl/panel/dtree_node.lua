SF.Panel.DTree_node = {}

local dtree_node_methods, dtree_node_metamethods = SF.Typedef( "Panel.DTree_node", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dtree_node_metamethods )
	return object
end

SF.Panel.DTree_node.wrap = pwrap
SF.Panel.DTree_node.unwrap = punwrap

SF.Panel.DTree_node.Methods = dtree_node_methods
SF.Panel.DTree_node.Metatable = dtree_node_metamethods