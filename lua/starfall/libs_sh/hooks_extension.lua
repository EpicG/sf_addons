local add = SF.hookAdd

if SERVER then
	-- Sandbox hooks
	-- add( "PersistenceLoad" )
	-- add( "PersistenceSave" )
	-- add( "PlayerGiveSWEP" )

	--[[ Disabled because the parameter ent is not wrapped; TODO wrap the parameter before it is passed to SF
	add( "PlayerSpawnedEffect" )
	add( "PlayerSpawnedNPC" )
	add( "PlayerSpawnedProp" )
	add( "PlayerSpawnedRagdoll" )
	add( "PlayerSpawnedSENT" )
	add( "PlayerSpawnedSWEP" )
	add( "PlayerSpawnedVehicle" )
	--]]

	--[[ Disabled because the return value determines whether an entity is able to be spawned; TODO igonre the return value
	add( "PlayerSpawnEffect" )
	add( "PlayerSpawnNPC" )
	add( "PlayerSpawnProp" )
	add( "PlayerSpawnRagdoll" )
	add( "PlayerSpawnSENT" )
	add( "PlayerSpawnSWEP" )
	add( "PlayerSpawnVehicle" )
	--]]
else
	--[[ Disabled because either the parameters passed are un-wraped, or return values determine wheter the action can happen; TODO wrap parameters, ignore returns
	add( "AddToolMenuCategories" )
	add( "AddToolMenuTabs" )
	add( "ContentSidebarSelection" )
	add( "PopulatePropMenu" )
	add( "SpawnMenuEnabled" )
	add( "SpawnMenuOpen" )
	--]]
end

add( "DupeFinished" )
add( "Updated" )

--- Called when duplicator finishes pasting the SF entity
-- @name DupeFinished
-- @class hook
-- @shared

--- Called when the starfall instance has new code uploaded to it
-- @name Updated
-- @class hook
-- @shared