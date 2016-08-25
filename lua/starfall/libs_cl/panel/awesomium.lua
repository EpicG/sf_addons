SF.Panel.Awesomium = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.Awesomium", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.Awesomium.wrap = pwrap
SF.Panel.Awesomium.unwrap = punwrap

SF.Panel.Awesomium.Methods = this_methods
SF.Panel.Awesomium.Metatable = this_metamethods
