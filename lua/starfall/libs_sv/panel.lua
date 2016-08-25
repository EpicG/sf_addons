MsgN( "- Adding client-side panel libraries to send list" )
l = file.Find( "starfall/libs_cl/panel/*.lua", "LUA" )
for _, filename in pairs( l ) do
	print( "-  Adding " .. filename )
	AddCSLuaFile( "starfall/libs_cl/panel/" .. filename )
end
MsgN( "- End loading client-side panel libraries" )