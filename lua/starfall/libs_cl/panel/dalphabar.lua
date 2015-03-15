SF.Panel.DAlphaBar = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DAlphaBar", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

SF.Panel.DAlphaBar.wrap = pwrap
SF.Panel.DAlphaBar.unwrap = punwrap

SF.Panel.DAlphaBar.Methods = this_methods
SF.Panel.DAlphaBar.Metatable = this_metamethods

function this_methods:setValue( value )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( value, "number" )

	punwrap( self ).m_Value = value
end

function this_methods:getValue( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_Value
end

function this_methods:setBarColor( color )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( color, SF.Types[ "Color" ] )

	punwrap( self ).m_BarColor = SF.UnwrapObject( color )
end
