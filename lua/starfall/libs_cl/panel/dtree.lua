SF.Panel.DTree = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DTree", SF.Panel.DScrollPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DTree.wrap = pwrap
SF.Panel.DTree.unwrap = punwrap

SF.Panel.DTree.Methods = this_methods
SF.Panel.DTree.Metatable = this_metamethods

function this_methods:setShowIcons( show )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( show, "boolean" )

	punwrap( self ).m_bShowIcons = show
end

function this_methods:getShowIcons( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bShowIcons
end

function this_methods:setIndentSize( size )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( size, "number" )

	punwrap( self ).m_iIndentSize = size
end

function this_methods:getIndentSize( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_iIndentSize
end

function this_methods:setLineHeight( height )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( height, "number" )

	punwrap( self ).m_iLineHeight = height
end

function this_methods:getLineHeight( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_iLineHeight
end

function this_methods:setSelectedItem( panel )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( panel, SF.Panel.Panel.Metatable )

	punwrap( self ):SetSelectedItem( punwrap( panel ) )
end

function this_methods:getSelectedItem( )
	SF.CheckType( self, this_metamethods )

	local selected = punwrap( self ).m_pSelectedItem

	if selected ~= nil then
		selected = SF.Panel.DTree_node.wrap( selected )
	end

	return selected
end

function this_methods:setClickOnDragHover( enable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ).m_bClickOnDragHover = enable
end

function this_methods:getClickOnDragHover( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bClickOnDragHover
end

function this_methods:root( )
	SF.CheckType( self, this_metamethods )

	return SF.Panel.wrap( punwrap( self ):Root( ), "DTree" )
end

function this_methods:addNode( name, icon )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( name, "string" )
	if icon then SF.CheckType( icon, "string" ) end

	return SF.Panel.wrap( punwrap( self ):AddNode( name, icon ), "DTree_node" )
end

--Does nothing to override the DScrollPanel function
function this_methods:clear( )

end