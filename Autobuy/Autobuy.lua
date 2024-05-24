--[[
			Script LUA Aimware v5.1
            This is a lua script for autobuy
		UID: https://aimware.net/forum/user/338736
--]]

--#region variables
local local_version = "1.0"
local name_script = "Autobuy.lua"
local default = false
--events
local event_gameStart = "game_start"
local event_prestart = "round_prestart"
local event_FireGameEvent = "FireGameEvent"
--items for Autobuy
local buyScout = "buy ssg08;"
local buyAwp = "buy awp;"
local buyAsniper = "buy scar20; buy g3sg1;"

local buyDeagle = "buy deagle;"
local buyRevolver = "buy revolver;"
local buyDuals = "buy elite;"

local buyVest = "buy vest;"
local buyVesthelm = "buy vesthelm;"

local buyFlash = "buy flashbang;"
local buyGrenede = "buy hegrenade;"
local buyMolotov = "buy molotov; buy incgrenade;"
local buyDefuser = "buy defuser;"
--#endregion

--#region GUI
local ref = gui.Reference("Ragebot");
local tab = gui.Tab(ref, "Autobuy", "Autobuy"); --?
local main_groupbox = gui.Groupbox(tab, "Autobuy by Cheater2/4", 16, 19, 608);

local masterSwitch_checkbox = gui.Checkbox(main_groupbox, "masterSwitch_checkbox", "Enable the autobuyer", default);

local riffles_groupbox = gui.Groupbox(main_groupbox, "Riffles", 1, 28, 280);
local buyScout_checkbox = gui.Checkbox(riffles_groupbox, "buyScout_checkbox", "Buy Scout", default);
local buyAwp_checkbox = gui.Checkbox(riffles_groupbox, "buyAwp_checkbox", "Buy AWP", default);
local buyAsniper_checkbox = gui.Checkbox(riffles_groupbox, "buyAsniper_checkbox", "Buy Autosniper", default);

local pistols_groupbox = gui.Groupbox(main_groupbox, "Pistols", 1, 195, 280);
local buyDeagle_checkbox = gui.Checkbox(pistols_groupbox, "buyDeagle_checkbox", "Buy Deagle", default);
local buyRevolver_checkbox = gui.Checkbox(pistols_groupbox, "buyRevolver_checkbox", "Buy Revolver", default);
local buyDuals_checkbox = gui.Checkbox(pistols_groupbox, "buyDuals_checkbox", "Buy Dual Berettas", default);

local armor_groupbox = gui.Groupbox(main_groupbox, "Armor", 295, 28, 280);
local buyVest_checkbox = gui.Checkbox(armor_groupbox, "buyVest_checkbox", "Buy Kevlar", default);
local buyHelmet_checkbox = gui.Checkbox(armor_groupbox, "buyHelmet_checkbox", "Buy Kevlar + Helmet", default);

local utilities_groupbox = gui.Groupbox(main_groupbox, "Utilities", 295, 159, 280);
local buyFlash_checkbox = gui.Checkbox(utilities_groupbox, "buyFlash_checkbox", "Buy Flashbang", default);
local buyGrenede_checkbox = gui.Checkbox(utilities_groupbox, "buyGrenede_checkbox", "Buy Grenede", default);
local buyMolotov_checkbox = gui.Checkbox(utilities_groupbox, "buyMolotov_checkbox", "Buy Molotov", default);
local buyDefuser_checkbox = gui.Checkbox(utilities_groupbox, "buyDefuser_checkbox", "Buy Defuser", default);
--#endregion

--#region Autobuy
local items = {buyScout, buyAwp, buyAsniper, 
                    buyDeagle, buyRevolver, buyDuals, 
                    buyVest, buyVesthelm, 
                    buyFlash, buyGrenede, buyMolotov, buyDefuser}
local checkboxes = {buyScout_checkbox, buyAwp_checkbox, buyAsniper_checkbox,
                    buyDeagle_checkbox, buyRevolver_checkbox, buyDuals_checkbox,
                    buyVest_checkbox, buyHelmet_checkbox,
                    buyFlash_checkbox, buyGrenede_checkbox, buyMolotov_checkbox, buyDefuser_checkbox}
local function autobuy(event)
    print(tostring(event:GetName()))
    if masterSwitch_checkbox:GetValue() == true and (event:GetName() == event_gameStart) or (event:GetName() == event_prestart) then
        for i in pairs(checkboxes) do 
            if checkboxes[i]:GetValue() == true then
                client.Command(items[i], true)
            end
        end
    end
end
client.AllowListener(event_prestart);
callbacks.Register(event_FireGameEvent, "autobuy", autobuy);
--#endregion
