local L = LibStub("AceLocale-3.0"):NewLocale("NovaWorldBuffs", "deDE");
if (not L) then
	return;
end

--Rend buff aura name.
L["Warchief's Blessing"] = "Segen des Kriegshäuptlings";
--Onyxia and Nefarian buff aura name.
L["Rallying Cry of the Dragonslayer"] = "Schlachtruf der Drachentöter";
--Songflower buff aura name from felwood.
L["Songflower Serenade"] = "Liedblumenserenade";
L["Songflower"] = "Liedblume";
--Spirit of Zandalar.
L["Spirit of Zandalar"] = "Geist von Zandalar";
L["Flask of Supreme Power"] = "Fläschchen mit oberster Macht";
L["Flask of the Titans"] = "Fläschchen der Titanen";
L["Flask of Distilled Wisdom"] = "Fläschchen mit destillierter Weisheit";
L["Flask of Chromatic Resistance"] = "Fläschchen mit chromatischem Widerstand";
--3 of the flasks spells seem to be named differently than the flask item, but titan is exact same name as the flask item.
L["Supreme Power"] = "Oberste Macht";
L["Distilled Wisdom"] = "Destillierte Weisheit";
L["Chromatic Resistance"] = "Chromatischer Widerstand";
L["Sap"] = "Sap";
L["Fire Festival Fortitude"] = "Fire Festival Fortitude";
L["Fire Festival Fury"] = "Fire Festival Fury";
L["Ribbon Dance"] = "Ribbon Dance";
L["Traces of Silithyst"] = "Traces of Silithyst";
L["Slip'kik's Savvy"] = "Slip'kik's Grips";
L["Fengus' Ferocity"] = "Fengus' Wildheit";
L["Mol'dar's Moxie"] = "Mol'Dars Mut";
L["Boon of Blackfathom"] = "Segen von Blackfathom";
L["Ashenvale Rallying Cry"] = "Anspornender Schrei von Ashenvale";
L["Spark of Inspiration"] = "Funke der wahnsinnigen Inspiration"; --Phase 2 SoD world buff.
L["Fervor of the Temple Explorer"] = "Eifer des Tempelforschers";

---=====---
---Horde---
---=====---

--Horde Orgrimmar Rend buff NPC.
L["Thrall"] = "Thrall";
--Horde The Barrens Rend buff NPC.
L["Herald of Thrall"] = "Herold von Thrall";
--Horde rend buff NPC first yell string (part of his first yell msg before before buff).
L["Rend Blackhand, has fallen"] = "Rend Blackhand, der falsche";
--Horde rend buff NPC second yell string (part of his second yell msg before before buff).
L["Be bathed in my power"] = "Badet in meiner Macht";

--Horde Onyxia buff NPC.
L["Overlord Runthak"] = "Oberanführer Runthak";
--Horde Onyxia buff NPC first yell string (part of his first yell msg before before buff).
L["Onyxia, has been slain"] = "Die Brutmutter Onyxia wurde getötet";
--Horde Onyxia buff NPC second yell string (part of his second yell msg before before buff).
L["Be lifted by the rallying cry"] = "Lasst den Siegesschrei der Drachentöter eure Herzen höher schlagen";

--Horde Nefarian buff NPC.
L["High Overlord Saurfang"] = "Hochfürst Saurfang";
--Horde Nefarian buff NPC first yell string (part of his first yell msg before before buff).
L["NEFARIAN IS SLAIN"] = "NAFARIAN IST TOT";
--Horde Nefarian buff NPC second yell string (part of his second yell msg before before buff).
L["Revel in his rallying cry"] = "Lasst seinen Siegesschrei eure Herzen höher schlagen";

---========---
---Alliance---
---========---

--Alliance Onyxia buff NPC.
L["Major Mattingly"] = "Major Mattingly";
--Alliance Onyxia buff NPC first yell string (part of his first yell msg before before buff).
L["history has been made"] = "am heutigen Tage ist Geschichte geschrieben worden";
--Alliance Onyxia buff NPC second yell string (part of his second yell msg before before buff).
L["Onyxia, hangs from the arches"] = "Onyxia baumelt leblos von den Torbögen";


--Alliance Nefarian buff NPC.
L["Field Marshal Afrasiabi"] = "Feldmarschall Afrasiabi";
L["Field Marshal Stonebridge"] = "Feldmarschall Steinsteg";
--Alliance Nefarian buff NPC first yell string (part of his first yell msg before before buff).
L["the Lord of Blackrock is slain"] = "der Herrscher des Blackrocks wurde besiegt";
--Alliance Nefarian buff NPC second yell string (part of his second yell msg before before buff).
L["Revel in the rallying cry"] = "Lasst den Siegesschrei des Drachentöters eure Herzen höher schlagen";

---===========----
---NPC's killed---
---============---

L["onyxiaNpcKilledHorde"] = "Oberanführer Runthak wurde getötet (Onyxia Buff NPC).";
L["onyxiaNpcKilledAlliance"] = "Major Mattingly wurde getötet (Onyxia Buff NPC).";
L["nefarianNpcKilledHorde"] = "Hochfürst Saurfang wurde getötet (Nefarian Buff NPC).";
L["nefarianNpcKilledAlliance"] = "Feldmarschall Afrasiabi wurde getötet (Nefarian Buff NPC).";
L["onyxiaNpcKilledHordeWithTimer"] = "Onyxia NPC (Runthak) wurde vor %s getötet. Ein neuer Buff wurde bisher nicht festgestellt.";
L["nefarianNpcKilledHordeWithTimer"] = "Nefarian NPC (Saurfang) wurde vor %s getötet. Ein neuer Buff wurde bisher nicht festgestellt.";
L["onyxiaNpcKilledAllianceWithTimer"] = "Onyxia NPC (Mattingly) wurde vor %s getötet. Ein neuer Buff wurde bisher nicht festgestellt.";
L["nefarianNpcKilledAllianceWithTimer"] = "Nefarian NPC (Afrasiabi) wurde vor %s getötet. Ein neuer Buff wurde bisher nicht festgestellt.";
L["anyNpcKilledWithTimer"] = "NPC wurde vor %s getötet"; --Map timers tooltip msg.

---==============---
---Darkmoon Faire---
---==============---

L["Darkmoon Faire"] = "Dunkelmond-Jahrmarkt";
L["Sayge's Dark Fortune of Agility"] = "Sayges dunkles Schicksal der Beweglichkeit";
L["Sayge's Dark Fortune of Intelligence"] = "Sayges dunkles Schicksal der Intelligenz";
L["Sayge's Dark Fortune of Spirit"] = "Sayges dunkles Schicksal der Willenskraft";
L["Sayge's Dark Fortune of Stamina"] = "Sayges dunkles Schicksal der Ausdauer";
L["Sayge's Dark Fortune of Strength"] = "Sayges dunkles Schicksal der Stärke";
L["Sayge's Dark Fortune of Armor"] = "Sayges dunkles Schicksal der Rüstung";
L["Sayge's Dark Fortune of Resistance"] = "Sayges dunkles Schicksal des Widerstands";
L["Sayge's Dark Fortune of Damage"] = "Sayges dunkles Schicksal des Schadens";
L["dmfBuffCooldownMsg"] = "Ein neuer Dunkelmond-Jahrmarkt Buff kann geholt werden in %s.";
L["dmfBuffCooldownMsg2"] = "Ein neuer Dunkelmond-Jahrmarkt Buff kann geholt werden in %s.";
L["dmfBuffCooldownMsg3"] = "DMF Buff cooldown also resets with the weekly server reset."; --/wb frame 2nd msg.
L["dmfBuffReady"] = "Ein neuer Dunkelmond-Jahrmarkt Buff kann jetzt geholt werden.";
L["dmfBuffReset"] = "Dunkelmond-Jahrmarkt Buff Cooldown wurde zurückgesetzt.";
L["dmfBuffDropped"] = "Dunkelmond-Jahrmarkt Buff %s erhalten. Um den 5 Stunden Cooldown zu tracken tippe /dmf.";
L["dmfSpawns"] = "Der Dunkelmond-Jahrmarkt öffnet in %s (%s)";
L["dmfEnds"] = "Der Dunkelmond-Jahrmarkt hat noch %s bis %s Uhr geöffnet";
L["mulgore"] = "Mulgore";
L["elwynnForest"] = "Wald von Elwynn";
				
---==============---
---Output Strings---
---==============---

L["rend"] = "Rend"; --Rend Blackhand
L["onyxia"] = "Onyxia"; --Onyxia
L["nefarian"] = "Nefarian"; --Nefarian
L["dmf"] = "Dunkelmond-Jahrmarkt"; --Darkmoon Faire
--L["noTimer"] = "Kein Timer"; --No timer (used only in map timer frames)
L["noTimer"] = "--"; --No timer (used only in map timer frames)
L["noCurrentTimer"] = "Kein aktueller Timer"; --No current timer
L["noActiveTimers"] = "Kein aktiver Timer";	--No active timers
L["newBuffCanBeDropped"] = "Ein neuer %s Buff kann jetzt gestellt werden";
L["buffResetsIn"] = "%s wird zurückgesetzt in %s";
L["rendFirstYellMsg"] = "Rend Buff in 6 Sekunden";
L["onyxiaFirstYellMsg"] = "Onyxia Buff in 14 Sekunden.";
L["nefarianFirstYellMsg"] = "Nefarian Buff in 15 Sekunden.";
L["rendBuffDropped"] = "Segen des Kriegshäuptlings (Rend) Buff wurde gewirkt.";
L["onyxiaBuffDropped"] = "Schlachtruf der Drachentöter (Onyxia) Buff wurde gewirkt.";
L["nefarianBuffDropped"] = "Schlachtruf der Drachentöter (Nefarian) Buff wurde gewirkt.";
L["newSongflowerReceived"] = "Neue Liedblume(n) synchronisiert"; --New songflower timer received
L["songflowerPicked"] = "Liedblume %s gepflückt. Erneut zu pflücken in 25min."; -- Guild msg when songflower picked.
L["North Felpaw Village"] = "Nördlich vom Revier der Teufelspfoten"; --Felwood map subzones (flower1).
L["West Felpaw Village"] = "Westlich vom Revier der Teufelspfoten"; --Felwood map subzones (flower2).
L["North of Irontree Woods"] = "Nördlich vom der Eisenwald"; --Felwood map subzones (flower3).
L["Talonbranch Glade"] = "Nachtlaublichtung"; --Felwood map subzones (flower4).
L["Shatter Scar Vale"] = "Shatter Scar-Tal"; --Felwood map subzones (flower5).
L["Bloodvenom Post"] = "Blutgiftposten"; --Felwood map subzones (flower6).
L["East of Jaedenar"] = "Östlich von Jaedenar"; --Felwood map subzones (flower7).
L["North of Emerald Sanctuary"] = "Nördlich vom smaragdgrünen Heiligtum"; --Felwood map subzones (flower8).
L["West of Emerald Sanctuary"] = "Westlich vom smaragdgrünen Heiligtum"; --Felwood map subzones (flower9).
L["South of Emerald Sanctuary"] = "Südlich vom smaragdgrünen Heiligtum"; --Felwood map subzones (flower10).
L["second"] = "Sekunde"; --Second (singular).
L["seconds"] = "Sekunden"; --Seconds (plural).
L["minute"] = "Minute"; --Minute (singular).
L["minutes"] = "Minuten"; --Minutes (plural).
L["hour"] = "Stunde"; --Hour (singular).
L["hours"] = "Stunden"; --Hours (plural).
L["day"] = "Tag"; --Day (singular).
L["days"] = "Tage"; --Days (plural).
L["secondShort"] = "s"; --Used in short timers like 1m30s (single letter only, usually the first letter of seconds).
L["minuteShort"] = "m"; --Used in short timers like 1m30s (single letter only, usually the first letter of minutes).
L["hourShort"] = "h"; --Used in short timers like 1h30m (single letter only, usually the first letter of hours).
L["dayShort"] = "d"; --Used in short timers like 1d8h (single letter only, usually the first letter of days).
L["startsIn"] = "Startet in %s"; --"Starts in 1hour".
L["endsIn"] = "Endet in %s"; --"Ends in 1hour".
L["versionOutOfDate"] = "Dein Nova World Buffs Addon ist nicht mehr aktuell. Bitte führe ein Update über https://www.curseforge.com/wow/addons/nova-world-buffs oder den Twitch Client durch.";
L["Your Current World Buffs"] = "Deine aktuellen World Buffs";
L["Options"] = "Einstellungen";

---New stuff---

--Spirit of Zandalar buff NPC first yell string (part of his first yell msg before before buff).
L["Begin the ritual"] = "Beginnt mit dem Ritual"
L["The Blood God"] = "Der Blutgott"; --First Booty bay yell from Zandalarian Emissary.
--Spirit of Zandalar buff NPC second yell string (part of his second yell msg before before buff).
L["slayer of Hakkar"] = "Besieger von Hakkar";

L["Molthor"] = "Molthor";
L["Zandalarian Emissary"] = "Abgesandter der Zandalarianer";
L["Whipper Root Tuber"] = "Peitscherwurzelknollen";
L["Night Dragon's Breath"] = "Nachtdrachenodem";
L["Resist Fire"] = "Feuer widerstehen"; -- LBRS fire resist buff.
L["Blessing of Blackfathom"] = "Segen von Blackfathom";

L["zan"] = "Zandalar";
L["zanFirstYellMsg"] = "Zandalar Buff in %s Sekunden.";
L["zanBuffDropped"] = "Geist von Zandalar (Hakkar) Buff wurde gewirkt.";
L["singleSongflowerMsg"] = "Liedblume %s zu pflücken um %s."; -- Songflower at Bloodvenom Post spawns at 1pm.
L["spawn"] = "Spawn"; --Used in Felwood map marker tooltip (03:46pm spawn).
L["Irontree Woods"] = "Eisenwald";
L["West of Irontree Woods"] = "Westlich vom Eisenwald";
L["Bloodvenom Falls"] = "Blutgift Wasserfälle";
L["Jaedenar"] = "Jaedenar";
L["North-West of Irontree Woods"] = "Nordwestlich vom Eisenwald";
L["South of Irontree Woods"] = "Südlich des Eisenwalds";


---New translations to do---
L["layerFrameMsgOne"] = "Old layers will still show for a few hours after server restarts."; --Msg at bottom of layer timers frame.
L["layerFrameMsgTwo"] = "Layers will disappear from here 8 hours after having no timers."; --Msg at bottom of layer timers frame.
L["You are currently on"] = "You are currently on"; --You are currently on [Layer 2]

-------------
---Config---
-------------
--There are 2 types of strings here, the names end in Title or Desc L["exampleTitle"] and L["exampleDesc"].
--Title must not be any longer than 21 characters (maybe less for chinese characters because they are larger).
--Desc can be any length.

---Description at the top---
L["mainTextDesc"] = "Type /wb to display timers to yourself.\nType /wb <channel> to display timers to the specified channel.\nScroll down for more options.";

---Show Buffs Button
L["showBuffsTitle"] = "Click To Show Your Current World Buffs";
L["showBuffsDesc"] = "Show your current world buffs for all your characters, this can also be opened by typing /buffs or clicking on the [WorldBuffs] prefix in chat.";

---General Options---
L["generalHeaderDesc"] = "General Options";

L["showWorldMapMarkersTitle"] = "City Map Timers";
L["showWorldMapMarkersDesc"] = "Show timer icons on the Orgrimmar/Stormwind world map?";

L["receiveGuildDataOnlyTitle"] = "Guild Data Only";
L["receiveGuildDataOnlyDesc"] = "This will make it so you don't get timer data from anyone outside the guild. You should only enable this if you think someone is spoofing wrong timer data on purpose because it will lower the accuracy of your timers with less people to pull data from. It will make it especially hard to get songflower timers becaus they are so short. Every single person in the guild needs this enabled for it to even work.";

L["chatColorTitle"] = "Chat Msg Color";
L["chatColorDesc"] = "What color should the timer msgs in chat be?";

L["middleColorTitle"] = "Middle Screen Color";
L["middleColorDesc"] = "What color should the raid warning style msgs in the middle of the screen be?";

L["resetColorsTitle"] = "Reset Colors";
L["resetColorsDesc"] = "Reset colors back to default.";

L["showTimeStampTitle"] = "Show Time Stamp";
L["showTimeStampDesc"] = "Show a time stamp (1:23pm) beside the timer msg?";

L["timeStampFormatTitle"] = "Time Stamp Format";
L["timeStampFormatDesc"] = "Set which timestamp format to use, 12 hour (1:23pm) or 24 hour (13:23).";

L["timeStampZoneTitle"] = "Local Time / Server Time";
L["timeStampZoneDesc"] = "Use local time or server time for timestamps?";

L["colorizePrefixLinksTitle"] = "Colored Prefix Link";
L["colorizePrefixLinksDesc"] = "Colorize the prefix [WorldBuffs] in all chat channels? This is the prefix in chat you can click to show all your characters current world buffs.";

L["showAllAltsTitle"] = "Show All Alts";
L["showAllAltsDesc"] = "Show all alts in the /buffs window even if they don't have an active buff?";

L["minimapButtonTitle"] = "Show Minimap Button";
L["minimapButtonDesc"] = "Show the NWB button the minimap?";

---Logon Messages---
L["logonHeaderDesc"] = "Logon Messages";

L["logonPrintTitle"] = "Logon Timers";
L["logonPrintDesc"] = "Show timers in the chat window when you log on, you can disable all logon msgs with this setting.";

L["logonRendTitle"] = "Rend";
L["logonRendDesc"] = "Show Rend timer in the chat window when you log on.";

L["logonOnyTitle"] = "Onyxia";
L["logonOnyDesc"] = "Show Onyxia timer in the chat window when you log on.";

L["logonNefTitle"] = "Nefarian";
L["logonNefDesc"] = "Show Nefarian timer in the chat window when you log on.";

L["logonDmfSpawnTitle"] = "DMF Spawn";
L["logonDmfSpawnDesc"] = "Show Darkmoon Faire spawn time, this will only show when there is less than 6 hours left until spawn or despawn.";

L["logonDmfBuffCooldownTitle"] = "DMF Buff Coooldown";
L["logonDmfBuffCooldownDesc"] = "Show Darkmoon Faire buff 4 hour cooldown, this will only show when you have an ative cooldown and when DMF is up.";

---Chat Window Timer Warnings---
L["chatWarningHeaderDesc"] = "Chat Window Timer Warnings";

L["chat30Title"] = "30 Minutes";
L["chat30Desc"] = "Print a msg in chat when 30 minutes left.";

L["chat15Title"] = "15 Minutes";
L["chat15Desc"] = "Print a msg in chat when 15 minutes left.";

L["chat10Title"] = "10 Minutes";
L["chat10Desc"] = "Print a msg in chat when 10 minutes left.";

L["chat5Title"] = "5 Minutes";
L["chat5Desc"] = "Print a msg in chat when 5 minutes left.";

L["chat1Title"] = "1 Minute";
L["chat1Desc"] = "Print a msg in chat when 1 minute left.";

L["chatResetTitle"] = "Buff Has Reset";
L["chatResetDesc"] = "Print a msg in chat when a buff has reset and a new one can be dropped.";

L["chatZanTitle"] = "Zandalar Buff Warning";
L["chatZanDesc"] = "Print a msg in chat 30 seconds before Zandalar buff will drop when the NPC starts yelling.";

---Middle Of The Screen Timer Warnings---
L["middleWarningHeaderDesc"] = "Middle Of The Screen Timer Warnings";

L["middle30Title"] = "30 Minutes";
L["middle30Desc"] = "Show a raid warning style msg in the middle of the screen when 30 minutes left.";

L["middle15Title"] = "15 Minutes";
L["middle15Desc"] = "Show a raid warning style msg in the middle of the screen when 15 minutes left.";

L["middle10Title"] = "10 Minutes";
L["middle10Desc"] = "Show a raid warning style msg in the middle of the screen when 10 minutes left.";

L["middle5Title"] = "5 Minutes";
L["middle5Desc"] = "Show a raid warning style msg in the middle of the screen when 5 minutes left.";

L["middle1Title"] = "1 Minute";
L["middle1Desc"] = "Show a raid warning style msg in the middle of the screen when 1 minute left.";

L["middleResetTitle"] = "Buff Has Reset";
L["middleResetDesc"] = "Show a raid warning style msg in the middle of the screen when a buff has reset and a new one can be dropped.";

L["middleBuffWarningTitle"] = "Buff Drop Warning";
L["middleBuffWarningDesc"] = "Show a raid warning style msg in the middle of the screen when someone hands in the head for any buff and the NPC yells a few seconds before the buff will drop.";

L["middleHideCombatTitle"] = "Hide In Combat";
L["middleHideCombatDesc"] = "Hide middle of the screen warnings in combat?";

L["middleHideRaidTitle"] = "Hide In Raid";
L["middleHideRaidDesc"] = "Hide middle of the screen warnings in raid instances? (Doesn't hide in normal dungeons)";

---Guild Messages---
L["guildWarningHeaderDesc"] = "Guild Messages";

L["guild10Title"] = "10 Minutes";
L["guild10Desc"] = "Send a message to guild chat when 10 minutes left.";

L["guild1Title"] = "1 Minute";
L["guild1Desc"] = "Send a message to guild chat when 1 minute left.";

L["guildNpcDialogueTitle"] = "NPC Dialogue Started";
L["guildNpcDialogueDesc"] = "Send a message to guild when someone hands in a head and the NPC first yells and you still have time to relog if fast?";

L["guildBuffDroppedTitle"] = "New Buff Dropped";
L["guildBuffDroppedDesc"] = "Send a message to guild when a new buff has been dropped? This msg is sent after the NPC is finished yelling and you get the actual buff a few seconds later. (6 seconds after first yell for rend, 14 seconds for ony, 15 seconds for nef)";

L["guildZanDialogueTitle"] = "Zandalar Buff Warning";
L["guildZanDialogueDesc"] = "Send a message to guild when Spirit of Zandalar buff is about to drop? (If you want no guild msgs at all for this buff then everyone in guild needs to disable this).";

L["guildNpcKilledTitle"] = "NPC Was Killed";
L["guildNpcKilledDesc"] = "Send a message to guild when one of the buff NPC's were killed in Orgrimmar or Stormwind? (mind control reset).";

L["guildCommandTitle"] = "Guild Commands";
L["guildCommandDesc"] = "Reply with timer info to !wb and !dmf commands in guild chat? You should probably leave this enabled to help your guild, if you really want to disable all guild msgs and leave only this command then untick everything else in the guild sectionand don't tick the Disable All Guild Msgs at the top.";

L["disableAllGuildMsgsTitle"] = "Disable All Guild Msgs";
L["disableAllGuildMsgsDesc"] = "Disable all guild messages including timers and when buffs drop? Note: You can disable all msgs one by one above and just leave certain things enabled to help out your guild if you rather.";

---Songflowers---
L["songflowersHeaderDesc"] = "Songflowers";

L["guildSongflowerTitle"] = "Tell Guild When Picked";
L["guildSongflowerDesc"] = "Tell your guild chat when you have picked a songflower with the time of next spawn?";

L["mySongflowerOnlyTitle"] = "Only When I Pick";
L["mySongflowerOnlyDesc"] = "Only record a new timer when I pick a songflower and not when others pick infront of me? This option is here just incase you have problems with false timers being set from other players. There's currently no way to tell if another players buff is new so a timer may trigger on rare occasions if the game loads the songflower buff on someone else when they logon infront of you beside a songflower.";

L["syncFlowersAllTitle"] = "Sync Flowers With All";
L["syncFlowersAllDesc"] = "Enable this to override the guild only data setting at the top of this config so you can share songflower data outside the guild but keep worldbuff data guild only still.";

L["showNewFlowerTitle"] = "Show New SF Timers";
L["showNewFlowerDesc"] = "This will show you in chat window when a new flower timer is found from another player not in your guild (guild msgs already show in guild chat when a flower is picked).";

L["showSongflowerWorldmapMarkersTitle"] = "Songflower Worldmap";
L["showSongflowerWorldmapMarkersDesc"] = "Show songflower icons on the world map?";

L["showSongflowerMinimapMarkersTitle"] = "Songflower Minimap";
L["showSongflowerMinimapMarkersDesc"] = "Show songflower icons on the mini map?";

L["showTuberWorldmapMarkersTitle"] = "Tuber Worldmap";
L["showTuberWorldmapMarkersDesc"] = "Show Whipper Root Tuber icons on the world map?";

L["showTuberMinimapMarkersTitle"] = "Tuber Minimap";
L["showTuberMinimapMarkersDesc"] = "Show Whipper Root Tuber icons on the mini map?";

L["showDragonWorldmapMarkersTitle"] = "Dragon Worldmap";
L["showDragonWorldmapMarkersDesc"] = "Show Night Dragon's Breath icons on the world map?";

L["showDragonMinimapMarkersTitle"] = "Dragon Minimap";
L["showDragonMinimapMarkersDesc"] = "Show Night Dragon's Breath icons on the mini map?";

L["showExpiredTimersTitle"] = "Show Expired Timers";
L["showExpiredTimersDesc"] = "Show expired timers in Felwood? They will be shown in red text how long ago a timer expired, the default time is 5 minutes (people say songflowers stay cleansed for 5 minutes after spawn?).";

L["expiredTimersDurationTitle"] = "Expired Timers Duraton";
L["expiredTimersDurationDesc"] = "How long should Felwood timers show for after expiring on the world map?";

---Darkmoon Faire---
L["dmfHeaderDesc"] = "Darkmoon Faire";

L["dmfTextDesc"] = "Your DMF damage buff cooldown will also show on the Darkmoon Faire map icon when you hover it, if you have a cooldown and DMF is currently up.";

L["showDmfWbTitle"] = "Show DMF with /wb";
L["showDmfWbDesc"] = "Show DMF spawn timer together with /wb command?";

L["showDmfBuffWbTitle"] = "DMF Buff Cooldown /wb";
L["showDmfBuffWbDesc"] = "Show your DMF buff cooldown timer together with /wb command? Only shows when you are on an active cooldown and DMF is currently up.";

L["showDmfMapTitle"] = "Show Map Marker";
L["showDmfMapDesc"] = "Show DMF map marker with spawn timer and buff cooldown info in Mulgore and Elwynn Forest world maps (whichever is next spawn). You can also type /dmf map to open the world map strait to this marker.";

---Guild Chat Filter---
L["guildChatFilterHeaderDesc"] = "Guild Chat Filter";

L["guildChatFilterTextDesc"] = "This will block any guild msgs from this addon you choose so you don't see them. It will stop you from seeing your own msgs and msgs from other addon users in guild chat.";

L["filterYellsTitle"] = "Filter Buff Warning";
L["filterYellsDesc"] = "Filter the msg when a buff is about to drop in a few seconds (Onyxia will drop in 14 seconds).";

L["filterDropsTitle"] = "Filter Buff Dropped";
L["filterDropsDesc"] = "Filter the msg when a buff has dropped (Rallying Cry of the Dragonslayer (Onyxia) has dropped).";

L["filterTimersTitle"] = "Filter Timer Msgs";
L["filterTimersDesc"] = "Filter timer msgs (Onyxia resets in 1 minute).";

L["filterCommandTitle"] = "Filter !wb command";
L["filterCommandDesc"] = "Filter the !wb and !dmf in guild chat when typed by players.";

L["filterCommandResponseTitle"] = "Filter !wb reply";
L["filterCommandResponseDesc"] = "Filter the reply msg with timers this addon does when !wb or !!dmf is used.";

L["filterSongflowersTitle"] = "Filter Songflowers";
L["filterSongflowersDesc"] = "Filter the msg when a songflower is picked.";

L["filterNpcKilledTitle"] = "Filter NPC Killed";
L["filterNpcKilledDesc"] = "Filter the msg when a buff hand in NPC is killed in your city.";

---Sounds---
L["soundsHeaderDesc"] = "Sounds";

L["soundsTextDesc"] = "Set sound to \"None\" to disable.";

L["disableAllSoundsTitle"] = "Disable All Sounds";
L["disableAllSoundsDesc"] = "Disable all sounds from this addon.";

L["extraSoundOptionsTitle"] = "Extra Sound Options";
L["extraSoundOptionsDesc"] = "Enable this to display all the sounds from all your addons at once in the dropdown lists here.";

L["soundOnlyInCityTitle"] = "Only In City";
L["soundOnlyInCityDesc"] = "Only play buff sounds when you are in the main city where the buffs drop (Stranglethorn Vale included for Zandalar buff).";

L["soundsDisableInInstancesTitle"] = "Disable In Instances";
L["soundsDisableInInstancesDesc"] = "Disable sounds while in raids and instances.";

L["soundsFirstYellTitle"] = "Buff Coming";
L["soundsFirstYellDesc"] = "Sound to play when head is handed in and you have a few seconds before buff will drop (First NPC Yell).";

L["soundsOneMinuteTitle"] = "One Minute Warning";
L["soundsOneMinuteDesc"] = "Sound to play for 1 minute left timer warning.";

L["soundsRendDropTitle"] = "Rend Buff Gained";
L["soundsRendDropDesc"] = "Sound to play for Rend buff drops and you get the buff.";

L["soundsOnyDropTitle"] = "Ony Buff Gained";
L["soundsOnyDropDesc"] = "Sound to play for Onyxia buff drops and you get the buff.";

L["soundsNefDropTitle"] = "Nef Buff Gained";
L["soundsNefDropDesc"] = "Sound to play for Nefarian buff drops and you get the buff.";

L["soundsZanDropTitle"] = "Zandalar Buff Gained";
L["soundsZanDropDesc"] = "Sound to play for Zandalar buff drops and you get the buff.";

---Flash When Minimized---
L["flashHeaderDesc"] = "Flash When Minimized";

L["flashOneMinTitle"] = "Flash One Minute";
L["flashOneMinDesc"] = "Flash the wow client when you have it minimized and 1 minute is left on timer?";

L["flashFirstYellTitle"] = "Flash NPC Yell";
L["flashFirstYellDesc"] = "Flash the wow client when you have it minimized and the NPC's yells a few seconds before buff drops?";

L["flashFirstYellZanTitle"] = "Flash Zandalar";
L["flashFirstYellZanDesc"] = "Flash the wow client when you have it minimized and the Zandalar buff is about to go out?";

---Faction/realm specific options---

L["allianceEnableRendTitle"] = "Enable Alliance Rend";
L["allianceEnableRendDesc"] = "Enable this to track rend as Alliance, for guilds that mind control to get rend buff. If you use this then everyone in the guild with the addon should enable it or guild chat msgs may not work properly (personal timer msgs will still work).";

L["minimapLayerFrameTitle"] = "Show Minimap Layer";
L["minimapLayerFrameDesc"] = "Show the little frame on the minimap with your current layer while in a capital city?";

L["minimapLayerFrameResetTitle"] = "Reset Minimap Layer";
L["minimapLayerFrameResetDesc"] = "Reset minimap layer frame back to default position (hold shift to drag the minimap frame).";

---Dispels---
L["dispelsHeaderDesc"] = "Dispels";

L["dispelsMineTitle"] = "My Buffs";
L["dispelsMineDesc"] = "Show in chat my buffs being dispelled? This shows who dispelled you and what buff.";

L["dispelsMineWBOnlyTitle"] = "My Worldbuffs Only";
L["dispelsMineWBOnlyDesc"] = "Only show my worldbuffs being dispelled and not any other kind of buffs.";

L["soundsDispelsMineTitle"] = "My Buffs Sound";
L["soundsDispelsMineDesc"] = "Which sound to play for my buffs being dispelled.";

L["dispelsAllTitle"] = "Other Players Buffs";
L["dispelsAllDesc"] = "Show in chat everyone's buffs being dispelled around me? This shows who dispelled anyone close to you and what buff.";

L["dispelsAllWBOnlyTitle"] = "Others Worldbuffs Only";
L["dispelsAllWBOnlyDesc"] = "Only show worldbuffs on everyone else being dispelled and not any other kind of buffs.";

L["soundsDispelsAllTitle"] = "Others Players Buffs Sound";
L["soundsDispelsAllDesc"] = "Which sound to play for other players buffs being dispelled.";

L["middleHideBattlegroundsTitle"] = "Hide In Battlegrounds";
L["middleHideBattlegroundsDesc"] = "Hide middle of the screen warnings in Battlegrounds?";

L["soundsDisableInBattlegroundsTitle"] = "Disable In Battleground";
L["soundsDisableInBattlegroundsDesc"] = "Disable sounds while in Battlegrounds.";

L["autoBuffsHeaderDesc"] = "Auto Get Buffs From NPCs";

L["autoDmfBuffTitle"] = "Auto Get DMF Buff";
L["autoDmfBuffDesc"] = "Do you want this addon to auto select a Darkmoon Faire buff for you when you speak to the Sayge NPC? Make sure you pick which buff you want also.";

L["autoDmfBuffTypeTitle"] = "Which DMF Buff";
L["autoDmfBuffTypeDesc"] = "Which Darkmoon Faire buff do you want this addon to auto select for you when you speak to Sayge?";

L["autoDireMaulBuffTitle"] = "Dire Maul Buffs";
L["autoDireMaulBuffDesc"] = "Do you want this addon to auto get buffs from the NPC's in Dire Maul when you talk to them? (Also auto gets King buff).";

L["autoBwlPortalTitle"] = "Auto BWL Portal";
L["autoBwlPortalDesc"] = "Do you want this addon to auto use the Blackwing Lair portal when you click the orb?";

L["showBuffStatsTitle"] = "Show Buff Stats";
L["showBuffStatsDesc"] = "Show how many times you've gotten each world buff in the /buffs frame? Ony/Nef/Rend/Zand buffs have been recording since the buffs frame was put in, but the rest of the buffs only started recording now in version 1.65";

L["buffResetButtonTooltip"] = "This will reset all buffs.\nBuff count data will not be reset."; --Reset button tooltip for the /buffs frame.
L["time"] = "(%s time)"; --Singular - This shows how many timers you got a buff. Example: (1 time)
L["times"] = "(%s times)"; --Plural - This shows how many timers you got a buff. Example: (5 times)

L["Blackrock Mountain"] = "Der Blackrock";

L["flowerWarning"] = "Songflower picked on a realm with layered songflower timers enabled but you haven't targeted a NPC since arriving in Felwood so no timer could be recorded.";

L["mmColorTitle"] = "Minimap Layer Color";
L["mmColorDesc"] = "What color should the minimap layer text be? (Layer 1)";

---New---
L["layerHasBeenDisabled"] = "Disabled layer %s, this layer is still in the database but will be ignored until you enable it again or it's detected again as being valid.";
L["layerHasBeenEnabled"] = "Enabled layer %s, this is now back in timer and layer calculations.";
L["layerDoesNotExist"] = "The layer ID %s doesn't exist in the database.";
L["enableLayerButton"] = "Enable Layer";
L["disableLayerButton"] = "Disable Layer";
L["enableLayerButtonTooltip"] = "Click to re-enable this layer,\nIt will be put back into timer and layer calcs.";
L["disableLayerButtonTooltip"] = "Click to disable this old layer after server restarts.\nIt will be ignored by the addon and removed later.";

L["minimapLayerHoverTitle"] = "Minimap Mouseover";
L["minimapLayerHoverDesc"] = "Only show the minimap layer number frame when you hover the mouse over the minimap?";

L["soundsNpcKilledTitle"] = "NPC Killed";
L["soundsNpcKilledDesc"] = "Sound to play when a buff NPC is killed to reset a timer.";

L["autoDmfBuffCharsText"] = "Darkmoon Faire Character Specific Buff Settings:";

L["middleNpcKilledTitle"] = "NPC Killed";
L["middleNpcKilledDesc"] = "Show a raid warning style msg in the middle of the screen when an Ony or Nef NPC is killed for a buff reset.";

L["chatNpcKilledTitle"] = "NPC Killed";
L["chatNpcKilledDesc"] = "Print a msg in chat when an Ony or Nef NPC is killed for a buff reset.";

L["onyxiaNpcRespawnHorde"] = "Onyxia NPC (Runthak) will respawn at a random time within the next 2 minutes.";
L["nefarianNpcRespawnHorde"] = "Nefarian NPC (Saurfang) will respawn at a random time within the next 2 minutes.";
L["onyxiaNpcRespawnAlliance"] = "Onyxia NPC (Mattingly) will respawn at a random time within the next 2 minutes.";
L["nefarianNpcRespawnAlliance"] = "Nefarian NPC (Afrasiabi) will respawn at a random time within the next 2 minutes.";

L["onyxiaNpcKilledHordeWithTimer2"] = "Onyxia NPC (Runthak) was killed %s ago, respawn in %s.";
L["nefarianNpcKilledHordeWithTimer2"] = "Nefarian NPC (Saurfang) was killed %s ago, respawn in %s.";
L["onyxiaNpcKilledAllianceWithTimer2"] = "Onyxia NPC (Mattingly) was killed %s ago, respawn in %s.";
L["nefarianNpcKilledAllianceWithTimer2"] = "Nefarian NPC (Afrasiabi) was killed %s ago, respawn in %s.";

L["flashNpcKilledTitle"] = "Flash NPC Killed";
L["flashNpcKilledDesc"] = "Flash the wow client when a buff NPC is killed?";

L["trimDataHeaderDesc"] = "Data Cleanup";

L["trimDataBelowLevelTitle"] = "Maximum Level To Remove";
L["trimDataBelowLevelDesc"] = "Select maximum level of characters to remove from database, all characters this level and below will be deleted.";

L["trimDataBelowLevelButtonTitle"] = "Remove Characters";
L["trimDataBelowLevelButtonDesc"] = "Click this button to remove all characters with the selected level and lower from this addon database. Note: This removes buff count data permanently.";

L["trimDataTextDesc"] = "Remove multiple characters from buffs database:";
L["trimDataText2Desc"] = "Remove one character from buffs database:";

L["trimDataCharInputTitle"] = "Remove One Character Input";
L["trimDataCharInputDesc"] = "Type a character here to remove, format as Name-Realm (Case sensitive). Note: This removes buff count data permanently.";

L["trimDataBelowLevelButtonConfirm"] = "Are you sure you want to remove all characters below level %s from the database?";
L["trimDataCharInputConfirm"] = "Are you sure you want to remove this character %s from the database?";

L["trimDataMsg1"] = "Buff records have been reset."
L["trimDataMsg2"] = "Removing all chars below level %s.";
L["trimDataMsg3"] = "Removed: %s.";
L["trimDataMsg4"] = "Done, no characters found.";
L["trimDataMsg5"] = "Done, removed %s characters.";
L["trimDataMsg6"] = "Please enter a valid Character-Name to delete from database.";
L["trimDataMsg7"] = "This character name %s doesn't include a realm, please input Name-Realm.";
L["trimDataMsg8"] = "Error removing %s from the database, character not found (name is case sensitive).";
L["trimDataMsg9"] = "Removed %s from the database.";

L["serverTime"] = "server time";
L["serverTimeShort"] = "st";

L["showUnbuffedAltsTitle"] = "Show Unbuffed Alts";
L["showUnbuffedAltsDesc"] = "Show alts without any buffs in the buffs window? This is so you can see what characters have no buffs if you would like.";

L["Sheen of Zanza"] = "Zanzas Glanz";
L["Spirit of Zanza"] = "Zanzas Geist";
L["Swiftness of Zanza"] = "Zanzas Schnelligkeit";

L["Mind Control"] = "Gedankenkontrolle";
L["Gnomish Mind Control Cap"] = "Gnomen-Gedankenkontrollkappe";

L["Flask of Fortification"] = "Flask of Fortification";
L["Flask of Pure Death"] = "Flask of Pure Death";
L["Flask of Relentless Assault"] = "Flask of Relentless Assault";
L["Flask of Blinding Light"] = "Flask of Blinding Light";
L["Flask of Mighty Restoration"] = "Flask of Mighty Restoration";
L["Flask of Chromatic Wonder"] = "Flask of Chromatic Wonder";
L["Fortification of Shattrath"] = "Fortification of Shattrath";
L["Pure Death of Shattrath"] = "Pure Death of Shattrath";
L["Relentless Assault of Shattrath"] = "Relentless Assault of Shattrath";
L["Blinding Light of Shattrath"] = "Blinding Light of Shattrath";
L["Mighty Restoration of Shattrath"] = "Mighty Restoration of Shattrath";
L["Supreme Power of Shattrath"] = "Supreme Power of Shattrath";
L["Unstable Flask of the Beast"] = "Unstable Flask of the Beast";
L["Unstable Flask of the Sorcerer"] = "Unstable Flask of the Sorcerer";
L["Unstable Flask of the Bandit"] = "Unstable Flask of the Bandit";
L["Unstable Flask of the Elder"] = "Unstable Flask of the Elder";
L["Unstable Flask of the Physician"] = "Unstable Flask of the Physician";
L["Unstable Flask of the Soldier"] = "Unstable Flask of the Soldier";

L["Chronoboon Displacer"] = "Chronoboon Displacer";

L["Silithyst"] = "Silithyst";

L["Gold"] = "Gold";
L["level"] = "Level";
L["realmGold"] = "Realm gold for";
L["total"] = "Total";
L["guild"] = "Guild";
L["bagSlots"] = "Bag slots";
L["durability"] = "Durability";
L["items"] = "Items";
L["ammunition"] = "Ammo";
L["attunements"] = "Attunements";
L["currentRaidLockouts"] = "Current Raid Lockouts";
L["none"] = "None.";

L["Temple of Atal'Hakkar"] = "Tempel von Atal'Hakkar";

L["Might of Stormwind"] = "Macht von Sturmwind";

L["Battle Shout"] = "Schlachtruf";