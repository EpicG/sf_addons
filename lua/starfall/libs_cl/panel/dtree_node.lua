SF.Panel.DTree_node = {}

local this_methods, this_metamethods = SF.Typedef( "Panel.DTree_node", SF.Panel.DPanel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, this_metamethods )
	return object
end

this_metamethods.__newindex = SF.Panel.Panel.Metatable.__newindex

SF.Panel.DTree_node.wrap = pwrap
SF.Panel.DTree_node.unwrap = punwrap

SF.Panel.DTree_node.Methods = this_methods
SF.Panel.DTree_node.Metatable = this_metamethods

function this_methods:setRoot( panel )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( panel, SF.Panel.DTree.Metatable )

	punwrap( self ):SetRoot( punwrap( panel ) )
end

function this_methods:getRoot( )
	SF.CheckType( self, this_metamethods )

	return SF.WrapObject( punwrap( self ):GetRoot( ), "DTree" )
end

function this_methods:setParentNode( node )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( node, this_metamethods )

	punwrap( self ):SetParentNode( punwrap( node ) )
end

function this_methods:getParentNode( )
	SF.CheckType( self, this_metamethods )

	return pwrap( punwrap( self ).m_pParentNode )
end

function this_methods:setFolder( folder )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( folder, "string" )

	punwrap( self ):SetFolder( folder )
end

function this_methods:getFolder( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_strFolder
end

function this_methods:setFileName( name )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( name, "string" )

	punwrap( self ):SetFileName( name )
end

function this_methods:getFileName( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_strFileName
end

function this_methods:setPathID( pathID )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( pathID, "string" )

	punwrap( self ):SetPathID( pathID )
end

function this_methods:getPathID( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_strPathID
end

function this_methods:setWildCard( wildcard )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( wildcard, "string" )

	punwrap( self ):SetWildCard( wildcard )
end

function this_methods:getWildCard( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_strWildCard
end

function this_methods:setNeedsPopulating( needsPopulating )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( needsPopulating, "boolean" )

	punwrap( self ):SetNeedsPopulating( needsPopulating )
end

function this_methods:getNeedsPopulating( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bNeedsPopulating
end

function this_methods:setShowFiles( show )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( show, "boolean" )

	punwrap( self ):SetShowFiles( show )
end

function this_methods:getShowFiles( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bShowFiles
end

function this_methods:setDirty( dirty )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( dirty, "boolean" )

	punwrap( self ):SetDirty( dirty )
end

function this_methods:getDirty( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bDirty
end

function this_methods:setNeedsChildSearch( needsCS )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( needsCS, "boolean" )

	punwrap( self ):SetNeedsChildrenSearch( needsCS )
end

function this_methods:getNeedsChildSearch( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bNeedsChildSearch
end

function this_methods:setForceShowExpander( force )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( force, "boolean" )

	punwrap( self ):SetForceShowExpander( force )
end

function this_methods:getForceShowExpander( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bForceShowExpander
end

function this_methods:setShowExpander( show )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( show, "boolean" )

	punwrap( self ):SetHideExpander( not show )
end

function this_methods:getShowExpander( )
	SF.CheckType( self, this_metamethods )

	return not punwrap( self ).m_bHideExpander
end

function this_methods:setDoubleClickToOpen( dcto )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( dcto, "boolean" )

	punwrap( self ):SetDoubleClickToOpen( dcto )
end

function this_methods:getDoubleClickToOpen( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bDoubleClickToOpen
end

function this_methods:setLastChild( lastChild )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( lastChild, "boolean" )

	punwrap( self ):SetLastChild( lastChild )
end

function this_methods:getLastChild( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bLastChild
end

function this_methods:setDrawLines( drawLines )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( drawLines, "boolean" )

	punwrap( self ):SetDrawLines( drawLines )
end

function this_methods:getDrawLines( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_bDrawLines
end

function this_methods:setDraggableName( draggableName )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( draggableName, "string" )

	punwrap( self ):SetDraggableName( draggableName )
end

function this_methods:getDraggableName( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ).m_strDraggableName
end

function this_methods:isRootNode( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):IsRootNode( )
end

function this_methods:setIcon( icon )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( icon, "string" )

	punwrap( self ):SetIcon( icon )
end

function this_methods:getLineHeight( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):GetLineHeight( )
end

function this_methods:getIndentSize( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):GetIndentSize( )
end

function this_methods:setText( name )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( name, "string" )

	return punwrap( self ):SetText( name )
end

function this_methods:expandRecurse( expand )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( expand, "boolean" )

	punwrap( self ):ExpandRecurse( expand )
end

function this_methods:expandTo( expand )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( expand, "boolean" )

	punwrap( self ):ExpandTo( expand )
end

function this_methods:setExpanded( expanded, animate )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( expanded, "boolean" )
	if animate then SF.CheckType( animate, "boolean" ) else animate = true end

	punwrap( self ):SetExpanded( expanded, not animate )
end

function this_methods:childExpanded( expand )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( expand, "boolean" )

	punwrap( self ):ChildExpanded( expand )
end

function this_methods:hasChildren( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):HasChildren( )
end

function this_methods:doChildrenOrder( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):DoChildrenOrder( )
end

function this_methods:performRootNodeLayout( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):PerformRootNodeLayout( )
end

function this_methods:createChildNodes( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):CreateChildNodes( )
end

function this_methods:addPanel( panel )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( panel, SF.Panel.Panel.Metatable )

	punwrap( self ):AddPanel( punwrap( panel ) )
end

function this_methods:addNode( name, icon )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( name, "string" )
	if icon then SF.CheckType( icon, "string" ) end

	return pwrap( punwrap( self ):AddNode( name, icon ) )
end

function this_methods:insertNode( node )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( node, this_metamethods )

	punwrap( self ):InsertNode( punwrap( node ) )
end

function this_methods:installDraggable( node )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( node, this_metamethods )

	punwrap( self ):InstallDraggable( punwrap( node ) )
end

function this_methods:addFolder( name, folder, path, showFiles, wildCard, forceExpandable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( name, "string" )
	SF.CheckType( folder, "string" )
	SF.CheckType( path, "string" )
	SF.CheckType( showFiles, "boolean" )
	SF.CheckType( wildCard, "string" )
	if forceExpandable then SF.CheckType( forceExpandable, "boolean" ) else forceExpandable = true end

	punwrap( self ):AddFolder( name, folder, path, showFiles, wildCard, not forceExpandable )
end

function this_methods:makeFolder( folder, path, showFiles, wildCard, forceExpandable )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( folder, "string" )
	SF.CheckType( path, "string" )
	SF.CheckType( showFiles, "boolean" )
	SF.CheckType( wildCard, "string" )
	if forceExpandable then SF.CheckType( forceExpandable, "boolean" ) else forceExpandable = true end

	punwrap( self ):MakeFolder( folder, path, showFiles, wildCard, not forceExpandable )
end

function this_methods:filePopulate( andChildren, expand )
	SF.CheckType( self, this_metamethods )
	if andChildren then SF.CheckType( andChildren, "boolean" ) else andChildren = false end
	if expand then SF.Checktype( expand, "boolean" ) else expand = false end

	punwrap( self ):FilePopulate( andChildren, expand )
end

function this_methods:populateChildren( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):PopulateChildren( )
end

function this_methods:populateChildrenAndSelf( expand )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( expand, "boolean" )

	punwrap( self ):PopulateChildrenAndSelf( expand )
end

function this_methods:setSelected( selected )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( selected, "boolean" )

	punwrap( self ):SetSelected( selected )
end

function this_methods:dragHoverClick( hoverTime )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( hoverTime, "number" )

	punwrap( self ):DragHoverClick( hoverTime )
end

function this_methods:moveChildTo( child )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( child, this_metamethods )

	punwrap( self ):MoveChildTo( punwrap( child ) )
end

function this_methods:getText( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):GetText( )
end

function this_methods:getIcon( )
	SF.CheckType( self, this_metamethods )

	return punwrap( self ):GetIcon( )
end

function this_methods:cleanList( )
	SF.CheckType( self, this_metamethods )

	punwrap( self ):CleanList( )
end

function this_methods:insert( node, adjacentNode, before )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( node, this_metamethods )
	SF.CheckType( adjacentNode, this_metamethods )
	SF.CheckType( before, "boolean" )

	punwrap( self ):Insert( punwrap( node ), punwrap( adjacentNode ), before )
end

function this_methods:leaveTree( panel )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( panel, this_metamethods )

	punwrap( self ):LeaveTree( punwrap( panel ) )
end

function this_methods:getChildNode( id )
	SF.CheckType( self, this_metamethods )
	SF.CheckType( id, "number" )

	return punwrap( self ):GetChildNode( id )
end

function this_methods:copy( )
	SF.CheckType( self, this_metamethods )

	return pwrap( punwrap( self ):Copy( ) )
end