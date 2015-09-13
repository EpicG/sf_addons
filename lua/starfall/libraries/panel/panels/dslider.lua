SF.Panel.DSlider = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DSlider", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DSlider.wrap = pwrap
SF.Panel.DSlider.unwrap = punwrap

SF.Panel.DSlider.Methods = this_methods
SF.Panel.DSlider.Metatable = this_metamethods
