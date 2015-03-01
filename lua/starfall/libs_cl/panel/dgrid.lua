SF.Panel.DGrid = {}

local dgrid_methods, dgrid_metamethods = SF.Typedef( "Panel.DGrid", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dgrid_metamethods )
	return object
end

SF.Panel.DGrid.wrap = pwrap
SF.Panel.DGrid.unwrap = punwrap

SF.Panel.DGrid.Methods = dgrid_methods
SF.Panel.DGrid.Metatable = dgrid_metamethods
