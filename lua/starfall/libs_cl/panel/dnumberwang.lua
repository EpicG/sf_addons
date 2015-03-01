SF.Panel.DNumberWang = {}

local dnumberWang_methods, dnumberWang_metamethods = SF.Typedef( "Panel.DNumberWang", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dnumberWang_metamethods )
	return object
end

SF.Panel.DNumberWang.wrap = pwrap
SF.Panel.DNumberWang.unwrap = punwrap

SF.Panel.DNumberWang.Methods = dnumberWang_methods
SF.Panel.DNumberWang.Metatable = dnumberWang_metamethods
