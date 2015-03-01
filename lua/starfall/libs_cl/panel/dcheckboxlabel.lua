SF.Panel.DCheckBoxLabel = {}

local dcheckBoxLabel_methods, dcheckBoxLabel_metamethods = SF.Typedef( "Panel.DCheckBoxLabel", SF.Panel.DLabel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dcheckBoxLabel_metamethods )
	return object
end

SF.Panel.DCheckBoxLabel.wrap = pwrap
SF.Panel.DCheckBoxLabel.unwrap = punwrap

SF.Panel.DCheckBoxLabel.Methods = dcheckBoxLabel_methods
SF.Panel.DCheckBoxLabel.Metatable = dcheckBoxLabel_metamethods
