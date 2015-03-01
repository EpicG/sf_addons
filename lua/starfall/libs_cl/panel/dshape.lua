SF.Panel.DShape = {}

local dshape_methods, dshape_metamethods = SF.Typedef( "Panel.DShape", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dshape_metamethods )
	return object
end

SF.Panel.DShape.wrap = pwrap
SF.Panel.DShape.unwrap = punwrap

SF.Panel.DShape.Methods = dshape_methods
SF.Panel.DShape.Metatable = dshape_metamethods
