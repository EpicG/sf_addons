SF.Panel.DTileLayout = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DTileLayout", SF.Panel.DDragBase.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DTileLayout.wrap = pwrap
SF.Panel.DTileLayout.unwrap = punwrap

SF.Panel.DTileLayout.Methods = this_methods
SF.Panel.DTileLayout.Metatable = this_metamethods
