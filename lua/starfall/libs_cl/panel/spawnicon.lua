SF.Panel.SpawnIcon = {}

local spawnIcon_methods, spawnIcon_metamethods = SF.Typedef( "Panel.SpawnIcon", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, spawnIcon_metamethods )
	return object
end

SF.Panel.SpawnIcon.wrap = pwrap
SF.Panel.SpawnIcon.unwrap = punwrap

SF.Panel.SpawnIcon.Methods = spawnIcon_methods
SF.Panel.SpawnIcon.Metatable = spawnIcon_metamethods
