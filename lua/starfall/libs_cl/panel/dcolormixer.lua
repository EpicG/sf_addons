SF.Panel.DColorMixer = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DColorMixer", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DColorMixer.wrap = pwrap
SF.Panel.DColorMixer.unwrap = punwrap

SF.Panel.DColorMixer.Methods = this_methods
SF.Panel.DColorMixer.Metatable = this_metamethods

function this_methods:setPalette( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):SetPalette( enable )
end

function this_methods:getPalette( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):GetPalette( )
end

function this_methods:setAlphaBar( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):SetAlphaBar( enable )
end

function this_methods:getAlphaBar( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):GetAlphaBar( )
end

function this_methods:setWangs( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):SetWangs( enable )
end

function this_methods:getWangs( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):GetWangs( )
end

function this_methods:setColor( color )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( color, SF.Types[ "Color" ] )

	punwrap( self ):SetColor( SF.UnwrapObject( color ) )
end

function this_methods:getColor( )
	SF.CheckType( self, this_metamethods )

	return SF.WrapObject( punwrap( self ):SetColor( ) )
end

function this_methods:setVector( vec )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( vec, SF.Types[ "Vector" ] )

	punwrap( self ):SetVector( SF.UnwrapObject( vec ) )
end

function this_methods:getVector( )
	SF.CheckType( self, this_metamethods )

	return SF.WrapObject( punwrap( self ):GetVector( ) )
end

function this_methods:setBaseColor( color )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( color, SF.Types[ "Color" ] )

	punwrap( self ):SetBaseColor( SF.UnwrapObject( color ) )
end

function this_methods:getBaseColor( )
	SF.CheckType( self, this_metamethods )

	return SF.WrapObject( punwrap( self ):GetBaseColor( ) )
end

function this_methods:updateColor( color )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( color, SF.Types[ "Color" ] )

	punwrap( self ):UpdateColor( SF.UnwrapObject( color ) )
end