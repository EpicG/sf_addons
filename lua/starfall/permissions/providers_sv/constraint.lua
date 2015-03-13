--- Provides permissions for constraints based on CPPI if present

local P = setmetatable( {}, { __index = SF.Permissions.Provider } )

local ALLOW = SF.Permissions.Result.ALLOW
local DENY = SF.Permissions.Result.DENY
local NEUTRAL = SF.Permissions.Result.NEUTRAL

local canTool = {
	[ "constraint.any" ] = true
}

function P:check ( principal, target, key )
	if not CPPI then return NEUTRAL end
	if type( target ) ~= "Entity" and type( target ) ~= "Player" then return NEUTRAL end

	if canTool[ key ] then
		if target:CPPICanTool( principal, "starfall_ent_lib" ) then return ALLOW end
		return DENY
	end

	return NEUTRAL
end

SF.Permissions.registerProvider( P )