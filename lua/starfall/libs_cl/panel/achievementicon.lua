SF.Panel.AchievementIcon = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.AchievementIcon", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.AchievementIcon.wrap = pwrap
SF.Panel.AchievementIcon.unwrap = punwrap

SF.Panel.AchievementIcon.Methods = this_methods
SF.Panel.AchievementIcon.Metatable = this_metamethods

--- Sets the achievement to be displayed by AchievementIcon
-- @param id Achievement number ID
function this_methods:setAchievement( id )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( id, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetAchievement( id )
end