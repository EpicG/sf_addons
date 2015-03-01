SF.Panel.DColorButton = {}

local dcolorButton_methods, dcolorButton_metamethods = SF.Typedef( "Panel.DColorButton", SF.Panel.DLabel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dcolorButton_metamethods )
	return object
end

SF.Panel.DColorButton.wrap = pwrap
SF.Panel.DColorButton.unwrap = punwrap

SF.Panel.DColorButton.Methods = dcolorButton_methods
SF.Panel.DColorButton.Metatable = dcolorButton_metamethods
