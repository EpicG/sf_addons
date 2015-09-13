SF.Panel.RichText = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.RichText", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.RichText.wrap = pwrap
SF.Panel.RichText.unwrap = punwrap

SF.Panel.RichText.Methods = this_methods
SF.Panel.RichText.Metatable = this_metamethods
