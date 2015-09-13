SF.Panel.DHTML = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DHTML", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DHTML.wrap = pwrap
SF.Panel.DHTML.unwrap = punwrap

SF.Panel.DHTML.Methods = this_methods
SF.Panel.DHTML.Metatable = this_metamethods
