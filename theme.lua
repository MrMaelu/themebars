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

local theme = {}

theme.apply = function (settings)
    local options = {}
    theme_path = ('%sthemes\\%s\\'):fmt(addon.path, settings.Theme.Name)

    options.sidebar = settings.Sidebar

    options.height = settings.Theme.Height
    options.width = settings.Theme.Width
    options.scale = settings.Theme.Scale
    options.offset_x = settings.Bars.OffsetX
    options.offset_y = settings.Bars.OffsetY

    options.fg_offset_x = settings.Bars.FgOffsetX
    options.fg_offset_y = settings.Bars.FgOffsetY

    options.bar_background = settings.bar_background
    options.bar_foreground = theme_path .. 'bar_fg.png'
    options.bar_hp = theme_path .. 'hp_fg.png'
    options.bar_hp_shade = theme_path .. 'hp_shade.png'
    options.bar_mp = theme_path .. 'mp_fg.png'
    options.bar_tp1 = theme_path .. 'tp1_fg.png'
    options.bar_tp2 = theme_path .. 'tp2_fg.png'
    options.bar_tp3 = theme_path .. 'tp3_fg.png'

    options.job_icon = settings.Theme.Job_Icon

    options.font = settings.Texts.Font
    options.font_size = settings.Texts.Size
    options.font_color_red = settings.Texts.Color.Red
    options.font_color_green = settings.Texts.Color.Green
    options.font_color_blue = settings.Texts.Color.Blue
    options.font_stroke_width = settings.Texts.Stroke.Width
    options.font_stroke_color_red = settings.Texts.Stroke.Red
    options.font_stroke_color_green = settings.Texts.Stroke.Green
    options.font_stroke_color_blue = settings.Texts.Stroke.Blue
    options.full_tp_color_red = settings.Texts.FullTpColor.Red
    options.full_tp_color_green = settings.Texts.FullTpColor.Green
    options.full_tp_color_blue = settings.Texts.FullTpColor.Blue

    options.full_tp_color_red = settings.Texts.FullTpColor.Red
    options.full_tp_color_green = settings.Texts.FullTpColor.Green
    options.full_tp_color_blue = settings.Texts.FullTpColor.Blue

    options.mid_hp_color_red = settings.Texts.HpMid.Red
    options.mid_hp_color_green = settings.Texts.HpMid.Green
    options.mid_hp_color_blue = settings.Texts.HpMid.Blue

    options.low_hp_color_red = settings.Texts.HpLow.Red
    options.low_hp_color_green = settings.Texts.HpLow.Green
    options.low_hp_color_blue = settings.Texts.HpLow.Blue

    options.critical_hp_color_red = settings.Texts.HpCritical.Red
    options.critical_hp_color_green = settings.Texts.HpCritical.Green
    options.critical_hp_color_blue = settings.Texts.HpCritical.Blue

    options.text_offset_hp_x = settings.Texts.Offset_HP_X
    options.text_offset_hp_y = settings.Texts.Offset_HP_Y
    options.text_offset_mp_x = settings.Texts.Offset_MP_X
    options.text_offset_mp_y = settings.Texts.Offset_MP_Y
    options.text_offset_tp_x = settings.Texts.Offset_TP_X
    options.text_offset_tp_y = settings.Texts.Offset_TP_Y

    options.bar_hp_width = settings.Theme.Bar.Hp_Width
    options.bar_hp_height = settings.Theme.Bar.Hp_Height
    options.bar_hp_offset_x = settings.Theme.Bar.Hp_Offset_X
    options.bar_hp_offset_y = settings.Theme.Bar.Hp_Offset_Y

    options.bar_hp_shade_width = settings.Theme.Bar.Hp_Shade_Width
    options.bar_hp_shade_height = settings.Theme.Bar.Hp_Shade_Height
    options.bar_hp_shade_offset_x = settings.Theme.Bar.Hp_Shade_Offset_X
    options.bar_hp_shade_offset_y = settings.Theme.Bar.Hp_Shade_Offset_Y

    options.bar_mp_width = settings.Theme.Bar.Mp_Width
    options.bar_mp_height = settings.Theme.Bar.Mp_Height
    options.bar_mp_offset_x = settings.Theme.Bar.Mp_Offset_X
    options.bar_mp_offset_y = settings.Theme.Bar.Mp_Offset_Y
    
    options.bar_tp1_width = settings.Theme.Bar.Tp1_Width
    options.bar_tp1_height = settings.Theme.Bar.Tp1_Height
    options.bar_tp1_offset_x = settings.Theme.Bar.Tp1_Offset_X
    options.bar_tp1_offset_y = settings.Theme.Bar.Tp1_Offset_Y
    
    options.bar_tp2_width = settings.Theme.Bar.Tp2_Width
    options.bar_tp2_height = settings.Theme.Bar.Tp2_Height
    options.bar_tp2_offset_x = settings.Theme.Bar.Tp2_Offset_X
    options.bar_tp2_offset_y = settings.Theme.Bar.Tp2_Offset_Y
    
    options.bar_tp3_width = settings.Theme.Bar.Tp3_Width
    options.bar_tp3_height = settings.Theme.Bar.Tp3_Height
    options.bar_tp3_offset_x = settings.Theme.Bar.Tp3_Offset_X
    options.bar_tp3_offset_y = settings.Theme.Bar.Tp3_Offset_Y

    options.Job_Icon_Offset_X = settings.Theme.Job_Icon_Offset_X
    options.Job_Icon_Offset_Y = settings.Theme.Job_Icon_Offset_Y
        
    options.bar_spacing = settings.Theme.Bar.Spacing

    options.dim_tp_bar = settings.Theme.DimTpBar
    options.use_hp_colors = settings.Theme.ColorHpText

    options.screen_x = AshitaCore:GetConfigurationManager():GetFloat('boot', 'ffxi.registry', '0001', 1024) / 2 - (options.width / 2)
    options.screen_y = AshitaCore:GetConfigurationManager():GetFloat('boot', 'ffxi.registry', '0002', 768) - 60

    return options
end

return theme