SF.Panel.DSlider = {}

local dslider_methods, dslider_metamethods = SF.Typedef( "Panel.DSlider", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dslider_metamethods )
	return object
end

SF.Panel.DSlider.wrap = pwrap
SF.Panel.DSlider.unwrap = punwrap

SF.Panel.DSlider.Methods = dslider_methods
SF.Panel.DSlider.Metatable = dslider_metamethods
