SF.Panel.DCategoryList = {}

local dcategoryList_methods, dcategoryList_metamethods = SF.Typedef( "Panel.DCategoryList", SF.Panel.DScrollPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dcategoryList_metamethods )
	return object
end

SF.Panel.DCategoryList.wrap = pwrap
SF.Panel.DCategoryList.unwrap = punwrap

SF.Panel.DCategoryList.Methods = dcategoryList_methods
SF.Panel.BIGNAME.Metatable = dcategoryList_metamethods
