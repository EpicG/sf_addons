SF.Panel.DModelPanel = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DModelPanel", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DModelPanel.wrap = pwrap
SF.Panel.DModelPanel.unwrap = punwrap

SF.Panel.DModelPanel.Methods = this_methods
SF.Panel.DModelPanel.Metatable = this_metamethods

function this_methods:setEntity( entity )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( entity, SF.Types[ "Entity" ] )

	punwrap( self ):SetEntity( SF.UnwrapObject( entity ) )
end

function this_methods:getEntity( )
	SF.CheckType( self, this_metamethods )

	return SF.Entities.Wrap( punwrap( self ).Entity )
end

function this_methods:setCamPos( camPos )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( camPos, SF.Types[ "Vector" ] )

	punwrap( self ).vCamPos = SF.UnwrapObject( camPos )
end

function this_methods:getCamPos( )
	SF.CheckType( self, this_metamethods )

	return SF.WrapObject( punwrap( self ).vCamPos )
end

function this_methods:setFOV( FOV )
	SF.CheckType( self, this_metamethods )
	SF.CheckTYpe( FOV, "number" )

	punwrap( self ).fFOV = FOV
end

function this_methods:getFOV( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).fFOV
end

function this_methods:setLookAt( position )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( position, SF.Types[ "Vector" ] )

	punwrap( self ).vLookatPos = SF.UnwrapObject( position )
end

function this_methods:getLookAt( )
	SF.CheckType( self, this_metamethods )

	return SF.WrapObject( punwrap( self ).vLookatPos )
end

function this_methods:setLookAngle( ang )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( ang, SF.Types[ "Angle" ] )

	punwrap( self ).aLookAngle = SF.UnwrapObject( ang )
end

function this_methods:getLookAngle( )
	SF.CheckType( self, this_metamethods )

	return SF.WrapObject( punwrap( self ).aLookAngle )
end

function this_methods:setAmbientLight( color )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( color, SF.Types[ "Color" ] )

	punwrap( self ).colAmbientLight = SF.UnwrapObject( color )
end

function this_methods:getAmbientLight( )
	SF.CheckType( self, this_metamethods )

	return SF.WrapObject( punwrap( self ).colAmbientLight )
end

function this_methods:setColor( color )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( color, SF.Types[ "Color" ] )

	punwrap( self ).colColor = SF.UnwrapObject( color )
end

function this_methods:getColor( )
	SF.CheckType( self, this_metamethods )

	return SF.WrapObject( punwrap( self ).colColor )
end

function this_methods:setModel( model )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( model, "string" )

	punwrap( self ):SetModel( model )
end

function this_methods:getModel( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):GetModel( )
end