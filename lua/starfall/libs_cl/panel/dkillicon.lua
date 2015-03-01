SF.Panel.DKillIcon = {}

local dkillIcon_methods, dkillIcon_metamethods = SF.Typedef( "Panel.DKillIcon", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dkillIcon_metamethods )
	return object
end

SF.Panel.DKillIcon.wrap = pwrap
SF.Panel.DKillIcon.unwrap = punwrap

SF.Panel.DKillIcon.Methods = dkillIcon_methods
SF.Panel.DKillIcon.Metatable = dkillIcon_metamethods
