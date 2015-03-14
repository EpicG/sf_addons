SF.Panel.DHTMLControls = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DHTMLControls", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

SF.Panel.DHTMLControls.wrap = pwrap
SF.Panel.DHTMLControls.unwrap = punwrap

SF.Panel.DHTMLControls.Methods = this_methods
SF.Panel.DHTMLControls.Metatable = this_metamethods

--- Links the controls to the DHTML frame supplied
--@param html The DHTML window to link
function this_methods:setHTML( html )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( html, SF.Panel.DHTML.Metatable )

	punwrap( self ):SetHTML( punwrap( html ) )
end

--- Updates the history of the browser
--@param url The url to add to the history
function this_methods:updateHistory( url )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( url, "string" )

	punwrap( self ):UpdateHistory( url )
end

--- Sets the color of the control buttons
--@param color The new color of the buttons
function this_methods:setButtonColor( color )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( color, SF.Types[ "Color" ] )

	punwrap( self ):SetButtonColor( SF.UnwrapObject( color ) )
end