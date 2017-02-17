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