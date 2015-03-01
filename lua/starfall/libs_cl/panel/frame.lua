SF.Panel.Frame = {}

local frame_methods, frame_metamethods = SF.Typedef( "Panel.Frame", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, frame_metamethods )
	return object
end

SF.Panel.Frame.wrap = pwrap
SF.Panel.Frame.unwrap = punwrap

SF.Panel.Frame.Methods = frame_methods
SF.Panel.Frame.Metatable = frame_metamethods
