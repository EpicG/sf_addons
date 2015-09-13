SF.Panel.DNumSlider = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DNumSlider", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DNumSlider.wrap = pwrap
SF.Panel.DNumSlider.unwrap = punwrap

SF.Panel.DNumSlider.Methods = this_methods
SF.Panel.DNumSlider.Metatable = this_metamethods

--- Sets the minimum and maximum of the slider
--@param min The minimum value that the slider can be
--@param max The maximum value that the slider can be
function this_methods:setMinMax( min, max )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( min, "number" )
	SF.CheckType( max, "number" )

	punwrap( self ):SetMinMax( min, max )
end

--- Sets whether the panel is dark
--@param enable True to make the panel dark
function this_methods:setDark( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):SetDark( enable )
end

--- Gets the minimum value that the slider can be
--@return The minimum value of the slider
function this_methods:getMin( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):GetMin( )
end

--- Gets the maximum value that the slider can be
--@return The maximum value of the slider
function this_methods:getMax( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):GetMax( )
end

--- Sets the minimum value that the slider can be
--@param min The minimum value of the slider
function this_methods:getMin( min )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( min, "number" )

	return punwrap( self ):SetMin( min )
end

--- Gets the maximum value that the slider can be
--@param max The maximum value of the slider
function this_methods:getMax( max )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( max, "number" )

	return punwrap( self ):GetMax( max )
end

--- Gets the range of the slider
--@return The range of the slider
function this_methods:getRange( )
	SF.CheckType( self, this_metamethods )
	
	return punwrap( self ):GetRange( )
end

--- Sets the value of the slider
--@param value The value of the slider
function this_methods:setValue( value )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( value, "number" )

	punwrap( self ):SetValue( value )
end

--- Gets the value of the slider
--@return The value of the slider
function this_methods:getValue( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):getValue( )
end

--- Sets the number of decimals
--@param decimals The number of decimals for the slider
function this_methods:setDecimals( decimals )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( decimals, "number" )

	punwrap( self ):SetDecimals( decimals )
end

--- Gets the number of decimals
--@return The number of decimals for the slider
function this_methods:getDecimals( decimals )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):GetDecimals( )
end

--- Redoes the layout for the panel
function this_methods:performLayout( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):PerformLayout( )
end

--- Sets the label of the slider
--@param text The new text for the label
function this_methods:setText( text )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( text, "string" )

	punwrap( self ):SetText( text )
end

--- Translates the slider value to coordinates
--@param x The x coordinate of the slider
--@param y The y value of the slider
--@return The fractional x value
--@return The y value
function this_methods:translateSliderValues( x, y )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( x, "number" )
	SF.CheckType( y, "number" )

	return punwrap( self ):TranslateSliderValues( x, y )
end

