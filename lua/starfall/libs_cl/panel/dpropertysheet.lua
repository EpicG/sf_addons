SF.Panel.DPropertySheet = {}

local small_methods, small_metamethods = SF.Typedef( "Panel.DPropertySheet", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, small_metamethods )
	return object
end

SF.Panel.DPropertySheet.wrap = pwrap
SF.Panel.DPropertySheet.unwrap = punwrap

SF.Panel.DPropertySheet.Methods = small_methods
SF.Panel.DPropertySheet.Metatable = small_metamethods
