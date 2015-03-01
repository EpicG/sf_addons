SF.Panel.DColorCube = {}

local dcolorCube_methods, dcolorCube_metamethods = SF.Typedef( "Panel.DColorCube", SF.Panel.DSlider.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dcolorCube_metamethods )
	return object
end

SF.Panel.DColorCube.wrap = pwrap
SF.Panel.DColorCube.unwrap = punwrap

SF.Panel.DColorCube.Methods = dcolorCube_methods
SF.Panel.DColorCube.Metatable = dcolorCube_metamethods
