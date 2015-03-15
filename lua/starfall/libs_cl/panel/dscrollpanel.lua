SF.Panel.DScrollPanel = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DScrollPanel", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

SF.Panel.DScrollPanel.wrap = pwrap
SF.Panel.DScrollPanel.unwrap = punwrap

SF.Panel.DScrollPanel.Methods = this_methods
SF.Panel.DScrollPanel.Metatable = this_metamethods

function this_methods:setPadding( padding )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( padding, "number" )

	punwrap( self ).Padding = padding
end

function this_methods:getPadding( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).Padding
end

--[[
function this_methods:setCanvas( panel )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( panel, SF.Panel.Panel.Metatable )

	punwrap( self ).pnlCanvas = punwrap( panel )
end

function this_methods:getCanvas( )
	SF.CheckType( self, this_metamethods )

	return SF.Panel.wrap( punwrap( self ).pnlCanvas )
end
--]]

function this_methods:addItem( panel )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( panel, SF.Panel.Panel.Metatable )

	punwrap( self ):AddItem( punwrap( panel ) )
end

function this_methods:sizeToContents( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):SizeToContents( )
end

function this_methods:innerWidth( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):InnerWidth( )
end

function this_methods:rebuild( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):Rebuild( )
end

function this_methods:scrollToChild( panel )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( panel, SF.Panel.Panel.Metatable )

	punwrap( self ):ScrollToChild( punwrap( panel ) )
end

function this_methods:clear( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):Clear( )
end