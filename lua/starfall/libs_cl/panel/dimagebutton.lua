SF.Panel.DImageButton = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DImageButton", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DImageButton.wrap = pwrap
SF.Panel.DImageButton.unwrap = punwrap

SF.Panel.DImageButton.Methods = this_methods
SF.Panel.DImageButton.Metatable = this_metamethods
