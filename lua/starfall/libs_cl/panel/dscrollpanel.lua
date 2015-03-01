SF.Panel.DScrollPanel = {}

local dscrollPanel_methods, dscrollPanel_metamethods = SF.Typedef( "Panel.DScrollPanel", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dscrollPanel_metamethods )
	return object
end

SF.Panel.DScrollPanel.wrap = pwrap
SF.Panel.DScrollPanel.unwrap = punwrap

SF.Panel.DScrollPanel.Methods = dscrollPanel_methods
SF.Panel.DScrollPanel.Metatable = dscrollPanel_metamethods
