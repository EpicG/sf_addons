SF.Panel.DFileBrowser = {}

local dfileBrowser_methods, dfileBrowser_metamethods = SF.Typedef( "Panel.DFileBrowser", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dfileBrowser_metamethods )
	return object
end

SF.Panel.DFileBrowser.wrap = pwrap
SF.Panel.DFileBrowser.unwrap = punwrap

SF.Panel.DFileBrowser.Methods = dfileBrowser_methods
SF.Panel.DFileBrowser.Metatable = dfileBrowser_metamethods
