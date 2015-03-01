SF.Panel.Label = {}

local label_methods, label_metamethods = SF.Typedef( "Panel.Label", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, label_metamethods )
	return object
end

SF.Panel.Label.wrap = pwrap
SF.Panel.Label.unwrap = punwrap

SF.Panel.Label.Methods = label_methods
SF.Panel.Label.Metatable = label_metamethods
