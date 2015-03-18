SF.Panel.DTab = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DTab", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DTab.wrap = pwrap
SF.Panel.DTab.unwrap = punwrap

SF.Panel.DTab.Methods = this_methods
SF.Panel.DTab.Metatable = this_metamethods

function this_methods:setPropertySheet( sheet )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( sheet, SF.Panel.DPropertySheet.Metatable )

	punwrap( self ):SetPropertySheet( punwrap( sheet ) )
end

function this_methods:getPropertySheet( )
	SF.CheckType( self, this_metamethods )

	return SF.Panel.wrap( punwrap( self ).m_pPropertySheet, "DPropertySheet" )
end

function this_methods:setPanel( panel )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( panel, SF.Panel.Panel.Metatable )

	local class = string.gsub( getmetatable( panel ), "Panel.", "", 1 )

	self.m_pPanel = punwrap( panel )
	self.m_pPanel.sfclass = class
end

function this_methods:getPanel( )
	SF.CheckType( self, this_metamethods )

	local panel = punwrap( self ).m_pPanel
	return SF.Panel.wrap( panel, panel.sfclass )
end

function this_methods:isActive( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):IsActive( )
end

