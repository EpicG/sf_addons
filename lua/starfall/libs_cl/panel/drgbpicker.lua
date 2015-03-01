SF.Panel.DRGBPicker = {}

local drgbPicker_methods, drgbPicker_metamethods = SF.Typedef( "Panel.DRGBPicker", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, drgbPicker_metamethods )
	return object
end

SF.Panel.DRGBPicker.wrap = pwrap
SF.Panel.DRGBPicker.unwrap = punwrap

SF.Panel.DRGBPicker.Methods = drgbPicker_methods
SF.Panel.DRGBPicker.Metatable = drgbPicker_metamethods
