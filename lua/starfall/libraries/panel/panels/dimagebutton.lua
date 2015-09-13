SF.Panel.DImageButton = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DImageButton", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DImageButton.wrap = pwrap
SF.Panel.DImageButton.unwrap = punwrap

SF.Panel.DImageButton.Methods = this_methods
SF.Panel.DImageButton.Metatable = this_metamethods

function this_methods:setStretchToFit( stf )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( stf, "boolean" )

	punwrap( self ).m_bStretchToFit = stf
end

function this_methods:getStretchToFit( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bStretchToFit
end

function this_methods:setImageVisible( visible )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( visible, "boolean" )

	punwrap( self ).m_Image:SetVisible( visible )
end

function this_methods:setImage( image, backup )
	SF.CheckType( image, "string" )
	if backup then SF.CheckType( backup, "string" ) end

	punwrap( self ).m_Image:SetImage( image, backup )
end

function this_methods:setColor( color )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( color, SF.Types[ "Color" ] )

	punwrap( self ):SetColor( color )
end

function this_methods:getImage( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_Image:GetImage( )
end

function this_methods:setKeepAspect( keep )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( keep, "boolean" )

	punwrap( self ):SetKeepAspect( )
end

function this_methods:sizeToContents( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):SizeToContents( )
end

function this_methods:setEnabled( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):SetDisabled( not enable )
end