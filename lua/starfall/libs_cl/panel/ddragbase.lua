SF.Panel.DDragBase = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DDragBase", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DDragBase.wrap = pwrap
SF.Panel.DDragBase.unwrap = punwrap

SF.Panel.DDragBase.Methods = this_methods
SF.Panel.DDragBase.Metatable = this_metamethods

function this_methods:setDnD( name )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( name, "string" )

	punwrap( self ).m_DNDName = name
end

function this_methods:getDnD( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_DNDName
end

function this_methods:setUseLiveDrag( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ).m_bLiveDrag = enable
end

function this_methods:getUseLiveDrag( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bLiveDrag
end

function this_methods:setDropPos( pos )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( pos, "string" )

	punwrap( self ):SetDropPos( pos )
end