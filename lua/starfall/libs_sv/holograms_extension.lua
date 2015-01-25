local holograms_library = SF.Libraries.Get("holograms")

--- Creates a hologram from table.
-- @server
-- @return The hologram object
function holograms_library.createFromTable ( holoTable )
    SF.CheckType( holoTable, "table" )
    SF.CheckType( holoTable.pos, SF.Types[ "Vector" ] )
    SF.CheckType( holoTable.ang, SF.Types[ "Angle" ] )
    SF.CheckType( holoTable.model, "string" )

    if holoTable.scale then
    	SF.CheckType( holoTable.scale, SF.Types[ "Vector" ] )
	end	

	if holoTable.parent then
		SF.CheckType( holoTable.parent, SF.Types[ "Entity"] )
	end

	if holoTable.angvel then
		SF.CheckType( holoTable.angvel, SF.Types[ "Angle" ] )
	end

	if holoTable.vel then
		SF.CheckType( holoTable.vel, SF.Types[ "Vector" ] )
	end

	if holoTable.bodygroup then
		SF.CheckType( holoTable.bodygroup, "table" )
		SF.CheckType( holoTable.bodygroup[ 1 ], "number" )
		SF.CheckType( holoTable.bodygroup[ 2 ], "number" )
	end

	if holoTable.skin then
		SF.CheckType( holoTable.skin, "number" )
	end

	if holoTable.color then
		SF.CheckType( holoTable.color, SF.Types[ "Color" ] )
	end


	local pos = vunwrap( holoTable.pos )
	local ang = SF.Angles.Unwrap( holoTable.ang )

    local instance = SF.instance
    if not can_spawn( instance ) then return SF.throw( "Can't spawn holograms that often", 2 )
    elseif personal_max_reached( instance ) then return SF.throw( "Can't spawn holograms, maximum personal limit of " .. SF.Holograms.personalquota:GetInt() .. " has been reached", 2 )
    elseif max_reached() then return SF.throw( "Can't spawn holograms, maximum limit of " .. SF.Holograms.defaultquota:GetInt() .. " has been reached", 2 ) end

    local holodata = instance.data.holograms
    local holoent = ents.Create( "starfall_hologram" )
    if holoent and holoent:IsValid() then
        holoent:SetPos( pos )
        holoent:SetAngles( ang )
        holoent:SetModel( holoTable.model )
        holoent:CallOnRemove( "starfall_hologram_delete", hologramOnDestroy, holodata )
        holoent:Spawn()

        if holoTable.scale then
            holoent:SetScale( holoTable.scale )
        end

        if holoTable.parent then
        	holoent:SetParent( SF.Entities.Unwrap( holoTable.parent ) )
        end

        if holoTable.bodygroup then
        	holoent:SetBodygroup( holoTable.bodygroup[ 1 ], holoTable.bodygroup[ 2 ] )
        end

        if holoTable.skin then
        	holoent:SetSkin( holoTable.skin )
        end

        if holoTable.color then
        	holoent:SetColor( holoTable.color )
        	holoent:SetRenderMode( holoTable.color.a == 255 and RENDERMODE_NORMAL or RENDERMODE_TRANSALPHA )
        end

        local holo = SF.Entities.Wrap( holoent )

        if holoTable.angvel then
        	holo:SetAngVel( holoTable.angvel )
        end

        if holoTable.vel then
        	holo:SetVel( holoTable.vel )
        end

        holodata.holos[ holo ] = holo
        holodata.count = holodata.count + 1

        plyCount[ instance.player ] = plyCount[ instance.player ] + 1
        return holo
        -- TODO: Need to fire a umsg here to assign clientside ownership(?)
    end
end
