SF.Panel.DProgress = {}

local dprogress_methods, dprogress_metamethods = SF.Typedef( "Panel.DProgress", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dprogress_metamethods )
	return object
end

SF.Panel.DProgress.wrap = pwrap
SF.Panel.DProgress.unwrap = punwrap

SF.Panel.DProgress.Methods = dprogress_methods
SF.Panel.DProgress.Metatable = dprogress_metamethods
