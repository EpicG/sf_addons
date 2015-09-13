-- Add CSLua files in panels directory

local files, _ = file.Find( "starfall/libraries/panel/panels/*.lua", "LUA" )

for _, file in pairs( files ) do
	AddCSLuaFile( "starfall/libraries/panel/panels/" .. file )
end
