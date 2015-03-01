SF.Panel.DNumberScratch = {}

local dnumberScratch_methods, dnumberScratch_metamethods = SF.Typedef( "Panel.DNumberScratch", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dnumberScratch_metamethods )
	return object
end

SF.Panel.DNumberScratch.wrap = pwrap
SF.Panel.DNumberScratch.unwrap = punwrap

SF.Panel.DNumberScratch.Methods = dnumberScratch_methods
SF.Panel.DNumberScratch.Metatable = dnumberScratch_metamethods
