SF.Panel.DBinder = {}

local dbinder_methods, dbinder_metamethods = SF.Typedef( "Panel.DBinder", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dbinder_metamethods )
	return object
end

SF.Panel.DBinder.wrap = pwrap
SF.Panel.DBinder.unwrap = punwrap

SF.Panel.DBinder.Methods = dbinder_methods
SF.Panel.DBinder.Metatable = dbinder_metamethods
