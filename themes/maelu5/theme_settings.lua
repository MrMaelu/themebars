local theme_settings = T{}

theme_settings.Theme = {}
theme_settings.Theme.Name = 'maelu5'
theme_settings.Theme.Width = 511
theme_settings.Theme.Height = 95

theme_settings.Theme.Bar = {}
theme_settings.Theme.Bar.Hp_Width = 475
theme_settings.Theme.Bar.Hp_Height = 9
theme_settings.Theme.Bar.Hp_Offset_X = 18
theme_settings.Theme.Bar.Hp_Offset_Y = 43

theme_settings.Theme.Bar.Mp_Width = 344
theme_settings.Theme.Bar.Mp_Height = 9
theme_settings.Theme.Bar.Mp_Offset_X = theme_settings.Theme.Bar.Hp_Offset_X + 65
theme_settings.Theme.Bar.Mp_Offset_Y = 9

theme_settings.Theme.Bar.Tp1_Width = 113
theme_settings.Theme.Bar.Tp1_Height = 9
theme_settings.Theme.Bar.Tp1_Offset_X = theme_settings.Theme.Bar.Mp_Offset_X
theme_settings.Theme.Bar.Tp1_Offset_Y = 77

theme_settings.Theme.Bar.Tp2_Width = theme_settings.Theme.Bar.Tp1_Width
theme_settings.Theme.Bar.Tp2_Height = theme_settings.Theme.Bar.Tp1_Height
theme_settings.Theme.Bar.Tp2_Offset_X = theme_settings.Theme.Bar.Tp1_Offset_X + theme_settings.Theme.Bar.Tp1_Width + 2
theme_settings.Theme.Bar.Tp2_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Bar.Tp3_Width = theme_settings.Theme.Bar.Tp1_Width
theme_settings.Theme.Bar.Tp3_Height = theme_settings.Theme.Bar.Tp1_Height
theme_settings.Theme.Bar.Tp3_Offset_X = theme_settings.Theme.Bar.Tp2_Offset_X + theme_settings.Theme.Bar.Tp1_Width + 3
theme_settings.Theme.Bar.Tp3_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Job_Icon_Offset_X = (theme_settings.Theme.Bar.Hp_Width / 2) - 35
theme_settings.Theme.Job_Icon_Offset_Y = 90

theme_settings.Theme.Bar.Spacing = 0

theme_settings.Theme.DimTpBar = true
theme_settings.Theme.ColorHpText = true

theme_settings.Texts = {}
theme_settings.Texts.Size = 24

theme_settings.Texts.Offset_HP_X = theme_settings.Theme.Bar.Hp_Offset_X - 20
theme_settings.Texts.Offset_HP_Y = theme_settings.Theme.Bar.Hp_Offset_Y - 8
theme_settings.Texts.Offset_MP_X = theme_settings.Theme.Bar.Mp_Offset_X - 20
theme_settings.Texts.Offset_MP_Y = theme_settings.Theme.Bar.Mp_Offset_Y - 8
theme_settings.Texts.Offset_TP_X = theme_settings.Theme.Bar.Tp1_Offset_X - 20
theme_settings.Texts.Offset_TP_Y = theme_settings.Theme.Bar.Tp1_Offset_Y - 8

return theme_settings
