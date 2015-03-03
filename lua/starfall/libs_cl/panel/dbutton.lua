SF.Panel.DButton = {}

local dbutton_methods, dbutton_metamethods = SF.Typedef( "Panel.DButton", SF.Panel.DLabel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dbutton_metamethods )
	return object
end

SF.Panel.DButton.wrap = pwrap
SF.Panel.DButton.unwrap = punwrap

SF.Panel.DButton.Methods = dbutton_methods
SF.Panel.DButton.Metatable = dbutton_metamethods

function dbutton_metamethods.__newindex( t, k, v )
	if type( v ) == "function" then
		local instance = SF.instance
		punwrap( t )[ k:sub( 1, 1 ):upper( ) .. k:sub( 2 ) ] = function( )
			local oldInstance = SF.instance
			SF.instance = instance
			v( )
			SF.instance = oldInstance
		end
	else
		t[ k ] = v
	end
end

function dbutton_methods:isDown( )
	SF.CheckType( self, dbutton_metamethods )

	return punwrap( self ):IsDown( )
end

function dbutton_methods:setEnabled( enable )
	SF.CheckType( self, dbutton_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):SetEnabled( enable )
end

function dbutton_methods:setImage( image )
	SF.CheckType( self, dbutton_metamethods )
	SF.CheckType( image, "string" )

	punwrap( self ):SetImage( image )
end