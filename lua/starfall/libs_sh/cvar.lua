---------------------------------------------------------
--Convar Class and cvars
---------------------------------------------------------
SF.Convar = {}

local cv_methods, cv_metamethods = SF.Typedef( "ConVar" )
local wrap, unwrap = SF.CreateWrapper( cv_metamethods, true, true, debug.getregistry().ConVar )

SF.Convar = {}
SF.Convar.Methods = cv_methods
SF.Convar.Metatable = cv_metamethods

SF.Convar.wrap = wrap
SF.Convar.unwrap = unwrap

--- Convar library. Used for getting console variables
-- @name cvars
-- @server
-- @class library
-- @libtbl cv_lib_methods
local cv_lib_methods, cv_lib_metamethods = SF.Libraries.Register( "cvars" )

SF.Convar.insts = {}
local insts = SF.Convar.insts

SF.Libraries.AddHook( "initialize", function( inst )
	inst.data.convar = {
		convars = {}
	}

	insts[ inst ] = true
end )

SF.Libraries.AddHook( "deinitialize", function( inst )
	local convars = inst.data.convar.convars
	for key, convar in pairs( convars ) do
		for id, _ in pairs( convar ) do
			cvars.RemoveChangeCallback( convar, id )
			convars[ key ][ id ] = nil
		end
		convars[ key ] = nil
	end

	insts[ inst ]= nil
end )

--- Gets the ConVar with the specified name
--@param name The name of the convar
--@return The ConVar
function cv_lib_methods.get( name )
	SF.CheckType( name, "string" )

	return wrap( GetConVar( name ) )
end

--- Tries to convert the value of the ConVar to a boolean
--@return The boolean value of ConVar
function cv_methods:getBool( )
	SF.CheckType( self, cv_metamethods )

	return unwrap( self ):GetBool( )
end

--- Returns the default value of the ConVar
--@return The default value of the console variable
function cv_methods:getDefault( )
	SF.CheckType( self, cv_metamethods )

	return unwrap( self ):GetDefault( )
end

--- Tries to convert the value of the ConVar to a float
--@return The float value of the ConVar, 0 by default
function cv_methods:getFloat( )
	SF.CheckType( self, cv_metamethods )

	return unwrap( self ):GetFloat( )
end

--- Returns the help text assigned to the ConVar
--@return The help text
function cv_methods:getHelpText( )
	Sf.CheckType( self, cv_metamethods )

	return unwrap( self ):GetHelpText( )
end

--- Tries to convert the value of the ConVar to an integer
--@return The integer value of the ConVar, 0 by default
function cv_methods:getInt( )
	SF.CheckType( self, cv_metamethods )

	return unwrap( self ):GetInt( )
end

--- Gets the name of the ConVar
--@return The name of the ConVar
function cv_methods:getName( )
	SF.CheckType( self, cv_metamethods )

	return unwrap( self ):GetName( )
end

--- Returns the value of the ConVar as a string
--@return The string value of the ConVar
function cv_methods:getString( )
	SF.CheckType( self, cv_metamethods )

	return unwrap( self ):GetString( )
end

--- Adds a callback to be called when the named convar changes.
--@param name The name of the convar to add the change callback to
--@param callback The function to be called when the convar changes
--@param identifier The name of the callback, used with cvars.removeChangeCallback
function cv_lib_methods.addChangeCallback( name, callback, identifier )
	SF.CheckType( name, "string" )
	SF.CheckType( callback, "function" )
	SF.CheckType( identifier, "string" )

	inst.data.convar.convars[ name ][ identifier ] = callback

	local instance = SF.instance

	cvars.AddChangeCallback( name, function( name, valueOld, valueNew )
		local oldInstance = SF.instance
		SF.instance = instance
		callback( name, valueOld, valueNew )
		SF.instance = oldInstance
	end, identifier )
end

--- Retrieves a console variable as a boolean
--@param name The name of the console variable
--@param default The value to return if the console variable does not exist
--@return The retrieved value
function cv_lib_methods.bool( name, default )
	SF.CheckType( name, "string" )
	SF.CheckType( default, "boolean" )

	return cvars.Bool( name, default )
end

--- Retrieves a table of the functions that are called when the convar changes
--@param name The name of the console variable
--@return Table of functions that are called when the convar is changed
function cv_lib_methods.getConVarCallbacks( name )
	SF.CheckType( name, "string" )

	local ret = {}

	if SF.instance.data.convar.convars[ name ] then
		local convars = SF.instance.data.convar.convars[ name ]
		for k, v in pairs( convars ) do
			table.insert( ret, v )
		end
	end

	return ret
end

--- Retrieves a console variable as a number
--@param name The name of the console variable
--@return The retrieved value
function cv_lib_methods.number( name )
	SF.CheckType( name, "string" )

	return cvars.Number( name )
end

--- Removes a callback with the given identifier
--@param name The name of the convar to remove the callback from
--@param identifier The name of the callback
function cv_lib_methods.addChangeCallback( name, identifier )
	SF.CheckType( name, "string" )
	SF.CheckType( identifier, "string" )

	inst.data.convar.convars[ name ][ identifier ] = nil

	cvars.RemoveChangeCallback( name, identifier )
end

--- Retrieves a console variable as a string
--@param name The name of the console variable
--@return The retrieved value
function cv_lib_methods.number( name )
	SF.CheckType( name, "string" )

	return cvars.String( name )
end