SF.Panel.DColorMixer = {}

local dcolorMixer_methods, dcolorMixer_metamethods = SF.Typedef( "Panel.DColorMixer", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dcolorMixer_metamethods )
	return object
end

SF.Panel.DColorMixer.wrap = pwrap
SF.Panel.DColorMixer.unwrap = punwrap

SF.Panel.DColorMixer.Methods = dcolorMixer_methods
SF.Panel.DColorMixer.Metatable = dcolorMixer_metamethods
