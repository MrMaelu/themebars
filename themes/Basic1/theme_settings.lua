local theme_settings = T{}

theme_settings.Theme = {}
theme_settings.Theme.Name = 'Basic1'
theme_settings.Theme.Width = 616
theme_settings.Theme.Height = 140

theme_settings.Theme.Bar = {}
theme_settings.Theme.Bar.Hp_Width = 572
theme_settings.Theme.Bar.Hp_Height = 40
theme_settings.Theme.Bar.Hp_Offset_X = 21
theme_settings.Theme.Bar.Hp_Offset_Y = 37

theme_settings.Theme.Bar.Mp_Width = 286
theme_settings.Theme.Bar.Mp_Height = 20
theme_settings.Theme.Bar.Mp_Offset_X = 18
theme_settings.Theme.Bar.Mp_Offset_Y = 85

theme_settings.Theme.Bar.Tp1_Width = 92
theme_settings.Theme.Bar.Tp1_Height = 19
theme_settings.Theme.Bar.Tp1_Offset_X = 309
theme_settings.Theme.Bar.Tp1_Offset_Y = 85

theme_settings.Theme.Bar.Tp2_Width = 92
theme_settings.Theme.Bar.Tp2_Height = 19
theme_settings.Theme.Bar.Tp2_Offset_X = 407
theme_settings.Theme.Bar.Tp2_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Bar.Tp3_Width = 92
theme_settings.Theme.Bar.Tp3_Height = 19
theme_settings.Theme.Bar.Tp3_Offset_X = 504
theme_settings.Theme.Bar.Tp3_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Job_Icon_Offset_X = 0
theme_settings.Theme.Job_Icon_Offset_Y = 0

theme_settings.Theme.Bar.Spacing = 0

theme_settings.Theme.DimTpBar = true
theme_settings.Theme.ColorHpText = true

theme_settings.Texts = {}
theme_settings.Texts.Size = 22
theme_settings.Texts.Font = 'OCR A Extended'

theme_settings.Texts.Offset_HP_X = 106
theme_settings.Texts.Offset_HP_Y = 10
theme_settings.Texts.Offset_MP_X = theme_settings.Texts.Offset_HP_X
theme_settings.Texts.Offset_MP_Y = 107
theme_settings.Texts.Offset_TP_X = 395
theme_settings.Texts.Offset_TP_Y = theme_settings.Texts.Offset_MP_Y

return theme_settings
