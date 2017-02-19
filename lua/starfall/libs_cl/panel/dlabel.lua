SF.Panel.DLabel = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DLabel", SF.Panel.Label.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DLabel.wrap = pwrap
SF.Panel.DLabel.unwrap = punwrap

SF.Panel.DLabel.Methods = this_methods
SF.Panel.DLabel.Metatable = this_metamethods

function this_methods:setTextColor( color )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( color, SF.Types[ "Color" ] )
	
	punwrap( self ):SetTextColor( SF.UnwrapObject( color ) )
end
