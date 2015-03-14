SF.Panel.IconEditor = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.IconEditor", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

SF.Panel.IconEditor.wrap = pwrap
SF.Panel.IconEditor.unwrap = punwrap

SF.Panel.IconEditor.Methods = this_methods
SF.Panel.IconEditor.Metatable = this_metamethods

--- Applies the top-down view to the camera for the model
function this_methods:aboveLayout( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):AboveLayout( )
end

--- Applies the best camera settings for the model
function this_methods:bestGuessLayout( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):BestGuessLayout( )
end

--- Applies the front view to the camera for the model
function this_methods:fullFrontalLayout( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):FullFrontalLayout( )
end

--- Places the camera at the origin relative to the entity
function this_methods:originLayout( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):OriginLayout( )
end

--- Updates the SpawnIcon, should be called immediately after setting the SpawnIcon with IconEditor:setIcon
function this_methods:refresh( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):Refresh( )
end

--- Re-renders the SpawnIcon
function this_methods:renderIcon( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):RenderIcon( )
end

--- Applies the right-side view to the camera for the model
function this_methods:rightLayout( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):RightLayout( )
end

--- Sets the editor's model and icon from an entity
--@param ent The entity to retrieve the model and skin from
function this_methods:setFromEntity( ent )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( ent, SF.Types[ "Entity" ] )

	punwrap( self ):SetFromEntity( SF.UnwrapObject( ent ) )
end

--- Sets the SpawnIcon to modify
--@param spawnicon The SpawnIcon to modify
function this_methods:setIcon( spawnicon )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( spawnicon, SF.Panel.SpawnIcon.Metatable )

	punwrap( self ):SetIcon( punwrap( spawnicon ) )
end