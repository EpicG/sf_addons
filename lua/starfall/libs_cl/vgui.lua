local vgui_library, _ = SF.Libraries.Register( "vgui" )

local punwrap = SF.Panel.unwrap
local plyCount = SF.Panel.plyCount

function vgui_library.create( classname, parent, name )
    SF.CheckType( classname, "string" )
    if parent then SF.CheckType( parent, SF.Types[ "Panel" ] ) end
    if name then SF.CheckType( name, "string" ) end

	if not SF.Permissions.check( SF.instance.player, self, "panel.access" ) then SF.throw( "Insufficient permissions", 2 ) return end

	local instance = SF.instance
	local paneldata = instance.data.panels

	if SF.Panel[ classname ] then
		local panel = vgui.Create( classname, punwrap( parent ), name )

		if panel and panel:IsValid() then
			local wrappedPanel = SF.Panel.wrap( panel, classname )

			if wrappedPanel then
				paneldata.panels[ wrappedPanel ] = true
				paneldata.count = paneldata.count + 1

				plyCount[ instance.player ] = plyCount[ instance.player ] + 1

				return wrappedPanel
			else
				panel:Remove( )
			end
		end
	end
end