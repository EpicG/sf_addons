SF.Panel.DListLayout = {}

local dlistLayout_methods, dlistLayout_metamethods = SF.Typedef( "Panel.DListLayout", SF.Panel.DDragBase.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dlistLayout_metamethods )
	return object
end

SF.Panel.DListLayout.wrap = pwrap
SF.Panel.DListLayout.unwrap = punwrap

SF.Panel.DListLayout.Methods = dlistLayout_methods
SF.Panel.DListLayout.Metatable = dlistLayout_metamethods
