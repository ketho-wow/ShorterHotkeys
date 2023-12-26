if WOW_PROJECT_ID ~= WOW_PROJECT_MAINLINE then
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

for _, btn in pairs(ActionBarButtonEventsFrame.frames) do
	hooksecurefunc(btn, "UpdateHotkeys", UpdateHotkey)
end

for _, btn in pairs(PetActionBar.actionButtons) do
	hooksecurefunc(btn, "SetHotkeys", UpdateHotkey)
end
