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
