SF.Panel.ContentIcon = {}

local contentIcon_methods, contentIcon_metamethods = SF.Typedef( "Panel.ContentIcon", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, contentIcon_metamethods )
	return object
end

SF.Panel.ContentIcon.wrap = pwrap
SF.Panel.ContentIcon.unwrap = punwrap

SF.Panel.ContentIcon.Methods = contentIcon_methods
SF.Panel.ContentIcon.Metatable = contentIcon_metamethods
