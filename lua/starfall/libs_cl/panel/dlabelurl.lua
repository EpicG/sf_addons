SF.Panel.DLabelURL = {}

local dlabelURL_methods, dlabelURL_metamethods = SF.Typedef( "Panel.DLabelURL", SF.Panel.DLabel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dlabelURL_metamethods )
	return object
end

SF.Panel.DLabelURL.wrap = pwrap
SF.Panel.DLabelURL.unwrap = punwrap

SF.Panel.DLabelURL.Methods = dlabelURL_methods
SF.Panel.DLabelURL.Metatable = dlabelURL_metamethods
