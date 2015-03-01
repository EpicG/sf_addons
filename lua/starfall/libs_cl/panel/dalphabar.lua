SF.Panel.DAlphaBar = {}

local dalphaBar_methods, dalphaBar_metamethods = SF.Typedef( "Panel.DAlphaBar", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dalphaBar_metamethods )
	return object
end

SF.Panel.DAlphaBar.wrap = pwrap
SF.Panel.DAlphaBar.unwrap = punwrap

SF.Panel.DAlphaBar.Methods = dalphaBar_methods
SF.Panel.DAlphaBar.Metatable = dalphaBar_metamethods
