SF.Panel.DPanel = {}

local dpanel_methods, dpanel_metamethods = SF.Typedef( "Panel.DPanel", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dpanel_metamethods )
	return object
end

SF.Panel.DPanel.wrap = pwrap
SF.Panel.DPanel.unwrap = punwrap

SF.Panel.DPanel.Methods = dpanel_methods
SF.Panel.DPanel.Metatable = dpanel_metamethods
