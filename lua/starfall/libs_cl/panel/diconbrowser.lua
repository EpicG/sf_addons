SF.Panel.DIconBrowser = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DIconBrowser", SF.Panel.DScrollPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DIconBrowser.wrap = pwrap
SF.Panel.DIconBrowser.unwrap = punwrap

SF.Panel.DIconBrowser.Methods = this_methods
SF.Panel.DIconBrowser.Metatable = this_metamethods
