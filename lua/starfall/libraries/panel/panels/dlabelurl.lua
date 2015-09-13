SF.Panel.DLabelURL = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DLabelURL", SF.Panel.DLabel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex


SF.Panel.DLabelURL.wrap = pwrap
SF.Panel.DLabelURL.unwrap = punwrap

SF.Panel.DLabelURL.Methods = this_methods
SF.Panel.DLabelURL.Metatable = this_metamethods