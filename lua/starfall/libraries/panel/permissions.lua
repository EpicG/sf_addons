local P = {}

local function check ( player, node, entity )
	if entity:GetOwner() == player then
		return SF.Permissions.hasNode( player, node .. ".self" )
	end

	return SF.Permissions.hasNode( player, node .. ".other" )
end

function P.check ( player, node, entities )
	if type( entities ) == "table" then
		for k, v in pairs( entities ) do
			if not check( player, node, v ) then
				return false
			end
		end
		return true
	end

	return check( player, node, entities )
end

SF.Permissions.registerProvider( P )
