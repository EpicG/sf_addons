SF.Panel.DPanel = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DPanel", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DPanel.wrap = pwrap
SF.Panel.DPanel.unwrap = punwrap

SF.Panel.DPanel.Methods = this_methods
SF.Panel.DPanel.Metatable = this_metamethods

function this_methods:setDrawBackground( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ).m_bBackground = enable
end

function this_methods:getDrawBackground( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bBackground
end

function this_methods:setIsMenu( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ).m_bIsMenuComponent = enable
end

function this_methods:getIsMenu( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bIsmenuComponent
end

function this_methods:setTabbing( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ).m_bDisableTabbing = not enable
end

function this_methods:getTabbing( )
	SF.CheckType( self, this_metamethods )

	return not punwrap( self ).m_bDisableTabbing
end

function this_methods:setEnabled( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):SetDisabled( not enable )
end

function this_methods:getEnabled( )
	SF.CheckType( self, this_metamethods )

	return not punwrap( self ).m_bDisabled
end

function this_methods:setBackgroundColor( color )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( color, SF.Types[ "Color" ] )

	punwrap( self ).m_bgColor = SF.UnwrapObject( color )
end

function this_methods:getBackgroundColor( )
	SF.CheckType( self, this_metamethods )

	return SF.WrapObject( punwrap( self ).m_bgColor )
end

