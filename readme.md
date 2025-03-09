# ThemeBars by MrMaelu [Rework of XIVBar]
A player hp/mp/tp bar addon originally FFXIV styled, modified to expand on the theme possibilities.

Ashita port by Tirem [https://github.com/tirem/XIVBar]

Original Windower4 addon by Edeon [https://github.com/Windower/Lua/tree/live/addons/xivbar]

## Overview

This addon displays vital bars for easy tracking

Comes with 13 themes and hopes to make it easy to make new themes.

## Included themes
![alt text](https://i.imgur.com/kj3X1qv.png)

The size can be modified with the scale slider in the config.

## Installation
* Extract the folder and drop the addons folder within into the install location of Ashita v4
* Load using "/addon load themebars" in the chat window
* To load the addon automatically when the game starts, edit scripts/default.txt and add "/addon load themebars" at the end

## How to edit the settings
* You can directly edit most settings in the in game config (/themebars, or /tb)
* To edit these settings and more manually: 
1. Login to your character in FFXI
2. Edit the addon's settings file: **[GameInstallLocation]\config\addons\themebars\THEME_NAME\theme_settings.lua**
3. Save the file 
5. Type ``` /addon reload themebars ``` to reload the addon

## How to create my own custom theme
1. Create a folder inside the *theme* directory of the addon: **[GameInstallLocation]\addons\themebars\themes\THEME_NAME**
2. Create the necessary images.
    A theme is composed of up to 8 images (you can take a look at the default themes.):
    * a background for the bars (*bar_bg.png*)
    * one image for each bar (*hp_fg.png, mp_fg.png and tp1_fg.png, tp2_fg.png, tp3_fg.png*)
    * optional foreground (*bar_fg.png*) and shade (*hp_shade.png*) images.
3. Edit the settings for the theme in theme_settings.
4. Load the theme from the config menu.
