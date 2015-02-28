--TODO: unwrap panel:OnDrop return
--TODO: delete created panels upon termination / update of starfall entity

SF.Panel = {}

local panel_methods, panel_metamethods = SF.Typedef( "Panel" )
local pwrap, punwrap = SF.CreateWrapper( panel_metamethods, true, true, debug.getregistry().Panel )

SF.Panel.Methods = panel_methods
SF.Panel.Metatable = panel_metamethods

SF.Panel.wrap = pwrap
SF.Panel.unwrap = punwrap

local function incPanel( name )
	print( "-   Loading panel/" .. name .. ".lua" )
	include( "starfall/libs_cl/panel/" .. name .. ".lua" )
end

do
	local P = SF.Permissions
	P.registerPrivilege( "panel.access", "Panel Access", "Allows the user to have access to panels" )
	incPanel( "dframe" )
end

function panel_metamethods.__newindex( t, k, v )
	if type( v ) == "function" then
		local instance = SF.instance
		punwrap( t )[ k ] = function( )
			local oldInstance = SF.instance
			SF.instance = instance
			v( )
			SF.instance = oldInstance
		end
	else
		t[ k ] = v
	end
end

SF.Panel.insts = {}
local insts = SF.Panel.insts
SF.Panel.plyCount = {}
local plyCount = SF.Panel.plyCount

SF.Libraries.AddHook("initialize",function(inst)
	inst.data.panels = {
		panels = {},
		count = 0
	}

	insts[ inst ] = true
	plyCount[ inst.player ] = plyCount[ inst.player ] or inst.data.panels.count
end)

SF.Libraries.AddHook("deinitialize", function(inst)
	local panels = inst.data.panels.panels
	for panel, _ in pairs( panels ) do
		if IsValid( punwrap( panel ) ) then
			punwrap( panel ):Remove( )
		end
		panels[ panel ] = nil
	end
	plyCount[ inst.player ] = plyCount[ inst.player ] - inst.data.panels.count
	inst.data.panels.count = 0

	insts[ inst ]= nil
end)

--- Adds the specified object to the panel
-- @param panel The panel to be added.
-- @return The new panel object
function panel_methods:add( panel )
    SF.CheckType( self, panel_metamethods )
    SF.CheckType( panel, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

    return pwrap( punwrap( self ):Add( punwrap( panel ) ) )
end

--- Aligns the panel to the bottom of its parent
-- @param offset The offset from the bottom of the parent
function panel_methods:alignBottom( offset )
    SF.CheckType( self, panel_metamethods )
	if offset then SF.CheckType( offset, "number" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

    punwrap( self ):AlignBottom( offset )
end

--- Alligns the panel to the left of its parent
-- @param offset The offset from the left of the parent
function panel_methods:alignLeft( offset )
    SF.CheckType( self, panel_metamethods )
	if offset then SF.CheckType( offset, "number" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

    punwrap( self ):AlignLeft( offset )
end

--- Alligns the panel to the right of its parent
-- @param offset The offset from the right of the parent
function panel_methods:alignRight( offset )
    SF.CheckType( self, panel_metamethods )
	if offset then SF.CheckType( offset, "number" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

    punwrap( self ):AlignRight( offset )
end

--- Alligns the panel to the top of its parent
-- @param offset The offset from the top of the parent
function panel_methods:alignTop( offset )
    SF.CheckType( self, panel_metamethods )
    if offset then SF.CheckType( offset, "number" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

    punwrap( self ):AlignTop( offset )
end

--- Uses animation to transition the current alpha value of a panel to a new alpha over a set period of time after a specified delay
-- @param alpha The alpha value to approach
-- @param duration The time in seconds it should take for the transition
-- @param delay The time before the animation starts ( optional )
-- @param callback Function to call upon animation finish
-- Args:
-- animData - The AnimationData structure that was used ( Not yet implemented )
-- panel	- The panel that was moved
function panel_methods:alphaTo( alpha, duration, delay, callback )
    SF.CheckType( self, panel_metamethods )
    SF.CheckType( alpha, "number" )
    SF.CheckType( duration, "number" )
	if delay then SF.CheckType( delay, "number" ) end
	if callback then SF.CheckType( callback, "function" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	local instance = SF.instance
    punwrap( self ):AlphaTo( alpha, duration, delay, function( animData, panel )
		if callback then
			local oldInstance = SF.instance
			SF.instance = instance
			callback( {}, pwrap( panel ) ) --TODO: Wrap animData
			SF.instance = oldInstance
		end
    end )
end

--- Retuns the systime value when all animations for this panel will end
-- @return The system time when all animations will end
function panel_methods:animTail( )
    SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):AnimTail( )
end

--- Appends text to a RichText element
-- @param text The text to append
function panel_methods:appendText( text )
    SF.CheckType( self, panel_metamethods )
    SF.CheckType( text, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

    punwrap( self ):AppendText( text )
end

--- Centers the panel to its parent
function panel_methods:center( )
    SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

    punwrap( self ):Center( )
end

--- Centers the panel horizontally with the specified fraction
-- @param fraction The center fraction
function panel_methods:centerHorizontal( fraction )
    SF.CheckType( self, panel_metamethods )
    SF.CheckType( fraction, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

    punwrap( self ):CenterHorizontal( fraction )
end

--- Centers the panel vertically with the specified fraction
-- @param fraction The center fraction
function panel_methods:centerVertical( fraction )
    SF.CheckType( self, panel_metamethods )
    SF.CheckType( fraction, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

    punwrap( self ):CenterVertical( fraction )
end

--- Returns the amount of panels parented to the panel
-- @return Number of panels parented
function panel_methods:childCount( )
    SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):ChildCount( )
end

--- Returns the width and height of the space between the position of the panel (upper-left corner) and the max bound of the children panels (farthest reaching lower-right corner)
-- @return width, height taken up by the children
function panel_methods:childrenSize()
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):ChildrenSize( )
end

--- Marks all children for deletion
function panel_methods:clear( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):Clear( )
end

--- Transitions panel's color to supplied color, will not work if the panel does not have a setColor function
-- @param color The color to transition to
-- @param duration The duration of the transition
-- @param delay How long to wait before transitioning
-- @param callback Function called when transition finishes
function panel_methods:colorTo( color, duration, delay, callback )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( color, SF.Types[ "Color" ] )
	SF.CheckType( duration, "number" )
	if delay then SF.CheckType( delay, "number" ) end
	if callback then SF.CheckType( callback, "function" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	local instance = SF.instance
	punwrap( self ):ColorTo( color, duration, delay, function( animData, panel )
		if callback then
			local oldInstance = SF.instance
			SF.instance = instance
			callback( {}, pwrap( panel ) ) --TODO: Wrap animData
			SF.instance = oldInstance
		end
	end )
end

--- Sends an action command signal to the panel. Response handled by Panel:ActionSignal function
-- @param command The command to send to the panel
function panel_methods:command( command )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( command, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):Command( command )
end

--TODO: conVar functions

--- Gets the size, position and dock state of the passed panel, and applies it to this one
-- @param src The panel to copy base from
function panel_methods:copyBase( src )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( src, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):CopyBase( punwrap( src ) )
end

--- Gets the size and position of the passed panel, and applies it to this one
-- @param src The panel to copy bounds from
function panel_methods:copyBounds( src )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( src, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):CopyBounds( punwrap( src ) )
end

--- Gets the height of the passed panel, and applies it to this one
-- @param src The panel to copy height from
function panel_methods:copyHeight( src )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( src, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):CopyHeight( punwrap( src ) )
end

--- Gets the position of the passed panel, and applies it to this one
-- @param src The panel to copy position from
function panel_methods:copyPos( src )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( src, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):CopyPos( punwrap( src ) )
end

--- Gets the width of the passed panel, and applies it to this one
-- @param src The panel to copy width from
function panel_methods:copyWidth( src )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( src, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):CopyWidth( punwrap( src ) )
end

--- Returns the cursor position relative to the top left of the panel
-- @return x, y coordinates of the cursor relative to the top left of the panel
function panel_methods:cursorPos( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):CursorPos( )
end

--- Resets the panel's setPos method and removes the animation table. To use a lerp animation again, call Panel:stop()
-- @usage
-- panel:DisableLerp()
-- panel:Stop()
-- panel.SetPosReal = nil
function panel_methods:disableLerp( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):DisableLerp( )
end

--- Returns the linear distance from the center of this panel to the center of the specified panel
-- @param target The panel to find the distance to
-- @return Linear distance between the centers of the two panels
function panel_methods:distance( target )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( target, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):Distance( target )
end

--- Returns the linear distance from the center of this panel to the specified point
-- @param x The x coordinate to find the distance to, local to the parent panel
-- @param y The y coordinate to find the distance to, local to the parent panel
-- @return Linear distance between the center of this panel to the specified point
function panel_methods:distanceFrom( target )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( target, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):DistanceFrom( target )
end

--- Sets the dock type of the panel
-- @param dockType Dock type using the supplied ENUMs
-- @usage
-- /- 0		NODOCK		Don't dock
-- /- 1		FILL		Fill parent panel
-- /- 2		LEFT		Dock to the left
-- /- 3		RIGHT		Dock to the right
-- /- 4		TOP			Dock to the top
-- /- 5		BOTTOM		Dock to the bottom
function panel_methods:dock( dockType )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( dockType, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):Dock( dockType )
end

--- Sets the dock margin of the panel
--- The dock margin is the extra space that will be left around the edge when the panel is docked inside its parent
-- @param marginLeft The left margin
-- @param marginTop The top margin
-- @param marginRight The right margin
-- @param marginBottom The bottom margin
function panel_methods:dockMargin( marginLeft, marginTop, marginRight, marginBottom )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( marginLeft, "number" )
	SF.CheckType( marginTop, "number" )
	SF.CheckType( marginRight, "number" )
	SF.CheckType( marginBottom, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):DockMargin( marginLeft, marginTop, marginRight, marginBottom )
end

--- Sets the dock padding of the panel
--- The dock padding is the extra space that will be left around the edge when child panels are docked inside this panel
-- @param paddingLeft The left margin
-- @param paddingTop The top margin
-- @param paddingRight The right margin
-- @param paddingBottom The bottom margin
function panel_methods:dockMargin( paddingLeft, paddingTop, paddingRight, paddingBottom )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( paddingLeft, "number" )
	SF.CheckType( paddingTop, "number" )
	SF.CheckType( paddingRight, "number" )
	SF.CheckType( paddingBottom, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):DockPadding( paddingLeft, paddingTop, paddingRight, paddingBottom )
end

--- Makes the panel "lock" to the screen until it is removed
-- @param doModal Sets to lock or unlock
function panel_methods:doModal( doModal )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( doModal, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):DoModal( doModal )
end

--[[
--TODO: Determine what the table return contains
--- Makes this panel dropable. This is used with panel.receiver to create drag and drop events.
-- @param name Name of the dropable panel
function panel_methods:droppable( name )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( name, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):Droppable( name )
end
--]]

--- Completes a box selection
-- @return Whether the end point of the selection box was within the selection canvas.
function panel_methods:endBoxSelection( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):EndBoxSelection( )
end

--- Searches children for a panel with the given name
-- @param panelName The name of the panel to search for
-- @return The found panel object
function panel_methods:find( panelName )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( panelName, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return pwrap( punwrap( self ):Find( panelName ) )
end

--- Sets the focus to the next panel in the focus queue
function panel_methods:focusNext( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):FocusNext( )
end

--- Sets the focus to the previous panel in the focus queue
function panel_methods:focusPrevious( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):FocusPrevious( )
end

--- Gets the alpha multiplier of the panel
-- @return Alpha multiplier
function panel_methods:getAlpha( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetAlpha( )
end

--- Returns the size of the panel
-- @return X coordinate relative to its parent
-- @return Y coordinate relative to its parent
-- @return Width of the panel
-- @return Height of the panel
function panel_methods:getBounds( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetBounds( )
end

--- Returns the position of the caret ( text cursor ) in a text-based panel
-- @return The caret position from the start of the text
function panel_methods:getCaretPos( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetCaretPos( )
end

--- Gets a child by its index
-- @param index The index of the child panel
-- @return The child panel
function panel_methods:getChild( index )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return pwrap( punwrap( self ):GetChild( index ) )
end

--TODO: Figure out getChildPosition

--- Returns a table composed of all child panels
-- @return Table of child panels
function panel_methods:getChildren( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	local children = punwrap( self ):GetChildren( )

	for k, v in pairs( children ) do --Wraps all panels in the table of children to prevent an escape from the sandbox
		children[ k ] = pwrap( v )
	end

	return children
end

--- Returns a table composed of all child panels
-- @param x top left x coordinate
-- @param y top left y coordinate
-- @param w width of search box
-- @param h height of search box
-- @return Table of child panels
function panel_methods:getChildrenInRect( x, y, w, h )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( x, "number" )
	SF.CheckType( y, "number" )
	SF.CheckType( w, "number" )
	SF.CheckType( h, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	local children = punwrap( self ):GetChildrenInRect( x, y, w, h )

	for k, v in pairs( children ) do --Wraps all panels in the table of children to prevent an escape from the sandbox
		children[ k ] = pwrap( v )
	end

	return children
end

--- Returns the class name of the panel
-- @return Class name
function panel_methods:getClassName( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetClassName( )
end

--- Returns the child closest to this point
-- @param x Horizontal position of search
-- @param y Vertical position of the search
-- @return Closest panel to the cooridnates given
-- @return Distance from center of found panel to coordinates
function panel_methods:getClosestChild( x, y )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( x, "number" )
	SF.CheckType( y, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	local panel, distance = punwrap( self ):GetClosestChild( x, y )
	return pwrap( panel ), distance
end

--- Gets the size of the content / children within a panel. Only works with DLabel objects ( Blame Garry )
-- @return Width of the content
-- @return Height of the content
function panel_methods:getContentSize( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetContentSize( )
end

--- Returns a dock enum for the panel's dock type
-- @return The dock enum
function panel_methods:getDock( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetDock( )
end

--- Returns the font name that text is rendered with
-- @return Font name
function panel_methods:getFont( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetFont( )
end

--- Returns the name of the panel
-- @return Panel name
function panel_methods:getName( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetName( )
end

--- Returns the number of lines in a RichText
-- @return Number of lines
function panel_methods:getNumLines( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetNumLines( )
end

--- Returns the parent panel
-- @return Parent panel
function panel_methods:getParent( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return pwrap( punwrap( self ):GetParent( ) )
end

--- Returns the position of the panel relative to its parent
-- @return X coordinate
-- @return Y coordinate
function panel_methods:getPos( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetPos( )
end

--TODO: figure out method for getSelectedChildren

--- Returns the panel object if it has been enabled as a canvas
-- @return Panel object ( when canvas enabled ) or nil
function panel_methods:getSelectionCanvas( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	local canvas = punwrap( self ):GetSelectionCanvas( )
	if canvas then return pwrap( canvas ) else return nil end
end

--- Returns the size of the panel
-- @return Width of the panel
-- @return Height of teh panel
function panel_methods:getSize( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetSize( )
end

--- Returns the height of the panel
-- @return Hight of the panel
function panel_methods:getTall( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetTall( )
end

--- Returns the panel's text where applicable
-- @return The text of the panel, max of 1023 bytes
function panel_methods:getText( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetText( )
end

--- Returns left and top margins of the text-based panel
-- @return Left margin of the text
-- @return Right margin of the text
function panel_methods:getTextInset( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetTextInset( )
end

--- Returns the text size of the text within a DLabel
-- @return Width of the text
-- @return Height of the text
function panel_methods:getTextSize( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetTextSize( )
end

--- Returns the value the panel holds
-- @return The value the panel holds
function panel_methods:getValue( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	local ret = punwrap( self ):GetValue( )
	return SF.WrapObject( ret ) or ret
end

--- Returns the width of the panel
-- @return Width of the panel
function panel_methods:getWide( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):GetWide( )
end

--- Forces RichText to scroll to the bottom of its text
function panel_methods:gotoTextEnd( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):GotoTextEnd( )
end

--- Forces RichText to scroll to the top of its text
function panel_methods:gotoTextStart( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):GotoTextStart( )
end

--- Returns whether the panel has children
-- @return True if the panel has any children
function panel_methods:hasChildren( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):HasChildren( )
end

--- Returns whether the panel is currently focused
-- @return True if the panel is focused
function panel_methods:hasFocus( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):HasFocus( )
end

--- Returns whether the panel or any of its children are currently focused
-- @return True if the panel or any children are focused
function panel_methods:hasHierarchicalFocus( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):HasHierarchicalFocus( )
end

--- Returns whether the panel is a descendant of the supplied panel
-- @return True if the panel supplied is a parent of the panel
function panel_methods:hasParent( panel )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( panel, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):HasParent( panel )
end

--- Makes a panel invisible
function panel_methods:hide( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):Hide( )
end

--- Marks the end of a clickable RichText segment; Start with panel:insertClickableTextStart( )
function panel_methods:insertClickableTextEnd( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):InsertClickableTextEnd( )
end

--- Marks the start of a clickable RichText segment; End with panel:insertClickableTextEnd( )
function panel_methods:insertClickableTextStart( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):InsertClickableTextStart( )
end

--- Inserts a color change in a RichText element
--- all text inserted with panel:appendText will be this color until another color change is applied
-- @param Color to change RichText to
function panel_methods:insertColorChange( color )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( color, SF.Types[ "Colors" ] )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):InsertColorChange( color.r, color.g, color.b, color.a )
end

--- Begins a text fade for a RichText element where the last appended text segment will be the one to fade
-- @param sustain The amount of time that the text will be visible
-- @param length The number of seconds it takes for the text to fade out
-- If set LOWER than delay, the text will begin fading once ( remain - length ) seconds have passed
-- If set HIGHER than delay, the text will begin fading right away
-- If set to -1, the text will not fade at all
function panel_methods:insertFade( sustain, length )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( sustain, "number" )
	SF.CheckType( length, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):InsertFade( sustain, length )
end

--- Invalidates the layout of this panel object and all its children. This will cause these objects to re-layout immediately, calling panel:performLayout.
-- @param recursive If true, ALL children ( and sub-children ) will be invalidated. False by default
function panel_methods:invalidateChildren( recursive )
	SF.CheckType( self, panel_metamethods )
	if recursive then SF.CheckType( recursive, "boolean" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):InvalidateChildren( recursive or false )
end

--- Causes the panel to re-layout next frame
-- @param layoutNow If true, the panel will re-layout now instead of waiting for the next frame. False by default
function panel_methods:invalidateLayout( layoutNow )
	SF.CheckType( self, panel_metamethods )
	if layoutNow then SF.CheckType( layoutNow, "boolean" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):InvalidateLayout( layoutNow or false )
end

--- Causes the parent panel to re-layout next frame
-- @param layoutNow If true, the parent panel will re-layout now instead of waiting for the next frame. False by default
function panel_methods:invalidateParent( layoutNow )
	SF.CheckType( self, panel_metamethods )
	if layoutNow then SF.CheckType( layoutNow, "boolean" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):InvalidateParent( layoutNow or false )
end

--- Determins whether the mouse cursor is hovered over one of this panel object's children.
-- @param depth How far to look through children, set to 1 to check only immediate children
-- @return True of a child panel is being hovered over
function panel_methods:isChildHovered( depth )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( depth, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):IsChildHovered( depth )
end

--- Returns whether the panel is draggable
-- @return True if the panel is able to be dragged by the user
function panel_methods:isDraggable( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):IsDraggable( )
end

--- Returns whether the panel is being dragged
-- @return True if the panel is being dragged.
function panel_methods:isDragging( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):IsDragging( )
end

--- Returns whether the panel is being hovered over
-- @return True if the cursor is over the panel
function panel_methods:isHovered( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):IsHovered( )
end

--- Returns whether the panel can receive keyboard input
-- @return True if keyboard input is enabled
function panel_methods:isKeyboardInputEnabled( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):IsKeyboardInputEnabled( )
end

--- Returns whether an HTML or DHTML element is currently loading
-- @return True if the element is loading
function panel_methods:isLoading( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):IsLoading( )
end

--- Returns whether a panel is going to be deleted next frame
-- @return True if the panel will be deleted
function panel_methods:isMarkedForDeletion( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):IsMarkedForDeletion( )
end

--- Returns whether the panel can receive mouse input
-- @return True if mouse input is enabled
function panel_methods:isMouseInputEnabled( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):IsMouseInputEnabled( )
end

--- Returns whether a text-based panel is in multi-line mode; Use panel:setMultiline( true ) to enable
-- @return True if the text-based panel is in multi-line mode
function panel_methods:isMultiline( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):IsMultiline( )
end

--- Returns whether the panel is selectable, like icons in the spawn menu while holding shift.
-- @return True if the panel is selectable
function panel_methods:isSelectable( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):IsSelectable( )
end

--- Returns whether the panel is selected
-- @return True if the panel is selected
function panel_methods:isSelected( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):IsSelected( )
end

--- Returns whether the panel is a selection canvas
-- @return True if the panel is a selection canvas
function panel_methods:isSelectionCanvas( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):IsSelectionCanvas( )
end

--- Returns whether the panel is valid and not marked for deletion
-- @return True if the panel is valid
function panel_methods:isValid( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):IsValid( )
end

--- Returns whether the panel is visible
-- @return True if the panel is visible
function panel_methods:isVisible( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):IsVisible( )
end

--- Remove focus from the panel
function panel_methods:killFocus( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):KillFocus( )
end

--- Modifies panel:setPos to Lerp between points. Will not operate while game is paused.
-- @param speed The speed at which to move the panel
-- @param easeOut This causes the panel to 'jump' at the target, slowing as it approaches. False by default
function panel_methods:lerpPositions( speed, easeOut )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( speed, "number" )
	if easeOut then SF.CheckType( easeOut, "boolean" ) else easeOut = false end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):LerpPositions( speed, easeOut )
end

--- Returns the cursor position relative to the position of the panel
-- @return X coordinate
-- @return Y coordinate
function panel_methods:localCursorPos( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):LocalCursorPos( )
end

--- Converts local pos to screen coordinates
-- @param x The panel x coordinate
-- @param y The panel y coordinate
-- @return The screen x coordinate
-- @return The screen y coordinate
function panel_methods:localToScreen( x, y )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( x, "number" )
	SF.CheckType( y, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):LocalToScreen( x, y )
end

--- Sets the focus to the panel and enables input
function panel_methods:makePopup( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):MakePopup( )
end

--- Allows the panel to receive mouse input even if the cursor is outside of the panel
-- @param doCapture Set to true to enable
function panel_methods:mouseCapture( doCapture )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( doCapture, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):MouseCapture( doCapture )
end

--- Places the panel above the passed panel, with the specified offset
-- @param panel Panel to position relatve to
-- @param offset The allign offset
function panel_methods:moveAbove( panel, offset )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( panel, panel_metamethods )
	SF.CheckType( offset, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):MoveAbove( panel, offset )
end

--- Places the panel below the passed panel, with the specified offset
-- @param panel Panel to position relatve to
-- @param offset The allign offset
function panel_methods:moveBelow( panel, offset )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( panel, panel_metamethods )
	SF.CheckType( offset, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):MoveBelow( panel, offset )
end

--- Moves the panel by the specified coordinates using animation
-- @param x The x distance to move by
-- @param y The y distance to move by
-- @param time The duration of the animation
-- @param delay Number of seconds to pass before begining animation. 0 by default
-- @param ease The easing of the start and/or end speed of the animation. -1 by default
-- @param callback Function to call upon animation finish
-- Args:
-- animData - The AnimationData structure that was used ( Not yet implemented )
-- panel	- The panel that was moved
function panel_methods:moveBy( x, y, time, delay, ease, callback )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( x, "number" )
	SF.CheckType( y, "number" )
	SF.CheckType( time, "number" )
	if delay then SF.CheckType( delay, "number" ) else delay = 0 end
	if ease then SF.CheckType( ease, "number" ) else ease = -1 end
	if callback then SF.CheckType( callback, "function" ) else callback = nil end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	local instance = SF.instance
	punwrap( self ):MoveBy( x, y, time, delay, ease, function( animData, panel )
		if callback then
			local oldInstance = SF.instance
			SF.instance = instance
			callback( {}, pwrap( panel ) ) --TODO: Wrap animData
			SF.instance = oldInstance
		end
	end	)
end

--- Places the panel left of the passed panel with the specified offset
-- @param panel Panel to position relative to
-- @param offset The align offset
function panel_methods:moveLeftOf( panel, offset )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( panel, panel_metamethods )
	SF.CheckType( offset, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):MoveLeftOf( punwrap( panel ), offset )
end

--- Places the panel right of the passed panel with the specified offset
-- @param panel Panel to position relative to
-- @param offset The align offset
function panel_methods:moveRightOf( panel, offset )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( panel, panel_metamethods )
	SF.CheckType( offset, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):MoveRightOf( punwrap( panel ), offset )
end

--- Moves the panel by the specified coordinates using animation
-- @param x The x distance to move by
-- @param y The y distance to move by
-- @param time The duration of the animation
-- @param delay Number of seconds to pass before begining animation. 0 by default
-- @param ease The easing of the start and/or end speed of the animation. -1 by default
-- @param callback Function to call upon animation finish
-- Args:
-- animData - The AnimationData structure that was used ( Not yet implemented )
-- panel	- The panel that was moved
function panel_methods:moveTo( x, y, time, delay, ease, callback )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( x, "number" )
	SF.CheckType( y, "number" )
	SF.CheckType( time, "number" )
	if delay then SF.CheckType( delay, "number" ) else delay = 0 end
	if ease then SF.CheckType( ease, "number" ) else ease = -1 end
	if callback then SF.CheckType( callback, "function" ) else callback = nil end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	local instance = SF.instance
	punwrap( self ):MoveTo( x, y, time, delay, ease, function( animData, panel )
		if callback then
			local oldInstance = SF.instance
			SF.instance = instance
			callback( {}, pwrap( panel ) ) --TODO: Wrap animData
			SF.instance = oldInstance
		end
	end	)
end

--- Moves this panel in front of the specified sibling in the render order
-- @param panel The sibling panel to move this in front of. Must be a child of the same parent panel
-- @return False if the panel is not a sibling, otherwise nil
function panel_methods:moveToAfter( panel )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( panel, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):MoveToAfter( punwrap( panel ) )
end

--- Moves the panel behind all other panels on screen.
function panel_methods:moveToBack( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):MoveToBack( )
end

--- Moves this panel behind the specified sibling in the render order
-- @param panel The sibling panel to move this panel behind. Must be a child of the same parent panel
-- @return False if the panel is not a sibling, otherwise nil
function panel_methods:moveToBefore( panel )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( panel, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):MoveToBefore( punwrap( panel ) )
end

--- Moves the panel in front of all other panels on screen
function panel_methods:moveToFront( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):MoveToFront( )
end

--TODO: add panel:newAnimation

--- Sets whether child drawings should be clipped within the panel bounds
-- @param clip True to clip children
function panel_methods:clip( clip )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( clip, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):NoClipping( not clip )
end

--- Returns the number of children of the panel that are selected.
function panel_methods:numSelectedChildren( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):NumSelectedChildren( )
end

--- Instructs an HTML control to parse an online HTML script from a link
-- @param URL The web URL to open
function panel_methods:openURL( URL )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( URL, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):OpenURL( URL )
end

--- Paints a ghost copy of the panel at the given position with the given size
-- @param x The x coordinate to draw
-- @param y The y coordinate to draw
-- @param w The width of the panel
-- @param h the height of the panel
function panel_methods:paintAt( x, y, w, h )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( x, "number" )
	SF.CheckType( y, "number" )
	SF.CheckType( w, "number" )
	SF.CheckType( h, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):PaintAt( x, y, w, h )
end

--- Paints the panel at its current position
function panel_methods:paintManual( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):PaintManual( )
end

--- Parents the panel to the HUD. Makes it invisible on the pause menu and disables controls
function panel_methods:parentToHUD( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):parentToHUD( )
end

--- Pastes the contents of the clipboard to the TextEntry
function panel_methods:paste( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):paste( )
end

--- Sets the width and position of a DLabel and places the passed panel directly to the right.
-- @param width The width to set the label to
-- @param x The x coordinate at which to place the label
-- @param y The y coordinate at which to place the label
-- @param label The label to resize and position
-- @param panel The panel to posiiton to the right of label
-- @return The distance from the top of the parent panel to the bottom of the tallest object
function panel_methods:positionLabel( width, x, y, label, panel )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( width, "number" )
	SF.CheckType( x, "number" )
	SF.CheckType( y, "number" )
	SF.CheckType( label, panel_metamethods )
	SF.CheckType( panel, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):PositionLabel( width, x, y, label, panel )
end

--- Sends a command to the panel
-- @param message The name of the message
-- @param typ The type of the variable to post
function panel_methods:postMessage( message, typ )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( message, "string" )
	SF.CheckType( typ, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):PostMessage( message, typ )
end

--- Enables the queue for panel animations, new animations will begin after all current animations have ended
function panel_methods:queue( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):Queue( )
end

--- Causes a SpawnIcon to rebuild its model image
function panel_methods:rebuildSpawnIcon( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):RebuildSpawnIcon( )
end

--- Causes a SpawnIcon to rebuild its model using the supplied table
-- @param cam_pos The position of the camera
-- @param cam_ang The camera angle the model is viewed from
-- @param cam_fov The camera's field of view
-- @param ent The entity object of the model
function panel_methods:rebuildSpawnIconEx( cam_pos, cam_ang, cam_fov, ent )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( cam_pos, SF.Types[ "Vector" ] )
	SF.CheckType( cam_ang, SF.Types[ "Angle" ] )
	SF.CheckType( cam_fov, "number" )
	SF.CheckType( ent, SF.Types[ "Entity" ] )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):RebuildSpawnIconEx( { cam_pos = SF.UnwrapObject( cam_pos ), cam_ang = SF.UnwrapObject( cam_ang ), cam_fov = cam_fov, ent = SF.UnwrapObject( ent ) } )
end

--[[
--TODO: determine structure of tbl
--- Allows the panel to receive drag and drop events
-- @param name Name of DnD panels to receive. Set by panel:droppable
-- @param func This function is called when a panel with a valid name is hovering above or dropped on this panel
-- Args:
-- panel - The receiver panel
-- tbl - A table of panels dropped onto receiver panel
-- dropped - False if hovering over, true if dropped onto
-- menuIndex - Index of clicked menu item
-- x - Cursor pos relative to receiver
-- y - Cursor pos relative to receiver
-- @param menu A table of string that will act as a menu if DnD was preformed with a right click
function panel_methods:receiver( name, func, menu )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( name, "string" )
	SF.CheckType( func, "function" )
	SF.CheckType( menu, "table" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):Receiver( name, function( pnl, tbl, dropped, menuIndex, x, y )
		local oldInstance = SF.instance
		SF.instance = instance
		func( pnl, {}, dropped, menuIndex, x, y )
		SF.instance = oldInstance
	end, menu )
end
--]]

--- Marks the panel for deletion next frame
function panel_methods:remove( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):Remove( )
end

--- Attempts to obtain focus for this panel
function panel_methods:requestFocus( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):RequestFocus( )
end

--- Resets all text fades in a RichText element
-- @param hold True to reset all fades
-- @param expiredOnly True to reset fades only on text segments that are completely faded out
-- @param newSustain The new sustain value for each faded text segment. -1 keeps the old sustain value
function panel_methods:resetAllFades( hold, expiredOnly, newSustain )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( hold, "boolean" )
	SF.CheckType( expiredOnly, "boolean" )
	SF.CheckType( newSustain, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):ResetAllFades( hold, expiredOnly, newSustain )
end

--- Runs JavaScript in the DHTML window
-- @param JavaScript The JavaScript that you want to run
function panel_methods:runJavaScript( JavaScript )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( JavaScript, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):RunJavaScript( JavaScript )
end

--- Translates global screen coordinate to coordinates relative to the panel
-- @param x The x coordinate in screen space
-- @param y The y coordinate in screen space
function panel_methods:screenToLocal( x, y )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( x, "number" )
	SF.CheckType( y, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	return punwrap( self ):ScreenToLocal( x, y )
end

--- Selects all items within a panel or object.
function panel_methods:selectAll( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SelectAll( )
end

--- Selects all text within a panel. Will not select non-text items
function panel_methods:selectAllText( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SelectAllText( )
end

--- Deselects all items in a panel.
function panel_methods:selectNone( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SelectNone( )
end

--- Sets the achievement to be displayed by AchievementIcon
-- @param id Achievement number ID
function panel_methods:setAchievement( id )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( id, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetAchievement( id )
end

--- Configures a text input to allow non-ascii characters
-- @param allowed Set to true to allow non-ascii characters
function panel_methods:setAllowNonAsciiCharacters( allowed )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( allowed, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetAllowNonAsciiCharacters( allowed )
end

--- Sets the alpha multiplier for the panel
-- @param alpha The new alpha value of the panel
function panel_methods:setAlpha( alpha )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( alpha, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetAlpha( alpha )
end

--- Enables or disables animations for the panel object
-- @param enable True to enable animations
function panel_methods:setAnimationEnabled( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetAnimationEnabled( enable )
end

--- Sets whether the panel should be deleted if the parent is removed
-- @param autoDelete True to enable auto deletion when the parent is removed
function panel_methods:setAutoDelete( autoDelete )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( autoDelete, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetAutoDelete( autoDelete )
end

--- Sets the background color of a panel such as a RichText, Label, or DColorCube
-- @param color The color to set the panel to
function panel_methods:setBGColor( color )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( color, SF.Types[ "Color" ] )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetBGColor( SF.WrapObject( color ) )
end

--- Sets the position of the caret in a text-based panel
-- @param offset Caret position / offset from the start of text.
function panel_methods:setCaretPos( offset )
    SF.CheckType( self, panel_metamethods )
    SF.CheckType( offset, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

    punwrap( self ):SetCaretPos( offset )
end

--- Sets the action signal command that's fired when a Button is clicked. panel:ActionSignal is called in response
--- Alternative to calling panel:command in the panel:doClick function
-- @param command The command to be called
function panel_methods:setCommand( command )
    SF.CheckType( self, panel_metamethods )
    SF.CheckType( command, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

    punwrap( self ):SetCommand( command )
end

--- Sets the allignment of the contents
-- @param alignment The direction based off the numpad, 5 being the middle, 7 being top left, 2 is bottom middle, etc.
function panel_methods:setContentAlignment( alignment )
    SF.CheckType( self, panel_metamethods )
    SF.CheckType( alignment, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

    punwrap( self ):SetContentAlignment( alignment )
end

--- Sets the appearance of the cursor
-- @param cursor The cursor to be set
-- @usage
-- Possible strings are as follows:
-- /- user
-- /- none
-- /- arrow
-- /- beam
-- /- hourglass
-- /- waitarrow
-- /- crosshair
-- /- up
-- /- sizenwse
-- /- sizenesw
-- /- sizewe
-- /- sizens
-- /- sizeall
-- /- no
-- /- hand
-- /- blank
-- /- last
function panel_methods:setCursor( cursor )
    SF.CheckType( self, panel_metamethods )
    SF.CheckType( cursor, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

    punwrap( self ):SetCursor( cursor )
end

--- Sets the drag parent. So when we start to drag this panel, we'll really start dragging the defined parent.
-- @param parent The panel to set as drag parent.
function panel_methods:setDragParent( parent )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( parent, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetDragParent( punwrap( parent ) )
end

--- Draws this panel object in front of all others, including the spawn menu and main menu.
-- @param enable True to draw the panel on top
function panel_methods:setDrawOnTop( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetDrawOnTop( enable )
end

--- Sets the enabled state of a disableable panel object, such as a DButton or DTextEntry.
-- @param enable True to enable the panel
function panel_methods:setEnabled( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetEnabled( enable )
end

--- Adds a shadow falling to the bottom left corner of the panel.
-- @param distance The diastance of the shadow
-- @param color The color of the shadow
function panel_methods:setShadow( distance, color )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( distance, "number" )
	SF.CheckType( color, SF.Types[ "Color" ] )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetExpensiveShadow( distance, SF.UnwrapObject( color ) )
end

--- Sets the foreground color of a panel.
-- @param color The foreground color
function panel_methods:setFGColor( color )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( color, SF.Types[ "Color" ] )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetFGColor( SF.UnwrapObject( color ) )
end

--- Sets the font used to render this panel's text
-- @param font Font names can be found here: http://wiki.garrysmod.com/page/Default_Fonts
function panel_methods:setFont( font )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( font, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetFontInternal( font )
end

--- Sets the height of the panel
-- @param height The height of the panel
function panel_methods:setHeight( height )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( height, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetHeight( height )
end

--- Sets the HTML code of the panel
-- @param HTML The html code
function panel_methods:setHTML( HTML )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( HTML, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetHTML( HTML )
end

--- Allows the panel to listen to keyboard input
-- @param enable True to allow the panel to listen to keyboard input
function panel_methods:setKeyboardInput( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetKeyboardInputEnabled( enable )
end

--- Sets the minimum dimensions of a panel
-- @param width The minimum width of the panel
-- @param height The minimum height of the panel
function panel_methods:setMinimumSize( width, height )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( width, "number" )
	SF.CheckType( height, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetMinimumSize( width, height )
end

--- Sets the model to be displayed by SpawnIcon.
-- @param model The path to the model
-- @param skin The skin for the model to use, 0 by default
-- @param bodygroups The bodygroups for the model to use, "" by default
function panel_methods:setModel( model, skin, bodygroups )
	SF.CheckType( self, panel_metamethods )
	if model then SF.CheckType( skin, "number" ) end
	if bodygroups then SF.CheckType( bodygroups, "string" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetModel( model, skin or 0, bodygroups or "" )
end

--- Allows the panel to listen to mouse input
-- @param enable True to allow the panel to listen to mouse input
function panel_methods:setMouseInput( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetMouseInputEnabled( enable )
end

--- Enables or disables the multi-line functionality of a text object, such as a DTextEntry.
-- @param enable True to enable multi-line functionality
function panel_methods:setMultiline( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetMultiline( enable )
end

--- Sets the name of the panel
-- @param name The new name of the panel
function panel_methods:setName( name )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( name, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetName( name )
end

--- Sets whether the panel background should be rendered
-- @param enable True to enable panel background rendering
function panel_methods:setPaintBackground( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):setPaintBackgroundEnabled( enable )
end

--- Sets whether the panel border should be rendered
-- @param enable True to enable panel border rendering
function panel_methods:setPaintBorder( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):setPaintBorderEnabled( enable )
end

--- Sets whether the panel is painted manually
-- @param enable True to paint manually
function panel_methods:setPaintedManually( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetPaintedManually( enable )
end

--- Sets the parent of the panel
-- @param parent The parent panel
function panel_methods:setParent( parent )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( parent, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetParent( punwrap( parent ) )
end

--- Sets the avatar for an AvatarImage panel
-- @param player The player to use as an avatar
-- @param size the size of avatar to use
-- Sizes can be: 16, 32, 64, 84, 128, and 184
function panel_methods:setPlayer( player, size )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( player, SF.Types[ "Player" ] )
	SF.CheckType( size, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetPlayer( SF.UnwrapObject( player ), size )
end

--- If this panel object has been made a popup with Panel:MakePopup, this method will prevent it from drawing in front of other panels when it receives input focus.
-- @param enable True to keep the panel at the back when focused
function panel_methods:setPopupStayAtBack( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetPopupStayAtBack( enable )
end

--- Sets the position of the panel
-- @param x The x coordinate
-- @param y The y coordinate
function panel_methods:setPos( x, y )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( x, "number" )
	SF.CheckType( y, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetPos( x, y )
end

--- Sets whether the panel should appear in screenshots
-- @param enable True to render in screenshots
function panel_methods:setRenderInScreenshots( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetRenderInScreenshots( enable )
end

--- Sets whether the panel is selectable
-- @param enable True to enable the panel as selectable
function panel_methods:setSelectable( enable)
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetSelectable( enable )
end

--- Sets whether the panel is selected
-- @param selected True to make the panel selected
function panel_methods:setSelected( selected )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( selected, "enable" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetSelected( selected )
end

--- Enables the panel for selection (much like the spawn menu).
-- @param enable True to enable the panel as a selection canvas
function panel_methods:setSelectionCanvas( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetSelectionCanvas( enable )
end

--- Sets the size of the panel
-- @param width The width of the panel
-- @param height The height of the panel
function panel_methods:setSize( width, height )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( width, "number" )
	SF.CheckType( height, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetSize( width, height )
end

--- Sets the derma skin of the panel
-- @param skin The name of the skin to use
function panel_methods:setSkin( skin )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( skin, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetSkin( skin )
end

--- Sets the silkicon of a panel such as a SpawnIcon
-- @param icon The silkicon to use: http://wiki.garrysmod.com/page/Silkicons
function panel_methods:setSpawnIcon( icon )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( icon, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetSpawnIcon( icon )
end

--- Sets the avatar used by AvatarImage via SteamID
-- @param id The 64bit SteamID
-- @param size the size of avatar to use
-- Sizes can be: 16, 32, 64, 84, 128, and 184
function panel_methods:setSteamID( id, size )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( id, "string" )
	SF.CheckType( size, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetSteamID( id, size )
end

--- Removes the panel after delay seconds have passed, will not work if panel:AnimationThink is overridden
-- @param delay The time to wait before removing the panel
function panel_methods:setTerm( delay )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( delay, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetTerm( delay )
end

--- Sets the text of the panel
-- @param text The text that the panel should have set
function panel_methods:setText( text )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( text, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetText( text )
end

--- Sets the top-left margins of a text-based panel
-- @param x The left margin for the text
-- @param y The top margin for the text
function panel_methods:setTextInsert( x, y )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( x, "number" )
	SF.CheckType( y, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetTextInsert( x, y )
end

--- Sets the height of a RichText element to accommodate the text inside
function panel_methods:setToFullHeight( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetToFullHeight( )
end

--- Sets the string to be displayed when a player hovers over the panel
-- @panel tooltip The string to be displayed in the tooltip
function panel_methods:setTooltip( tooltip )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( tooltip, "string" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetTooltip( tooltip )
end

--- Sets the panel to be displayed when a player hovers over the panel
-- @panel tooltip The panel to be displayed in the tooltip
function panel_methods:setTooltipPanel( tooltip )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( tooltip, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetTooltipPanel( punwrap( tooltip ) )
end

--- Sets the URL of a link-based panel
-- @param url The URL to set, MUST begin with "http://"
function panel_methods:setURL( url )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( url, "string")

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetURL( url )
end

--- Sets the visibility of the vertical scrollbar
-- @param enable True to display the vertical scrollbar
function panel_methods:setVerticalScrollbar( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetVerticalScrollbarEnabled( enable )
end

--- Sets the visibility of the panel
-- @param visible True to render the panel
function panel_methods:setVisible( visible )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( visible, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetVisible( visible )
end

--- Sets the width of the panel
-- @param width The width of the panel
function panel_methods:setWidth( width )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( width, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetWidth( width )
end

--- This makes it so that when you're hovering over this panel you can `click` on the world. Your viewmodel will aim etc.
-- @param enable True to enable world clicking
function panel_methods:setWorldClicker( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetWorldClicker( enable )
end

--- Sets whether text wrapping should be enabled
-- @param enable True to enable text wrapping
function panel_methods:setWrap( enable )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( enable, "boolean" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetWrap( enable )
end

--- Sets the z position of the panel, higher z value = higher render priority
-- @param z The z position of the panel, between -32768 and 32768
function panel_methods:setZPos( z )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( z, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SetZPos( z )
end

--- Makes the panel visible
function panel_methods:show()
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):Show()
end

--- Uses animation to resize the panel to the specified size
-- @param width The target width, -1 to stay the same
-- @param height The target height, -1 to stay the same
-- @param duration The time in seconds of the animation
-- @param delay Time time in seconds before the animation starts, 0 by default
-- @param ease The easing of the start and/or end speed of the animation. -1 by default
-- @param callback Function to call upon animation finish
-- Args:
-- animData - The AnimationData structure that was used ( Not yet implemented )
-- panel	- The panel that was moved
function panel_methods:sizeTo( width, height, duration, delay, ease, callback )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( width, "number" )
	SF.CheckType( height, "number" )
	SF.CheckType( duration, "number" )
	if delay then SF.CheckType( delay, "number" ) end
	if callback then SF.CheckType( callback, "function" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	local instance = SF.instance
	punwrap( self ):SizeTo( width, height, duration, delay, ease, function( animData, panel )
		if callback then
			local oldInstance = SF.instance
			SF.instance = instance
			callback( {}, pwrap( panel ) ) --TODO: Wrap animData
			SF.instance = oldInstance
		end
	end )
end

--- Resizes the panel to fit the bounds of its children (Blame GMod wiki)
-- @param width Resize the width of the panel (?)
-- @param height Resize the height of the panel (?)
function panel_methods:sizeToChildren ( width, height )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( width, "number" )
	SF.CheckType( height, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SizeToChildren( width, height )
end

--- Resizes the panel so that it's width and height fit all of the child controls inside.
function panel_methods:sizeToContents( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SizeToContents( )
end

--- Resizes the panel width to accommodate all children objects
-- @param offset The additional width to add to the panel ( can be negative ). 0 by default
function panel_methods:sizeToContentsX( offset )
	SF.CheckType( self, panel_metamethods )
	if offset then SF.CheckType( offset, "number" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SizeToContentsX( offset or 0)
end

--- Resizes the panel height to accommodate all children objects
-- @param offset The additional height to add to the panel ( can be negative ). 0 by default
function panel_methods:sizeToContentsY( offset )
	SF.CheckType( self, panel_metamethods )
	if offset then SF.CheckType( offset, "number" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SizeToContentsY( offset or 0)
end

--- Slides the panel in from above.
-- @param duration Time for the animation to last
function panel_methods:slideDown( duration )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( duration, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SlideDown( duration )
end

--- Slides the panel in from below.
-- @param duration Time for the animation to last
function panel_methods:slideUp( duration )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( duration, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):SlideUp( duration )
end

--- Begins a box selection, enables mouse capture for the panel object, and sets the start point of the selection box to the mouse cursor's position, relative to this panel.
function panel_methods:startBoxSelection( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):StartBoxSelection( )
end

--- Stops all panel animations by clearing its animation list. This also clears all delayed animations.
function panel_methods:stop( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):Stop( )
end

--- Resizes the panel's height so that its bottom is aligned with the top of the passed panel. An offset greater than zero will reduce the panel's height to leave a gap between it and the passed panel.
-- @param panel The panel to allign the bottom of this one with
-- @offset offset The gap to leave between this and the passed panel ( can be negative ). 0 by default
function panel_methods:stretchBottomTo( panel, offset )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( panel, panel_metamethods )
	if offset then SF.CheckType( offset, "number" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):StretchBottomTo( punwrap( panel ), offset or 0 )
end

--- Resizes the panel's width so that its right edge is aligned with the left edge of the passed panel. An offset greater than zero will reduce the panel's width to leave a gap between it and the passed panel.
-- @param panel The panel to allign the right edge of this one with
-- @offset offset The gap to leave between this and the passed panel ( can be negative ). 0 by default
function panel_methods:stretchRightTo( panel, offset )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( panel, panel_metamethods )
	if offset then SF.CheckType( offset, "number" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):StretchRightTo( punwrap( panel ), offset or 0 )
end

--- Sets the dimensions of the panel to fill its parent. It will only stretch in directions that aren't nil.
-- @param left The left offset
-- @param top The top offset
-- @param right The right offset
-- @param bottom The bottom offset
function panel_methods:stretchToParent( left, top, right, bottom )
	SF.CheckType( self, panel_metamethods )
	SF.CheckType( left, "number" )
	SF.CheckType( top, "number" )
	SF.CheckType( right, "number" )
	SF.CheckType( right, "number" )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):StretchToParent( left, top, right, bottom )
end

--- Toggles the selected state of a selectable panel
function panel_methods:toggleSelection( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):ToggleSelection( )
end

--- Toggles the visibility of a panel and all its children.
function panel_methods:toggleVisible( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):ToggleVisible( )
end

--- Recursively deselects this panel object and all of its children.
function panel_methods:deselectAll( )
	SF.CheckType( self, panel_metamethods )

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	punwrap( self ):UnselectAdd( )
end