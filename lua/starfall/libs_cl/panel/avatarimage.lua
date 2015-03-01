SF.Panel.AvatarImage = {}

local avatarImg_methods, avatarImg_metamethods = SF.Typedef( "Panel.AvatarImage", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, avatarImg_metamethods )
	return object
end

SF.Panel.AvatarImage.wrap = pwrap
SF.Panel.AvatarImage.unwrap = punwrap

SF.Panel.AvatarImage.Methods = avatarImg_methods
SF.Panel.AvatarImage.Metatable = avatarImg_metamethods
