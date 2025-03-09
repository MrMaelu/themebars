local theme_settings = T{}

theme_settings.Theme = {}
theme_settings.Theme.Name = 'monsterhunter'
theme_settings.Theme.Width = 570
theme_settings.Theme.Height = 116

theme_settings.Theme.Bar = {}
theme_settings.Theme.Bar.Hp_Width = 440
theme_settings.Theme.Bar.Hp_Height = 7
theme_settings.Theme.Bar.Hp_Offset_X = 102
theme_settings.Theme.Bar.Hp_Offset_Y = 46

theme_settings.Theme.Bar.Mp_Width = 440
theme_settings.Theme.Bar.Mp_Height = 7
theme_settings.Theme.Bar.Mp_Offset_X = theme_settings.Theme.Bar.Hp_Offset_X
theme_settings.Theme.Bar.Mp_Offset_Y = theme_settings.Theme.Bar.Hp_Offset_Y + 17

theme_settings.Theme.Bar.Tp1_Width = 80
theme_settings.Theme.Bar.Tp1_Height = 7
theme_settings.Theme.Bar.Tp1_Offset_X = theme_settings.Theme.Bar.Hp_Offset_X + 9
theme_settings.Theme.Bar.Tp1_Offset_Y = theme_settings.Theme.Bar.Mp_Offset_Y + 23

theme_settings.Theme.Bar.Tp2_Width = 80
theme_settings.Theme.Bar.Tp2_Height = 7
theme_settings.Theme.Bar.Tp2_Offset_X = theme_settings.Theme.Bar.Tp1_Offset_X + theme_settings.Theme.Bar.Tp1_Width + 45
theme_settings.Theme.Bar.Tp2_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Bar.Tp3_Width = 80
theme_settings.Theme.Bar.Tp3_Height = 7
theme_settings.Theme.Bar.Tp3_Offset_X = theme_settings.Theme.Bar.Tp2_Offset_X + theme_settings.Theme.Bar.Tp1_Width + 45
theme_settings.Theme.Bar.Tp3_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Job_Icon_Offset_X = 45
theme_settings.Theme.Job_Icon_Offset_Y = 40

theme_settings.Theme.Bar.Spacing = 0

theme_settings.Theme.DimTpBar = true
theme_settings.Theme.ColorHpText = true

theme_settings.Texts = {}
theme_settings.Texts.Size = 20

theme_settings.Texts.Offset_HP_X = theme_settings.Theme.Bar.Hp_Offset_X + 515
theme_settings.Texts.Offset_HP_Y = theme_settings.Theme.Bar.Hp_Offset_Y - 8
theme_settings.Texts.Offset_MP_X = theme_settings.Theme.Bar.Mp_Offset_X + 515
theme_settings.Texts.Offset_MP_Y = theme_settings.Theme.Bar.Mp_Offset_Y - 8
theme_settings.Texts.Offset_TP_X = theme_settings.Theme.Bar.Tp1_Offset_X + 400
theme_settings.Texts.Offset_TP_Y = theme_settings.Theme.Bar.Tp1_Offset_Y - 8

return theme_settings
