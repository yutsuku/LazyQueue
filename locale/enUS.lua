local _G = getfenv()
local LazyQueue = _G.LazyQueue
local enUS = LazyQueue.Locale:new()
local L = enUS.Strings

LazyQueue.Locales = LazyQueue.Locales or LazyQueue.LocaleTable:new(enUS)
LazyQueue.Locales['enUS'] = enUS

-- zone names
L['Alterac Valley']	= 'Alterac Valley'
L['Arathi Basin'] 	= 'Arathi Basin'
L['Warsong Gulch'] 	= 'Warsong Gulch'

L['Queue'] 			= 'Queue'
L['AV'] 			= 'AV'
L['AB'] 			= 'AB'
L['WSG'] 			= 'WSG'