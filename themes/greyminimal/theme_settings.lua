local theme_settings = T{}

theme_settings.Theme = {}
theme_settings.Theme.Name = 'greyminimal'
theme_settings.Theme.Width = 700
theme_settings.Theme.Height = 98

theme_settings.Theme.Bar = {}
theme_settings.Theme.Bar.Hp_Width = 680
theme_settings.Theme.Bar.Hp_Height = 17
theme_settings.Theme.Bar.Hp_Offset_X = 10
theme_settings.Theme.Bar.Hp_Offset_Y = 10

theme_settings.Theme.Bar.Mp_Width = 680
theme_settings.Theme.Bar.Mp_Height = 17
theme_settings.Theme.Bar.Mp_Offset_X = theme_settings.Theme.Bar.Hp_Offset_X
theme_settings.Theme.Bar.Mp_Offset_Y = 40

theme_settings.Theme.Bar.Tp1_Width = 680
theme_settings.Theme.Bar.Tp1_Height = 17
theme_settings.Theme.Bar.Tp1_Offset_X = theme_settings.Theme.Bar.Hp_Offset_X
theme_settings.Theme.Bar.Tp1_Offset_Y = 70

theme_settings.Theme.Bar.Tp2_Width = 680
theme_settings.Theme.Bar.Tp2_Height = 17
theme_settings.Theme.Bar.Tp2_Offset_X = theme_settings.Theme.Bar.Tp1_Offset_X
theme_settings.Theme.Bar.Tp2_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Bar.Tp3_Width = 680
theme_settings.Theme.Bar.Tp3_Height = 17
theme_settings.Theme.Bar.Tp3_Offset_X = theme_settings.Theme.Bar.Tp1_Offset_X
theme_settings.Theme.Bar.Tp3_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Job_Icon_Offset_X = -100
theme_settings.Theme.Job_Icon_Offset_Y = -20

theme_settings.Theme.Bar.Spacing = 0

theme_settings.Theme.DimTpBar = true
theme_settings.Theme.ColorHpText = true

theme_settings.Texts = {}
theme_settings.Texts.Size = 16

theme_settings.Texts.Offset_HP_X = theme_settings.Theme.Bar.Hp_Offset_X + 50
theme_settings.Texts.Offset_HP_Y = theme_settings.Theme.Bar.Hp_Offset_Y - 1
theme_settings.Texts.Offset_MP_X = theme_settings.Theme.Bar.Mp_Offset_X + 50
theme_settings.Texts.Offset_MP_Y = theme_settings.Theme.Bar.Mp_Offset_Y
theme_settings.Texts.Offset_TP_X = theme_settings.Theme.Bar.Tp1_Offset_X + 50
theme_settings.Texts.Offset_TP_Y = theme_settings.Theme.Bar.Tp1_Offset_Y + 1

return theme_settings
