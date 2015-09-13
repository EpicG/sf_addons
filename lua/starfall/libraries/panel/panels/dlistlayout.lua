SF.Panel.DListLayout = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DListLayout", SF.Panel.DDragBase.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DListLayout.wrap = pwrap
SF.Panel.DListLayout.unwrap = punwrap

SF.Panel.DListLayout.Methods = this_methods
SF.Panel.DListLayout.Metatable = this_metamethods
