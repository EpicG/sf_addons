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
