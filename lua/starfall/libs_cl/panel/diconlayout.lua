SF.Panel.DIconLayout = {}

local diconLayout_methods, diconLayout_metamethods = SF.Typedef( "Panel.DIconLayout", SF.Panel.DDragBase.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, diconLayout_metamethods )
	return object
end

SF.Panel.DIconLayout.wrap = pwrap
SF.Panel.DIconLayout.unwrap = punwrap

SF.Panel.DIconLayout.Methods = diconLayout_methods
SF.Panel.DIconLayout.Metatable = diconLayout_metamethods
