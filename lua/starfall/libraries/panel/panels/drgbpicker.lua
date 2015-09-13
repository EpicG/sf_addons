SF.Panel.DRGBPicker = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DRGBPicker", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DRGBPicker.wrap = pwrap
SF.Panel.DRGBPicker.unwrap = punwrap

SF.Panel.DRGBPicker.Methods = this_methods
SF.Panel.DRGBPicker.Metatable = this_metamethods
