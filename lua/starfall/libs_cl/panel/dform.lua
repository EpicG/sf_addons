SF.Panel.DForm = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DForm", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DForm.wrap = pwrap
SF.Panel.DForm.unwrap = punwrap

SF.Panel.DForm.Methods = this_methods
SF.Panel.DForm.Metatable = this_metamethods

--- Sets whether to size the panel to its contents
--@param enable True to enable autosizing
function this_methods:setAutoSize( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ).m_bSizeToContents = enable
end

--- Gets whether the panel is automatically sized to its contents
--@return True if the panel automatically resizes to its contents
function this_methods:getAutoSize( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bSizeToContents
end

--- Sets the spacing of the panel
--@param spacing The spacing of the panel
function this_methods:setSpacing( spacing )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( spacing, "number" )

	punwrap( self ).m_iSpacing = spacing
end

--- Gets the spacing of the panel
--@return The spacing of the panel
function this_methods:getSpacing( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_iSpacing
end

--- Sets the padding of the panel
--@param padding The padding of the panel
function this_methods:setPadding( padding )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( padding, "number" )

	punwrap( self ).m_Padding = padding
end

--- Gets the padding of the panel
--@return The padding of the panel
function this_methods:getPadding( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_Padding
end

--- Sets the name of the form
--@param name The name of the form
function this_methods:setName( name )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( name, "string" )

	punwrap( self ):SetLabel( name )
end

---Removes all items from the form
function this_methods:clear( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):Clear( )
end

function this_methods:addItem( left, right )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( left, this_metamethods )
	SF.CheckType( right, this_metamethods )

	punwrap( self ):AddItem( punwrap( left ), punwrap( right ) )
end

--- Sets the help text
--@param help The help text
function this_methods:help( help )
	SF.CheckType( self, this_methods )
	SF.CheckType( help, "string" )

	return SF.Panel.wrap( punwrap( self ):Help( help ), "DLabel" )
end

--- Sets the control help
--@param help The help text
function this_methods:controlHelp( help )
	SF.CheckType( self, this_methods )
	SF.CheckType( help, "string" )

	return SF.Panel.wrap( punwrap( self ):Help( help ), "DLabel" )
end

