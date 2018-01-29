local _G = getfenv();
local LazyQueue = _G.LazyQueue;

local LocaleTable = {};

function LocaleTable:new(defaultLocale)
    local localeTable = {
        DEFAULT = defaultLocale,
    };

    setmetatable(localeTable, {
        __index = function (self, key)
            return self.DEFAULT;
        end,
    });

    return localeTable;
end

LazyQueue.LocaleTable = LocaleTable;