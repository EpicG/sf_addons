SF.Panel.DMenuBar = {}

local dmenuBar_methods, dmenuBar_metamethods = SF.Typedef( "Panel.DMenuBar", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dmenuBar_metamethods )
	return object
end

SF.Panel.DMenuBar.wrap = pwrap
SF.Panel.DMenuBar.unwrap = punwrap

SF.Panel.DMenuBar.Methods = dmenuBar_methods
SF.Panel.DMenuBar.Metatable = dmenuBar_metamethods
