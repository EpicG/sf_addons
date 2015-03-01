SF.Panel.URLLabel = {}

local urlLabel_methods, urlLabel_metamethods = SF.Typedef( "Panel.URLLabel", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, urlLabel_metamethods )
	return object
end

SF.Panel.URLLabel.wrap = pwrap
SF.Panel.URLLabel.unwrap = punwrap

SF.Panel.URLLabel.Methods = urlLabel_methods
SF.Panel.URLLabel.Metatable = urlLabel_metamethods
