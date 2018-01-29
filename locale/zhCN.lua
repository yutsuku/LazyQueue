local _G = getfenv();
local LazyQueue = _G.LazyQueue;
local zhCN = LazyQueue.Locale:new();
local L = zhCN.Strings;

LazyQueue.Locales = LazyQueue.Locales or LazyQueue.LocaleTable:new(zhCN);
LazyQueue.Locales["zhCN"] = zhCN;

L['Alterac Valley']	= '奥特兰克山谷'
L['Arathi Basin'] 	= '阿拉希盆地'
L['Warsong Gulch'] 	= '战歌峡谷'
