SF.Panel.Button = {}

local button_methods, button_metamethods = SF.Typedef( "Panel.Button", SF.Panel.DLabel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, button_metamethods )
	return object
end

SF.Panel.Button.wrap = pwrap
SF.Panel.Button.unwrap = punwrap

SF.Panel.Button.Methods = button_methods
SF.Panel.Button.Metatable = button_metamethods
