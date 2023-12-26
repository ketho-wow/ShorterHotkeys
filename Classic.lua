local isWrath = WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC
local isClassic = WOW_PROJECT_ID == WOW_PROJECT_CLASSIC

if not isWrath and not isClassic then
	return
end

local function UpdateHotkey(self, actionButtonType)
	local hotkey = self.HotKey
	local text = hotkey:GetText()
	for k, v in pairs(ShorterHotkeys.patterns) do
		text = text:gsub(k, v)
	end
	hotkey:SetText(ShorterHotkeys.keys[text] or text)
end

hooksecurefunc("ActionButton_UpdateHotkeys", UpdateHotkey)
