local theme_settings = T{}

theme_settings.Theme = {}
theme_settings.Theme.Name = 'minimal'
theme_settings.Theme.Width = 1108
theme_settings.Theme.Height = 33

theme_settings.Theme.Bar = {}
theme_settings.Theme.Bar.Hp_Width = 1102
theme_settings.Theme.Bar.Hp_Height = 4
theme_settings.Theme.Bar.Hp_Offset_X = 3
theme_settings.Theme.Bar.Hp_Offset_Y = 1

theme_settings.Theme.Bar.Mp_Width = 1102
theme_settings.Theme.Bar.Mp_Height = 4
theme_settings.Theme.Bar.Mp_Offset_X = theme_settings.Theme.Bar.Hp_Offset_X
theme_settings.Theme.Bar.Mp_Offset_Y = 8

theme_settings.Theme.Bar.Tp1_Width = 364
theme_settings.Theme.Bar.Tp1_Height = 4
theme_settings.Theme.Bar.Tp1_Offset_X = theme_settings.Theme.Bar.Hp_Offset_X
theme_settings.Theme.Bar.Tp1_Offset_Y = 15

theme_settings.Theme.Bar.Tp2_Width = 364
theme_settings.Theme.Bar.Tp2_Height = 4
theme_settings.Theme.Bar.Tp2_Offset_X = theme_settings.Theme.Bar.Tp1_Offset_X + theme_settings.Theme.Bar.Tp1_Width + 5
theme_settings.Theme.Bar.Tp2_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Bar.Tp3_Width = 364
theme_settings.Theme.Bar.Tp3_Height = 4
theme_settings.Theme.Bar.Tp3_Offset_X = theme_settings.Theme.Bar.Tp2_Offset_X + theme_settings.Theme.Bar.Tp1_Width + 5
theme_settings.Theme.Bar.Tp3_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Job_Icon_Offset_X = -100
theme_settings.Theme.Job_Icon_Offset_Y = -20

theme_settings.Theme.Bar.Spacing = 0

theme_settings.Theme.DimTpBar = true
theme_settings.Theme.ColorHpText = true

theme_settings.Texts = {}
theme_settings.Texts.Size = 14

theme_settings.Texts.Offset_HP_X = theme_settings.Theme.Bar.Hp_Offset_X + 55
theme_settings.Texts.Offset_HP_Y = theme_settings.Theme.Bar.Hp_Offset_Y + 17
theme_settings.Texts.Offset_MP_X = theme_settings.Texts.Offset_HP_X + 65
theme_settings.Texts.Offset_MP_Y = theme_settings.Texts.Offset_HP_Y
theme_settings.Texts.Offset_TP_X = theme_settings.Texts.Offset_MP_X + 75
theme_settings.Texts.Offset_TP_Y = theme_settings.Texts.Offset_HP_Y

return theme_settings
