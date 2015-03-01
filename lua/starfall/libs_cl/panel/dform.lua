SF.Panel.DForm = {}

local dform_methods, dform_metamethods = SF.Typedef( "Panel.DForm", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dform_metamethods )
	return object
end

SF.Panel.DForm.wrap = pwrap
SF.Panel.DForm.unwrap = punwrap

SF.Panel.DForm.Methods = dform_methods
SF.Panel.DForm.Metatable = dform_metamethods
