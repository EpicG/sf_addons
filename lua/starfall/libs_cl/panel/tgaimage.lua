SF.Panel.TGAImage = {}

local tgaimage_methods, tgaimage_metamethods = SF.Typedef( "Panel.TGAImage", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, tgaimage_metamethods )
	return object
end

SF.Panel.TGAImage.wrap = pwrap
SF.Panel.TGAImage.unwrap = punwrap

SF.Panel.TGAImage.Methods = tgaimage_methods
SF.Panel.TGAImage.Metatable = tgaimage_metamethods
