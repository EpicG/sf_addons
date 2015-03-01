SF.Panel.DHorizontalDivider = {}

local dhorizontalDivider_methods, dhorizontalDivider_metamethods = SF.Typedef( "Panel.DHorizontalDivider", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dhorizontalDivider_metamethods )
	return object
end

SF.Panel.DHorizontalDivider.wrap = pwrap
SF.Panel.DHorizontalDivider.unwrap = punwrap

SF.Panel.DHorizontalDivider.Methods = dhorizontalDivider_methods
SF.Panel.DHorizontalDivider.Metatable = dhorizontalDivider_metamethods
