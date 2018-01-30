local _G = getfenv()
local LazyQueue = _G.LazyQueue
local L = LazyQueue.Locales[_G.GetLocale()].Strings

local frame = CreateFrame('Frame')
LazyQueue.frame = frame

frame:SetScript('OnEvent', function()
	this[event](this)
end)

frame:RegisterEvent('ADDON_LOADED')
frame:RegisterEvent('BATTLEFIELDS_SHOW')
frame:RegisterEvent('PLAYER_ENTERING_WORLD')

function LazyQueue.Join()
	if _G.LazyQueueDB.WSG then
		SendChatMessage(_G.LazyQueueDB.Commands.WSG, 'SAY')
	end
	if _G.LazyQueueDB.AB then
		SendChatMessage(_G.LazyQueueDB.Commands.AB, 'SAY')
	end
	if _G.LazyQueueDB.AV then
		SendChatMessage(_G.LazyQueueDB.Commands.AV, 'SAY')
	end
end

function frame:ADDON_LOADED()
	if arg1 ~= 'LazyQueue' then
		return
	end

	if not _G.LazyQueueDB then
		_G.LazyQueueDB = {
			['Commands'] = {
				['WSG'] = '.join wsg',
				['AB'] = '.join ab',
				['AV'] = '.join av',
			}
		}
	end
	
	LazyQueue.UI.Load()
	
	if not _G.LazyQueueDB.enabled then
		return
	end
	
	-- don't attempt to queue from bg!
	local zone = _G.GetRealZoneText()
	if zone ~= L['Warsong Gulch'] and zone ~= L['Arathi Basin'] and zone ~= L['Alterac Valley'] then
		LazyQueue.Join()
	end
end

function frame:PLAYER_ENTERING_WORLD()
	if not _G.LazyQueueDB.enabled then
		return
	end
	
	-- don't attempt to queue from bg!
	local zone = _G.GetRealZoneText()
	if zone ~= L['Warsong Gulch'] and zone ~= L['Arathi Basin'] and zone ~= L['Alterac Valley'] then
		LazyQueue.Join()
	end
end


function frame:BATTLEFIELDS_SHOW()
	local bg = GetBattlefieldInfo()
	local asGroup = 0
	
	if GetNumPartyMembers() > 0 or GetNumRaidMembers() > 0 and IsPartyLeader() then
		asGroup = 1
	end
	
	if _G.LazyQueueDB.WSG and bg == L['Warsong Gulch'] then
		JoinBattlefield(0, asGroup)
		_G.BattlefieldFrameCancelButton:Click()
	elseif _G.LazyQueueDB.AB and bg == L['Arathi Basin'] then
		JoinBattlefield(0, asGroup)
		_G.BattlefieldFrameCancelButton:Click()
	elseif _G.LazyQueueDB.AV and bg == L['Alterac Valley'] then
		JoinBattlefield(0, asGroup)
		_G.BattlefieldFrameCancelButton:Click()
	end
end