SF.Panel.DNumberWang = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DNumberWang", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DNumberWang.wrap = pwrap
SF.Panel.DNumberWang.unwrap = punwrap

SF.Panel.DNumberWang.Methods = this_methods
SF.Panel.DNumberWang.Metatable = this_metamethods
