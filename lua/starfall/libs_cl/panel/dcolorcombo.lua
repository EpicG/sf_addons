SF.Panel.DColorCombo = {}

local dcolorCombo_methods, dcolorCombo_metamethods = SF.Typedef( "Panel.DColorCombo", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dcolorCombo_metamethods )
	return object
end

SF.Panel.DColorCombo.wrap = pwrap
SF.Panel.DColorCombo.unwrap = punwrap

SF.Panel.DColorCombo.Methods = dcolorCombo_methods
SF.Panel.DColorCombo.Metatable = dcolorCombo_metamethods
