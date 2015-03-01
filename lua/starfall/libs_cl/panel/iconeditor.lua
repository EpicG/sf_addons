SF.Panel.IconEditor = {}

local small_methods, small_metamethods = SF.Typedef( "Panel.IconEditor", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, small_metamethods )
	return object
end

SF.Panel.IconEditor.wrap = pwrap
SF.Panel.IconEditor.unwrap = punwrap

SF.Panel.IconEditor.Methods = small_methods
SF.Panel.IconEditor.Metatable = small_metamethods
