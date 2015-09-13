SF.Panel.SpawnIcon = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.SpawnIcon", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.SpawnIcon.wrap = pwrap
SF.Panel.SpawnIcon.unwrap = punwrap

SF.Panel.SpawnIcon.Methods = this_methods
SF.Panel.SpawnIcon.Metatable = this_metamethods
