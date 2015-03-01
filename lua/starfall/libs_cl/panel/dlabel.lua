SF.Panel.DLabel = {}

local dlabel_methods, dlabel_metamethods = SF.Typedef( "Panel.DLabel", SF.Panel.Label.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dlabel_metamethods )
	return object
end

SF.Panel.DLabel.wrap = pwrap
SF.Panel.DLabel.unwrap = punwrap

SF.Panel.DLabel.Methods = dlabel_methods
SF.Panel.DLabel.Metatable = dlabel_metamethods
