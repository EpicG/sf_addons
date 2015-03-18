SF.Panel.HTML = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.HTML", SF.Panel.DFrame.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.HTML.wrap = pwrap
SF.Panel.HTML.unwrap = punwrap

SF.Panel.HTML.Methods = this_methods
SF.Panel.HTML.Metatable = this_metamethods
