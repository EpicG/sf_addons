SF.Panel.ContentIcon = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.ContentIcon", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.ContentIcon.wrap = pwrap
SF.Panel.ContentIcon.unwrap = punwrap

SF.Panel.ContentIcon.Methods = this_methods
SF.Panel.ContentIcon.Metatable = this_metamethods
