SF.Panel.DNotify = {}

local dnotify_methods, dnotify_metamethods = SF.Typedef( "Panel.DNotify", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dnotify_metamethods )
	return object
end

SF.Panel.DNotify.wrap = pwrap
SF.Panel.DNotify.unwrap = punwrap

SF.Panel.DNotify.Methods = dnotify_methods
SF.Panel.DNotify.Metatable = dnotify_metamethods
