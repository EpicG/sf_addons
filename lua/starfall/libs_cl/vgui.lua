local vgui_library, _ = SF.Libraries.Register( "vgui" )

local pwrap, punwrap = SF.Panel.wrap, SF.Panel.unwrap

function vgui_library.create( classname, parent, name )
    SF.CheckType( classname, "string" )

    if parent then
        SF.CheckType( parent, SF.Types[ "Panel" ] )
    end

    if name then
        SF.CheckType( name, "string" )
    end

    return pwrap( vgui.Create( classname, punwrap( parent ), name ) )
end