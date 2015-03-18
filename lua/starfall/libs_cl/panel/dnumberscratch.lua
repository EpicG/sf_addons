SF.Panel.DNumberScratch = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DNumberScratch", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DNumberScratch.wrap = pwrap
SF.Panel.DNumberScratch.unwrap = punwrap

SF.Panel.DNumberScratch.Methods = this_methods
SF.Panel.DNumberScratch.Metatable = this_metamethods
