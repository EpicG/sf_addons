SF.Panel.DColorCombo = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DColorCombo", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DColorCombo.wrap = pwrap
SF.Panel.DColorCombo.unwrap = punwrap

SF.Panel.DColorCombo.Methods = this_methods
SF.Panel.DColorCombo.Metatable = this_metamethods
