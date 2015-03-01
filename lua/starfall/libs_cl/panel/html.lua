SF.Panel.HTML = {}

local html_methods, html_metamethods = SF.Typedef( "Panel.HTML", SF.Panel.DFrame.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, html_metamethods )
	return object
end

SF.Panel.HTML.wrap = pwrap
SF.Panel.HTML.unwrap = punwrap

SF.Panel.HTML.Methods = html_methods
SF.Panel.HTML.Metatable = html_metamethods
