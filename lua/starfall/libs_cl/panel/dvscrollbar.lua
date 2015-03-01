SF.Panel.DVScrollBar = {}

local dvScrollBar_methods, dvScrollBar_metamethods = SF.Typedef( "Panel.DVScrollBar", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dvScrollBar_metamethods )
	return object
end

SF.Panel.DVScrollBar.wrap = pwrap
SF.Panel.DVScrollBar.unwrap = punwrap

SF.Panel.DVScrollBar.Methods = dvScrollBar_methods
SF.Panel.DVScrollBar.Metatable = dvScrollBar_metamethods
