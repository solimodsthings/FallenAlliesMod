![](https://i.imgur.com/D2Ep7aW.png)

# Overview
This is a mod for [Himeko Sutori](https://himekosutori.com/) that records the names of fallen allies. When an ally is defeated in battle, this mod writes their name, character level, and class into the in-game journal in the "Peoples" category, under a "Fallen Allies" page.

This mod will save your list of fallen allies directly in your save file.

# Screenshots
![](https://i.imgur.com/0GFggzJ.png)
![](https://i.imgur.com/31GpHat.png)

# How do I install this mod?
All folder paths are relative to your steam folder containing Himeko Sutori. If you're having trouble finding it, right-click on the game in Steam and choosing Manage > Browser Local Files.

To install:
1. [Download the mod files from the releases page](https://github.com/solimodsthings/FallenAlliesMod/releases)
2.	Place the <i>EventsMod.u</i> and <i>FallenAlliesMod.u</i> files into the script folder of the game at <b>…/Himeko Sutori/RPGTacGame/Script/</b>
3.	Update file <b>…/Himeko Sutori/RPGTacGame/Config/RPGTacMods.ini</b> so the mod is loaded whenever you start the game – the file should look similar to this:

```
[rpgtacgame.RPGTacMutatorLoader]
MutatorsLoaded=EventsMod.EventsModStart,FallenAlliesMod.FallenAlliesModStart
```

(Note: Make sure there are no spaces in the mod list as whitespaces don’t get trimmed!)

# Mod Dependencies and Compatiblity
This mod relies on Events Mod and is compatible with other mods that use Events Mod. Please ensure Events Mod is loaded before this mod. 
