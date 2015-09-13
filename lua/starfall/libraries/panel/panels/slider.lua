SF.Panel.Slider = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.Slider", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.Slider.wrap = pwrap
SF.Panel.Slider.unwrap = punwrap

SF.Panel.Slider.Methods = this_methods
SF.Panel.Slider.Metatable = this_metamethods
