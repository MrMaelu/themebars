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

local defaults = T{}

defaults.Sidebar = false

defaults.Bars = {}
defaults.Bars.OffsetX = 0
defaults.Bars.OffsetY = 0
defaults.Bars.FgOffsetX = 0
defaults.Bars.FgOffsetY = 0

defaults.Theme = {}
defaults.Theme.Name = 'XVI'
defaults.Theme.Width = 500
defaults.Theme.Height = 100
defaults.Theme.Scale = 1.0

defaults.Theme.Bar = {}
defaults.Theme.Bar.Hp_Width = 1000
defaults.Theme.Bar.Hp_Height = 10
defaults.Theme.Bar.Hp_Offset_X = 0
defaults.Theme.Bar.Hp_Offset_Y = 0

defaults.Theme.Bar.Hp_Shade_Width = 1000
defaults.Theme.Bar.Hp_Shade_Height = 10
defaults.Theme.Bar.Hp_Shade_Offset_X = 0
defaults.Theme.Bar.Hp_Shade_Offset_Y = 0

defaults.Theme.Bar.Mp_Width = 100
defaults.Theme.Bar.Mp_Height = 10
defaults.Theme.Bar.Mp_Offset_X = 0
defaults.Theme.Bar.Mp_Offset_Y = 0

defaults.Theme.Bar.Tp1_Width = 100
defaults.Theme.Bar.Tp1_Height = 10
defaults.Theme.Bar.Tp1_Offset_X = 0
defaults.Theme.Bar.Tp1_Offset_Y = 0

defaults.Theme.Bar.Tp2_Width = 100
defaults.Theme.Bar.Tp2_Height = 10
defaults.Theme.Bar.Tp2_Offset_X = 0
defaults.Theme.Bar.Tp2_Offset_Y = 0

defaults.Theme.Bar.Tp3_Width = 100
defaults.Theme.Bar.Tp3_Height = 10
defaults.Theme.Bar.Tp3_Offset_X = 0
defaults.Theme.Bar.Tp3_Offset_Y = 0

defaults.Theme.Job_Icon_Offset_X = 0
defaults.Theme.Job_Icon_Offset_Y = 0

defaults.Theme.Bar.Spacing = 0

defaults.Theme.DimTpBar = true
defaults.Theme.ColorHpText = true

defaults.Texts = {}
defaults.Texts.Font = 'Rockwell'
defaults.Texts.Size = 12
defaults.Texts.Offset_HP_X = 25
defaults.Texts.Offset_HP_Y = 25
defaults.Texts.Offset_MP_X = 25
defaults.Texts.Offset_MP_Y = 25
defaults.Texts.Offset_TP_X = 25
defaults.Texts.Offset_TP_Y = 25

defaults.Texts.Color = {}
defaults.Texts.Color.Red = 255
defaults.Texts.Color.Green = 255
defaults.Texts.Color.Blue = 255

defaults.Texts.Stroke = {}
defaults.Texts.Stroke.Width = 3
defaults.Texts.Stroke.Red = 50
defaults.Texts.Stroke.Green = 50
defaults.Texts.Stroke.Blue = 50

defaults.Texts.FullTpColor = {}
defaults.Texts.FullTpColor.Red = 80
defaults.Texts.FullTpColor.Green = 180
defaults.Texts.FullTpColor.Blue = 250

defaults.Texts.HpMid = {}
defaults.Texts.HpMid.Red = 255
defaults.Texts.HpMid.Green = 255
defaults.Texts.HpMid.Blue = 0

defaults.Texts.HpLow = {}
defaults.Texts.HpLow.Red = 255
defaults.Texts.HpLow.Green = 150
defaults.Texts.HpLow.Blue = 0

defaults.Texts.HpCritical = {}
defaults.Texts.HpCritical.Red = 255
defaults.Texts.HpCritical.Green = 0
defaults.Texts.HpCritical.Blue = 0

return defaults