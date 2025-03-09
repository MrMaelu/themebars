
--[[
      Modified by MrMaelu for ThemeBars
]]

require('common')
local imgui = require('imgui')
local chat = require('chat');

local showConfig = false;
local configInitialized = false;

-- find all our layouts and strip _alliance and file extensions
-- return a list of all sub directories
---@return table theme_paths
local function get_theme_paths()
    local path = ('%s\\themes'):fmt(addon.path);
    return ashita.fs.get_directory(path);
end 

---@return table style_paths
local function get_style_paths()
    local path = ('%s\\themes\\%s\\styles'):fmt(addon.path, settings.Theme.Name)
	return ashita.fs.get_directory(path);
end 

local function DrawConfigMenu()
	if (configInitialized == false) then
		imgui.SetNextWindowPos({
			(gTheme_options.screen_x + gTheme_options.offset_x) * settings.Theme.Scale,
			(gTheme_options.screen_y + gTheme_options.offset_y) * settings.Theme.Scale
		});
		imgui.SetNextWindowSize({1,1});
		configInitialized = true;
	end

	imgui.PushStyleColor(ImGuiCol_WindowBg, {1,1,0,1});
	imgui.PushStyleVar(ImGuiStyleVar_WindowBorderSize, 3);
	imgui.Begin(("themebars: move bar"), true, bit.bor(ImGuiWindowFlags_NoSavedSettings, ImGuiWindowFlags_NoDecoration))
	local posX, posY = imgui.GetWindowPos();
	posX = (posX / settings.Theme.Scale) - gTheme_options.screen_x;
	posY = (posY / settings.Theme.Scale) - gTheme_options.screen_y;
	if (settings.Bars.OffsetX ~= posX or settings.Bars.OffsetY ~= posY) then
		settings.Bars.OffsetX = posX;
		settings.Bars.OffsetY = posY;
		OnSettingsUpdated();
	end
	imgui.End();
	imgui.PopStyleColor(1);
	imgui.PopStyleVar(1);

	if(imgui.Begin(("themebars config"), true, ImGuiWindowFlags_AlwaysAutoResize)) then

		-- Use tabs for this config menu
		imgui.BeginTabBar('XivParty Settings Tabs');

		-- General
		if imgui.BeginTabItem('General') then

            -- theme
            local theme_paths = get_theme_paths();
            if (imgui.BeginCombo('Theme', settings.Theme.Name)) then
                for i = 1,#theme_paths,1 do
                    local is_selected = i == settings.Theme.Name;

                    if (imgui.Selectable(theme_paths[i], is_selected) and theme_paths[i] ~= settings.Theme.Name) then
                        settings.Theme.Name = theme_paths[i];
						refresh_settings();
						OnSettingsUpdated();
                    end

                    if (is_selected) then
                        imgui.SetItemDefaultFocus();
                    end
                end
                imgui.EndCombo();
            end
            imgui.ShowHelp('The theme to use for bar images [xiv_bar/themes]');

			-- Style
			local style_paths = get_style_paths();
			local style_base = ('%s\\themes\\%s\\styles\\'):fmt(addon.path, settings.Theme.Name)
			if style_paths ~= nil and #style_paths > 0 then
				local current_style = settings.bar_background:match("styles\\([^\\]+)\\bar_bg.png") or settings.bar_background
				local current_style_index = 1
				for i = 1, #style_paths do
					if style_paths[i] == current_style then
						current_style_index = i
						break
					end
				end

				if current_style_index == 1 and settings.bar_background ~= style_base .. tostring(style_paths[1]) .. '\\bar_bg.png' then
					settings.bar_background = style_base .. tostring(style_paths[1]) .. '\\bar_bg.png'
					refresh_settings();
					OnSettingsUpdated();
				end

				local style_index = { current_style_index }
				if (imgui.SliderInt('Style', style_index, 1, #style_paths)) then
					local selected_style = style_paths[style_index[1]]
					local style_path = style_base .. tostring(selected_style) .. '\\bar_bg.png'
					if style_path ~= settings.bar_background then
						settings.bar_background = style_path
						refresh_settings();
						OnSettingsUpdated();
					end
				end
				imgui.ShowHelp('The theme style to use for bar images');
			else
				local default_bar_bg = ('%s\\themes\\%s\\bar_bg.png'):fmt(addon.path, settings.Theme.Name)
				if settings.bar_background ~= default_bar_bg then
					settings.bar_background = default_bar_bg
					refresh_settings();
					OnSettingsUpdated();
				end
				imgui.Text('')
			end

			imgui.Separator();

			if scaleFactor == nil then
				scaleFactor = { settings.Theme.Scale * 100 };
			end
			if (imgui.SliderInt('Scale', scaleFactor, 50, 150)) then
				onSliderChange(scaleFactor[1] / 100);
			end

			imgui.Separator();

			-- Stroke Settings
			local fontSize = { settings.Texts.Size };
				if (imgui.SliderInt('Font size', fontSize, 8, 32)) then
					settings.Texts.Size = fontSize[1];
					OnSettingsUpdated();
				end
			-- Stroke Settings
			local strokeWidth = { settings.Texts.Stroke.Width };
			if (imgui.SliderInt('Stroke Width', strokeWidth, 0, 8)) then
				settings.Texts.Stroke.Width = strokeWidth[1];
				OnSettingsUpdated();
			end

			imgui.Separator();

            local fontRed = { settings.Texts.Color.Red };
			if (imgui.SliderInt('Font Red', fontRed, 0, 255)) then
				settings.Texts.Color.Red = fontRed[1];
				OnSettingsUpdated();
			end
            local fontGreen = { settings.Texts.Color.Green };
			if (imgui.SliderInt('Font Green', fontGreen, 0, 255)) then
				settings.Texts.Color.Green = fontGreen[1];
				OnSettingsUpdated();
			end
            local fontBlue = { settings.Texts.Color.Blue };
			if (imgui.SliderInt('Font Blue', fontBlue, 0, 255)) then
				settings.Texts.Color.Blue = fontBlue[1];
				OnSettingsUpdated();
			end

			imgui.Separator();

            local strokeRed = { settings.Texts.Stroke.Red };
			if (imgui.SliderInt('stroke Red', strokeRed, 0, 255)) then
				settings.Texts.Stroke.Red = strokeRed[1];
				OnSettingsUpdated();
			end
            local strokeGreen = { settings.Texts.Stroke.Green };
			if (imgui.SliderInt('stroke Green', strokeGreen, 0, 255)) then
				settings.Texts.Stroke.Green = strokeGreen[1];
				OnSettingsUpdated();
			end
            local strokeBlue = { settings.Texts.Stroke.Blue };
			if (imgui.SliderInt('stroke Blue', strokeBlue, 0, 255)) then
				settings.Texts.Stroke.Blue = strokeBlue[1];
				OnSettingsUpdated();
			end

			imgui.Separator();

			imgui.EndTabItem();
		end

		-- HP Bar
		if imgui.BeginTabItem('HP Bar') then

            if (imgui.Checkbox('Color HP Text', { settings.Theme.ColorHpText })) then
				settings.Theme.ColorHpText = not settings.Theme.ColorHpText;
				OnSettingsUpdated();
			end
			imgui.ShowHelp('Color HP based on percent');

			imgui.Separator();

            local midHpR = { settings.Texts.HpMid.Red };
			if (imgui.SliderInt('75% HP Red', midHpR, 0, 255)) then
				settings.Texts.HpMid.Red = midHpR[1];
				OnSettingsUpdated();
			end
            local midHpG = { settings.Texts.HpMid.Green };
			if (imgui.SliderInt('75% HP Green', midHpG, 0, 255)) then
				settings.Texts.HpMid.Green = midHpG[1];
				OnSettingsUpdated();
			end
            local midHpB = { settings.Texts.HpMid.Blue };
			if (imgui.SliderInt('75% HP Blue', midHpB, 0, 255)) then
				settings.Texts.HpMid.Blue = midHpB[1];
				OnSettingsUpdated();
			end
			
			imgui.Separator();

			local lowHpR = { settings.Texts.HpLow.Red };
			if (imgui.SliderInt('50% HP Red', lowHpR, 0, 255)) then
				settings.Texts.FullTpColor.Red = lowHpR[1];
				OnSettingsUpdated();
			end
            local lowHpG = { settings.Texts.HpLow.Green };
			if (imgui.SliderInt('50% HP Green', lowHpG, 0, 255)) then
				settings.Texts.HpLow.Green = lowHpG[1];
				OnSettingsUpdated();
			end
            local lowHpB = { settings.Texts.HpLow.Blue };
			if (imgui.SliderInt('50% HP Blue', lowHpB, 0, 255)) then
				settings.Texts.HpLow.Blue = lowHpB[1];
				OnSettingsUpdated();
			end

			imgui.Separator();

			local critHpR = { settings.Texts.HpCritical.Red };
			if (imgui.SliderInt('25% HP Red', critHpR, 0, 255)) then
				settings.Texts.HpCritical.Red = critHpR[1];
				OnSettingsUpdated();
			end
            local critHpG = { settings.Texts.HpCritical.Green };
			if (imgui.SliderInt('25% HP Green', critHpG, 0, 255)) then
				settings.Texts.HpCritical.Green = critHpG[1];
				OnSettingsUpdated();
			end
            local critHpB = { settings.Texts.HpCritical.Blue };
			if (imgui.SliderInt('25% HP Blue', critHpB, 0, 255)) then
				settings.Texts.HpCritical.Blue = critHpB[1];
				OnSettingsUpdated();
			end

			imgui.Separator();

			imgui.EndTabItem();
		end

		-- TP Bar
		if imgui.BeginTabItem('TP Bar') then
            if (imgui.Checkbox('Dim TP Text', { settings.Theme.DimTpBar })) then
				settings.Theme.DimTpBar = not settings.Theme.DimTpBar;
				OnSettingsUpdated();
			end
			imgui.ShowHelp('Dim the TP bar when TP is below 1000');

			imgui.Separator();

            -- TP Full Font Settings
            local fullTpRed = { settings.Texts.FullTpColor.Red };
			if (imgui.SliderInt('Full TP Red', fullTpRed, 0, 255)) then
				settings.Texts.FullTpColor.Red = fullTpRed[1];
				OnSettingsUpdated();
			end
            local fullTpGreen = { settings.Texts.FullTpColor.Green };
			if (imgui.SliderInt('Full TP Green', fullTpGreen, 0, 255)) then
				settings.Texts.FullTpColor.Green = fullTpGreen[1];
				OnSettingsUpdated();
			end
            local fullTpBlue = { settings.Texts.FullTpColor.Blue };
			if (imgui.SliderInt('Full TP Blue', fullTpBlue, 0, 255)) then
				settings.Texts.FullTpColor.Blue = fullTpBlue[1];
				OnSettingsUpdated();
			end

			imgui.Separator();

			imgui.EndTabItem();
		end
		imgui.EndTabBar();
		imgui.End();
	end
end

ashita.events.register('d3d_present', '__config_present_cb', function ()

    if (showConfig) then
        DrawConfigMenu();
    end

end);

ashita.events.register('command', '__config_command_cb', function (e)
	-- Parse the command arguments
	local command_args = e.command:lower():args()
    if table.contains({'/themebars', '/tb'}, command_args[1]) then
		-- Toggle the config menu
		configInitialized = false;
		showConfig = not showConfig;
		if (not showConfig) then
			UpdateSettings();
		else
			print(chat.header(addon.name)..'Config opened (/tb or /themebars)')
			print(chat.header(addon.name)..'Retype the command to save and close')
			print(chat.header(addon.name)..'To move bar click and drag the yellow box')
		end
		e.blocked = true;
	end
end);