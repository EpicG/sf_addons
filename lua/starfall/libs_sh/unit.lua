-------------------------------------------------------------------------------
-- Unit library
-------------------------------------------------------------------------------

--- Unit Library
-- @shared
local unit_library, _ = SF.Libraries.Register( "unit" )

local speed = {
	["u/s"]   = 1 / 0.75,
	["u/m"]   = 60 * (1 / 0.75),
	["u/h"]   = 3600 * (1 / 0.75),

	["mm/s"]  = 25.4,
	["cm/s"]  = 2.54,
	["dm/s"]  = 0.254,
	["m/s"]   = 0.0254,
	["km/s"]  = 0.0000254,
	["in/s"]  = 1,
	["ft/s"]  = 1 / 12,
	["yd/s"]  = 1 / 36,
	["mi/s"]  = 1 / 63360,
	["nmi/s"] = 127 / 9260000,

	["mm/m"]  = 60 * 25.4,
	["cm/m"]  = 60 * 2.54,
	["dm/m"]  = 60 * 0.254,
	["m/m"]   = 60 * 0.0254,
	["km/m"]  = 60 * 0.0000254,
	["in/m"]  = 60,
	["ft/m"]  = 60 / 12,
	["yd/m"]  = 60 / 36,
	["mi/m"]  = 60 / 63360,
	["nmi/m"] = 60 * 127 / 9260000,

	["mm/h"]  = 3600 * 25.4,
	["cm/h"]  = 3600 * 2.54,
	["dm/h"]  = 3600 * 0.254,
	["m/h"]   = 3600 * 0.0254,
	["km/h"]  = 3600 * 0.0000254,
	["in/h"]  = 3600,
	["ft/h"]  = 3600 / 12,
	["yd/h"]  = 3600 / 36,
	["mi/h"]  = 3600 / 63360,
	["nmi/h"] = 3600 * 127 / 9260000,

	["mph"]   = 3600 / 63360,
	["knots"] = 3600 * 127 / 9260000,
	["mach"]  = 0.0254 / 295,
}

local length = {
	["u"]   = 1 / 0.75,

	["mm"]  = 25.4,
	["cm"]  = 2.54,
	["dm"]  = 0.254,
	["m"]   = 0.0254,
	["km"]  = 0.0000254,
	["in"]  = 1,
	["ft"]  = 1 / 12,
	["yd"]  = 1 / 36,
	["mi"]  = 1 / 63360,
	["nmi"] = 127 / 9260000,
}

local weight = {
	["g"]  = 1000,
	["kg"] = 1,
	["t"]  = 0.001,
	["oz"] = 1 / 0.028349523125,
	["lb"] = 1 / 0.45359237,
}

--- Converts value in source units to new unit
-- @param typ The type of the unit to convert from source
-- @param val The value of the source unit
-- @return The converted value
function unit_library.toUnit( typ, val )
	SF.CheckType( typ, "string" )
	SF.CheckType( val, "number" )
	
	if speed[ typ ] then
		return ( val * 0.75 ) * speed[ typ ]
	elseif length[ typ ] then
		return ( val * 0.75 ) * length[ typ ]
	elseif weight[ typ ] then
		return val * weight[ typ ]
	end
end

--- Converts value in typ units to source units
-- @param typ The type of the unit to convert to source
-- @param val The value of the typ unit
-- @return The converted value
function unit_library.fromUnit( typ, val )
	SF.CheckType( typ, "string" )
	SF.CheckType( val, "number" )
	
	if speed[ typ ] then
		return ( val / 0.75 ) / speed[ typ ]
	elseif length[ typ ] then
		return ( val / 0.75 ) / length[ typ ]
	elseif weight[ typ ] then
		return val / weight[ typ ]
	end
end

--- Converts value from typF to typT
-- @param typF The type of the starting unit
-- @param typT The type of the final unit
-- @param val The number to convert
-- @return The converted value
function unit_library.convertUnit( typF, typT, val )
	SF.CheckType( typF, "string" )
	SF.CheckType( typT, "string" )
	SF.CheckType( val, "number" )
	
	if speed[ typF ] and speed[ typT ] then
		return val * (speed[ typT ] / speed[ typF ])
	elseif length[ typF ] and length[ typT ] then
		return val * (length[ typT ] / length[ typF ])
	elseif weight[ typF ] and weight[ typT ] then
		return val * (weight[ typT ] / weight[ typF ])
	end
end