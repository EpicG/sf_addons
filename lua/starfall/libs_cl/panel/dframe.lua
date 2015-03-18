SF.Panel.DFrame = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DFrame", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DFrame.wrap = pwrap
SF.Panel.DFrame.unwrap = punwrap

SF.Panel.DFrame.Methods = this_methods
SF.Panel.DFrame.Metatable = this_metamethods

--- Gets whether the frame is part of a derma menu
--@return True if the frame is part of a menu
function this_methods:getIsMenu( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bIsMenuComponent
end

--- Sets whether the frame is part of a derma menu
--@param enable True to make the panel part of a derma menu
function this_methods:setIsMenu( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )
	
	punwrap( self ).m_bIsMenuComponent = enable
end

--- Gets whether the frame is draggable
--@return True if the frame is able to be dragged with the mouse
function this_methods:getDraggable( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bDraggable
end

--- Sets whether the frame is draggable
--@param enable True to enable the mouse to drag the panel around the screen
function this_methods:setDraggable( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )
	
	punwrap( self ).m_bDraggable = enable
end

--- Gets whether the frame is able to be resized
--@return True if the frame is able to be resized
function this_methods:getSizable( )
	SF.CheckType( self, this_metamethods )
	
	return punwrap( self ).m_bSizable
end

--- Sets whether the frame is able to be resized
--@param enable True to enable the resizing of the panel
function this_methods:setSizable( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )
	
	punwrap( self ).m_bSizable = enable
end

--- Gets whether the frame is restricted to the bounds of the screen
--@return True if the frame is restricted
function this_methods:getScreenLock( )
	SF.CheckType( self, this_metamethods )
	
	return punwrap( self ).m_bScreenLock
end

--- Sets whether the frame is restriced to the bounds of the screen
--@param enable True to restrict the panel
function this_methods:setScreenLock( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )
	
	punwrap( self ).m_bScreenLock = enable
end

--- Gets whether the panel is deleted when it is closed
--@return True if the panel will be deleted when it is closed
function this_methods:getDeleteOnClose( )
	SF.CheckType( self, this_metamethods )
	
	return punwrap( self ).m_bDeleteOnClose
end

--- Sets whether the panel is deleted when it is closed
--@param enable True to delete the panel when it is closed
function this_methods:setDeleteOnClose( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )
	
	punwrap( self ).m_bDeleteOnClose = enable
end

--- Gets whether the panel's shadow will be drawn
--@return True if the shadow is drawn
function this_methods:getPaintShadow( )
	SF.CheckType( self, this_metamethods )
	
	return punwrap( self ).m_bPaintShadow
end

--- Sets whether the panel's shadow will be drawn
--@param enable True to enable the drawing of the shadow
function this_methods:setPaintShadow( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )
	
	punwrap( self ).m_bPaintShadow = enable
end

--- Gets the minimum width of the panel
--@return The minimum width
function this_methods:getMinWidth( )
	SF.CheckType( self, this_metamethods )
	
	return punwrap( self ).m_iMinWidth
end

--- Sets the minimum width of the panel
--@param width The minimum width
function this_methods:setMinWidth( width )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( width, "number" )
	
	punwrap( self ).m_iMinWidth = width
end

--- Gets the minimum height of the panel
--@return The minimum height
function this_methods:getMinHeight( )
	SF.CheckType( self, this_metamethods )
	
	return punwrap( self ).m_iMinHeight
end

--- Sets the minimum height of the panel
--@param height The minimum height
function this_methods:setMinHeight( height )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( height, "number" )
	
	punwrap( self ).m_iMinHeight = height
end

--- Gets whether the background is blurred
--@return True if background blur is enabled
function this_methods:getBackgroundBlur( )
	SF.CheckType( self, this_metamethods )
	
	return punwrap( self ).m_bBackgroundBlur
end

--- Sets whether the background is blurred
--@param enable True to enable background blur
function this_methods:setBackgroundBlur( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )
	
	punwrap( self ).m_bBackgroundBlur = enable
end

--- Sets whether the close button in the top left of the panel is shown
--@param enable True to allow the user to see the close button
function this_methods:showCloseButton( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )
	
	punwrap( self ):ShowCloseButton( enable )
end

--- Centers the panel on the screen
function this_methods:center( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):Center( )
end

--- Gets whether the panel is currently focused
--@return True if the panel is active
function this_methods:isActive( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):IsActive( )
end

--- Sets the icon of the panel
--@param icon The icon material
function this_methods:setIcon( icon )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( icon, "string" )

	punwrap( self ):SetIcon( icon )
end

--- Closes the panel, runs the PANEL:onClose function
function this_methods:close( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):Close( )
end

--- Sets the title in the top left of the panel
--@param title The name of the panel
function this_methods:setTitle( title )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( title, "string" )

	punwrap( self ):SetTitle( title )
end