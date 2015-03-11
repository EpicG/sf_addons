SF.Panel.AchievementIcon = {}

local achIcon_methods, achIcon_metamethods = SF.Typedef( "Panel.AchievementIcon", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, achIcon_metamethods )
	return object
end

SF.Panel.AchievementIcon.wrap = pwrap
SF.Panel.AchievementIcon.unwrap = punwrap

SF.Panel.AchievementIcon.Methods = achIcon_methods
SF.Panel.AchievementIcon.Metatable = achIcon_metamethods

--- Sets the achievement to be displayed by AchievementIcon
-- @param id Achievement number ID
function achIcon_methods:setAchievement( id )
	SF.CheckType( self, achIcon_metamethods )
	SF.CheckType( id, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetAchievement( id )
end