SF.Panel.DColorCube = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DColorCube", SF.Panel.DSlider.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DColorCube.wrap = pwrap
SF.Panel.DColorCube.unwrap = punwrap

SF.Panel.DColorCube.Methods = this_methods
SF.Panel.DColorCube.Metatable = this_metamethods
