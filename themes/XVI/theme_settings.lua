local theme_settings = T{}

theme_settings.Theme = {}
theme_settings.Theme.Name = 'XVI'
theme_settings.Theme.Width = 680
theme_settings.Theme.Height = 60

theme_settings.Theme.Bar = {}
theme_settings.Theme.Bar.Hp_Width = 655
theme_settings.Theme.Bar.Hp_Height = 12
theme_settings.Theme.Bar.Hp_Offset_X = 15
theme_settings.Theme.Bar.Hp_Offset_Y = 2

theme_settings.Theme.Bar.Mp_Width = 655
theme_settings.Theme.Bar.Mp_Height = 12
theme_settings.Theme.Bar.Mp_Offset_X = theme_settings.Theme.Bar.Hp_Offset_X
theme_settings.Theme.Bar.Mp_Offset_Y = 24

theme_settings.Theme.Bar.Tp1_Width = 191
theme_settings.Theme.Bar.Tp1_Height = 13
theme_settings.Theme.Bar.Tp1_Offset_X = theme_settings.Theme.Bar.Hp_Offset_X
theme_settings.Theme.Bar.Tp1_Offset_Y = 44

theme_settings.Theme.Bar.Tp2_Width = 191
theme_settings.Theme.Bar.Tp2_Height = 13
theme_settings.Theme.Bar.Tp2_Offset_X = theme_settings.Theme.Bar.Tp1_Offset_X + theme_settings.Theme.Bar.Tp1_Width + 38
theme_settings.Theme.Bar.Tp2_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Bar.Tp3_Width = 191
theme_settings.Theme.Bar.Tp3_Height = 13
theme_settings.Theme.Bar.Tp3_Offset_X = theme_settings.Theme.Bar.Tp2_Offset_X + theme_settings.Theme.Bar.Tp1_Width + 38
theme_settings.Theme.Bar.Tp3_Offset_Y = theme_settings.Theme.Bar.Tp1_Offset_Y

theme_settings.Theme.Job_Icon_Offset_X = (theme_settings.Theme.Width / 2) - 35
theme_settings.Theme.Job_Icon_Offset_Y = - 100

theme_settings.Theme.Bar.Spacing = 0

theme_settings.Theme.DimTpBar = true
theme_settings.Theme.ColorHpText = true

theme_settings.Texts = {}
theme_settings.Texts.Size = 20

theme_settings.Texts.Offset_HP_X = theme_settings.Theme.Bar.Hp_Offset_X - 20
theme_settings.Texts.Offset_HP_Y = theme_settings.Theme.Bar.Hp_Offset_Y - 6
theme_settings.Texts.Offset_MP_X = theme_settings.Theme.Bar.Mp_Offset_X - 20
theme_settings.Texts.Offset_MP_Y = theme_settings.Theme.Bar.Mp_Offset_Y - 6
theme_settings.Texts.Offset_TP_X = theme_settings.Theme.Bar.Tp1_Offset_X - 20
theme_settings.Texts.Offset_TP_Y = theme_settings.Theme.Bar.Tp1_Offset_Y - 6

return theme_settings
