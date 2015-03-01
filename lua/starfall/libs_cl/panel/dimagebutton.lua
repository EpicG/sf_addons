SF.Panel.DImageButton = {}

local dimageButton_methods, dimageButton_metamethods = SF.Typedef( "Panel.DImageButton", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dimageButton_metamethods )
	return object
end

SF.Panel.DImageButton.wrap = pwrap
SF.Panel.DImageButton.unwrap = punwrap

SF.Panel.DImageButton.Methods = dimageButton_methods
SF.Panel.DImageButton.Metatable = dimageButton_metamethods
