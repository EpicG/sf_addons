SF.Panel.DPropertySheet = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DPropertySheet", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DPropertySheet.wrap = pwrap
SF.Panel.DPropertySheet.unwrap = punwrap

SF.Panel.DPropertySheet.Methods = this_methods
SF.Panel.DPropertySheet.Metatable = this_metamethods

function this_methods:setActiveTab( tab )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( tab, this_metamethods )

	punwrap( self ):SetActiveTab( punwrap( tab ) )
end

function this_methods:getActiveTab( )
	SF.CheckType( self, this_metamethods )

	return SF.Panel.DTab.wrap( punwrap( self ).m_pActiveTab )
end

function this_methods:setPadding( padding )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( padding, "number" )

	punwrap( self ).m_iPadding = padding
end

function this_methods:getPadding( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_iPadding
end

function this_methods:setFadeTime( time )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( time, "number" )

	punwrap( self ).m_fFadeTime = time
end

function this_methods:getFadeTime( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_fFadeTime
end

function this_methods:setShowIcons( show )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( show, "boolean" )

	punwrap( self ).m_bShowIcons = show
end

function this_methods:getShowIcons( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bShowIcons
end

function this_methods:addSheet( label, panel, material, stretchX, stretchY, tooltip )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( label, "string" )
	SF.CheckType( panel, SF.Panel.Panel.Metatable )
	if material then SF.CheckType( material, "string") end
	if stretchX then SF.CheckType( stretchX, "boolean" ) else stretchX = false end
	if stretchY then SF.CheckType( stretchY, "boolean" ) else stretchY = false end
	if tooltip then SF.CheckType( tooltip, "string" ) else tooltip = "" end

	local sheet = punwrap( self ):AddSheet( label, punwrap( panel ), material, not stretchX, not stretchY, tooltip )
	sheet.tab = SF.Panel.wrap( sheet.tab, "DTab" )
	local tmpPan = sheet.panel
	sheet.panel = panel
	rawset( sheet.panel, "NoStretchX", tmpPan.NoStretchX )
	rawset( sheet.panel, "NoStretchY", tmpPan.NoStretchY )

	return sheet
end

function this_methods:setActiveTab( active )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( active, SF.Panel.DTab.Metatable )

	punwrap( self ):SetActiveTab( punwrap( active ) )
end

function this_methods:sizeToContentWidth( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):SizeToContentWidth( )
end

function this_methods:switchToName( name )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( name, "string" )

	punwrap( self ):SwitchToName( name )
end

function this_methods:setupCloseButton( func )
	SF.CheckType( self, this_metamethods )
	if func then SF.CheckType( func, "function" ) end

	self = punwrap( self )

	self.CloseButton = self.tabScroller:Add( "DImageButton" )
	self.CloseButton:SetImage( "icon16/circlecross.png" )
	self.CloseButton:SetColor( Color( 10, 10, 10, 200 ) );
	self.CloseButton:DockMargin( 0, 0, 0, 8 )
	self.CloseButton:SetWide( 16 )
	self.CloseButton:Dock( RIGHT )

	if func then
		local instance = SF.instance
		self.CloseButton.DoClick = function( )
			local oldInst = SF.instance
			SF.instance = instance
			func( )
			SF.instance = instance
		end
	end
end

function this_methods:closeTab( tab, removePanelToo )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( tab, SF.Panel.DTab.Metamethods )
	SF.CheckType( removePanelToo, "boolean" )

	punwrap( self ):CloseTab( punwrap( tab ), removePanelToo )
end

