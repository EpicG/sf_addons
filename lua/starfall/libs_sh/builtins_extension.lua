function SF.DefaultEnvironment.lerp( percent, from, to )
	SF.CheckType( percent, "number" )
	SF.CheckType( from, "number" )
	SF.CheckType( to, "number" )

	return Lerp( percent, from, to )
end

function SF.DefaultEnvironment.lerpAngle( percent, from, to )
	SF.CheckType( percent, "number" )
	SF.CheckType( from, SF.Types[ "Angle" ] )
	SF.CheckType( to, SF.Types[ "Angle" ] )

	return SF.WrapObject( LerpAngle( percent, SF.UnwrapObject( from ), SF.UnwrapObject( to ) ) )
end

function SF.DefaultEnvironment.lerpVector( percent, from, to )
	SF.CheckType( percent, "number" )
	SF.CheckType( from, SF.Types[ "Vector" ] )
	SF.CheckType( to, SF.Types[ "Vector" ] )

	return SF.WrapObject( LerpVector( percent, SF.UnwrapObject( from ), SF.UnwrapObject( to ) ) )
end

if CLIENT then
	--- Returns client's screen width
	-- @name SF.DefaultEnvironment.scrW
	-- @class function
	-- @return Screen width of current client
	SF.DefaultEnvironment.scrW = ScrW

	--- Returns client's screen height
	-- @name SF.DefaultEnvironment.scrH
	-- @class function
	-- @return Screen height of current client
	SF.DefaultEnvironment.scrH = ScrH
end

--- Returns the time in seconds it took to render the last frame
-- @name SF.DefaultEnvironment.frameTime
-- @class function
-- @return Time in seconds
SF.DefaultEnvironment.frameTime = FrameTime

--- Returns the percent of quota used
-- @name SF.DefaultEnvironment.quotaPercent
-- @class function
-- @return Percent of quota used
function SF.DefaultEnvironment.quotaPercent()
    return 100 * ( SF.instance.cpu_total / SF.instance.context.cpuTime.getMax() )
end

--- Returns if the quota has not exceeded the given limit
-- @name SF.DefaultEnvironment.quotaSafe
-- @class function
-- @param quota The max "safe" quota
-- @return Whether the quota is under the maximum safe quota
function SF.DefaultEnvironment.quotaSafe( quota )
    return 100 * ( SF.instance.cpu_total / SF.instance.context.cpuTime.getMax() ) < quota
end
