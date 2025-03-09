local theme_settings = T{}

theme_settings.Theme = {}
theme_settings.Theme.Name = 'FF3'
theme_settings.Theme.Width = 780
theme_settings.Theme.Height = 38

theme_settings.Theme.Bar = {}
theme_settings.Theme.Bar.Hp_Width = 244
theme_settings.Theme.Bar.Hp_Height = 11
theme_settings.Theme.Bar.Hp_Offset_X = 6
theme_settings.Theme.Bar.Hp_Offset_Y = 5

theme_settings.Theme.Bar.Mp_Width = 244
theme_settings.Theme.Bar.Mp_Height = theme_settings.Theme.Bar.Hp_Height
theme_settings.Theme.Bar.Mp_Offset_X = theme_settings.Theme.Bar.Hp_Offset_X + theme_settings.Theme.Bar.Mp_Width + 18
theme_settings.Theme.Bar.Mp_Offset_Y = theme_settings.Theme.Bar.Hp_Offset_Y

theme_settings.Theme.Bar.Tp1_Width = 244
theme_settings.Theme.Bar.Tp1_Height = theme_settings.Theme.Bar.Hp_Height
theme_settings.Theme.Bar.Tp1_Offset_X = theme_settings.Theme.Bar.Hp_Offset_X + (theme_settings.Theme.Bar.Mp_Width * 2) + 18 + 18
theme_settings.Theme.Bar.Tp1_Offset_Y = theme_settings.Theme.Bar.Hp_Offset_Y

theme_settings.Theme.Bar.Tp2_Width = 244
theme_settings.Theme.Bar.Tp2_Height = theme_settings.Theme.Bar.Hp_Height
theme_settings.Theme.Bar.Tp2_Offset_X = theme_settings.Theme.Bar.Tp1_Offset_X
theme_settings.Theme.Bar.Tp2_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Bar.Tp3_Width = 244
theme_settings.Theme.Bar.Tp3_Height = theme_settings.Theme.Bar.Hp_Height
theme_settings.Theme.Bar.Tp3_Offset_X = theme_settings.Theme.Bar.Tp1_Offset_X
theme_settings.Theme.Bar.Tp3_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Job_Icon_Offset_X = -100
theme_settings.Theme.Job_Icon_Offset_Y = -20

theme_settings.Theme.Bar.Spacing = 0

theme_settings.Theme.DimTpBar = true
theme_settings.Theme.ColorHpText = true

theme_settings.Texts = {}
theme_settings.Texts.Size = 18

theme_settings.Texts.Offset_HP_X = theme_settings.Theme.Bar.Hp_Offset_X + 80
theme_settings.Texts.Offset_HP_Y = theme_settings.Theme.Bar.Hp_Offset_Y + 11
theme_settings.Texts.Offset_MP_X = theme_settings.Theme.Bar.Mp_Offset_X + 80
theme_settings.Texts.Offset_MP_Y = theme_settings.Theme.Bar.Mp_Offset_Y + 11
theme_settings.Texts.Offset_TP_X = theme_settings.Theme.Bar.Tp1_Offset_X + 80
theme_settings.Texts.Offset_TP_Y = theme_settings.Theme.Bar.Tp1_Offset_Y + 11

return theme_settings
