SF.Panel.DDragBase = {}

local ddragBase_methods, ddragBase_metamethods = SF.Typedef( "Panel.DDragBase", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, ddragBase_metamethods )
	return object
end

SF.Panel.DDragBase.wrap = pwrap
SF.Panel.DDragBase.unwrap = punwrap

SF.Panel.DDragBase.Methods = ddragBase_methods
SF.Panel.DDragBase.Metatable = ddragBase_metamethods
