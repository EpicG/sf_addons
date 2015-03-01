SF.Panel.Slider = {}

local slider_methods, slider_metamethods = SF.Typedef( "Panel.Slider", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, slider_metamethods )
	return object
end

SF.Panel.Slider.wrap = pwrap
SF.Panel.Slider.unwrap = punwrap

SF.Panel.Slider.Methods = slider_methods
SF.Panel.Slider.Metatable = slider_metamethods
