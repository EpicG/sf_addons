SF.Panel.DComboBox = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DComboBox", SF.Panel.DButton.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DComboBox.wrap = pwrap
SF.Panel.DComboBox.unwrap = punwrap

SF.Panel.DComboBox.Methods = this_methods
SF.Panel.DComboBox.Metatable = this_metamethods

function this_methods:clear( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):Clear( )
end

function this_methods:getOptionText( id )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( id, "number" )

	return punwrap( self ):GetOptionText( id )
end

function this_methods:getOptionData( id )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( id, "number" )

	return punwrap( self ):GetOptionData( id )
end

function this_methods:chooseOption( value, index )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( value, "string" )
	SF.CheckType( index, "number" )

	punwrap( self ):ChooseOption( value, index )
end

function this_methods:chooseOptionID( index )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( index, "number" )

	punwrap( self ):ChooseOptionID( index )
end

function this_methods:getSelectedID( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):GetSelectedID( )
end

function this_methods:getSelected( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):GetSelected( )
end

function this_methods:addChoice( value, select )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( value, "string" )
	if select then SF.CheckType( select, "boolean" ) else select = false end

	punwrap( self ):AddChoice( value, nil, select )
end

function this_methods:isMenuOpen( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):IsMenuOpen( )
end

function this_methods:closeMenu( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):CloseMenu( )
end