SF.Panel.DProperty_Combo = {}

local dproperty_Combo_methods, dproperty_Combo_metamethods = SF.Typedef( "Panel.DProperty_Combo", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dproperty_Combo_metamethods )
	return object
end

SF.Panel.DProperty_Combo.wrap = pwrap
SF.Panel.DProperty_Combo.unwrap = punwrap

SF.Panel.DProperty_Combo.Methods = dproperty_Combo_methods
SF.Panel.DProperty_Combo.Metatable = dproperty_Combo_metamethods
