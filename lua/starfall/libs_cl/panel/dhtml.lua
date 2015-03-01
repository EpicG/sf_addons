SF.Panel.DHTML = {}

local dhtml_methods, dhtml_metamethods = SF.Typedef( "Panel.DHTML", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dhtml_metamethods )
	return object
end

SF.Panel.DHTML.wrap = pwrap
SF.Panel.DHTML.unwrap = punwrap

SF.Panel.DHTML.Methods = dhtml_methods
SF.Panel.DHTML.Metatable = dhtml_metamethods
