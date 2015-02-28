SF.Panel.DFrame = {}

local dframe_methods, dframe_metamethods = SF.Typedef( "Panel.DFrame", SF.Panel.Panel.Metatable )

local punwrap = SF.Panel.unwrap

local function pwrap( object )
	object = SF.Panel.wrap( object )
	debug.setmetatable( object, dframe_metamethods )
	return object
end

SF.Panel.DFrame.wrap = pwrap
SF.Panel.DFrame.unwrap = punwrap

SF.Panel.DFrame.Methods = dframe_methods
SF.Panel.DFrame.Metatable = dframe_metamethods

function dframe_methods:close( )
	SF.CheckType( self, dframe_metamethods )

	punwrap( self ):Close( )
end

function dframe_methods:getBackgroundBlur( )
	SF.CheckType( self, dframe_metamethods )

	return punwrap( self ):GetBackgroundBlur( )
end

function dframe_methods:getDeleteOnClose( )
	SF.CheckType( self, dframe_metamethods )

	return punwrap( self ):GetDeleteOnClose( )
end

function dframe_methods:getDraggable( )
	SF.CheckType( self, dframe_metamethods )

	return punwrap( self ):GetDraggable( )
end

function dframe_methods:getIsMenu( )
	SF.CheckType( self, dframe_metamethods )

	return punwrap( self ):GetIsMenu( )
end

function dframe_methods:getMinHeight( )
	SF.CheckType( self, dframe_metamethods )

	return punwrap( self ):GetMinHeight( )
end

function dframe_methods:getMinWidth( )
	SF.CheckType( self, dframe_metamethods )

	return punwrap( self ):GetMinWidth( )
end

function dframe_methods:getPaintShadow( )
	SF.CheckType( self, dframe_metamethods )

	return punwrap( self ):GetPaintShadow( )
end

function dframe_methods:getScreenLock( )
	SF.CheckType( self, dframe_metamethods )

	return punwrap( self ):GetScreenLock( )
end

function dframe_methods:getSizable( )
	SF.CheckType( self, dframe_metamethods )

	return punwrap( self ):GetSizable( )
end

function dframe_methods:isActive( )
	SF.CheckType( self, dframe_metamethods )

	return punwrap( self ):IsActive( )
end

function dframe_methods:setBackgroundBlur( enable )
	SF.CheckType( self, dframe_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):SetBackgroundBlur( enable )
end

function dframe_methods:setDeleteOnClose( enable )
	SF.CheckType( self, dframe_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):SetDeleteOnClose( enable )
end

function dframe_methods:setDraggable( enable )
	SF.CheckType( self, dframe_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):SetDraggable( enable )
end

function dframe_methods:setIsMenu( enable )
	SF.CheckType( self, dframe_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):SetIsMenu( enable )
end

function dframe_methods:setMinHeight( height )
	SF.CheckType( self, dframe_metamethods )
	SF.CheckType( height, "number" )

	punwrap( self ):SetMinHeight( height )
end

function dframe_methods:setMinWidth( width )
	SF.CheckType( self, dframe_metamethods )
	SF.CheckType( width, "number" )

	punwrap( self ):SetMinWidth( width )
end

function dframe_methods:setPaintShadow( enable )
	SF.CheckType( self, dframe_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):SetPaintShadow( enable )
end

function dframe_methods:setScreenLock( enable )
	SF.CheckType( self, dframe_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):SetScreenLock( enable )
end

function dframe_methods:setSizable( enable )
	SF.CheckType( self, dframe_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):SetSizable( enable )
end

function dframe_methods:setTitle( title )
	SF.CheckType( self, dframe_metamethods )
	SF.CheckType( title, "string" )

	punwrap( self ):SetTitle( title )
end

function dframe_methods:showCloseButton( enable )
	SF.CheckType( self, dframe_metamethods )
	SF.CheckType( enable, "boolean" )

	punwrap( self ):ShowCloseButton( enable )
end