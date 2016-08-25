--
-- classic
--
-- Copyright (c) 2014, rxi
--
-- This module is free software; you can redistribute it and/or modify it under
-- the terms of the MIT license. See LICENSE for details.
--

--- Class Library
-- @shared
local class_library, class_metamethods = SF.Libraries.Register( "class" )

function class_library:new()
end

function class_library:extend()
    local cls = {}
    for k, v in pairs( class_metamethods ) do
        if k:find("__") == 1 then
            cls[k] = v
        end
    end
    cls.__index = cls
    cls.super = self
    setmetatable( cls, cls )
    return cls
end


function class_library:implement(...)
    for _, cls in pairs({...}) do
        for k, v in pairs(cls) do
            if self[k] == nil and type(v) == "function" then
                self[k] = v
            end
        end
    end
end


function class_library:is(T)
    local mt = getmetatable(self)
    while mt do
        if mt == T then
            return true
        end
        mt = getmetatable(mt)
    end
    return false
end

function class_metamethods:__tostring()
    return "Object"
end

function class_metamethods:__call(...)
    local obj = setmetatable( {}, self )
    obj:new(...)
    return obj
end
