SF.Panel.RichText = {}

local richText_methods, richText_metamethods = SF.Typedef( "Panel.RichText", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, richText_metamethods )
	return object
end

SF.Panel.RichText.wrap = pwrap
SF.Panel.RichText.unwrap = punwrap

SF.Panel.RichText.Methods = richText_methods
SF.Panel.RichText.Metatable = richText_metamethods
