local _G = getfenv();
local LazyQueue = _G.LazyQueue;

local Locale = {};

function Locale:new()
    local locale = {
        Strings = {},
    };

    setmetatable(locale.Strings, {
        __index = function (self, str)
            return str;
        end,
    });

    return locale;
end

LazyQueue.Locale = Locale;