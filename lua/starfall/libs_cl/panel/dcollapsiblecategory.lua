SF.Panel.DCollapsibleCategory = {}

local dcollapsibleCategory_methods, dcollapsibleCategory_metamethods = SF.Typedef( "Panel.DCollapsibleCategory", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dcollapsibleCategory_metamethods )
	return object
end

SF.Panel.DCollapsibleCategory.wrap = pwrap
SF.Panel.DCollapsibleCategory.unwrap = punwrap

SF.Panel.DCollapsibleCategory.Methods = dcollapsibleCategory_methods
SF.Panel.DCollapsibleCategory.Metatable = dcollapsibleCategory_metamethods
