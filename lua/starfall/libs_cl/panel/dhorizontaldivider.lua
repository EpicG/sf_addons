SF.Panel.DHorizontalDivider = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DHorizontalDivider", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DHorizontalDivider.wrap = pwrap
SF.Panel.DHorizontalDivider.unwrap = punwrap

SF.Panel.DHorizontalDivider.Methods = this_methods
SF.Panel.DHorizontalDivider.Metatable = this_metamethods
