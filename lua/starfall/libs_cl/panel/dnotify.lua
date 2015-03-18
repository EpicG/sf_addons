SF.Panel.DNotify = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DNotify", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DNotify.wrap = pwrap
SF.Panel.DNotify.unwrap = punwrap

SF.Panel.DNotify.Methods = this_methods
SF.Panel.DNotify.Metatable = this_metamethods

--- Sets the spacing of the notification
--@param space The spacing of the notification
function this_methods:setSpacing( space )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( space, "number" )

	punwrap( self ).Spacing = space
end

--- Gets the spacing of the notification
--@return The spacing of the notification
function this_methods:getSpacing( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).Spacing
end

--- Sets the allignment of the notification
--@param allign The allignment of the notification
function this_methods:setAllignment( allign )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( allign, "number" )

	punwrap( self ).Allignment = allign
end

--- Gets the allignment of the notification
--@return The allignment of the notification
function this_methods:getAllignment( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).Allignment
end

--- Sets the length of time that the notification will exist
--@param time The time in seconds
function this_methods:setLife( time )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( time, "number" )

	punwrap( self ).m_fLifeLength = time
end

--- Gets the length of time that the notification will exist
--@return The time in seconds
function this_methods:getLife( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_fLifeLength
end

--- Adds a panel to the notification
--@param item The panel to add
--@param life The time for the notification to be around
function this_methods:addItem( item, life )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( item, SF.Panel.Panel.Metatable )
	SF.CheckType( life, "number" )

	punwrap( self ):AddItem( punwrap( item ), life )
end

--- Rebuilds the notification
function this_methods:shuffle( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):Shuffle( )
end