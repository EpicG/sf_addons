SF.Panel.AvatarImage = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.AvatarImage", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

SF.Panel.AvatarImage.wrap = pwrap
SF.Panel.AvatarImage.unwrap = punwrap

SF.Panel.AvatarImage.Methods = this_methods
SF.Panel.AvatarImage.Metatable = this_metamethods

local validSize = {
	"16" = true,
	"32" = true,
	"64" = true,
	"84" = true,
	"128" = true,
	"184" = true
}

--- Sets the avatar for the panel
-- @param player The player to use as an avatar
-- @param size the size of avatar to use
-- Sizes can be: 16, 32, 64, 84, 128, and 184
function this_methods:setPlayer( player, size )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( player, SF.Types[ "Player" ] )
	SF.CheckType( size, "number" )

	if not validSize[ tostring( size ) ] then SF.throw( "Invalid panel size", 2 ) return end

	punwrap( self ):SetPlayer( SF.UnwrapObject( player ), size )
end

--- Sets the avatar for the panel via SteamID
-- @param id The 64bit SteamID
-- @param size the size of avatar to use
-- Sizes can be: 16, 32, 64, 84, 128, and 184
function this_methods:setSteamID( id, size )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( id, "string" )
	SF.CheckType( size, "number" )

	punwrap( self ):SetSteamID( id, size )
end