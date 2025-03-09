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
        (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
        LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
        ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
        (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
        SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]]

--[[
      Modified by MrMaelu for ThemeBars
]]

text_elements = {
    elements = {
    -- Primary Resources
        hp_text  = {x = "text_offset_hp_x",  y = "text_offset_hp_y",  scale = 1},
        mp_text  = {x = "text_offset_mp_x",  y = "text_offset_mp_y",  scale = 1},
        tp_text  = {x = "text_offset_tp_x",  y = "text_offset_tp_y",  scale = 1},
    },

    order = {
        "hp_text", "mp_text", "tp_text"
    }
}

local ui = {}

-- setup images
function setup_image(image, path)
    if (image) then
        image:SetPath(path)
        image.visible = true
    end
end

-- setup text
local function get_text_settings(theme_options)
    local font_settings = {
        box_height = 0,
        box_width = 0,
        font_alignment = texts.Alignment.Right;
        font_color = tonumber(string.format('%02x%02x%02x%02x', 255, theme_options.font_color_red, theme_options.font_color_green, theme_options.font_color_blue), 16),
        font_family = texts:get_font_available(theme_options.font) and theme_options.font or 'Arial',
        font_flags = texts.FontFlags.Bold,
        font_height = theme_options.font_size,
        gradient_color = 0x00000000,
        gradient_style = 0,

        outline_color = tonumber(string.format('%02x%02x%02x%02x', 255, theme_options.font_stroke_color_red, theme_options.font_stroke_color_green, theme_options.font_stroke_color_blue), 16),
        outline_width = theme_options.font_stroke_width,
    
        position_x = 0,
        position_y = 0,
        text = '',
    };
    return font_settings
end

function update_text(textObject, theme_options)
    if (textObject == nil) then return end

    textObject:set_font_height(theme_options.font_size * settings.Theme.Scale)
    textObject:set_outline_width(theme_options.font_stroke_width)
    textObject:set_font_color(tonumber(string.format('%02x%02x%02x%02x', 255, theme_options.font_color_red, theme_options.font_color_green, theme_options.font_color_blue), 16))
    textObject:set_font_family(texts:get_font_available(theme_options.font) and theme_options.font or 'Arial')
    textObject:set_outline_color(tonumber(string.format('%02x%02x%02x%02x', 255, theme_options.font_stroke_color_red, theme_options.font_stroke_color_green, theme_options.font_stroke_color_blue), 16))
end

-- load the images and text
function ui:load(theme_options)
    ui.background = images:new()
    ui.hp_bar = images:new()
    ui.hp_bar_shade = images:new()
    ui.mp_bar = images:new()
    ui.tp1_bar = images:new()
    ui.tp2_bar = images:new()
    ui.tp3_bar = images:new()
    ui.foreground = images:new()

    ui.job_icon = images:new()

    setup_image(self.background, theme_options.bar_background)
    setup_image(self.hp_bar, theme_options.bar_hp)
    setup_image(self.hp_bar_shade, theme_options.bar_hp_shade)
    setup_image(self.mp_bar, theme_options.bar_mp)
    setup_image(self.tp1_bar, theme_options.bar_tp1)
    setup_image(self.tp2_bar, theme_options.bar_tp2)
    setup_image(self.tp3_bar, theme_options.bar_tp3)
    setup_image(self.foreground, theme_options.bar_foreground)
    
    setup_image(self.job_icon, theme_options.job_icon)

    local textSettings = get_text_settings(theme_options)
    for _, name in ipairs(text_elements.order) do
        local element = text_elements.elements[name]
        ui[name] = texts:create_object(textSettings, false)
        ui[name]:set_font_height(theme_options.font_size * settings.Theme.Scale * element.scale)
    end

    self:position(theme_options)
end

function ui:reload(theme_options)
    setup_image(self.background, theme_options.bar_background)
    setup_image(self.hp_bar, theme_options.bar_hp)
    setup_image(self.hp_bar_shade, theme_options.bar_hp_shade)
    setup_image(self.mp_bar, theme_options.bar_mp)
    setup_image(self.tp1_bar, theme_options.bar_tp1)
    setup_image(self.tp2_bar, theme_options.bar_tp2)
    setup_image(self.tp3_bar, theme_options.bar_tp3)
    setup_image(self.foreground, theme_options.bar_foreground)
    
    setup_image(self.job_icon, theme_options.job_icon)

    for _, name in ipairs(text_elements.order) do
        update_text(self[name], theme_options)
        ui[name]:set_font_height(theme_options.font_size * settings.Theme.Scale * text_elements.elements[name].scale)
    end

    ui:position(theme_options)
end

-- position the images and text
function ui:position(theme_options)
    local scale = settings.Theme.Scale
    local x = AshitaCore:GetConfigurationManager():GetFloat('boot', 'ffxi.registry', '0001', 1024) / 2 - (theme_options.width / 2) + theme_options.offset_x
    local y = AshitaCore:GetConfigurationManager():GetFloat('boot', 'ffxi.registry', '0002', 768) - 60 + theme_options.offset_y

    self.background.position_x = x
    self.background.position_y = y
    self.foreground.position_x = x + theme_options.fg_offset_x
    self.foreground.position_y = y + theme_options.fg_offset_y

    self.hp_bar.position_x = x + theme_options.bar_hp_offset_x
    self.hp_bar.position_y = y + theme_options.bar_hp_offset_y
    self.hp_bar_shade.position_x = x + theme_options.bar_hp_shade_offset_x
    self.hp_bar_shade.position_y = y + theme_options.bar_hp_shade_offset_y
    self.mp_bar.position_x = x + theme_options.bar_mp_offset_x
    self.mp_bar.position_y = y + theme_options.bar_mp_offset_y
    self.tp1_bar.position_x = x + theme_options.bar_tp1_offset_x
    self.tp1_bar.position_y = y + theme_options.bar_tp1_offset_y
    self.tp2_bar.position_x = x + theme_options.bar_tp2_offset_x
    self.tp2_bar.position_y = y + theme_options.bar_tp2_offset_y
    self.tp3_bar.position_x = x + theme_options.bar_tp3_offset_x
    self.tp3_bar.position_y = y + theme_options.bar_tp3_offset_y

    self.job_icon.position_x = x + theme_options.Job_Icon_Offset_X
    self.job_icon.position_y = y + theme_options.Job_Icon_Offset_Y

    local y_offset = 0

    for index, name in ipairs(text_elements.order) do
        local element = text_elements.elements[name]

        if index > 3 then
            y_offset = y_offset + (theme_options.font_size * settings.Theme.Scale * element.scale)
        end

        local pos_x, pos_y

        if not theme_options.sidebar then
            pos_x = (x + theme_options[element.x]) * scale
            pos_y = (y + theme_options[element.y] + y_offset) * scale
        else
            pos_x = (theme_options[element.x]) * scale
            pos_y = (theme_options[element.y]) * scale

            if index <= 3 then
                pos_x = (x + theme_options[element.x]) * scale
                pos_y = (y + theme_options[element.y] + y_offset) * scale
            end
        end
        self[name]:set_position_x(pos_x)
        self[name]:set_position_y(pos_y)
    end


end

-- hide ui
function ui:hide()
    if (self.background == nil) then return end
    self.background.visible = false
    self.hp_bar.visible = false
    self.hp_bar_shade.visible = false
    self.mp_bar.visible = false
    self.tp1_bar.visible = false
    self.tp2_bar.visible = false
    self.tp3_bar.visible = false
    self.foreground.visible = false
    self.job_icon.visible = false

    for _, name in ipairs(text_elements.order) do
        self[name]:set_visible(false)
    end

end

-- show ui
function ui:show()
    if (self.background == nil) then return; end;
    self.background.visible = true
    self.hp_bar.visible = true
    self.hp_bar_shade.visible = true
    self.mp_bar.visible = true
    self.tp1_bar.visible = true
    self.tp2_bar.visible = true
    self.tp3_bar.visible = true
    self.foreground.visible = true
    self.job_icon.visible = true

    for _, name in ipairs(text_elements.order) do
        self[name]:set_visible(true)
    end

end

return ui