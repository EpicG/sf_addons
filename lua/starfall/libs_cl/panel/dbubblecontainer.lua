SF.Panel.DBubbleContainer = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DBubbleContainer", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DBubbleContainer.wrap = pwrap
SF.Panel.DBubbleContainer.unwrap = punwrap

SF.Panel.DBubbleContainer.Methods = this_methods
SF.Panel.DBubbleContainer.Metatable = this_metamethods

--- Sets the speech bubble position and size
--@param x The x position of the dialog point
--@param y The y position of the dialog point
--@param w The width of the bubble container
--@param h The height of the bubble container
function this_methods:openForPos( x, y, w, h )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( x, "number" )
	SF.CheckType( y, "number" )
	SF.CheckType( w, "number" )
	SF.CheckType( h, "number" )

	punwrap( self ):OpenForPos( x, y, w, h )
end