SF.Panel.DTileLayout = {}

local dtileLayout_methods, dtileLayout_metamethods = SF.Typedef( "Panel.DTileLayout", SF.Panel.DDragBase.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dtileLayout_metamethods )
	return object
end

SF.Panel.DTileLayout.wrap = pwrap
SF.Panel.DTileLayout.unwrap = punwrap

SF.Panel.DTileLayout.Methods = dtileLayout_methods
SF.Panel.DTileLayout.Metatable = dtileLayout_metamethods
