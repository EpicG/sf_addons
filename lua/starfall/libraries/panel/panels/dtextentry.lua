SF.Panel.DTextEntry = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DTextEntry", SF.Panel.TextEntry.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DTextEntry.wrap = pwrap
SF.Panel.DTextEntry.unwrap = punwrap

SF.Panel.DTextEntry.Methods = this_methods
SF.Panel.DTextEntry.Metatable = this_metamethods

function this_methods:setAllowEnter( allow )
    SF.CheckType( self, this_metamethods )
    SF.CheckType( allow, "boolean" )

    punwrap( self ).m_bAllowEnter = allow
end

function this_methods:getAllowEnter( )
    SF.CheckType( self, this_metamethods )

    return punwrap( self ).m_bAllowEnter
end

function this_methods:setUpdateOnType( update )
    SF.CheckType( self, this_metamethods )
    SF.CheckType( update, "boolean" )

    punwrap( self ).m_bUpdateOnType = update
end

function this_methods:getUpdateOnType( )
    SF.CheckType( self, this_metamethods )

    return punwrap( self ).m_bUpdateOnType
end

function this_methods:setNumeric( enable )
    SF.CheckType( self, this_metamethods )
    SF.CheckType( enable, "boolean" )

    punwrap( self ).m_bNumeric = enable
end

function this_methods:getNumeric( )
    SF.CheckType( self, this_metamethods )

    return punwrap( self ).m_bNumeric
end

function this_methods:setHistoryEnabled( enable )
    SF.CheckType( self, this_metamethods )
    SF.CheckType( enable, "boolean" )

    punwrap( self ).m_bHistory = enable
end

function this_methods:getHistoryEnabled( )
    SF.CheckType( self, this_metamethods )

    return punwrap( self ).m_bHistory
end

function this_methods:setFont( font )
    SF.CheckType( self, this_metamethods )
    SF.CheckType( font, "string" )

    punwrap( self ).m_FontName = font
end

function this_methods:getFont( )
    SF.CheckType( self, this_metamethods )

    return punwrap( self ).m_FontName
end

function this_methods:setDrawBorder( draw )
    SF.CheckType( self, this_metamethods )
    SF.CheckTYpe( draw, "boolean" )

    punwrap( self ).m_bBorder = draw
end

function this_methods:getDrawBorder( )
    SF.CheckType( self, this_metamethods )

    return punwrap( self ).m_bBorder
end

function this_methods:setDrawBackground( draw )
    SF.CheckType( self, this_metamethods )
    SF.CheckType( draw, "boolean" )

    punwrap( self ).m_bBackground = draw
end

function this_methods:getDrawBackground( )
    SF.CheckType( self, this_metamethods )

    return punwrap( self ).m_bBackground
end

function this_methods:setTextColor( color )
    SF.CheckType( self, this_metamethods )
    SF.CheckType( color, SF.Types[ "Color" ] )

    punwrap( self ).m_colText = SF.UnwrapObject( color )
end

function this_methods:getTextColor( )
    SF.CheckType( self, this_metamethods )

    return SF.WrapObject( punwrap( self ).m_colText )
end

function this_methods:setHighlightColor( color )
    SF.CheckType( self, this_metamethods )
    SF.CheckType( color, SF.Types[ "Color" ] )

    punwrap( self ).m_colHighlight = SF.UnwrapObject( color )
end

function this_methods:getHighlightColor( )
    SF.CheckType( self, this_metamethods )

    return SF.WrapObject( punwrap( self ).m_colHighlight )
end

function this_methods:setCursorColor( color )
    SF.CheckType( self, this_metamethods )
    SF.CheckType( color, SF.Types[ "Color" ] )

    punwrap( self ).m_colCursor = SF.UnwrapObject( color )
end

function this_methods:getCursorColor( )
    SF.CheckType( self, this_metamethods )

    return SF.WrapObject( punwrap( self ).m_colCursor )
end

function this_methods:setDisabled( disable )
    SF.CheckType( self, this_metamethods )
    SF.CheckType( disable, "boolean" )

    punwrap( self ).m_bDisabled = disable
end

function this_methods:getDisabled( )
    SF.CheckType( self, this_metamethods )

    return punwrap( self ).m_bDisabled
end

function this_methods:isEditing( )
    SF.CheckType( self, this_metamethods )

    return punwrap( self ):IsEditing( )
end

function this_methods:applySchemeSettings( )
    SF.CheckType( self, this_metamethods )

    punwrap( self ):ApplySchemeSettings( )
end

function this_methods:updateFromHistory( )
    SF.CheckType( self, this_metamethods )

    punwrap( self ):UpdateFromHistory( )
end

function this_methods:updateFromMenu( )
    SF.CheckType( self, this_metamethods )

    punwrap( self ):UpdateFromMenu( )
end

function this_methods:setValue( value )
    SF.CheckType( self, this_metamethods )
    SF.CheckType( value, "string" )

    punwrap( self ):SetValue( value )
end

function this_methods:checkNumeric( value )
    SF.CheckType( self, this_metamethods )
    SF.CheckType( value, "string" )

    punwrap( self ):CheckNumeric( value )
end

function this_methods:setEditable( enable )
    SF.CheckType( self, this_metamethods )
    SF.CheckType( enable, "boolean" )

    punwrap( self ):SetEditable( enable )
end

function this_methods:addHistory( txt )
    SF.CheckType( self, this_metamethods )
    SF.CheckType( txt, "string" )

    punwrap( self ):AddHistory( txt )
end

function this_methods:getInt( )
    SF.CheckType( self, this_metamethods )

    return punwrap( self ):GetInt( )
end

function this_methods:getFloat( )
    SF.CheckType( self, this_metamethods )

    return punwrap( self ):GetFloat( )
end