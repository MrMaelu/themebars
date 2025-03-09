local theme_settings = T{}

theme_settings.Sidebar = true

theme_settings.Bars = {}
theme_settings.Bars.FgOffsetX = 0
theme_settings.Bars.FgOffsetY = 0

theme_settings.Theme = {}
theme_settings.Theme.Name = 'ffxi_2'
theme_settings.Theme.Width = 584
theme_settings.Theme.Height = 80

theme_settings.Theme.Bar = {}
theme_settings.Theme.Bar.Hp_Width = 572
theme_settings.Theme.Bar.Hp_Height = 10
theme_settings.Theme.Bar.Hp_Offset_X = 6
theme_settings.Theme.Bar.Hp_Offset_Y = 44

theme_settings.Theme.Bar.Mp_Width = 274
theme_settings.Theme.Bar.Mp_Height = 10
theme_settings.Theme.Bar.Mp_Offset_X = 6
theme_settings.Theme.Bar.Mp_Offset_Y = 62

theme_settings.Theme.Bar.Tp1_Width = 84
theme_settings.Theme.Bar.Tp1_Height = 10
theme_settings.Theme.Bar.Tp1_Offset_X = 304
theme_settings.Theme.Bar.Tp1_Offset_Y = 62

theme_settings.Theme.Bar.Tp2_Width = theme_settings.Theme.Bar.Tp1_Width
theme_settings.Theme.Bar.Tp2_Height = theme_settings.Theme.Bar.Tp1_Height
theme_settings.Theme.Bar.Tp2_Offset_X = theme_settings.Theme.Bar.Tp1_Offset_X + theme_settings.Theme.Bar.Tp1_Width + 11
theme_settings.Theme.Bar.Tp2_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Bar.Tp3_Width = theme_settings.Theme.Bar.Tp1_Width
theme_settings.Theme.Bar.Tp3_Height = theme_settings.Theme.Bar.Tp1_Height
theme_settings.Theme.Bar.Tp3_Offset_X = theme_settings.Theme.Bar.Tp2_Offset_X + theme_settings.Theme.Bar.Tp2_Width + 11
theme_settings.Theme.Bar.Tp3_Offset_Y = theme_settings.Theme.Bar.Tp2_Offset_Y

theme_settings.Theme.Job_Icon_Offset_X = 0
theme_settings.Theme.Job_Icon_Offset_Y = 0

theme_settings.Theme.Bar.Spacing = 0

theme_settings.Theme.DimTpBar = true
theme_settings.Theme.ColorHpText = true

theme_settings.Texts = {}
theme_settings.Texts.Font = 'Lucida Calligraphy'

theme_settings.Texts.Size = 16
theme_settings.Texts.Offset_HP_X = 60
theme_settings.Texts.Offset_HP_Y = 20
theme_settings.Texts.Offset_MP_X = 150
theme_settings.Texts.Offset_MP_Y = theme_settings.Texts.Offset_HP_Y
theme_settings.Texts.Offset_TP_X = 260
theme_settings.Texts.Offset_TP_Y = theme_settings.Texts.Offset_HP_Y

return theme_settings
