SF.Panel.DIconBrowser = {}

local diconBrowser_methods, diconBrowser_metamethods = SF.Typedef( "Panel.DIconBrowser", SF.Panel.DScrollPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, diconBrowser_metamethods )
	return object
end

SF.Panel.DIconBrowser.wrap = pwrap
SF.Panel.DIconBrowser.unwrap = punwrap

SF.Panel.DIconBrowser.Methods = diconBrowser_methods
SF.Panel.DIconBrowser.Metatable = diconBrowser_metamethods
