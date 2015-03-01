SF.Panel.BIGNAME = {}

local dhtmlControls_methods, dhtmlControls_metamethods = SF.Typedef( "Panel.BIGNAME", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dhtmlControls_metamethods )
	return object
end

SF.Panel.BIGNAME.wrap = pwrap
SF.Panel.BIGNAME.unwrap = punwrap

SF.Panel.BIGNAME.Methods = dhtmlControls_methods
SF.Panel.BIGNAME.Metatable = dhtmlControls_metamethods
