SF.Panel.DFileBrowser = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DFileBrowser", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DFileBrowser.wrap = pwrap
SF.Panel.DFileBrowser.unwrap = punwrap

SF.Panel.DFileBrowser.Methods = this_methods
SF.Panel.DFileBrowser.Metatable = this_metamethods
