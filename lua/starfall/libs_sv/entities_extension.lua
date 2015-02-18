local ents_methods = SF.Entities.Methods
local ents_metatable = SF.Entities.Metatable
local wrap, unwrap = SF.Entities.Wrap, SF.Entities.Unwrap
local isValid = SF.Entities.IsValid

do
	P.registerPrivilege( "entities.setBonePos", "setBonePos", "Allows the user to get the bone position of an entity" )
	P.registerPrivilege( "entities.getBonePos", "getBonePos", "Allows the user to set the bone position of an entity" )
	P.registerPrivilege( "entities.setBoneAngles", "setBoneAngles", "Allows the user to get the bone angles of an entity" )
	P.registerPrivilege( "entities.getBoneAngles", "getBoneAngles", "Allows the user to set the bone angles of an entity" )
end

--- Checks the entities frozen state
-- @return True if entity is frozen
function ents_methods:getFrozen ()
	SF.CheckType( self, ents_metatable )

	local ent = unwrap( self )
	if not isValid( ent ) then
		return false
	end
	local phys = ent:GetPhysicsObject()
	if phys:IsMoveable() then return false else return true end
end

--- Sets the entity to be Solid or not.
-- For more information please refer to GLua function http://wiki.garrysmod.com/page/Entity/SetNotSolid
-- @param solid Boolean, Should the entity be solid?
function ents_methods:setSolid ( solid )
	local ent = unwrap( self )
	if not isValid( ent ) then return false, "entity not valid" end
	
	if not SF.Permissions.check( SF.instance.player, ent, "entities.setSolid" ) then SF.throw( "Insufficient permissions", 2 ) end

	ent:SetNotSolid( not solid )
end

--- Sets entity gravity
-- @param grav Should the entity respect gravity?
function ents_methods:setGravity ( grav )
	SF.CheckType( self, ents_metatable )
	
	local ent = unwrap( self )
	if not isValid( ent ) then return false, "entity not valid" end
	local phys = getPhysObject( ent )
	if not phys then return false, "entity has no physics object" end
	
	if not SF.Permissions.check( SF.instance.player, ent, "entities.enableGravity" ) then SF.throw( "Insufficient permissions", 2 ) end

	phys:EnableGravity( grav and true or false )
	phys:Wake()
	return true
end

local function ent1or2 ( ent, con, num )
	if not con then return nil end
	if num then
		con = con[ num ]
		if not con then return nil end
	end
	if con.Ent1 == ent then return con.Ent2 end
	return con.Ent1
end

--- Gets what the entity is welded to
function ents_methods:getWeldedTo ()
	local this = unwrap( self )
	if not isValid( this ) then return nil end
	if not constraint.HasConstraints( this ) then return nil end

	return wrap( ent1or2( this, constraint.FindConstraint( this, "Weld" ) ) )
end

--- Returns the position of the bone
-- @param id The ID of the bone to use
-- @return The position of the bone
function ents_methods:getBonePos( id )
	SF.CheckType( self, ents_metatable )
	this = unwrap( self )

	if not SF.Permissions.check( SF.instance.player, this, "entities.getBonePos" ) then SF.throw( "Insufficient permissions", 2 ) end


	local pos, _ = this:GetBonePosition( )
	return SF.WrapObject( pos )
end

--- Sets the position of the bone
-- @param id The ID of the bone to use
-- @param pos The new position of the bone
function ents_methods:setBonePos( id, pos )
	SF.CheckType( self, ents_metatable )
	this = unwrap( self )

	if not SF.Permissions.check( SF.instance.player, this, "entities.setBonePos" ) then SF.throw( "Insufficient permissions", 2 ) end


	local _, ang = this:GetBonePosition( )
	this:SetBonePosition( id, SF.UnwrapObject( pos ), ang )
end

--- Returns the angle of the bone
-- @param id The ID of the bone to use
function ents_methods:getBonePos( id )
	SF.CheckType( self, ents_metatable )
	this = unwrap( self )

	if not SF.Permissions.check( SF.instance.player, this, "entities.getBoneAngles" ) then SF.throw( "Insufficient permissions", 2 ) end

	local _, ang = this:GetBonePosition( )
	return SF.WrapObject( ang )
end

--- Sets the angle of the bone
-- @param id The ID of the bone to use
-- @param ang The new angle of the bone
function ents_methods:setBoneAngles( id, ang )
	SF.CheckType( self, ents_metatable )
	this = unwrap( self )

	if not SF.Permissions.check( SF.instance.player, this, "entities.getBoneAngles" ) then SF.throw( "Insufficient permissions", 2 ) end

	local pos, _ = this:GetBonePosition( )
	this:SetBonePosition( id, pos, SF.UnwrapObject( ang ) )
end