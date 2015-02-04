local ents_lib = SF.Entities.Library
local ents_metatable = SF.Entities.Metatable

--- Entity type
--@class class
--@name Entity
local ents_methods = SF.Entities.Methods
local wrap, unwrap = SF.Entities.Wrap, SF.Entities.Unwrap
local vunwrap = SF.UnwrapObject
local isValid = SF.Entities.IsValid

--- Returns whether the entity is a vehicle or not
-- @shared
-- @return True if vehicle, false if not
function ents_methods:isVehicle( )
	SF.CheckType( self, ents_metamethods )
	local ent = unwrap( self )
	return ent:IsVehicle()
end

--- Sets an entities' bodygroup
-- @shared
-- @class function
-- @param bodygroup Number, The ID of the bodygroup you're setting.
-- @param value Number, The value you're setting the bodygroup to.
-- @return The Entity being modified.
function ents_methods:setBodygroup ( bodygroup, value )
    SF.CheckType( bodygroup, "number" )
    SF.CheckType( value, "number" )

    local ent = unwrap( self )
    if not isValid( ent ) then return nil, "invalid entity" end

    ent:SetBodygroup( bodygroup, value )

    return wrap( ent )
end