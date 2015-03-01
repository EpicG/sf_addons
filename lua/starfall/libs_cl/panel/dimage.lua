SF.Panel.DImage = {}

local dimage_methods, dimage_metamethods = SF.Typedef( "Panel.DImage", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dimage_metamethods )
	return object
end

SF.Panel.DImage.wrap = pwrap
SF.Panel.DImage.unwrap = punwrap

SF.Panel.DImage.Methods = dimage_methods
SF.Panel.DImage.Metatable = dimage_metamethods
