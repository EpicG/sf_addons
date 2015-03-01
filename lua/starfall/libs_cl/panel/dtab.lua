SF.Panel.DTab = {}

local dtab_methods, dtab_metamethods = SF.Typedef( "Panel.DTab", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dtab_metamethods )
	return object
end

SF.Panel.DTab.wrap = pwrap
SF.Panel.DTab.unwrap = punwrap

SF.Panel.DTab.Methods = dtab_methods
SF.Panel.DTab.Metatable = dtab_metamethods
