
-------------------------------------------------------------------------------
-- Constraint functions
-------------------------------------------------------------------------------

assert( SF.Entities )

--- Constraint library. Used for various entity constraints
-- @name constraint
-- @server
-- @class library
-- @libtbl constraint_lib
local constraint_lib, _ = SF.Libraries.Register( "constraint" )

local ents_metatable = SF.Entities.Metatable
local wrap, unwrap = SF.Entities.Wrap, SF.Entities.Unwrap
local vwrap, vunwrap = SF.WrapObject, SF.UnwrapObject

--- Creates a table of entities recursively constrained to an entity
-- @param ent Base entity of search
-- @param default Default table to return
-- @return Table of constrained entities
function constraint_lib.getAllConstrainedEntities( ent, default )
	SF.CheckType( ent, ents_metatable )
	ent = unwrap( ent )

	if default ~= nil then
		SF.CheckType( default, "table" )
	else
		default = {}
	end

	local valid = SF.Entities.IsValid
	if not valid( ent ) then return {} end

	local constrainedEnts = constraint.GetAllConstrainedEntities( ent, {} )

	local entsTable = {}
	for _, Entity in pairs( constrainedEnts ) do
		table.insert( entsTable, wrap( Entity ) )
	end

	if #entsTable == 0 then
		entsTable = default
	end

	return entsTable
end

--- Creates a table of constraints on an entity
-- @param ent Target entity
-- @return Table of entity constraints
function constraint_lib.getTable( ent )
	SF.CheckType( ent, ents_metatable )
	ent = unwrap( ent )

	local valid = SF.Entities.IsValid
	if not valid( ent ) then return {} end

	local constraints = constraint.GetTable( ent )

	local ret = {}
	for k, v in pairs( constraints ) do
		ret[ k ] = {}
		
		ret[ k ].LPos = vwrap( v.LPos )
		ret[ k ].Ent1 = wrap( v.Ent1 )
		ret[ k ].LPos1 = vwrap( v.LPos1 )
		ret[ k ].Ent2 = wrap( v.Ent2 )
		ret[ k ].LPos2 = vwrap( v.LPos2 )
		ret[ k ].Type = v.Type
	end

	return ret
end