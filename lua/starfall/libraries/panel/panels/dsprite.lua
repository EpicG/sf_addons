SF.Panel.DSprite = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DSprite", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DSprite.wrap = pwrap
SF.Panel.DSprite.unwrap = punwrap

SF.Panel.DSprite.Methods = this_methods
SF.Panel.DSprite.Metatable = this_metamethods
