local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/ZlvXs/LinoriaLib/refs/heads/main/Remake/lib.lua'))()
local SaveManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/ZlvXs/LinoriaLib/refs/heads/main/Remake/savemanager.lua'))()
local ThemeManager = loadstring(game:HttpGet('https://raw.githubusercontent.com/ZlvXs/LinoriaLib/refs/heads/main/Remake/themes.lua'))()

local Window = Library:CreateWindow({ Size = UDim2.fromOffset(550, 610),
    Title = "linoria remake <font color=\"#d17bff\">example</font> | by <font color=\"#ff1100\">@qquixn</font>", --- color only support hex
    Center = true,
    AutoShow = true
})

local Tabs = {
    tab = Window:AddTab('tab'),
    UISettings = Window:AddTab('settings')
}

Library:Notify(("1 second"), 1)
Library:Notify(("2 seconds"), 2)
Library:Notify(("3 seconds"), 3)

local leftgroupbox = Tabs.tab:AddLeftGroupbox('left groupbox')

leftgroupbox:AddButton('button', function()
    print("button pressed")
end)

leftgroupbox:AddToggle('toggleflag', {Text = 'toggle', Default = false}):OnChanged(function(x)
    print(x)
end)

leftgroupbox:AddSlider('sliderflag', {Text = '0 rounding', Default = 1, Min = 0, Max = 100, Suffix = "%", Rounding = 0, Compact = false}):OnChanged(function(x)
    print(x)
end)

leftgroupbox:AddSlider('sliderflag', {Text = '1 rounding', Default = 1, Min = 0, Max = 100, Suffix = "%", Rounding = 1, Compact = false}):OnChanged(function(x)
    print(x)
end)

leftgroupbox:AddSlider('sliderflag', {Text = '2 rounding', Default = 1, Min = 0, Max = 100, Suffix = "%", Rounding = 2, Compact = false}):OnChanged(function(x)
    print(x)
end)

leftgroupbox:AddSlider('sliderflag', {Text = '3 rounding', Default = 1, Min = 0, Max = 100, Suffix = "%", Rounding = 3, Compact = false}):OnChanged(function(x)
    print(x)
end)

leftgroupbox:AddSlider('sliderflag', {Text = 'compact true', Default = 1, Min = 0, Max = 100, Suffix = "%", Rounding = 0, Compact = true}):OnChanged(function(x)
    print(x)
end)

leftgroupbox:AddInput('textboxflag', {Default = "hi" , Numeric = false, Finished = true, Text = 'textbox', Placeholder = "why did u put it empty?",}):OnChanged(function(x)
    print(x)
end)

leftgroupbox:AddDropdown('dropdownflag1', {Values = {'option 1', 'option 2', 'option 3'}, Default = 1, Multi = false, Text = 'multi false'})
Options.dropdownflag1:OnChanged(function(X)
    print(x)
end)

leftgroupbox:AddDropdown('dropdownflag2', {Values = {'hi', 'how', 'are', 'u', '?'}, Default = 1, Multi = true, Text = 'multi true'})
Options.dropdownflag2:OnChanged(function(X)
    print(x)
end)

leftgroupbox:AddLabel('color picker'):AddColorPicker('colorpickerflag', {Default = Color3.fromRGB(80,80,80)})
Options.colorpickerflag:OnChanged(function(x)
    print(x)
end)

--[[ idk how to use this but i will put it anyways
    leftgroupbox:AddLabel('keybind'):AddKeyPicker('keybindflag', {Default = 'none', SyncToggleState = false, Mode = 'Toggle', Text = 'ww', NoUI = false})
    Options.keybindflag:OnClick(function(x)
        print(x)
    end)

    noUI makes it invisible in the menu keybind
    and the mode you can choose between toggle, click and hold i think
]]

leftgroupbox:AddToggle('toggleflag2',{ Text = 'toggle w keybind', Default = false }):AddKeyPicker('keybindflag2', {Default = 'none', SyncToggleState = true, Mode = 'Toggle', Text = 'this will show in the keybind menu', NoUI = false}):OnChanged(function(x)
    print(x)
end)

local rightgroupbox = Tabs.tab:AddRightGroupbox('right groupbox')

rightgroupbox:AddButton('hi', function()
    print("wsg")
end)

local tabbox = Tabs.tab:AddRightTabbox() --- you can change it to AddLeftTabbox
local right = tabbox:AddTab('right')

right:AddButton('tab', function()
    print("tab")
end)

local tabboxx = tabbox:AddTab('tabboxx')

tabboxx:AddButton('box', function()
    print("box")
end)

local UITabBox = Tabs.UISettings:AddLeftTabbox()
local UITab = UITabBox:AddTab('menu')

UITab:AddLabel('menu keybind'):AddKeyPicker('MenuKeybind', { Default = "F1", NoUI = true, Text = 'menu keybind' })
Library.ToggleKeybind = Options.MenuKeybind

UITab:AddToggle('UISettings_KeybindFrameVisibility', {Text = 'show menu keybinds', Default = true}):OnChanged(function()
    Library.KeybindFrame.Visible = Toggles.UISettings_KeybindFrameVisibility.Value
end)

UITab:AddToggle('WatermarkToggle', { Text = 'watermark', Default = false})
Toggles.WatermarkToggle:OnChanged(function()
while Toggles.WatermarkToggle.Value do
task.wait(1)
local fps = string.format('%.0f', game.Stats.Workspace.Heartbeat:GetValue())
local ping = string.format('%.0f', game.Stats.Network.ServerStatsItem["Data Ping"]:GetValue())
Library:SetWatermark('watermark   -   FPS: ' .. fps .. '   -   Ping: ' .. ping .. '   -   [ example by @qquinx ] ')
Library:SetWatermarkVisibility(true)
end
Library:SetWatermarkVisibility(false)
end)

UITab:AddButton('panic button', function()
    Library:Unload()
    for i,v in pairs(Toggles) do
    v:SetValue(false)
    end
end)

local label = Tabs.UISettings:AddRightTabbox()
local labeltab = label:AddTab('extra')
labeltab:AddLabel('this is a<font color="#de6cff"> label</font>')
labeltab:AddLabel('example by<font color="#de6cff"> @qquinx</font>')

SaveManager:SetLibrary(Library)
SaveManager:SetFolder('linoriaremake/folder')
SaveManager:BuildConfigSection(Tabs.UISettings)
SaveManager:IgnoreThemeSettings()
ThemeManager:SetLibrary(Library)
ThemeManager:SetFolder('linoriaremake/themes')
ThemeManager:ApplyToTab(Tabs.UISettings)

loadstring(game:HttpGet('https://raw.githubusercontent.com/ZlvXs/LinoriaLib/refs/heads/main/Remake/loadermanager.lua'))
