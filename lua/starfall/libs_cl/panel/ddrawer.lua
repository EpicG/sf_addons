SF.Panel.DDrawer = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DDrawer", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

SF.Panel.DDrawer.wrap = pwrap
SF.Panel.DDrawer.unwrap = punwrap

SF.Panel.DDrawer.Methods = this_methods
SF.Panel.DDrawer.Metatable = this_metamethods

--- Toggles the state of the drawer
function this_methods:toggle( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):Toggle( )
end

--- Opens the drawer
function this_methods:open( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):Open( )
end

--- Closes the drawer
function this_methods:close( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):Close( )
end