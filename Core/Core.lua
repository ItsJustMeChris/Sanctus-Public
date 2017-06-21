--[[
███████╗ ██████╗ ██████╗ ███████╗
██╔════╝██╔═══██╗██╔══██╗██╔════╝
██║     ██║   ██║██████╔╝█████╗
██║     ██║   ██║██╔══██╗██╔══╝
╚██████╗╚██████╔╝██║  ██║███████╗
╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝
]]--

local version = 2
local ver = "|cFF2ECC71"..version.."|r"
local user = UnitName("player")
local playerspec = select(2, GetSpecializationInfo(GetSpecialization()))
toggle = false
debug = false
cds = false
taunt = false
tauntall = false
function start()
	AddTimerCallback (.1,function()
		rotationSelect()
	end)
end
local hookedTalents = false
local frame = CreateFrame('Frame')
frame:RegisterEvent("ADDON_LOADED")
frame:SetScript("OnEvent", function(self, event, addon)
    if addon == "Blizzard_TalentUI" then
        if not hookedTalents then
            hooksecurefunc("PlayerTalentFrameTalent_OnClick", function(self, button)
                for i = 1, #self:GetParent().talents do
                    RemoveTalent(self:GetParent().talents[i]:GetID())
                    RemoveTalent(self:GetParent().talents[i]:GetID())
					UIErrorsFrame:Clear()

                end
                C_Timer.After(0.45, function()
                    LearnTalent(self:GetID())
                end)
            end)
        end
        hookedTalents = true
    end
end)

function Print(msg)
    print("|cFFF27935[Sanctus]|r "..msg)
end

function toggleSanctus()
    if toggle then
        toggle = false
        Print("Disabled")
    else
        toggle = true
        Print("Enabled")
    end
end

function toggleDebugger()
    if debug then
        debug = false
        Print("Debugger Disabled")
    else
        debug = true
        Debug("Enabled")
    end
end

function toggleCDs()
    if cds then
        cds = false
		Print("CDs Disabled")
	else
        cds = true
        Print("CDs Enabled")
    end
end

function toggleTaunt()
    if taunt then
        taunt = false
		Print("Taunting Disabled")
	else
        taunt = true
        Print("Taunting Enabled")
    end
end

function toggleTauntAll()
    if tauntall then
        tauntall = false
		Print("Taunting All Disabled")
	else
        tauntall = true
        Print("Taunting All Enabled")
    end
end

function Debug(msg)
	local time = GetGameTime()
	local min = select(2,GetGameTime())
	if debug then
		WriteFile (GetWoWDirectory() .. "\\" .. "Interface" .. "\\" ..  "Addons" .. "\\" .. "Sanctus" .. "\\" .. "Debug" .. "\\" .. "debug"..debugseed..".sanctus", "\n".."["..time..":"..min.."] "..msg, true)
		Print("["..time..":"..min.."] ".."|cFFFF5733Debugger Caught |r"..msg)
	end
end




function listCommands()
    Print("Current Commands")
    Print("help:  Reveals this list")
	Print("debug:  Enables debugging code, you shouldn't need this but it's there!")
    Print("toggle:  Enables and Disables the bot")
    Print("toggle cds:  Enables and Disables the use of Cooldowns")
	Print("toggle taunt:  Enables and Disables the use of Cooldowns")
	Print("tome:  Removes your talents without the need of having a tome in your bags.  ")
end

SLASH_SANCTUS1 = '/sanctus'
function handler(text, editbox)
	local msg = string.lower(text)
  	if msg == "toggle" then
  		toggleSanctus()
	elseif msg == "debug" then
		toggleDebugger()
	elseif msg == "toggle cds" then
		toggleCDs()
	elseif msg == "toggle taunt" then
		toggleTaunt()
	elseif msg == "toggle tauntall" then
		toggleTauntAll()
	elseif msg == "toggle spinbot" then
		togglespin()
	elseif msg == "toggle spinsilent" then
		togglespinsilent()
    elseif msg == "help" then
        listCommands()
	elseif msg == "l0l1dk" then
		Print("Isn't l0l1dk amazing!")
	elseif msg == "" then
		Print("Just Do It.  ")
	else
		Print("Invalid Command: |cFFFF0000" .. msg .. "|r try /sanctus help")
  end
end
SlashCmdList["SANCTUS"] = handler;
start()

AddEventCallback("PLAYER_ENTERING_WORLD", function()
	Print("Loaded Sanctus Version "..ver)
	Print("Welcome to Sanctus, "..user)
end)
