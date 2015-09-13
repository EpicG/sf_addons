SF.Panel.DCollapsibleCategory = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DCollapsibleCategory", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DCollapsibleCategory.wrap = pwrap
SF.Panel.DCollapsibleCategory.unwrap = punwrap

SF.Panel.DCollapsibleCategory.Methods = this_methods
SF.Panel.DCollapsibleCategory.Metatable = this_metamethods

function this_methods:setExpanded( expanded )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( expanded, "boolean" )

	punwrap( self ).m_bSizeExpanded = expanded
end

function this_methods:getExpanded( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bSizeExpanded
end

--- Sets the start height of the content
--@param height The start height of the content
function this_methods:setStartHeight( height )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( height, "number" )

	punwrap( self ).m_iContentHeight = height
end

--- Gets the start height of the content
--@return The start height of the content
function this_methods:getStartHeight( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_iContentHeight
end

--- Sets the time it takes for the panel to open
--@param time The time in seconds
function this_methods:setAnimTime( time )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( time, "number" )

	punwrap( self ).m_fAnimTime = time
end

--- Gets the time it takes for the panel to open
--@return The time in seconds
function this_methods:getAnimTime( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_fAnimTime
end

--- Sets whether to draw the background
--@param draw True to draw the background
function this_methods:setDrawBackground( draw )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( draw, "boolean" )

	punwrap( self ).m_bDrawBackground = draw
end

--- Gets whether the background is drawn
--@return True if the background is drawn
function this_methods:getDrawBackground( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bDrawBackground
end

--- Sets the padding of the panel
--@param padding The padding of the panel
function this_methods:setPadding( padding )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( padding, "number" )

	punwrap( self ).m_iPadding = padding
end

--- Gets the padding of the panel
--@return The padding of the panel
function this_methods:getPadding( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_iPadding
end

--[[
--- Sets the list
--@param list The list
function this_methods:setList( list )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( list,  )

	punwrap( self ).m_pList = list
end

--- Gets the list
function this_methods:getList( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_pList
end
--]]

--- Adds a button with the supplied name
--@param name The name of the button to add
--@return The button that was created
function this_methods:add( name )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( name, "string" )

	self = punwrap( self )

	--return SF.Panel.wrap( button, "DButton" )
end

--- Deselects all children
function this_methods:unselectAll( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):UnselectAll( )
end

--- Updates all alt lines
function this_methods:updateAltLines( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):UpdateAltLines( )
end

--- Sets the label of the panel
--@param label The new label for the panel
function this_methods:setLabel( label )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( label, "string" )

	punwrap( self ).Header:SetText( label )
end

--- Sets the contents of the panel
--@param contents The new contents of the panel
function this_methods:setContents( contents )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( self, this_metamethods )
end

--- Toggles the state of the panel
function this_methods:toggle( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):Toggle( )
end

function this_methods:doExpansion( b )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( b, "boolean" )

	punwrap( self ):DoExpansion( b )
end

--- Re-formats the layout of the panel
function this_methods:performLayout( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):PerformLayout( )
end

--- Loads the cookies
function this_methods:loadCookies( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):LoadCookies( )
end