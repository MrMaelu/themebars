local theme_settings = T{}

theme_settings.Theme = {}
theme_settings.Theme.Name = 'Floral'
theme_settings.Theme.Width = 537
theme_settings.Theme.Height = 264

theme_settings.Theme.Bar = {}
theme_settings.Theme.Bar.Hp_Width = 391
theme_settings.Theme.Bar.Hp_Height = 36
theme_settings.Theme.Bar.Hp_Offset_X = 127
theme_settings.Theme.Bar.Hp_Offset_Y = 44

theme_settings.Theme.Bar.Mp_Width = 391
theme_settings.Theme.Bar.Mp_Height = 36
theme_settings.Theme.Bar.Mp_Offset_X = theme_settings.Theme.Bar.Hp_Offset_X
theme_settings.Theme.Bar.Mp_Offset_Y = 113

theme_settings.Theme.Bar.Tp1_Width = 131
theme_settings.Theme.Bar.Tp1_Height = 36
theme_settings.Theme.Bar.Tp1_Offset_X = theme_settings.Theme.Bar.Hp_Offset_X
theme_settings.Theme.Bar.Tp1_Offset_Y = 182

theme_settings.Theme.Bar.Tp2_Width = 131
theme_settings.Theme.Bar.Tp2_Height = 36
theme_settings.Theme.Bar.Tp2_Offset_X = theme_settings.Theme.Bar.Tp1_Offset_X + theme_settings.Theme.Bar.Tp1_Width
theme_settings.Theme.Bar.Tp2_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Bar.Tp3_Width = 131
theme_settings.Theme.Bar.Tp3_Height = 36
theme_settings.Theme.Bar.Tp3_Offset_X = theme_settings.Theme.Bar.Tp1_Offset_X + theme_settings.Theme.Bar.Tp1_Width + theme_settings.Theme.Bar.Tp1_Width
theme_settings.Theme.Bar.Tp3_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Job_Icon_Offset_X = - 4
theme_settings.Theme.Job_Icon_Offset_Y = - 4

theme_settings.Theme.Bar.Spacing = 0

theme_settings.Theme.DimTpBar = true
theme_settings.Theme.ColorHpText = true

theme_settings.Texts = {}

theme_settings.Texts.Size = 20
theme_settings.Texts.Offset_HP_X = theme_settings.Theme.Bar.Hp_Offset_X + 70
theme_settings.Texts.Offset_HP_Y = theme_settings.Theme.Bar.Hp_Offset_Y - 20
theme_settings.Texts.Offset_MP_X = theme_settings.Theme.Bar.Mp_Offset_X + 70
theme_settings.Texts.Offset_MP_Y = theme_settings.Theme.Bar.Mp_Offset_Y - 20
theme_settings.Texts.Offset_TP_X = theme_settings.Theme.Bar.Tp1_Offset_X + 70
theme_settings.Texts.Offset_TP_Y = theme_settings.Theme.Bar.Tp1_Offset_Y - 20

return theme_settings
