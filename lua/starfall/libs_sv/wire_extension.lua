local wlwrap = SF.Wire.WlWrap
local wlunwrap = SF.Wire.WlUnwrap

--- Returns the wirelink for that entity
function SF.Entities.Methods:wirelink( )
	SF.CheckType( self, SF.Entities.Metatable )
	local ent = SF.Entities.Unwrap( self )

	if ent.Outputs then
		local names = {}
		local types = {}
		local descs = {}
		local x = 0
		for k,v in pairs( ent.Outputs ) do
			x = x + 1
			local num = v.Num
			names[num] = v.Name
			if v.Name == "wirelink" then return wlwrap( ent ) end -- we already have a wirelink output, abort
			types[num] = v.Type
			descs[num] = v.Desc
		end
		
		names[x+1] = "wirelink"
		types[x+1] = "WIRELINK"
		descs[x+1] = ""
	
		WireLib.AdjustSpecialOutputs( ent, names, types, descs )
	else
		WireLib.CreateSpecialOutputs( ent, { "wirelink" }, { "WIRELINK" } )
	end

	ent.extended = true
	WireLib.TriggerOutput( ent, "wirelink", ent )

	return wlwrap( ent )
end