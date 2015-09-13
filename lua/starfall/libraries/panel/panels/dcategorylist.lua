SF.Panel.DCategoryList = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DCategoryList", SF.Panel.DScrollPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DCategoryList.wrap = pwrap
SF.Panel.DCategoryList.unwrap = punwrap

SF.Panel.DCategoryList.Methods = this_methods
SF.Panel.DCategoryList.Metatable = this_metamethods
