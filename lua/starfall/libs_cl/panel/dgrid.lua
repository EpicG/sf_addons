SF.Panel.DGrid = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DGrid", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

SF.Panel.DGrid.wrap = pwrap
SF.Panel.DGrid.unwrap = punwrap

SF.Panel.DGrid.Methods = this_methods
SF.Panel.DGrid.Metatable = this_metamethods

--- Sets the number of columns
--@param cols Number of columns
function this_methods:setCols( cols )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( cols, "number" )

	punwrap( self ).m_iCols = cols
end

--- Gets the number of columns
--@return The number of columns
function this_methods:getCols( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_iCols
end

--- Sets the width of each column
--@param width The width of each column
function this_methods:setColWide( width )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( width, "number" )

	punwrap( self ).m_iColWide = width
end

--- Gets the width of each column
--@return The width of each column
function this_methods:getColWide( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_iColWide
end

--- Sets the height of each row
--@param height The height of each row
function this_methods:setRowHeight( height )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( height, "number" )
	
	punwrap( self ).m_iRowHeight = height
end

--- Gets the height of each row
--@return The height of each row
function this_methods:getRowHeight( )
	SF.CheckType( self, this_metamethods )
	
	return punwrap( self ).m_iRowHeight
end

--- Adds an item to the grid
--@param item The panel to add to the grid
function this_methods:addItem( item )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( item, SF.Panel.Panel.Metatable )

	punwrap( self ):AddItem( punwrap( item ) )
end

--- Removes an item from the grid
--@param item The panel to remove fromt he grid
--@param remove True to mark the panel for removal
function this_methods:removeItem( item, remove )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( item, SF.Panel.Panel.Metatable )

	punwrap( self ):RemoveItem( punwrap( item ), remove ~= true )
end