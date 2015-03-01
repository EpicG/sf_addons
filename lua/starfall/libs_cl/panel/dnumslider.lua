SF.Panel.DNumSlider = {}

local dnumSlider_methods, dnumSlider_metamethods = SF.Typedef( "Panel.DNumSlider", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dnumSlider_metamethods )
	return object
end

SF.Panel.DNumSlider.wrap = pwrap
SF.Panel.DNumSlider.unwrap = punwrap

SF.Panel.DNumSlider.Methods = dnumSlider_methods
SF.Panel.DNumSlider.Metatable = dnumSlider_metamethods
