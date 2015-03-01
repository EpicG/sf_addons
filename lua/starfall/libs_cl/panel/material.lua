SF.Panel.Material = {}

local material_methods, material_metamethods = SF.Typedef( "Panel.Material", SF.Panel.Button.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, material_metamethods )
	return object
end

SF.Panel.Material.wrap = pwrap
SF.Panel.Material.unwrap = punwrap

SF.Panel.Material.Methods = material_methods
SF.Panel.Material.Metatable = material_metamethods
