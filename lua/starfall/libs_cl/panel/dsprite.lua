SF.Panel.DSprite = {}

local dsprite_methods, dsprite_metamethods = SF.Typedef( "Panel.DSprite", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dsprite_metamethods )
	return object
end

SF.Panel.DSprite.wrap = pwrap
SF.Panel.DSprite.unwrap = punwrap

SF.Panel.DSprite.Methods = dsprite_methods
SF.Panel.DSprite.Metatable = dsprite_metamethods
