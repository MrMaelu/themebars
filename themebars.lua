--[[
        Copyright © 2017, SirEdeonX
        All rights reserved.

        Redistribution and use in source and binary forms, with or without
        modification, are permitted provided that the following conditions are met:

            * Redistributions of source code must retain the above copyright
              notice, this list of conditions and the following disclaimer.
            * Redistributions in binary form must reproduce the above copyright
              notice, this list of conditions and the following disclaimer in the
              documentation and/or other materials provided with the distribution.
            * Neither the name of xivbar nor the
              names of its contributors may be used to endorse or promote products
              derived from this software without specific prior written permission.

        THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
        ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
        WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
        DISCLAIMED. IN NO EVENT SHALL SirEdeonX BE LIABLE FOR ANY
        DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
        (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES
        LOSS OF USE, DATA, OR PROFITS OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
        ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
        (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
        SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

--[[
    This is a rework and rename of the original xivbar addon by Edeon.
]]

-- Addon description
addon.name = 'ThemeBars'
addon.author = ' MrMaelu (Themebars rework/rename) Tirem (Rework) Edeon (Original)'
addon.version = '1.0.0'

-- Libs
local settingsLib = require('settings')
images = require('libs/sprites')
texts  = require('libs/gdifonts/include')

local configMenu = require('config')

-- Slider debounce variables
local scaleUpdateTimer = 0
local scaleUpdateDelay = 200  -- Adjust delay (in ms)
local pendingScale = nil

local bLoggedIn = false
local playerIndex = AshitaCore:GetMemoryManager():GetParty():GetMemberTargetIndex(0)
if playerIndex ~= 0 then
    local entity = AshitaCore:GetMemoryManager():GetEntity()
    local flags = entity:GetRenderFlags0(playerIndex)
    if (bit.band(flags, 0x200) == 0x200) and (bit.band(flags, 0x4000) == 0) then
        bLoggedIn = true
	end
end

--Thanks to Velyn for the event system and interface hidden signatures!
local pGameMenu = ashita.memory.find('FFXiMain.dll', 0, "8B480C85C974??8B510885D274??3B05", 16, 0)
local pEventSystem = ashita.memory.find('FFXiMain.dll', 0, "A0????????84C0741AA1????????85C0741166A1????????663B05????????0F94C0C3", 0, 0)
local pInterfaceHidden = ashita.memory.find('FFXiMain.dll', 0, "8B4424046A016A0050B9????????E8????????F6D81BC040C3", 0, 0)

local function GetMenuName()
    local subPointer = ashita.memory.read_uint32(pGameMenu)
    local subValue = ashita.memory.read_uint32(subPointer)
    if (subValue == 0) then
        return ''
    end
    local menuHeader = ashita.memory.read_uint32(subValue + 4)
    local menuName = ashita.memory.read_string(menuHeader + 0x46, 16)
    return string.gsub(tostring(menuName), '\x00', '')
end

local function GetEventSystemActive()
    if (pEventSystem == 0) then
        return false
    end
    local ptr = ashita.memory.read_uint32(pEventSystem + 1)
    if (ptr == 0) then
        return false
    end

    return (ashita.memory.read_uint8(ptr) == 1)

end

local function GetInterfaceHidden()
    if (pEventSystem == 0) then
        return false
    end
    local ptr = ashita.memory.read_uint32(pInterfaceHidden + 10)
    if (ptr == 0) then
        return false
    end

    return (ashita.memory.read_uint8(ptr + 0xB4) == 1)
end


local function GetGameInterfaceHidden()

	if (GetEventSystemActive()) then
		return true
	end
	if (string.match(GetMenuName(), 'map')) then
		return true
	end
    if (GetInterfaceHidden()) then
        return true
    end
	if (bLoggedIn == false) then
		return true
	end
    return false
end

-- Load theme options according to settings
-- User settings
local defaults = require('defaults')
settings = settingsLib.load(defaults)
local theme = require('theme')
local themebars = require('variables')
local original_package_path = package.path

local function update_theme_settings(settings, theme_settings)
    for key, value in pairs(theme_settings) do
        if type(value) == "table" then
            if type(settings[key]) == "table" then
                update_theme_settings(settings[key], value)
            else
                settings[key] = value
            end
        else
            settings[key] = value
        end
    end
end

function refresh_settings()
    package.path = addon.path .. 'themes\\' .. settings.Theme.Name .. '\\?.lua;' .. original_package_path
    settings_file = io.open(addon.path .. 'themes\\' .. settings.Theme.Name .. '\\theme_settings.lua', "r")

    if settings_file then
        settings_file:close()
        theme_settings = require('themes.' .. settings.Theme.Name .. '.theme_settings')
        update_theme_settings(settings, theme_settings)
    end

    gTheme_options = theme.apply(settings)

end

refresh_settings()

-- Addon Dependencies
local ui = require('ui')
local player = require('player')

-- initialize addon
local function re_initialize()
    if themebars.initialized == true then
        gTheme_options = theme.apply(settings)
        ui:reload(gTheme_options)
        -- Initialize bars
        themebars.hp_bar_width = 0
        themebars.mp_bar_width = 0

        themebars.tp1_bar_width = 0
        themebars.tp2_bar_width = 0
        themebars.tp3_bar_width = 0

        -- Set bars to update
        themebars.update_hp = true
        themebars.update_mp = true
        UpdateTpBars()

        -- Set job icon to update
        themebars.update_job = true
    end
end

local function initialize()
    if themebars.initialized == true then return end
    gTheme_options = theme.apply(settings)
    ui:load(gTheme_options)

    local ashitaParty = AshitaCore:GetMemoryManager():GetParty()
    local ashitaPlayer = AshitaCore:GetMemoryManager():GetPlayer()

    if ashitaPlayer ~= nil and ashitaParty ~= nil then
        player.hpp = math.clamp(ashitaParty:GetMemberHPPercent(0), 0, 100)
        player.mpp = math.clamp(ashitaParty:GetMemberMPPercent(0), 0, 100)
        player.current_hp = ashitaParty:GetMemberHP(0)
        player.current_mp = ashitaParty:GetMemberMP(0)
        player.current_tp = ashitaParty:GetMemberTP(0)

        player:calculate_tpp()

        job = ashitaParty:GetMemberMainJob(0)

        themebars.initialized = true
    end
end

function onSliderChange(newScale)
    pendingScale = newScale
    scaleUpdateTimer = ashita.time.clock().ms + scaleUpdateDelay
end

function OnSettingsUpdated()
    if themebars.initialized == true then
        re_initialize()
    else
        initialize()
    end
end

function UpdateSettings(s)
    if (s ~= nil) then
        settings = s
    end
    OnSettingsUpdated()
    settingsLib.save()
end

settingsLib.register('settings', 'settings_update', function (s)
    UpdateSettings(s)
end)

local function GetHPTextColor(val)
    local color = { gTheme_options.font_color_red, gTheme_options.font_color_green, gTheme_options.font_color_blue }
    if val >= 0 then
        if val < 25 then
            color = { gTheme_options.critical_hp_color_red, gTheme_options.critical_hp_color_green, gTheme_options.critical_hp_color_blue }
        elseif val < 50 then
            color = { gTheme_options.low_hp_color_red, gTheme_options.low_hp_color_green, gTheme_options.low_hp_color_blue }
        elseif val < 75 then
            color = { gTheme_options.mid_hp_color_red, gTheme_options.mid_hp_color_green, gTheme_options.mid_hp_color_blue }
        end
    end
    return color
end

-- update a bar
local function update_bar(bar, text, width, current, pp, flag)
    local bar_config = {}
    bar_config[1] = {base_width = gTheme_options.bar_hp_width, base_height = gTheme_options.bar_hp_height, update_status = "update_hp", set_width = "hp_bar_width"}
    bar_config[2] = {base_width = gTheme_options.bar_mp_width, base_height = gTheme_options.bar_mp_height, update_status = "update_mp", set_width = "mp_bar_width"}
    bar_config[3] = {base_width = gTheme_options.bar_tp1_width, base_height = gTheme_options.bar_tp1_height, update_status = "update_tp_1", set_width = "tp1_bar_width"}
    bar_config[4] = {base_width = gTheme_options.bar_tp2_width, base_height = gTheme_options.bar_tp2_height, update_status = "update_tp_2", set_width = "tp2_bar_width"}
    bar_config[5] = {base_width = gTheme_options.bar_tp3_width, base_height = gTheme_options.bar_tp3_height, update_status = "update_tp_3", set_width = "tp3_bar_width"}

    local base_width = bar_config[flag].base_width
    local old_width = width
    local new_width = math.min(math.floor((pp / 100) * base_width), base_width)

    if new_width ~= nil and new_width >= 0 then
        if old_width == new_width then
            if new_width == 0 then
                bar.visible = false
            end

            if not (themebars.update_tp_1 or themebars.update_tp_2 or themebars.update_tp_3) then
                themebars.update_tp = false
            end

            themebars[bar_config[flag].update_status] = false

        else
            local x = old_width
            if old_width < new_width then
                x = old_width + math.ceil((new_width - old_width) * 0.1)
                x = math.min(x, base_width)
            elseif old_width > new_width then
                x = old_width - math.ceil((old_width - new_width) * 0.1)
                x = math.max(x, 0)
            end
            themebars[bar_config[flag].set_width] = x
            bar.width = x
            bar.height = bar_config[flag].base_height
            bar.visible = true
        end
    else
        bar.visible = false
    end

    -- figure out colors
    if flag >= 3 and current > 1000 then
        text:set_font_color(tonumber(string.format('%02x%02x%02x%02x', 255, gTheme_options.full_tp_color_red, gTheme_options.full_tp_color_green, gTheme_options.full_tp_color_blue), 16))
    elseif (flag == 1 and gTheme_options.use_hp_colors) then
        local color = GetHPTextColor(player.hpp)
        text:set_font_color(tonumber(string.format('%02x%02x%02x%02x', 255, color[1], color[2], color[3]), 16))
    else
        text:set_font_color(tonumber(string.format('%02x%02x%02x%02x', (gTheme_options.dim_tp_bar and flag == 3 and 100) or 255, gTheme_options.font_color_red, gTheme_options.font_color_green, gTheme_options.font_color_blue), 16))
    end

    text:set_text(tostring(current))
end

-- hide the addon
local function hide()
    ui:hide()
    themebars.ready = false
end

-- show the addon
local function show()
    --OnSettingsUpdated()
    if themebars.initialized == false then
        initialize()
    end
    ui:show()
    themebars.ready = true
    -- Set bars to update
    themebars.update_hp = true
    themebars.update_mp = true
    UpdateTpBars()

    -- Set job icon to update
    themebars.update_job = true
end

local function UpdateJobIcon(job)
    if job ~= nil then
        local job_icon_path = ('%sthemes\\%s\\icons\\'):fmt(addon.path, settings.Theme.Name)
        local default_icon_path = ('%sicons\\'):fmt(addon.path)
        local ok, err, code = os.rename(job_icon_path, job_icon_path)
        if not ok then
            job_icon_path = default_icon_path
        end
        gTheme_options.job_icon = job_icon_path .. tostring(job) .. '.png'
        setup_image(ui.job_icon, gTheme_options.job_icon)
    end
end

-- Bind Events
-- ON LOAD
ashita.events.register('load', 'load_cb', function ()
    if GetGameInterfaceHidden() == false then
        show()
    end
end)

local function CheckVitals()
    local ashitaParty = AshitaCore:GetMemoryManager():GetParty()
    local ashitaPlayer = AshitaCore:GetMemoryManager():GetPlayer()

    if ashitaParty ~= nil then

        local currentHpp = math.clamp(ashitaParty:GetMemberHPPercent(0), 0, 100)
        if (player.hpp ~= currentHpp) then
            player.hpp = currentHpp
            themebars.update_hp = true
        end

        local currentMpp = math.clamp(ashitaParty:GetMemberMPPercent(0), 0, 100)
        if (player.mpp ~= currentMpp) then
            player.mpp = currentMpp
            themebars.update_mp = true
        end

        local current_hp = ashitaParty:GetMemberHP(0)
        if (player.current_hp ~= current_hp) then
            player.current_hp = current_hp
            themebars.update_hp = true
        end

        local current_mp = ashitaParty:GetMemberMP(0)
        if (player.current_mp ~= current_mp) then
            player.current_mp = current_mp
            themebars.update_mp = true
        end

        local current_tp = ashitaParty:GetMemberTP(0)
        if (player.current_tp ~= current_tp) then
            player.current_tp = current_tp
            player:calculate_tpp()
            UpdateTpBars()
        end

        local current_job = ashitaParty:GetMemberMainJob(0)
        if (job ~= current_job) then
            job = current_job
            themebars.update_job = true
        end
    end

end

ashita.events.register('d3d_present', 'present_cb', function ()
    if settings.Theme.Name == "Frame" then
        settings.Bars.OffsetX = 0
        settings.Bars.OffsetY = 0
    end
    -- handle hiding bars
    if themebars.hide_bars == false and GetGameInterfaceHidden() == true then
        themebars.hide_bars = true
        hide()
    elseif themebars.hide_bars == true and GetGameInterfaceHidden() == false then
        themebars.hide_bars = false
        show()
    end

    CheckVitals()

    if themebars.ready == false then return end

    if themebars.update_hp then update_bar(ui.hp_bar, ui.hp_text, themebars.hp_bar_width, player.current_hp, player.hpp, 1) end

    if themebars.update_mp then update_bar(ui.mp_bar, ui.mp_text, themebars.mp_bar_width, player.current_mp, player.mpp, 2) end

    if themebars.update_tp then
        update_bar(ui.tp1_bar, ui.tp_text, themebars.tp1_bar_width, player.current_tp, player.tpp1, 3)
        update_bar(ui.tp2_bar, ui.tp_text, themebars.tp2_bar_width, player.current_tp, player.tpp2, 4)
        update_bar(ui.tp3_bar, ui.tp_text, themebars.tp3_bar_width, player.current_tp, player.tpp3, 5)
    end

    if themebars.update_job then
        if job ~= nil then
            UpdateJobIcon(job)
        themebars.update_job = false
        end
    end

    if pendingScale and ashita.time.clock().ms >= scaleUpdateTimer then
        settings.Theme.Scale = pendingScale
        OnSettingsUpdated()
        pendingScale = nil
    end

end)

ashita.events.register('packet_in', '__themebars_packet_in_cb', function (e)
    
    -- Track our logged in status
    if (e.id == 0x00A) then
        bLoggedIn = true
	elseif (e.id == 0x00B) then
        bLoggedIn = false
    end
end)

ashita.events.register('unload', 'load_cb', function ()
    texts:destroy_interface()
end)

-- Sets all TP bars to update
function UpdateTpBars()
    themebars.update_tp = true
    themebars.update_tp_1 = true
    themebars.update_tp_2 = true
    themebars.update_tp_3 = true
end
