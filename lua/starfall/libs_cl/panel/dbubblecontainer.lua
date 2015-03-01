SF.Panel.DBubbleContainer = {}

local dbubbleContainer_methods, dbubbleContainer_metamethods = SF.Typedef( "Panel.DBubbleContainer", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dbubbleContainer_metamethods )
	return object
end

SF.Panel.DBubbleContainer.wrap = pwrap
SF.Panel.DBubbleContainer.unwrap = punwrap

SF.Panel.DBubbleContainer.Methods = dbubbleContainer_methods
SF.Panel.DBubbleContainer.Metatable = dbubbleContainer_metamethods
