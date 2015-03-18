SF.Panel.TGAImage = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.TGAImage", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.TGAImage.wrap = pwrap
SF.Panel.TGAImage.unwrap = punwrap

SF.Panel.TGAImage.Methods = this_methods
SF.Panel.TGAImage.Metatable = this_metamethods
