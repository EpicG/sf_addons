SF.Panel.DButton = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DButton", SF.Panel.DLabel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DButton.wrap = pwrap
SF.Panel.DButton.unwrap = punwrap

SF.Panel.DButton.Methods = this_methods
SF.Panel.DButton.Metatable = this_metamethods

function this_methods:isDown( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).Depressed
end

function this_methods:setEnabled( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ).m_bDisabled = not enable
end

function this_methods:getEnabled( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bDisabled
end

function this_methods:setImage( image )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( image, "string" )

	punwrap( self ):SetImage( image )
end