SF.Panel.DKillIcon = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DKillIcon", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DKillIcon.wrap = pwrap
SF.Panel.DKillIcon.unwrap = punwrap

SF.Panel.DKillIcon.Methods = this_methods
SF.Panel.DKillIcon.Metatable = this_metamethods

--- Gets the name of the killicon
--@return The name of the killicon
function this_methods:getName( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_Name
end

--- Sets the name of the killicon to use
--@param killicon The name of the killicon
function this_methods:setName( killicon )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( killicon, "string" )

	punwrap( self ).m_Name = killicon
end

--- Resizes the killicon to fit the icon being shown
function this_methods:resizeToContents( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):ResizeToContents( )
end