--Cheat Information
local PenisDedushki = {}
PenisDedushki.Version = "V4.5"
PenisDedushki.UpdateDate = "05.04.2022"
PenisDedushki.Build = "Beta v2"
--Tables
local em = FindMetaTable"Entity"
local wm = FindMetaTable"Weapon"
local pm = FindMetaTable"Player"
--Misc
local ply, me = LocalPlayer(), LocalPlayer()
local math, player = math, player
local table, util = table, util
local pairs, ipairs = pairs, ipairs
local Vector, Angle, Color = Vector, Angle, Color
local IsValid = IsValid
local TraceLine, TraceHull = util.TraceLine, util.TraceHull
local mNormalizeAng = math.NormalizeAngle
local band, bor, bnot = bit.band, bit.bor, bit.bnot
local TICK_INTERVAL = engine.TickInterval()
--Math 
local mabs, msin, mcos, mClamp, mrandom, mRand = math.abs, math.sin, math.cos, math.Clamp, math.random, math.Rand
local mceil, mfloor, msqrt, mrad, mdeg = math.ceil, math.floor, math.sqrt, math.rad, math.deg
local mmin, mmax = math.min, math.max
--Draw
local surface, draw = surface, draw
local drawSimpleOutlinedText = draw.SimpleTextOutlined
local surfSetDrawColor = surface.SetDrawColor
local surfDrawLine = surface.DrawLine
local surfDrawRect = surface.DrawRect
local surfSetTextColor = surface.SetTextColor
local surfSetTextPos = surface.SetTextPos --surfDrawTexturedRect
local surfSetFont = surface.SetFont
local surfDrawText = surface.DrawText
local surfGetTextSize = surface.GetTextSize
local surfDrawCircle = surface.DrawCircle
local surfDrawTexturedRect = surface.DrawTexturedRect
--Fonts
surface.CreateFont("smallest_pixel", {size = 15,weight = 1000,antialias = true,shadow = true,font = "smallest_pixel-7",})
surface.CreateFont("Fatality", {size = 30,weight = 400,antialias = true,shadow = true,font = "Fatality's Edge",})
--CFG Start
local config = {}
local teamFilterSelected = {}
config.colors = {}
config.keybinds = {}
//Game events
gameevent.Listen("entity_killed")
gameevent.Listen("player_connect")
gameevent.Listen("player_disconnect")
gameevent.Listen("player_changename")
gameevent.Listen("server_cvar")
gameevent.Listen("player_say")
gameevent.Listen("player_spawn")
gameevent.Listen("player_hurt")
//Modules
require("dickwrap")
require("enginepred")
require("context")
require("bsendpacket")
--require("cvar3")
//PenisDeduration
config["aim_master_toggle"] = false
config["aim_onkey"] = false
config["aim_norecoil"] = false
config["aim_norecoil_true"] = false
config["aim_nospread"] = false
config["aim_prediction_metod"] = 1
config["aim_silent"] = 1
config["aim_psilent"] = false
config["aim_target"] = 1
config["aim_hitbox"] = 1
config["aim_fov"] = 30
config["aim_smoothing"] = false
config["aim_smoothing_value"] = 0
config["aim_ignorefriends"] = false
config["aim_ignoreadmins"] = false
config["aim_ignorenoclip"] = false
config["aim_ignoreteam"] = false
config["aim_ignoreinvis"] = true
config["aim_ignorebots"] = false
config["aim_autofire"] = false
config["aim_autofire_fast"] = false
config["aim_autoreload"] = false
config["autoslow"] = false
config["slowwalk"] = false
config["slowwalk_speed"] = 35
config["autocrouch"] = false
config["aim_zeusbot"] = false
config["aim_jump_check"] = false
config["aim_nodraw"] = false
config["aim_godded"] = false
config["aim_bullettime"] = false
config["aim_facestab"] = false
config["aim_knifebot"] = false
config["aim_animknife"] = false
config["aim_act_disabler"] = false
config["aim_interp"] = false
config["aim_velocitypred"] = true
config["aim_autopeek3"] = false
config["aim_autopeek_timer"] = 3

config["movement_fix"] = 1

config["killaura_crits"] = false
config["killaura_key"] = false
config["killaura_magnet"] = false
config["killaura_on_key"] = false
config["killaura_toggle"] = false
config["killaura_delay"] = false
config["killaura_disttype"] = 1

config["bot_healthkit"] = false
config["bot_armorkit"] = false

config["trigger_master_toggle"] = false
config["trigger_onkey"] = false

config["antihit_act"] = false
config["antihit_act_type"] = 1
config["antihit_lean"] = false
config["antihit_lean_dir"] = 1
config["aa_enable"] = false
config["aa_pitch"] = 1
config["aa_yaw"] = 1
config["aa_lby"] = 1
config["aa_yaw_add"] = 1
config["aa_cpitch"] = 1
config["aa_cyaw"] = 1
config["aa_jitter_range"] = 1
config["fa_enable"] = false
config["fa_pitch"] = 1
config["fa_yaw"] = 1
config["fa_lby"] = 1
config["fa_yaw_add"] = 1
config["fa_cpitch"] = 1
config["fa_cyaw"] = 1
config["fa_jitter_range"] = 1
config["aa_chams"] = false
config["fa_chams"] = false
config["antihit_act"] = false
config["antihit_fd"] = false
config["crimwalk"] = false


config["esp_self_predict_me"] = false
config["esp_self_dlight"] = false
config["esp_self_dlight_hsv"] = false
config["esp_self_hand_chams"] = false
config["esp_self_gun_chams"] = false
config["esp_self_pet"] = false
config["esp_self_hat"] = false
config["esp_self_rainbow"] = false
config["esp_self_laser_sight"] = false
config["esp_self_velocity_crosshair"] = false
config["esp_self_chams"] = false
config["esp_self_chams_wep"] = false
config["esp_self_hat_type"] = 1
config["esp_self_customagent"] = false
config["esp_self_customagent_agent"] = 1
config["esp_self_fakelagchams"] = false


config["esp_self_bullet_tracers"] = false

config["esp_player_teamfilter"] = false
config["esp_player_botfilter"] = false

config["esp_player_box"] = false
config["esp_player_box_mode"] = 1 
config["esp_player_name"] = false config["name_x"] = 0 config["name_y"] = 5 config["name_pos"] = 3 
config["esp_player_hp"] = false
config["esp_player_hp_type"] = 1
config["esp_player_ap"] = false
config["esp_player_ap_type"] = 1
config["esp_player_health"] = false config["health_x"] = 5 config["health_y"] = 10 config["health_pos"] = 1 
config["esp_player_armor"] = false config["armor_x"] = 5 config["armor_y"] = 20 config["armor_pos"] = 1 
config["esp_player_ap_type"] = 2
config["esp_player_weapon"] = false config["wep_x"] = 0 config["wep_y"] = 15 config["wep_pos"] = 4 
config["esp_player_weapon_fancy"] = false
config["esp_player_rank"] = false config["rank_x"] = 0 config["rank_y"] = 25 config["rank_pos"] = 4 
config["esp_player_team"] = false config["tm_x"] = 0 config["tm_y"] = 15 config["tm_pos"] = 3 
config["esp_player_distance"] = false config["ds_x"] = 5 config["ds_y"] = 10 config["ds_pos"] = 2 
config["esp_player_money"] = false config["mn_x"] = 0 config["mn_y"] = 5 config["mn_pos"] = 1 
config["esp_player_dormant_ind"] = false config["di_x"] = 0 config["di_y"] = 5 config["di_pos"] = 1 
config["esp_player_skeleton"] = false
config["esp_player_snaplines"] = false
config["esp_player_snaplines_pos"] = 1
config["esp_player_sights"] = false 
config["esp_player_glow"] = false
config["esp_player_glow_type"] = 1
config["esp_player_chams"] = false
config["esp_player_chams_overlay"] = false
config["esp_player_chams_xyz"] = false
config["esp_player_drawmodel"] = false
config["esp_player_chams_material"] = "!textured"
config["esp_player_overlay_chams_material"] = "!textured"
config["esp_player_xyz_chams_material"] = "!textured"
config["esp_player_hitbox"] = false
config["esp_player_render_distance"] = 3000
config["esp_player_dormant"] = false
config["esp_player_filtering"] = false
config["esp_player_highlight_box"] = false
config["esp_player_highlight_name"] = false
config["esp_player_closest_hud"] = false
config["esp_player_hitmarker"] = false
config["esp_player_dlight"] = false
config["esp_player_bulletbeam"] = false
config["esp_attachments_chams"] = false
config["esp_attachments_glow"] = false


config["esp_comp"] = true

config["esp_player_box_hsv"] = false
config["esp_player_name_hsv"] = false
config["esp_player_weapon_hsv"] = false
config["esp_player_hp_hsv"] = false
config["esp_player_chams_hsv"] = false
config["esp_player_chams_hp"] = false

config["esp_player_hp_health"] = false

config["esp_npc_box"] = false
config["esp_npc_halo"] = false
config["esp_npc_name"] = false
config["esp_npc_health"] = false
config["esp_npc_snaplines"] = false

config["esp_ent_storage_esp"] = false
config["esp_ent_crosshair"] = false

config["esp_other_fog"] = false
config["esp_other_fog_start"] = 0
config["esp_other_fog_end"] = 9000
config["esp_other_fog_density"] = 0.8
config["esp_other_worldmod"] = false
config["esp_other_propmod"] = false
config["esp_other_nosky"] = false
config["esp_other_3dskydisabler"] = false
config["esp_other_skyboxrect"] = false
config["esp_other_cc"] = false
config["esp_other_cc_scale"] = 0.4
config["esp_other_cc_addr"] = 55
config["esp_other_cc_addg"] = 45
config["esp_other_cc_addb"] = 66
config["esp_other_cc_color"] = 1
config["esp_other_cc_mulr"] = 0
config["esp_other_cc_mulg"] = 0
config["esp_other_cc_mulrb"] = 0

config["esp_other_killeffect"] = false

config["esp_other_bloom"] = 0
config["esp_other_hitsound"] = false
config["esp_hitsound_sound"] = 1
config["esp_other_hitnumbers"] = false
config["esp_other_drawfov"] = false
config["esp_other_drawfov_fill"] = false
config["esp_other_fullbright"] = false
config["esp_other_thirdperson"] = false
config["esp_other_thirdperson_distance"] = 15
config["esp_other_thirdperson_walldetect"] = false
config["esp_other_freecam"] = false
config["esp_other_freecam_speed"] = 5
config["esp_other_hlflashlight"] = false
config["esp_other_swinganim"] = false

config["esp_entity_box"] = false
config["esp_entity_name"] = false

config["map_enable"] = false
config["map_zoom"] = 35
config["map_size"] = 230
config["map_x"] = 5
config["map_y"] = 150
config["map_names"] = false
config["map_teams"] = false

config["hud_watermark"] = true
config["hud_fps_indicator"] = false
config["hud_disable_hl2_hud"] = false
config["hud_custom_hud"] = false
config["hud_crosshair"] = false
config["hud_crosshair_type"] = 1
config["hud_keystrokes"] = false
config["hud_keystrokes_style"] = 1
config["hud_aimbotstatus"] = false
config["hud_killstreak"] = false
config["hud_arraylist"] = false
config["hud_topline"] = false
config["hud_topline_style"] = 1
config["hud_bsp"] = false

config["esp_render_mode"] = false

config["misc_autobunnyhop"] = false
config["misc_autostrafe"] = false
config["misc_autostrafe_type"] = 1
config["misc_infinitduck"] = false
config["misc_airduck"] = false
config["misc_duckwalk"] = false
config["misc_airduckmetod"] = 1
config["misc_antiafk"] = false
config["misc_180turn"] = false
config["misc_jittermove"] = false
config["misc_scrollattack"] = false
config["misc_fastswitch"] = false
config["misc_m9kstopper"] = false

config["misc_ttt"] = false
config["misc_antibot"] = false
config["misc_observerlist"] = false
config["misc_adminlist"] = false
config["misc_adminlist_x"] = 3
config["misc_adminlist_y"] = 35
config["misc_rainbow"] = false	
config["misc_rainbowply"] = false	
config["misc_rainbow_speed"] = 20
config["misc_fov"] = false
config["misc_fov_value"] = 100
config["misc_viewmodel"] = false
config["misc_bob"] = false
config["misc_sway"] = false
config["misc_vm_x"] = 0
config["misc_vm_y"] = 0
config["misc_vm_z"] = 0
config["misc_vm_p"] = 0
config["misc_vm_ya"] = 0
config["misc_vm_r"] = 0
config["misc_chat_spam"] = false
config["misc_ropes"] = false

config["misc_eventlog"] = false
config["misc_eventlog_connects"] = false
config["misc_eventlog_dconects"] = false
config["misc_eventlog_hurt"] = false
config["misc_eventlog_kills"] = false

config["misc_infolist"] = false
config["misc_infolist_x"] = 5
config["misc_infolist_y"] = 250

config["misc_speclist"] = false
config["misc_speclist_x"] = 5
config["misc_speclist_y"] = 400

config["misc_gaysay"] = false
config["misc_gaysays"] = 1
config["misc_familyshared"] = false
config["misc_flashlight"] = false
config["misc_antiarest"] = false
config["misc_antiarest_metod"] = 1
config["misc_supkill"] = false
config["misc_wallpush"] = false
config["misc_sitabuse"] = false
config["misc_use"] = false
config["misc_doundo"] = false
config["misc_rpnamer"] = false
config["misc_rpnamer_time"] = 35
config["misc_circlestrafer"] = false
config["misc_fakecrouch"] = false

config["misc_fnamechanger"] = false

config["config_name"] = nil
config["name_font_size"] = 12
config["name_font"] = 1
config["flags_font_size"] = 12
config["flag_font"] = 2


config["menu_type"] = 1

config["bsp_fake_lags"] = false
config["bsp_fake_lags_value"] = 1
config["bsp_fake_lags_conditions"] = 1
config["bsp_evadebullets"] = false
config["misc_pairstack"] = false

config["gameserver"] = 1

config.colors["esp_player_box"] = "255 255 255 255"
config.colors["esp_player_name"] = "255 255 255 255"
config.colors["esp_player_hp"] = "0 255 0 255"
config.colors["esp_player_ap"] = "0 125 255 255"
config.colors["esp_player_armor"] = "66 138 245 255"
config.colors["esp_player_health"] = "0 255 0 255"
config.colors["esp_player_weapon"] = "255 255 255 255"
config.colors["esp_player_rank"] = "255 0 0 255"
config.colors["esp_player_skeleton"] = "255 255 255 255"
config.colors["esp_player_snaplines"] = "255 255 255 255"
config.colors["esp_player_glow"] = "0 140 255 255"
config.colors["esp_player_chams"] = "30 111 146 255"
config.colors["esp_player_chams_overlay"] = "255 255 255 255"
config.colors["esp_player_chams_xyz"] = "0 63 160 63"
config.colors["esp_player_hitbox"] = "51 204 255 255"
config.colors["esp_player_highlight_box"] = "0 255 0 255"
config.colors["esp_player_highlight_name"] = "0 255 0 255"
config.colors["esp_other_fog"] = "118 144 184 255"
config.colors["esp_other_worldmod"] = "255 255 255 255"
config.colors["esp_other_propmod"] = "255 255 255 255"
config.colors["esp_other_drawfov"] = "255 255 255 255"
config.colors["esp_entity_box"] = "255 255 255 255"
config.colors["esp_entity_name"] = "255 255 255 255"
config.colors["esp_self_bullet_tracers"] = "255 0 255 255"
config.colors["esp_player_bulletbeam"] = "255 200 0 255"
config.colors["esp_player_sights"] = "255 200 200 255"
config.colors["esp_self_dlight"] = "255 0 0 255"
config.colors["esp_player_dlight"] = "0 125 255 255"
config.colors["esp_other_skyboxrect"] = "15 15 35 255"
config.colors["esp_attachments_chams"] = "150 150 255 150"
config.colors["esp_attachments_glow"] = "150 150 255 150"
config.colors["esp_player_distance"] = "255 255 255 255"
config.colors["esp_self_velocity_crosshair"] = "5 5 5 120"
config.colors["esp_ent_storage_esp"] = "255 180 45 150"
config.colors["esp_self_chams"] = "255 180 255 150"
config.colors["esp_self_chams_wep"] = "255 11 11 150"
config.colors["esp_player_money"] = "45 255 45 150"
config.colors["esp_player_dormant_ind"] = "55 45 45 150"
config.colors["esp_self_fakelagchams"] = "200 200 255 150"
config.colors["esp_self_gun_chams"] = "55 255 45 255"
config.colors["esp_self_hand_chams"] = "120 120 200 255"

config.colors["esp_npc_box"] = "255 255 255 255"
config.colors["esp_npc_halo"] = "255 255 255 255"
config.colors["esp_npc_name"] = "255 255 255 255"
config.colors["esp_npc_health"] = "120 255 0 255"
config.colors["esp_npc_snaplines"] = "255 15 15 255"

config.colors["esp_self_laser_sight"] = "255 15 15 255"

config.colors["menu_accent"] = "255 15 15 255"
config.colors["map_enable"] = "15 15 15 255"
config.colors["map_names"] = "255 255 255 255"

config.keybinds["aim_onkey_key"] = 0
config.keybinds["misc_wallpush"] = 0
config.keybinds["killaura_key"] = 0
config.keybinds["trigger_onkey_key"] = 0
config.keybinds["menu_key"] = 73 
config.keybinds["logger_key"] = 0
config.keybinds["panic_key"] = 0
config.keybinds["thirdperson_key"] = 0
config.keybinds["freecam_key"] = 0
config.keybinds["misc_supkill_key"] = 0
config.keybinds["misc_mm_keybind"] = 0
config.keybinds["180turn_keybind"] = 0
config.keybinds["jitter_keybind"] = 0
config.keybinds["circlestrafer_key"] = 0
config.keybinds["misc_warp_key"] = 0
config.keybinds["antihit_fd_key"] = 0
config.keybinds["airstack"] = 0
config.keybinds["aim_autopeek"] = 0
config.keybinds["crimwalkkey"] = 0
--config.keybinds["aim_autopeek2"] = 0

config["friends"] = {}
config["entities"] = {}

//Misc
local hooks = {}
local verifyconfig = config
local frame, frameX, frameY, sheet, colorWindow, teamList, teamFilter, teamFilterWasOpen, teamFilterEnable, teamFilterX, teamFilterY, pList, pListWasOpen, entityFrame, entityFrameX, entityFrameY, entityFrameWasOpen, cfgDropdown, chamFrame, chamFrameX, chamFrameY, chamFrameWasOpen
local activeTab
local ss = false
local loadedCfg = {}
local editingText = false
local observingPlayers = {}
observingPlayers.watcher = {}
observingPlayers.spec = {}
local onlineStaff = {}
local staffRanks = {}
local files, dir = file.Find( "config/*.json", "DATA" )
local frametime, deviation = engine.ServerFrameTime()
local intp, toggledelay3, toggledelayN = false, false, false
local NoclipPos, NoclipAngles, NoclipOn, NoclipX, NoclipY, NoclipDuck, NoclipJump = LocalPlayer():EyePos(), LocalPlayer():GetAngles(), false, 0, 0, false, false
CreateMaterial("textured", "VertexLitGeneric")
CreateMaterial("flat", "UnLitGeneric")
CreateMaterial("wireframe", "VertexLitGeneric", {
	["$wireframe"] = 1
})
local ChamMaterials = {
	["Flat"] = "!flat",
	["Textured"] = "!textured",
	["Untextured"] = "1",
	["Wireframe"] = "!wireframe",
	["Spawn Effect"] = "models/spawn_effect2",
	["Light 1"] = "models/error/new light1",
	["Alien"] = "models/XQM/LightLinesRed_tool",
	["Flesh"] = "models/flesh",
	["Molten"] = "models/props_lab/Tank_Glass001",
	["Glass"] = "models/props_combine/com_shield001a",
	["Plasma"] = "models/props_combine/portalball001_sheet",
	["Water"] = "models/props_combine/stasisshield_sheet",
	["Fire"] = "models/shadertest/shader4",
	["Glow"] = "Models/effects/splodearc_sheet",
	["Reactor"] = "Models/effects/comball_tape",
	["Galaxy"] = "Models/effects/comball_sphere",
	["Water 2"] = "models/shadertest/shader3",
	["Chrome"] = "debug/env_cubemap_model",
	["Shiny"] = "models/shiny",
	["Supreme"] = "random-supreme",
	["VaporWave"] = "random-vaporwave",
	["Rainbow"] = "color-arcoiris",
	["Cloud"] = "color-blanco-transparente",
	["Portal"] = "minecraft-portal",
	["Random Map"] = "random-6",
	["Marihuana"] = "random-marihuana",
	["LEGO"] = "random-lego",
	["Palm"] = "random-2",
	["Green"] = "random-cuadriculado",
}
local oldposition = Vector(0,0,0)
local CheatFonts = {"comfortaa", "Arial", "Bahnschrift", "Calibri", "Comic Sans MS", "Consolas", "Courier New", "Franklin Gothic Medium", "Impact", "Ink Free", "Microsoft Sans Serif", "Myanmar Text", "Segoe UI", "Tahoma", "Times New Roman", "Trebuchet MS", "Verdana"}
local function UpdateNameFont()
	surface.CreateFont("ESP_Font_Main",{font = CheatFonts[config["name_font"]], size = config["name_font_size"]})
end

local function UpdateFlagFont()
	surface.CreateFont("ESP_Font_Flag",{font = CheatFonts[config["flag_font"]], size = config["flags_font_size"]})
end
UpdateNameFont()
UpdateFlagFont()
local function RandomString() return tostring(math.random(-9999999999, 9999999999)) end
local cObs, cStaff = RandomString(), RandomString()
local function DisableWorldModulation()

	for k, v in pairs( Entity( 0 ):GetMaterials() ) do
   		Material( v ):SetVector( "$color", Vector(1, 1, 1) )
   		Material( v ):SetFloat( "$alpha", 1 )
	end

end
local function DisablePropModulation()

	for k, v in pairs(ents.FindByClass("prop_physics")) do
		v:SetColor(Color(255, 255, 255, 255))
		v:SetRenderMode( RENDERMODE_NORMAL )
	end

end
local function GetRenderMode()
	return config["esp_render_mode"] and "(Unsafe)" or "(Protected)"
end
local function UpdateVisibleChamMaterial(cvar, old, new)
	if table.HasValue(ChamMaterials, new) then
		config["esp_player_chams_material"] = new
	end
end
local function UpdateOverlayChamMaterial(cvar, old, new)
	if table.HasValue(ChamMaterials, new) then
		config["esp_player_overlay_chams_material"] = new
	end
end
local function UpdateInvisibleChamMaterial(cvar, old, new)
	if table.HasValue(ChamMaterials, new) then
		config["esp_player_xyz_chams_material"] = new
	end
end
CreateClientConVar("pd_setmat", "!textured")
cvars.AddChangeCallback("pd_setmat", UpdateVisibleChamMaterial, "update_chams")
CreateClientConVar("pd_setoverlaymat", "!textured")
cvars.AddChangeCallback("pd_setoverlaymat", UpdateOverlayChamMaterial, "update_chams_overlay")
CreateClientConVar("pd_setxyzmat", "!textured")
cvars.AddChangeCallback("pd_setxyzmat", UpdateInvisibleChamMaterial, "update_chams_xyz")

local function AddHook(event, name, func)
	hooks[name] = event
	hook.Add(event, name, func)
end

local function VerifyConfig()
	for k, v in pairs(verifyconfig) do
		if config[k] == nil then
			config[k] = verifyconfig[k]
			MsgC(Color(61, 149, 217), "\n[config] ", Color(222, 222, 222), "The config value ", Color(255, 0, 0), k, Color(222, 222, 222), " was nil. To prevent errors in the cheat it has been set to the default value automatically. Please make sure to save your config with your desired settings to prevent this in the future.")
		end
	end
	for k, v in pairs(verifyconfig.colors) do
		if config.colors[k] == nil then
			if k == "config_name" then return end
			config.colors[k] = verifyconfig.colors[k]
			MsgC(Color(61, 149, 217), "\n[config] ", Color(222, 222, 222), "The colour config value ", Color(255, 0, 0), k, Color(222, 222, 222), " was nil. To prevent errors in the cheat it has been set to the default value automatically. Please make sure to save your config with your desired settings to prevent this in the future.")
		end
	end
	for k, v in pairs(verifyconfig.keybinds) do
		if config.keybinds[k] == nil then
			config.keybinds[k] = verifyconfig.keybinds[k]
			MsgC(Color(61, 149, 217), "\n[config] ", Color(222, 222, 222), "The keybind config value ", Color(255, 0, 0), k, Color(222, 222, 222), " was nil. To prevent errors in the cheat it has been set to the default value automatically. Please make sure to save your config with your desired settings to prevent this in the future.")
		end
	end
end

local function GetENTPos ( Ent )
	if Ent:IsValid() then 
		local Points = {
			Vector( Ent:OBBMaxs().x, Ent:OBBMaxs().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMaxs().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMins().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMaxs().x, Ent:OBBMins().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMins().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMins().y, Ent:OBBMaxs().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMaxs().y, Ent:OBBMins().z ),
			Vector( Ent:OBBMins().x, Ent:OBBMaxs().y, Ent:OBBMaxs().z )
		}
		local MaxX, MaxY, MinX, MinY
		local V1, V2, V3, V4, V5, V6, V7, V8
		local isVis
		for k, v in pairs( Points ) do
			local ScreenPos = Ent:LocalToWorld( v ):ToScreen()
			isVis = ScreenPos.visible
			if MaxX != nil then
				MaxX, MaxY, MinX, MinY = math.max( MaxX, ScreenPos.x ), math.max( MaxY, ScreenPos.y), math.min( MinX, ScreenPos.x ), math.min( MinY, ScreenPos.y)
			else
				MaxX, MaxY, MinX, MinY = ScreenPos.x, ScreenPos.y, ScreenPos.x, ScreenPos.y
			end

			if V1 == nil then
				V1 = ScreenPos
			elseif V2 == nil then
				V2 = ScreenPos
			elseif V3 == nil then
				V3 = ScreenPos
			elseif V4 == nil then
				V4 = ScreenPos
			elseif V5 == nil then
				V5 = ScreenPos
			elseif V6 == nil then
				V6 = ScreenPos
			elseif V7 == nil then
				V7 = ScreenPos
			elseif V8 == nil then
				V8 = ScreenPos
			end
		end
		return MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8, isVis
	end
end

local fakeRT = GetRenderTarget( "fakeRT" .. os.time(), ScrW(), ScrH() )
 
AddHook("RenderScene", RandomString(), function( vOrigin, vAngle, vFOV )
	if ( !gui.IsConsoleVisible() && !gui.IsGameUIVisible() ) || ss then
	    local view = {
	        x = 0,
	        y = 0,
	        w = ScrW(),
	        h = ScrH(),
	        dopostprocess = true,
	        origin = vOrigin,
	        angles = vAngle,
	        fov = vFOV,
	        drawhud = true,
	        drawmonitors = true,
	        drawviewmodel = true
	    }
	 
	    render.RenderView( view )
	    render.CopyTexture( nil, fakeRT )
	 
	    cam.Start2D()
	        hook.Run( "CheatHUDPaint" )
	    cam.End2D()

	    render.SetRenderTarget( fakeRT )
	 
	    return true
	end
end )
 
AddHook("ShutDown", RandomString(), function()
    render.SetRenderTarget()
end )

local renderv = render.RenderView
local renderc = render.Clear
local rendercap = render.Capture
local rendercappix = render.CapturePixels
local vguiworldpanel = vgui.GetWorldPanel
render.CapturePixels = function() return end
 
local function screengrab()
	if ss then return end
	ss = true
 
	renderc( 0, 0, 0, 255, true, true )
	renderv( {
		origin = LocalPlayer():EyePos(),
		angles = LocalPlayer():EyeAngles(),
		x = 0,
		y = 0,
		w = ScrW(),
		h = ScrH(),
		dopostprocess = true,
		drawhud = true,
		drawmonitors = true,
		drawviewmodel = true
	} )
 
	local vguishits = vguiworldpanel()
 
	if IsValid( vguishits ) then
		vguishits:SetPaintedManually( true )
	end
 
	timer.Simple( 0.1, function()
		vguiworldpanel():SetPaintedManually( false )
		ss = false
	end)
end
render.Capture = function(data)
	screengrab()
	local cap = rendercap( data )
	return cap
end
local function GetIgnorePlayers( ply )

	if config["aim_ignorefriends"] then
		if table.HasValue(config["friends"], ply:SteamID()) then
			return false
		end
	end
	if config["aim_ignoreadmins"] then
		if table.HasValue(onlineStaff, ply) then
			return false
		end
	end
	if config["aim_ignorenoclip"] then
		if ply:GetMoveType() == MOVETYPE_NOCLIP then
			return false
		end
	end
	if config["aim_ignoreteam"] then
		if ply:Team() == LocalPlayer():Team() then
			return false
		end
	end

	return true
end
local function ValidateESP(ply)
	if !IsValid(ply) then return false end
	if ply == LocalPlayer() then return false end
	if !ply:IsPlayer() and !ply:IsBot() then return false end
	if !ply:Alive() then return false end
	if config["esp_player_dormant"] then
		if ply:IsDormant() then return false end
	end
	if config["esp_comp"] then
		if ply:IsDormant() && ply:GetPos():Distance(LocalPlayer():GetPos()) > 2000 then return false end 
		if ply:IsDormant() && ply:GetPos():Distance(LocalPlayer():GetPos()) > 5000 then return false end 
	end
	if ply:GetPos():Distance(LocalPlayer():GetPos()) > config["esp_player_render_distance"] then return false end
	if config["esp_player_teamfilter"] then
	if ply:Team() == LocalPlayer():Team() then return false end
	end
	if config["esp_player_botfilter"] && ply:IsBot() then return false end
	if !table.IsEmpty(teamFilterSelected) && config["esp_player_filter"] then
		for k, v in pairs(teamFilterSelected) do
			if team.GetName(ply:Team()) == v then
				return true
			end
		end
	else
		return true
	end
end

local function ValidateAimbot(ply)
	if !IsValid(ply) then return false end
	if !ply:IsPlayer() and !ply:IsBot() then return false end
	if ply == LocalPlayer() then return false end
	if !ply:Alive() then return false end
	if ply:Team() == TEAM_SPECTATOR then return false end
	if ply:IsDormant() then return false end
	if config["aim_jump_check"] && !LocalPlayer():IsOnGround() then return false end 
	if config["aim_godded"] && ply:HasGodMode() then return false end 
	if config["aim_nodraw"] && ply:GetNoDraw() then return false end 
	if !GetIgnorePlayers(ply) then return false end
	if config["aim_ignorebots"] then if ply:IsBot() then return false end end
	if ply:GetPos():Distance(LocalPlayer():GetPos()) > config["esp_player_render_distance"] then return false end
	if !table.IsEmpty(teamFilterSelected) && config["esp_player_filter"] then
		for k, v in pairs(teamFilterSelected) do
			if team.GetName(ply:Team()) == v then
				return true
			end
		end
	else
		return true
	end
end

local function ValidateKillaura(ply)
	if !IsValid(ply) then return false end
	if !ply:IsPlayer() and !ply:IsBot() then return false end
	if ply == LocalPlayer() then return false end
	if !ply:Alive() then return false end
	if ply:Team() == TEAM_SPECTATOR then return false end
	if ply:IsDormant() then return false end
	if !GetIgnorePlayers(ply) then return false end
	if config["aim_ignorebots"] then if ply:IsBot() then return false end end
	if ply:GetPos():Distance(LocalPlayer():GetPos()) > 100 then return false end
	if !table.IsEmpty(teamFilterSelected) && config["esp_player_filter"] then
		for k, v in pairs(teamFilterSelected) do
			if team.GetName(ply:Team()) == v then
				return true
			end
		end
	else
		return true
	end
end

local playerTable = {}



AddHook("Think", RandomString(), function()
	for k, v in pairs(player.GetAll()) do
		if ValidateESP(v) && !table.HasValue(playerTable, v) then
			table.insert(playerTable, v)
		elseif !ValidateESP(v) && table.HasValue(playerTable, v) then
			table.RemoveByValue(playerTable, v)
		end
	end
end)
local function CloseFrame()
	frameX, frameY = frame:GetPos()
	RememberCursorPosition()
	frame:Remove()
	frame = false
end
local function SaveConfig()
	if cfgDropdown:GetSelected() == nil then return end	
	local cfg = cfgDropdown:GetSelected()
	local JSONconfig = util.TableToJSON(config, true)
	file.Write("config/"..cfg, JSONconfig)
	MsgC(Color(61, 149, 217), "\n[config] ", Color(222, 222, 222), "Saved Config - ", Color(255, 0, 0), cfg, "\n")
end
local function LoadDefault()
	local JSONconfig = file.Read("penisdeda/default.json", "DATA")
	config = util.JSONToTable(JSONconfig)
	VerifyConfig()
	loadedCfg[0] = "default.json"
	for k, v in ipairs(files) do
		if v == "default.json" then
			loadedCfg[1] = k
		end
	end
	SwapRender(true)
	MsgC(Color(61, 149, 217), "\n[PenisDeda] ", Color(222, 222, 222), "Loaded Default Config\n")
end
local function LoadConfig()

	if cfgDropdown:GetSelected() == nil then return end

	local cfg = cfgDropdown:GetSelected()
	local JSONconfig = file.Read("penisdeda/"..cfg, "DATA")
	config = util.JSONToTable(JSONconfig)

	VerifyConfig()

	loadedCfg[0] = cfg
	for k, v in ipairs(files) do
		if v == cfg then
			loadedCfg[1] = k
		end
	end

	SwapRender(true)

	MsgC(Color(61, 149, 217), "\n[PenisDeda] ", Color(222, 222, 222), "Loaded Config - ", Color(255, 0, 0), cfg, "\n")

	CloseFrame()
	HavocGUI()

end


local function CreateConfig()

	if config["config_name"] == nil then return end
	
	if file.Exists("penisdeda/"..config["config_name"]..".json", "DATA") then return end

	local JSONconfig = util.TableToJSON(config, true)
	file.CreateDir("penisdeda")
	file.Write("penisdeda/"..config["config_name"]..".json", JSONconfig)

	MsgC(Color(61, 149, 217), "\n[PenisDeda] ", Color(222, 222, 222), "Created Config - ", Color(255, 0, 0), config["config_name"], "\n")

	CloseFrame()
	HavocGUI()

end


local function DeleteConfig()

	if cfgDropdown:GetSelected() == nil then return end
	
	local cfg = cfgDropdown:GetSelected()
	file.Delete("penisdeda/"..cfg)

	loadedCfg = {}

	MsgC(Color(61, 149, 217), "\n[PenisDeda] ", Color(222, 222, 222), "Deleted Config - ", Color(255, 0, 0), cfg, "\n")

	CloseFrame()
	HavocGUI()

end

local function Unload()
	if frame then
		frame:Remove()
	end
	if teamFilter then
		teamFilter:Remove()
	end
	if colorWindow then
		colorWindow:Remove()
	end
	if pList then
		pList:Remove()
	end
	if entityFrame then
		entityFrame:Remove()
	end
	if chamFrame then
		chamFrame:Remove()
	end
	for k, v in pairs(hooks) do
		hook.Remove(v, k)
	end
	if _framerender then
		_framerender:Remove()
	end
	timer.Remove(cObs)
	timer.Remove(cStaff)
	for k, v in pairs(player.GetAll()) do
		v:SetRenderMode(0)
	end
	if textInput:IsEditing() then
	editingText = false
	end
	DisableWorldModulation()
	DisablePropModulation()
	cvars.RemoveChangeCallback("pd_setmat", "update_chams")
	cvars.RemoveChangeCallback("pd_setxyzmat", "update_chams_xyz")
	cvars.RemoveChangeCallback("pd_setoverlaymat", "update_chams_overlay")
	print("Cheat was unloaded..")
end



local function CheckObservers()

	if !config["misc_speclist"] then return end

	observingPlayers = {}
	observingPlayers.watcher = {}
	observingPlayers.spec = {}

	for k, v in pairs(player.GetAll()) do
	    if v:IsValid() and v != LocalPlayer() then
	        local Trace = {}
	        Trace.start  = LocalPlayer():EyePos() + Vector(0, 0, 32)
	        Trace.endpos = v:EyePos() + Vector(0, 0, 32)
	        Trace.filter = {v, LocalPlayer()}
	        TraceRes = util.TraceLine(Trace)
	        if !TraceRes.Hit then
	            if (v:EyeAngles():Forward():Dot((LocalPlayer():EyePos() - v:EyePos())) > math.cos(math.rad(45))) then
	                if !table.HasValue(observingPlayers.watcher, v) then table.insert(observingPlayers.watcher, v ) end
	            end
	        end
	    end
	    if v:GetObserverTarget() == LocalPlayer() then
	    	if !table.HasValue(observingPlayers.spec, v) then table.insert(observingPlayers.spec, v) end
	    end
	end
end
timer.Create(cObs, 0.5, 0, CheckObservers)
local function UpdateOnlineStaff()
	onlineStaff = {}
	for k, v in ipairs(player.GetAll()) do
		if v:IsValid() && v:IsSuperAdmin() then
			if !table.HasValue(onlineStaff, v) then
				table.insert(onlineStaff, v)
			end
		elseif v:IsValid() && v:IsAdmin() then
			if !table.HasValue(onlineStaff, v) then
				table.insert(onlineStaff, v)
			end
		elseif v:IsValid() && table.HasValue(staffRanks, v:GetUserGroup()) then
			if !table.HasValue(onlineStaff, v) then
				table.insert(onlineStaff, v)
			end
		end
	end
end
timer.Create(cStaff, 5, 0, UpdateOnlineStaff)

messageJustSent = false
messages = 0
EventsAlpha = 0
timer.Create("eventListTimer", 8, 0, function() messageJustSent = false end)
local function eventListOpen()
    eventList = vgui.Create("DFrame")
    eventList:SetDraggable(false)
    eventList:ShowCloseButton(false)
    eventList:SetPos(-5, 22)
    eventList:SetSize(800, 300)
    eventList:SetTitle("")
    eventList.Paint = function() end

    Events = vgui.Create("RichText", eventList)
    Events:Dock(FILL)
    Events:SetVerticalScrollbarEnabled(false) 
    Events.Paint = function()
        if(!messageJustSent) then if(EventsAlpha > 0) then EventsAlpha = EventsAlpha - 4 end end
        if(messages > 10 && messageJustSent) then Events:GotoTextEnd() end
        Events:SetAlpha(EventsAlpha)
    end

    Events.PerformLayout = function(self)
        self:SetFontInternal("ChatFont")
    end
    function addEventlistMessage(message)
    timer.Stop("eventListTimer")
    messageJustSent = true
    messages = messages + 1
    EventsAlpha = 255
    if(messageJustSent) then timer.Start("eventListTimer") end
    Events:InsertColorChange(0, 0, 0, 255)
    Events:AppendText("[")
            
    Events:InsertColorChange(255, 25, 25, 255)
    Events:AppendText("Penis")

    Events:InsertColorChange(255, 255, 255, 255)
    Events:AppendText("Deda")

    Events:InsertColorChange(0, 0, 0, 255)
    Events:AppendText("]")

    Events:InsertColorChange(255, 255, 255, 255)
    Events:AppendText(" ".. message.. "\n")
    MsgC(message, Color(255, 255, 255))
    end
end

--=========================================GUI ITEMS============================================--
local function CreateCheckBox(lbl, x, y, cfg, col, par, cpx)

	local checkBox = vgui.Create("DCheckBox", par)
	checkBox:SetPos(x, y)
	checkBox:SetValue( config[cfg] )
	function checkBox:OnChange( bVal )
		config[cfg] = bVal
	end
	
	local label2 = vgui.Create("DLabel", par)
	label2:SetText(lbl)
	local w, h = label2:GetTextSize()
	label2:SetSize(w, h)
	label2:SetPos(x+16, y)
	label2:SetSize(200,20)
	label2:SetFont("smallest_pixel")
	
	checkBox.Paint = function(self, w, h)
	if checkBox:GetChecked() then
	    for i = 0, 5 do
            surfSetDrawColor(Color(128,255,128,200))
            surfDrawRect(1, 2, 13, 13)
	    end
	else
        for i = 0, 5 do
            surfSetDrawColor(Color(200,128,128,45))
            surfDrawRect(1, 2, 13, 13)
	    end
	end
	surfSetDrawColor(Color(25,25,25,128)) 
	surface.SetMaterial( Material("gui/gradient_up") )
	surfDrawTexturedRect( 0, 1, 14, 14 )
	surfSetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 1, 14, 14, 1 )
	end
	
	if col then
		local cx = checkBox:GetPos()
		local colorPicker = vgui.Create("DImageButton", par)
		colorPicker:SetImage("gui/workshop_rocket.png")
		colorPicker:SetSize(16, 16)
		colorPicker:SetPos(cx+cpx, y - 1)
		colorPicker:SetColor(string.ToColor(config.colors[cfg]))
		colorPicker.Paint = function(self, w, h)
		surfSetDrawColor( 0, 0, 0, 255 )
	    surface.DrawOutlinedRect( 2, 2, w-4, h-4, 1 )
		end
		
		function colorPicker:DoClick()
			if IsValid(colorWindow) then
				colorWindow:Remove()
			end
			--Color Picker Window
			
			colorPicker:SetColor(string.ToColor(config.colors[cfg]))
			colorWindow = vgui.Create("DFrame")
			colorWindow:SetSize(300, 225)
			colorWindow:SetTitle(" ")
			colorWindow:ShowCloseButton(false)			
			colorWindow.Paint = function(self, w, h) local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 ) draw.RoundedBox(3, 0, 0, w, h, Color(0,0,0,255)) draw.RoundedBox(3, 1, 1, w-2, h-2, Color(30,30,30,255))	draw.RoundedBox(3, 3, 3, w-6, 3, Color(hsv.r,hsv.g,hsv.b,255)) draw.SimpleText( lbl .. " - Color", "BudgetLabel", 5, 8, color_white ) draw.RoundedBox(3, 1, 26, w-2, 198, Color(45,45,45,255)) end
			
			local colorWindowCloser = vgui.Create( "DButton", colorWindow ) 
            colorWindowCloser:SetText( "" )					
            colorWindowCloser:SetPos( 250, 8 )					
            colorWindowCloser:SetSize( 40, 15 )					
            colorWindowCloser.DoClick = function() colorWindow:Close() end
            colorWindowCloser.Paint = function(w,h) draw.RoundedBox(0,0,0,0,0,Color(0,0,0,0)) draw.SimpleText("Close", "BudgetLabel", 0, 0, Color(255,100,100) ) end
			
			local frameX, frameY = frame:GetPos()
			if frameX + 350 > ScrW() then
				colorWindow:Center()
			else
				colorWindow:SetPos(frameX + 350, frameY)
			end
			colorWindow:MakePopup()
            --Window end
			local colorSelector = vgui.Create("DColorMixer", colorWindow)
			colorSelector:Dock(FILL)
			colorSelector:DockPadding(5, 5, 5, 5)
			colorSelector:SetPalette(true)
			colorSelector:SetColor(string.ToColor(config.colors[cfg]))
			function colorSelector:ValueChanged(val)
				local r = tostring(val.r)
				local g = tostring(val.g)
				local b = tostring(val.b)
				local a = tostring(val.a)
				local col = r.." "..g.." "..b.." "..a
				config.colors[cfg] = col
			colorPicker:SetColor(string.ToColor(config.colors[cfg]))
			end
		end	
		--[[
		function colorPicker:DoRightClick()
		    hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
			colorPicker:SetColor(hsv.r,hsv.g,hsv.b)
		end
		]]
	end
end

local function CreateCheckBoxExperemental(lbl, x, y, cfg, col, par)

	local checkBox = vgui.Create("DCheckBox", par)
	checkBox:SetPos(x, y)
	checkBox:SetValue( config[cfg] )
	function checkBox:OnChange( bVal )
		config[cfg] = bVal
	end
	
	local label1 = vgui.Create("DLabel", par)
	label1:SetText(lbl)
	local w, h = label1:GetTextSize()
	label1:SetSize(w, h)
	label1:SetPos(x+16, y)
	label1:SetSize(200,20)
	label1:SetColor(Color(255,120,120,255))
	label1:SetFont("smallest_pixel")
	
	checkBox.Paint = function(self, w, h)
	if checkBox:GetChecked() then
	for i = 0, 5 do
    surfSetDrawColor(Color(128,255,128,200))
    surfDrawRect(1, 2, 13, 13)
	end
	else
    for i = 0, 5 do
    surfSetDrawColor(Color(200,128,128,45))
    surfDrawRect(1, 2, 13, 13)
	end
	end
	surfSetDrawColor(Color(25,25,25,128)) 
	surface.SetMaterial( Material("gui/gradient_up") )
	surfDrawTexturedRect( 0, 1, 14, 14 )
	surfSetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 1, 14, 14, 1 )
	end
	
if col then
		local cx, cy = collabel:GetPos()
		local colorPicker = vgui.Create("DImageButton", par)
		colorPicker:SetImage("icon16/color_wheel.png")
		colorPicker:SetSize(16, 16)
		colorPicker:SetPos(cx + collabel:GetWide() + 5, y - 1)
		function colorPicker:DoClick()
			if IsValid(colorWindow) then
				colorWindow:Remove()
			end
			colorWindow = vgui.Create("DFrame")
			colorWindow:SetSize(300, 225)
			colorWindow:SetTitle(lbl.." - Color Picker")
			local frameX, frameY = frame:GetPos()
			if frameX + 350 > ScrW() then
				colorWindow:Center()
			else
				colorWindow:SetPos(frameX + 350, frameY)
			end
			colorWindow:MakePopup()

			local colorSelector = vgui.Create("DColorMixer", colorWindow)
			colorSelector:Dock(FILL)
			colorSelector:DockPadding(5, 5, 5, 5)
			colorSelector:SetPalette(false)
			colorSelector:SetColor(string.ToColor(config.colors[cfg]))
			function colorSelector:ValueChanged(val)
				local r = tostring(val.r)
				local g = tostring(val.g)
				local b = tostring(val.b)
				local a = tostring(val.a)
				local col = r.." "..g.." "..b.." "..a
				config.colors[cfg] = col
			end
		end
	end
end

local function CreateLabel(lbl, x, y, par)

	local label = vgui.Create("DLabel", par)
	label:SetText(lbl)
	label:SetFont("smallest_pixel")
	local w, h = label:GetTextSize()
	label:SetSize(w, h)
	label:SetPos(x, y)


end

local function CreateSlider(lbl, x, y, cfg, min, max, dec, par)

	local sliderLabel = vgui.Create("DLabel", par)
	sliderLabel:SetText(lbl)
	local w, h = sliderLabel:GetTextSize()
	sliderLabel:SetWide(w)
	sliderLabel:SetPos(x+5, y - h / 8)

	local slider = vgui.Create("DNumSlider", par)
	slider:SetWide(350)
	slider:SetPos(x-150, y + 10)
	slider:SetMin(min)
	slider:SetMax(max)
	slider:SetTooltip(lbl)
	slider:SetDefaultValue(config[cfg])
	slider:ResetToDefaultValue()
	slider:SetDecimals(dec)
	function slider:OnValueChanged()
		config[cfg] = slider:GetValue()
	end
	slider.Slider.Knob:SetSize(12,8)
    slider.Slider.Knob.Paint = function(self,w,h)
	surfSetDrawColor(Color(255,255,255,255)) 
	surface.SetMaterial( Material("gui/lmb.png") )
	surfDrawTexturedRect( 0, -5, 15, 15 )
	end

end

local function CreateDropdown(lbl, x, y, choices, cfg, par)

	local dropdownLabel = vgui.Create("DLabel", par)
	dropdownLabel:SetText(lbl)
	local w, h = dropdownLabel:GetTextSize()
	dropdownLabel:SetWide(w)
	dropdownLabel:SetPos(x, y - h / 8)

	local dropdown = vgui.Create("DComboBox", par)
	dropdown:SetSize(180, 20)
	dropdown:SetPos(x, y + 20)
	for k, v in ipairs(choices) do
		dropdown:AddChoice(v)
	end
	dropdown:SetSortItems(false)
	dropdown:ChooseOptionID(config[cfg])
	function dropdown:OnSelect(index, value, data)
		config[cfg] = index
	end
	dropdown.Paint = function(self,w,h)
		draw.RoundedBox(0, 0, 0, w, h, Color(45,45,60,150))
		surfSetDrawColor( 0, 0, 0, 255 )
	    surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	end
	DMenuOption.Paint = function(self, w, h)
    for i = 0, 12 do
	draw.RoundedBox(0, 0, 0, w, h, Color(55,55,55,255))
    draw.RoundedBox(0, 1, 1, w-2, h-2, Color(55,55,75,150))
	surfSetDrawColor( 0, 0, 0, 150 )
	surface.DrawOutlinedRect( 1, 1, w-2, h-2, 1 )    
    end
    surfSetDrawColor( 0, 0, 0, 0 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    end
	dropdown.DropButton.Paint = function() end
	dropdown.PerformLayout = function(self)
        self:SetTextColor(Color(215,215,215,255))
        self:SetFont("smallest_pixel")
    end
end

local function CreateKeybind(x, y, cfg, par)

	local keyBind = vgui.Create("DBinder", par)
	keyBind:SetValue(config.keybinds[cfg])
 	keyBind:SetSize(50, 16)
 	keyBind:SetPos(x, y)
 	keyBind.OnChange = function()
 		config.keybinds[cfg] = keyBind:GetValue()
 	end
	keyBind.Paint = function(self,w,h)
	    surfSetDrawColor(25,25,25,150)
        surfDrawRect(0, 0, w-2, h)
	end
end

local function CreateButton(lbl, tooltip, fnc, x, y, par)

	local button = vgui.Create("DButton", par)
	button:SetSize(150, 20)
	button:SetPos(x, y)
	button:SetText("")
	button:SetTooltip(tooltip)
	function button:DoClick()
		surface.PlaySound( "buttons/button15.wav" )
		fnc()
	end
	button.Paint = function(self,w,h)
	    surface.SetFont("smallest_pixel")
		local textw = surfGetTextSize(lbl)
		draw.RoundedBox(0, 0, 0, w, h, Color(45,45,60,150))
		surfSetDrawColor( 0, 0, 0, 255 )
	    surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.SimpleText(lbl, "smallest_pixel", 150/2-textw/2, 3, color_white )
	end
end

local function HSVColorButton(x, y, cfg, par)

	local hsvbox = vgui.Create("DCheckBox", par)
	hsvbox:SetPos(x, y)
	hsvbox:SetValue( config[cfg] )
	function hsvbox:OnChange( bVal )
		config[cfg] = bVal
	end
	hsvbox.Paint = function(self, w, h)
	local mat = Material("icon16/rainbow.png")
	if hsvbox:GetChecked() then
        surfSetDrawColor( 255, 255, 255, 255 )
	    surface.SetMaterial( mat )
	    surfDrawTexturedRect( 0, 0, 15, 15 )
	else
        surfSetDrawColor( 111, 111, 111, 200 )
	    surface.SetMaterial( mat )
	    surfDrawTexturedRect( 0, 0, 15, 15 )
	end
	end
end

local function CreateExpButton(lbl, tooltip, fnc, x, y, par, col)
	local expbutton = vgui.Create("DButton", par)
	expbutton:SetSize(150, 30)
	function expbutton:Paint(w, h)
		surfSetDrawColor(25,25,25,255)
        surfDrawRect(0, 0, w, h)
		surfSetDrawColor(col.r,col.g,col.b,255)
		surface.DrawOutlinedRect( 2, 2, w-4, h-4, 1 )
		draw.SimpleText( lbl, "smallest_pixel", w/2/2/2, 7, color_white )
	end
	expbutton:SetPos(x, y)
	expbutton:SetText(" ")
	expbutton:SetTooltip(tooltip)
	function expbutton:DoClick()
		surface.PlaySound( "buttons/button15.wav" )
		fnc()
	end
end

local function CreateTextInput(lbl, cfg, x, y, chars, par)

	textInput = vgui.Create("DTextEntry", par)
	textInput:SetSize(200, 20)
	textInput:SetPos(x, y)
	textInput:IsMultiline( false )
	textInput:SetMaximumCharCount(chars)
	textInput:SetPlaceholderText(lbl)
	textInput.Think = function()
		if textInput:IsEditing() then
			editingText	= true
		else
			editingText = false
		end
		config[cfg] = textInput:GetValue()
	end 
end

local function CreateFilterPanel()

	if !teamFilter then

		teamFilter = vgui.Create("DFrame")
		teamFilter:SetSize(300, 200)
		teamFilter:SetTitle("Filter By Teams")
		function teamFilter:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(45,45,60,150))
		surfSetDrawColor( 0, 0, 0, 255 )
	    surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		end
		if teamFilterX == nil or teamFilterY == nil then
			teamFilter:Center()
		else
			teamFilter:SetPos(teamFilterX, teamFilterY)
		end
		teamFilter:MakePopup()
		function teamFilter:OnClose()
			teamFilterX, teamFilterY = teamFilter:GetPos()
			teamFilter = false
			config["esp_player_filter"] = teamFilterEnable:GetChecked()
			for k, v in pairs(teamList:GetSelected()) do
				if !table.HasValue(teamFilterSelected, v:GetValue(1)) then
					table.insert(teamFilterSelected, v:GetValue(1))
				end
			end
		end

		teamFilterEnable = vgui.Create("DCheckBoxLabel", teamFilter)
		teamFilterEnable:Dock(TOP)
		teamFilterEnable:DockMargin(10, 10, 10, 0)
		teamFilterEnable:SetText("Enable Team Based Filtering")
		if config["esp_player_filtering"] then
			teamFilterEnable:SetValue( true )
		end
		function teamFilterEnable:OnChange(bval)
			config["esp_player_filtering"] = bval
		end

		teamList = vgui.Create("DListView", teamFilter)
		teamList:Dock(FILL)
		teamList:DockMargin(10, 10, 10, 10)
		teamList:SetMultiSelect(true)
		teamList:AddColumn("Teams")
		teamList:SetSortable(true)

		for k, v in pairs(team.GetAllTeams()) do
			if !( team.GetName(k) == team.GetName(TEAM_CONNECTING) ) then
				teamList:AddLine(team.GetName(k))
			end
		end
		if !table.IsEmpty(teamFilterSelected) then
			for k, v in pairs(teamFilterSelected) do
				for i, line in ipairs(teamList:GetLines()) do
					if line:GetValue(1) == v then
						teamList:SelectItem(line)
						break
					end
				end
			end
		end
		teamFilterSelected = {}
	end
end

local function CreatePlayerList()

	if !pList then

		pList = vgui.Create("DFrame")
		pList:SetSize(475, 200)
		function pList:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(45,45,60,150))
		surfSetDrawColor( 0, 0, 0, 255 )
	    surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		end
		local frameW, frameH = frame:GetPos()
		if frameW - 50 < 0 then
			pList:Center()
		else
			pList:SetPos(frameW - 525, frameH)
		end
		pList:SetTitle("Players List")
		pList:MakePopup()
		function pList:OnClose()
			pList = false
		end

		local dlist = vgui.Create("DListView", pList)
		dlist:DockMargin(0, 0, 150, 0)
		dlist:Dock(FILL)
		dlist:SetMultiSelect(false)
		dlist:AddColumn("Name")
		dlist:AddColumn("Steam ID")
		dlist:AddColumn("Rank")

		for k, v in ipairs(player.GetAll()) do
			if v != LocalPlayer() then
				dlist:AddLine(v:Name(), v:SteamID(), v:GetUserGroup())
			end
		end

		local profile = vgui.Create("DButton", pList)
		profile:SetSize(130, 20)
		profile:SetPos(335, 29)
		profile:SetText("Open Profile")
		profile:SetTooltip("Opens the selected players steam profile.")
		function profile:DoClick()
			if dlist:GetSelectedLine() != nil then
				local _, line = dlist:GetSelectedLine()
				player.GetBySteamID(line:GetColumnText(2)):ShowProfile()
			end
		end

		local steamid = vgui.Create("DButton", pList)
		steamid:SetSize(130, 20)
		steamid:SetPos(335, 54)
		steamid:SetText("Copy SteamID")
		steamid:SetTooltip("Copies the selected players SteamID.")
		function steamid:DoClick()
			if dlist:GetSelectedLine() != nil then
				local _, line = dlist:GetSelectedLine()
				SetClipboardText(line:GetColumnText(2))
				chat.AddText(Color(61, 149, 217), "[PenisDeda] ", Color(222, 222, 222), "SteamID copied to clipboard.")
			end
		end

		local friend = vgui.Create("DCheckBoxLabel", pList)
		friend:SetText("Friend")
		friend:SetPos(335, 79)
		friend:SetValue( false )
		function friend:OnChange( bVal )
			if dlist:GetSelectedLine() != nil then
				local _, line = dlist:GetSelectedLine()
				if bVal then
					if table.HasValue(config["friends"], line:GetColumnText(2)) then return
					else table.insert(config["friends"], line:GetColumnText(2)) end
				else
					if table.HasValue(config["friends"], line:GetColumnText(2)) then
						table.RemoveByValue(config["friends"], line:GetColumnText(2))
					end
				end
			end
		end

		function dlist:OnRowSelected(ind, line)
			if table.HasValue(config["friends"], line:GetColumnText(2)) then
				friend:SetValue(true)
			else
				friend:SetValue(false)
			end
		end
	end
end

local function CreateEntityList()

	if !entityFrame then

		entityFrame = vgui.Create("DFrame")
		entityFrame:SetSize(400, 200)
		entityFrame:SetTitle("Entity ESP")
		function entityFrame:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(45,45,60,150))
		surfSetDrawColor( 0, 0, 0, 255 )
	    surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		end
		if entityFrameX == nil or entityFrameY == nil then
			entityFrame:Center()
		else
			entityFrame:SetPos(entityFrameX, entityFrameY) 
		end
		entityFrame:MakePopup()
		function entityFrame:OnClose()
			entityFrameX, entityFrameY = entityFrame:GetPos()
			entityFrame = false
		end

		local entList = vgui.Create("DListView", entityFrame)
		entList:DockMargin(0, 0, 100, 0)
		entList:Dock(FILL)
		entList:SetMultiSelect(false)
		entList:AddColumn("Entities")

		for k, v in ipairs(ents.GetAll()) do
			local good = true
			for k, line in ipairs( entList:GetLines() ) do
    			if line:GetValue( 1 ) == v:GetClass() then good = false break end
			end
			if v:GetClass() != "worldspawn" && v:GetClass() != "player" && v:GetOwner() != LocalPlayer() && good then
				entList:AddLine(v:GetClass())
			end
		end

		local enable = vgui.Create("DCheckBoxLabel", entityFrame)
		enable:SetText("Enable ESP")
		enable:SetPos(305, 30)
		enable:SetValue( false )
		function enable:OnChange( bVal )
			if entList:GetSelectedLine() != nil then
				local _, line = entList:GetSelectedLine()
				if bVal then
					if table.HasValue(config["entities"], line:GetColumnText(1)) then return
					else table.insert(config["entities"], line:GetColumnText(1)) end
				else
					if table.HasValue(config["entities"], line:GetColumnText(1)) then
						table.RemoveByValue(config["entities"], line:GetColumnText(1))
					end
				end
			end
		end

		CreateCheckBox("Box ESP", 305, 50, "esp_entity_box", true, entityFrame, 165)
		CreateCheckBox("Name ESP", 305, 70, "esp_entity_name", true, entityFrame, 165)

		function entList:OnRowSelected(ind, line)
			if table.HasValue(config["entities"], line:GetColumnText(1)) then
				enable:SetValue(true)
			else
				enable:SetValue(false)
			end
			
		end
	end
end

local function CreateMaterialList()

	if !chamFrame then

		chamFrame = vgui.Create("DFrame")
		chamFrame:SetSize(400, 425)
		chamFrame:SetTitle("Cham Materials")
		function chamFrame:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(45,45,60,150))
		surfSetDrawColor( 0, 0, 0, 255 )
	    surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		end
		if chamFrameX == nil or chamFrameY == nil then
			chamFrame:Center()
		else
			chamFrame:SetPos(chamFrameX, chamFrameY) 
		end
		chamFrame:MakePopup()
		function chamFrame:OnClose()
			chamFrameX, chamFrameY = chamFrame:GetPos()
			chamFrame = false
		end

		local sPanel = vgui.Create("DScrollPanel", chamFrame)
		sPanel:Dock(FILL)
        local sPanelS = sPanel:GetVBar()
	    function sPanelS:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(15, 15, 15, 200))
	    end
	    function sPanelS.btnUp:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	    end
	    function sPanelS.btnDown:Paint(w, h)
		draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	    end
	    function sPanelS.btnGrip:Paint(w, h)
		surfSetDrawColor( 0, 0, 0, 255 )
	    surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.RoundedBox(0, 0, 0, w, h, Color(45, 45, 60, 150))
	    end
		local visChams = vgui.Create("ControlPanel", sPanel)
		visChams:Dock(TOP)
		visChams:SetName("Visible Chams")
		visChams:MatSelect("pd_setmat", ChamMaterials, true, 50, 50)

		local overlayChams = vgui.Create("ControlPanel", sPanel)
		overlayChams:Dock(TOP)
		overlayChams:SetName("Overlay Chams")
		overlayChams:MatSelect("pd_setoverlaymat", ChamMaterials, true, 50, 50)

		local invisChams = vgui.Create("ControlPanel", sPanel)
		invisChams:Dock(TOP)
		invisChams:SetName("Invisible Chams")
		invisChams:MatSelect("pd_setxyzmat", ChamMaterials, true, 50, 50)

	end
end
function Wrad(x,y,w,h)
	surface.SetDrawColor( 255, 255, 255, 60 ) 
	surface.SetMaterial(Material("gui/center_gradient")) 
    surface.DrawTexturedRect(x, y, w, h)
end
--========================GUI Menu============================================--
function HavocGUI()
	files, dir = file.Find( "penisdeda/*.json", "DATA" )

	frame = vgui.Create("DFrame")
	frame:SetSize(780, 650)
	if frameX == nil or frameY == nil then frame:Center() else frame:SetPos(frameX, frameY) end
	frame:SetTitle("")
	frame:MakePopup()
	frame:ShowCloseButton(false)
	frame.Paint = function(self,w,h)
	surface.SetFont("Fatality")
	local wt = surfGetTextSize("PenisDeda - Azbuka Sexa V4 - Beta")
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.RoundedBox( 3, 0, 0, w, h, Color(0,0,0,255) )
    draw.RoundedBox( 3, 1, 1, w-2, h-2, Color(35,35,40,255) )
	draw.RoundedBox( 3, 0, 0, w, 6, Color(0,0,0,255) )
	draw.RoundedBox( 3, 1, 1, w-2, 4, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(25,1,675,4)
	draw.RoundedBox( 3, 3, 8, w-6, 30, Color(0,0,0,255) )
	draw.RoundedBox( 3, 4, 9, w-8, 28, Color(45,45,50,255) )	
	draw.RoundedBox( 3, 3, 42, w-6, h-46, Color(0,0,0,255) )
	draw.RoundedBox( 3, 4, 43, w-8, h-48, Color(45,45,50,255) )
	draw.SimpleText("PenisDeda - Azbuka Sexa V4 - Beta", "Fatality", 780/2-wt/2, 7,Color(hsv.r,hsv.g,hsv.b))
	end
    	
	local sheet = vgui.Create( "DPropertySheet", frame )
    sheet:SetPos(4,44)
    sheet:SetSize(792,602)
	sheet.Paint = function( self, w, h ) for k, v in pairs(sheet.Items) do if v.Tab then v.Tab.Paint = function(self,w,h) draw.RoundedBox( 3, 0, 0, w, h, Color(0,0,0,255) ) draw.RoundedBox( 3, 1, 1, w-2, h-2, Color(45,45,50,255) ) end end end end

    --======================= Combat ==========================--
	local AIM_SCROLL = vgui.Create( "DScrollPanel", sheet )
    AIM_SCROLL:Dock( FILL )
    local AIM_SCROLLS = AIM_SCROLL:GetVBar()
	function AIM_SCROLLS:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(15, 15, 15, 200))
	end
	function AIM_SCROLLS.btnUp:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function AIM_SCROLLS.btnDown:Paint(w, h)
	draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function AIM_SCROLLS.btnGrip:Paint(w, h)
    draw.RoundedBox( 3, 0, 0, w, h, Color(0,0,0,255) )
	draw.RoundedBox( 3, 1, 1, w-2, h-2, Color(45,45,50,255) )
	end
    
	local co_main = vgui.Create( "DPanel", AIM_SCROLL)
    co_main:SetPos( 3, 3 ) 
    co_main:SetSize( 250, 400 )
	co_main.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Main:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
	local co_accuracy = vgui.Create( "DPanel", AIM_SCROLL)
    co_accuracy:SetPos( 260, 3 ) 
    co_accuracy:SetSize( 250, 200 )
	co_accuracy.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Accuracy:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
    local co_helpers = vgui.Create( "DPanel", AIM_SCROLL)
    co_helpers:SetPos( 517, 3 ) 
    co_helpers:SetSize( 250, 300 )
	co_helpers.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Helpers:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
    local co_filtering = vgui.Create( "DPanel", AIM_SCROLL)
    co_filtering:SetPos( 260, 205 ) 
    co_filtering:SetSize( 250, 210 )
	co_filtering.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Filter:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
    local co_trigger = vgui.Create( "DPanel", AIM_SCROLL)
    co_trigger:SetPos( 517, 305 ) 
    co_trigger:SetSize( 250, 80 )
	co_trigger.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Triggerbot:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
    local co_bt = vgui.Create( "DPanel", AIM_SCROLL)
    co_bt:SetPos( 517, 385 ) 
    co_bt:SetSize( 250, 114 )
	co_bt.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Backtrack:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
    --====================== Anti-Aim =========================--
	local AA_SCROLL = vgui.Create( "DScrollPanel", sheet )
    AA_SCROLL:Dock( FILL )
    local AA_SCROLLS = AA_SCROLL:GetVBar()
	function AA_SCROLLS:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(15, 15, 15, 200))
	end
	function AA_SCROLLS.btnUp:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function AA_SCROLLS.btnDown:Paint(w, h)
	draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function AA_SCROLLS.btnGrip:Paint(w, h)
    draw.RoundedBox( 3, 0, 0, w, h, Color(0,0,0,255) )
	draw.RoundedBox( 3, 1, 1, w-2, h-2, Color(45,45,50,255) )
	end	
    local co_aa = vgui.Create( "DPanel", AA_SCROLL)
    co_aa:SetPos( 3, 3 ) 
    co_aa:SetSize( 250, 400 )
	co_aa.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Anti-Aim:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
    local co_fa = vgui.Create( "DPanel", AA_SCROLL)
    co_fa:SetPos( 260, 3 ) 
    co_fa:SetSize( 250, 400 )
	co_fa.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Fake Angles:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
    local co_otheraa = vgui.Create( "DPanel", AA_SCROLL)
    co_otheraa:SetPos( 517, 3 ) 
    co_otheraa:SetSize( 250, 400 )
	co_otheraa.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Other:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
	--======================= Player ==========================--
	local VISUAL_SCROLL = vgui.Create( "DScrollPanel", sheet )
    VISUAL_SCROLL:Dock( FILL )
    local VISUAL_SCROLLS = VISUAL_SCROLL:GetVBar()
	function VISUAL_SCROLLS:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(15, 15, 15, 200))
	end
	function VISUAL_SCROLLS.btnUp:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function VISUAL_SCROLLS.btnDown:Paint(w, h)
	draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function VISUAL_SCROLLS.btnGrip:Paint(w, h)
    draw.RoundedBox( 3, 0, 0, w, h, Color(0,0,0,255) )
	draw.RoundedBox( 3, 1, 1, w-2, h-2, Color(45,45,50,255) )
	end    
	local pl_main = vgui.Create( "DPanel", VISUAL_SCROLL)
    pl_main:SetPos( 3, 3 ) 
    pl_main:SetSize( 250, 490 )
	pl_main.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Main:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
	local pl_effect = vgui.Create( "DPanel", VISUAL_SCROLL)
    pl_effect:SetPos( 260, 3 ) 
    pl_effect:SetSize( 250, 220 )
	pl_effect.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Effects:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
    local pl_render = vgui.Create( "DPanel", VISUAL_SCROLL)
    pl_render:SetPos( 517, 3 ) 
    pl_render:SetSize( 250, 110 )
	pl_render.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Render:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
    local pl_chams = vgui.Create( "DPanel", VISUAL_SCROLL)
    pl_chams:SetPos( 260, 225 ) 
    pl_chams:SetSize( 250, 150 )
	pl_chams.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Colored Models:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
    local pl_performance = vgui.Create( "DPanel", VISUAL_SCROLL)
    pl_performance:SetPos( 517, 115 ) 
    pl_performance:SetSize( 250, 260 )
	pl_performance.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Performance:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
	--======================= ESPS ==========================--
	local ESPS_SCROLL = vgui.Create( "DScrollPanel", sheet )
    ESPS_SCROLL:Dock( FILL )
    local ESPS_SCROLLS = ESPS_SCROLL:GetVBar()
	function ESPS_SCROLLS:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(15, 15, 15, 200))
	end
	function ESPS_SCROLLS.btnUp:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function ESPS_SCROLLS.btnDown:Paint(w, h)
	draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function ESPS_SCROLLS.btnGrip:Paint(w, h)
    draw.RoundedBox( 3, 0, 0, w, h, Color(0,0,0,255) )
	draw.RoundedBox( 3, 1, 1, w-2, h-2, Color(45,45,50,255) )
	end
	local esps_poss = vgui.Create( "DPanel", ESPS_SCROLL)
    esps_poss:SetPos( 3, 3 ) 
    esps_poss:SetSize( 250, 800 )
	esps_poss.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "ESP Element Positions:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end    
	local esps_aligns = vgui.Create( "DPanel", ESPS_SCROLL)
    esps_aligns:SetPos( 260, 3 ) 
    esps_aligns:SetSize( 250, 600 )
	esps_aligns.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "ESP Text Align:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
	local esps_fonts = vgui.Create( "DPanel", ESPS_SCROLL)
    esps_fonts:SetPos( 517, 3 ) 
    esps_fonts:SetSize( 250, 200 )
	esps_fonts.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "ESP Fonts:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
	--======================= Self ==========================--
	local SELF_SCROLL = vgui.Create( "DScrollPanel", sheet )
    SELF_SCROLL:Dock( FILL )
    local SELF_SCROLLS = SELF_SCROLL:GetVBar()
	function SELF_SCROLLS:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(15, 15, 15, 200))
	end
	function SELF_SCROLLS.btnUp:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function SELF_SCROLLS.btnDown:Paint(w, h)
	draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function SELF_SCROLLS.btnGrip:Paint(w, h)
    draw.RoundedBox( 3, 0, 0, w, h, Color(0,0,0,255) )
	draw.RoundedBox( 3, 1, 1, w-2, h-2, Color(45,45,50,255) )
	end
	local self_view = vgui.Create( "DPanel", SELF_SCROLL)
    self_view:SetPos( 3, 3 ) 
    self_view:SetSize( 250, 620 )
	self_view.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "View:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end    
	local self_other = vgui.Create( "DPanel", SELF_SCROLL)
    self_other:SetPos( 260, 3 ) 
    self_other:SetSize( 250, 350 )
	self_other.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Other:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end  
	local self_hud = vgui.Create( "DPanel", SELF_SCROLL)
    self_hud:SetPos( 517, 3 ) 
    self_hud:SetSize( 250, 370 )
	self_hud.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "HUD:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end   	
	--======================= World =========================--
	local WORLD_SCROLL = vgui.Create( "DScrollPanel", sheet )
    WORLD_SCROLL:Dock( FILL )
    local WORLD_SCROLLS = WORLD_SCROLL:GetVBar()
	function WORLD_SCROLLS:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(15, 15, 15, 200))
	end
	function WORLD_SCROLLS.btnUp:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function WORLD_SCROLLS.btnDown:Paint(w, h)
	draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function WORLD_SCROLLS.btnGrip:Paint(w, h)
    draw.RoundedBox( 3, 0, 0, w, h, Color(0,0,0,255) )
	draw.RoundedBox( 3, 1, 1, w-2, h-2, Color(45,45,50,255) )
	end
	local wrld_ents = vgui.Create( "DPanel", WORLD_SCROLL)
    wrld_ents:SetPos( 3, 3 ) 
    wrld_ents:SetSize( 250, 100 )
	wrld_ents.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Entity ESP:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end    
	local wrld_minimap = vgui.Create( "DPanel", WORLD_SCROLL)
    wrld_minimap:SetPos( 260, 3 ) 
    wrld_minimap:SetSize( 250, 500 )
	wrld_minimap.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Mini Map:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
	local wrld_effects = vgui.Create( "DPanel", WORLD_SCROLL)
    wrld_effects:SetPos( 517, 3 ) 
    wrld_effects:SetSize( 250, 500 )
	wrld_effects.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Effects:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end	
	local wrld_cc = vgui.Create( "DPanel", WORLD_SCROLL)
    wrld_cc:SetPos( 3, 103 ) 
    wrld_cc:SetSize( 250, 370 )
	wrld_cc.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Color Correction:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end    
	--======================= Misc ==========================--
	local MISC_SCROLL = vgui.Create( "DScrollPanel", sheet )
    MISC_SCROLL:Dock( FILL )
    local MISC_SCROLLS = MISC_SCROLL:GetVBar()
	function MISC_SCROLLS:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(15, 15, 15, 200))
	end
	function MISC_SCROLLS.btnUp:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function MISC_SCROLLS.btnDown:Paint(w, h)
	draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function MISC_SCROLLS.btnGrip:Paint(w, h)
    draw.RoundedBox( 3, 0, 0, w, h, Color(0,0,0,255) )
	draw.RoundedBox( 3, 1, 1, w-2, h-2, Color(45,45,50,255) )
	end
	local misc_movement = vgui.Create( "DPanel", MISC_SCROLL)
    misc_movement:SetPos( 3, 3 ) 
    misc_movement:SetSize( 250, 350 )
	misc_movement.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Movement:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end  
	local misc_mmgames = vgui.Create( "DPanel", MISC_SCROLL)
    misc_mmgames:SetPos( 260, 3 ) 
    misc_mmgames:SetSize( 250, 200 )
	misc_mmgames.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Gamemodes:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
	local misc_player = vgui.Create( "DPanel", MISC_SCROLL)
    misc_player:SetPos( 517, 3 ) 
    misc_player:SetSize( 250, 250 )
	misc_player.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Player:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
	local misc_logs = vgui.Create( "DPanel", MISC_SCROLL)
    misc_logs:SetPos( 3, 357 ) 
    misc_logs:SetSize( 250, 250 )
	misc_logs.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Event logs:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end 
	local misc_panels = vgui.Create( "DPanel", MISC_SCROLL)
    misc_panels:SetPos( 260, 207 ) 
    misc_panels:SetSize( 250, 350 )
	misc_panels.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Panels:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end 		
	local misc_packets = vgui.Create( "DPanel", MISC_SCROLL)
    misc_packets:SetPos( 517, 257 ) 
    misc_packets:SetSize( 250, 200 )
	misc_packets.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "bSendPacket:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end
	--====================== Config =========================--
	local CFG_SCROLL = vgui.Create( "DScrollPanel", sheet )
    CFG_SCROLL:Dock( FILL )
    local CFG_SCROLLS = CFG_SCROLL:GetVBar()
	function CFG_SCROLLS:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(15, 15, 15, 200))
	end
	function CFG_SCROLLS.btnUp:Paint(w, h)
    draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function CFG_SCROLLS.btnDown:Paint(w, h)
	draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
	end
	function CFG_SCROLLS.btnGrip:Paint(w, h)
    draw.RoundedBox( 3, 0, 0, w, h, Color(0,0,0,255) )
	draw.RoundedBox( 3, 1, 1, w-2, h-2, Color(45,45,50,255) )
	end
	local cfg_tab = vgui.Create( "DPanel", CFG_SCROLL)
    cfg_tab:SetPos( 3, 3 ) 
    cfg_tab:SetSize( 250, 500 )
	cfg_tab.Paint = function(self,w,h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.SimpleText( "Config:", "TargetID", 0, 0, color_white )
	draw.RoundedBox( 3, 0, 16, w, h-16, Color(55,55,60,255) )
	draw.RoundedBox( 3, 0, 16, w, 5, Color(hsv.r,hsv.g,hsv.b) )
	Wrad(15,16,195,5)
	end  
	
    sheet:AddSheet( "Combat", AIM_SCROLL, "icon16/gun.png", false, false, nil)
	sheet:AddSheet( "Anti-Aim", AA_SCROLL, "icon16/male.png", false, false, nil)
	sheet:AddSheet( "Player", VISUAL_SCROLL, "icon16/group.png", false, false, nil)
	sheet:AddSheet( "ESP Settings", ESPS_SCROLL, "icon16/style_edit.png", false, false, nil)
	sheet:AddSheet( "Self", SELF_SCROLL, "icon16/eye.png", false, false, nil)
	sheet:AddSheet( "World", WORLD_SCROLL, "icon16/world.png", false, false, nil)
	sheet:AddSheet( "Misc", MISC_SCROLL, "icon16/page_white_stack.png", false, false, nil)
	sheet:AddSheet( "Config", CFG_SCROLL, "icon16/disk.png", false, false, nil)
	--=========== sheet ===========--
    sheet:SwitchToName(activeTab)
	for k, v in pairs(sheet:GetItems()) do
		function v.Tab:OnDepressed()
			activeTab = v.Name
		end
	end
    --=======FEATURES==============--
   	CreateCheckBox("Enable Aimbot", 5, 25, "aim_master_toggle", false, co_main)
	CreateCheckBox("Aimbot On Key", 5, 45, "aim_onkey", false, co_main)
	CreateKeybind(140, 45, "aim_onkey_key", co_main)
	CreateDropdown("Silent Aim", 5, 65, {"None", "Clientside", "Serverside"}, "aim_silent", co_main)
	CreateDropdown("Target Selection", 5, 105, {"Crosshair", "Closest Distance", "Lowest Health"}, "aim_target", co_main)
	CreateDropdown("Hitbox Selection", 5, 145, {"Hitscan", "Head", "Body"}, "aim_hitbox", co_main)	
    CreateSlider("Aimbot FOV", 2, 185, "aim_fov", 0, 180, 0, co_main)	
	CreateCheckBox("Aimbot Smoothing", 5, 225, "aim_smoothing", false, co_main)
	CreateSlider("Smoothing Scale", 2, 245, "aim_smoothing_value", 0, 2, 2, co_main) 
	
	CreateCheckBox("Remove Visual Recoil", 5, 25, "aim_norecoil", false, co_accuracy)
	CreateCheckBox("Remove Recoil", 5, 45, "aim_norecoil_true", false, co_accuracy)
	CreateCheckBoxExperemental("Predict Spread", 5, 65, "aim_nospread", false, co_accuracy)	
	CreateCheckBox("Auto Slow", 5, 85, "autoslow", false, co_accuracy)
	CreateCheckBox("Auto Crouch", 5, 105, "autocrouch", false, co_accuracy)
	CreateCheckBox("Bullet Time", 5, 125, "aim_bullettime", false, co_accuracy)	
	CreateCheckBox("Velocity Prediction", 5, 145, "aim_velocitypred", false, co_accuracy)		
    CreateCheckBox("Interp Disabler", 5, 165, "aim_interp", false, co_accuracy)
	
	CreateCheckBoxExperemental("Automatic Fire", 5, 25, "aim_autofire", false, co_helpers)
	CreateCheckBoxExperemental("Automatic Reload", 5, 45, "aim_autoreload", false, co_helpers)
	CreateCheckBox("Auto Click", 5, 65, "misc_autoclick", false, co_helpers)
	CreateCheckBox("M9K Sprint disabler", 5, 85, "misc_m9kstopper", false, co_helpers)
	CreateCheckBox("Force Backstab", 5, 105, "aim_facestab", false, co_helpers)
	CreateCheckBox("Knife BOT", 5, 125, "aim_knifebot", false, co_helpers)
	CreateCheckBox("Act Disabler", 5, 145, "aim_act_disabler", false, co_helpers)	
	CreateCheckBox("Peek Teleport", 5, 165, "aim_autopeek3", false, co_helpers)	
	CreateKeybind(140, 165, "aim_autopeek", co_helpers)
	CreateSlider("Teleport Timer", 2, 185, "aim_autopeek_timer", 0, 5, 2, co_helpers)
	CreateCheckBox("Rope Spam", 5, 225, "misc_ropes", false, co_helpers)	
	--CreateKeybind(18, 165, "aim_autopeek2", co_helpers)
	
	CreateCheckBox("Ignore Friends", 5, 25, "aim_ignorefriends", false, co_filtering)
	CreateCheckBox("Ignore BOTS", 5, 45, "aim_ignorebots", false, co_filtering)
	CreateCheckBox("Ignore Staff", 5, 65, "aim_ignoreadmins", false, co_filtering)
	CreateCheckBox("Ignore Noclipping", 5, 85, "aim_ignorenoclip", false, co_filtering)
	CreateCheckBox("Ignore Same Team", 5, 105, "aim_ignoreteam", false, co_filtering)
	CreateCheckBox("Ignore Non-Visible", 5, 125, "aim_ignoreinvis", false, co_filtering)
	CreateCheckBox("Jump Check", 5, 145, "aim_jump_check", false, co_filtering)
	CreateCheckBox("Ignore No-Draw", 5, 165, "aim_nodraw", false, co_filtering)
	CreateCheckBox("Ignore God", 5, 185, "aim_godded", false, co_filtering)
	
	CreateCheckBox("Enable Triggerbot", 5, 30, "trigger_master_toggle", false, co_trigger)
	CreateCheckBox("Triggerbot On Key", 5, 50, "trigger_onkey", false, co_trigger)
	CreateKeybind(150, 50, "trigger_onkey_key", co_trigger)	
	
	CreateCheckBox("Enable backtracking", 5, 25, "backtrack_enable", false, co_bt)
	CreateSlider("Backtrack Amount", 2, 45, "backtrack_amount", 0, 200, 0, co_bt)	
	
	--Anti-Aim
	CreateCheckBox("Enable Anti-Aim", 10, 30, "aa_enable", false, co_aa)
	CreateDropdown("Pitch", 10, 50, {"None", "Zero", "Down", "Up", "Fake Down", "Fake Up", "Random", "Custom"}, "aa_pitch", co_aa)
	CreateDropdown("Yaw", 10, 90, {"None", "Backward", "Forward", "Left", "Right", "Jitter", "Spin", "Custom"}, "aa_yaw", co_aa)
	CreateSlider("Yaw Add", 2, 170, "aa_yaw_add", 0, 180, 0, co_aa)
	CreateSlider("Custom Yaw", 2, 210, "aa_cyaw", 0, 180, 0, co_aa)
	CreateSlider("Custom Pitch", 2, 250, "aa_cpitch", 0, 180, 0, co_aa)
	CreateSlider("Jitter Range", 2, 290, "aa_jitter_range", 0, 180, 0, co_aa)
	--Fake-Angles
	CreateCheckBox("Enable Fake Angles", 10, 30, "fa_enable", false, co_fa)
	CreateDropdown("Fake Pitch", 10, 50, {"None", "Zero", "Down", "Up", "Fake Down", "Fake Up", "Random", "Custom"}, "fa_pitch", co_fa)
	CreateDropdown("Fake Yaw", 10, 90, {"None", "Backward", "Forward", "Left", "Right", "Jitter", "Spin", "Custom"}, "fa_yaw", co_fa)
	CreateSlider("Yaw Add", 2, 170, "fa_yaw_add", 0, 180, 0, co_fa)
	CreateSlider("Custom Yaw", 2, 210, "fa_cyaw", 0, 180, 0, co_fa)
	CreateSlider("Custom Pitch", 2, 250, "fa_cpitch", 0, 180, 0, co_fa)
	CreateSlider("Jitter Range", 2, 290, "fa_jitter_range", 0, 180, 0, co_fa)
	CreateDropdown("LBY", 10, 130, {"None", "LBY Normal", "LBY Breaker"}, "aa_lby", co_fa)
	--AA Chams
	CreateCheckBox("Fake Angle Chams", 10, 30, "aa_chams", false, co_otheraa)
	CreateCheckBox("Real Angle Chams", 10, 50, "fa_chams", false, co_otheraa)
	CreateCheckBox("Fake Duck", 10, 70, "antihit_fd", false, co_otheraa)
	CreateKeybind(140, 70, "antihit_fd_key", co_otheraa)
	CreateCheckBox("Dance Spam", 10, 90, "antihit_act", false, co_otheraa)
	CreateDropdown("Act", 10, 110, {"Dance", "Robot", "Sex", "Bow", "Wave", "Zombie", "Disagree", "Forward", "Pers", "Salute"}, "antihit_act_type", co_otheraa)	
	CreateCheckBox("Crimwalk", 10, 150, "crimwalk", false, co_otheraa)
	CreateKeybind(140, 150, "crimwalkkey", co_otheraa)
	
	CreateCheckBox("Bounding Box", 5, 25, "esp_player_box", true, pl_main, 165)
	CreateDropdown("Box Style", 5, 45, {"Line | Box", "Line | Corners", "3D Box", "Neon Red", "Neon Blue", "Box | Default", "Box | Outlined"}, "esp_player_box_mode", pl_main)
	CreateCheckBox("Health Bar", 5, 85, "esp_player_hp", true, pl_main, 165)
	CreateDropdown("Health Bar Pos", 5, 105, {"Left", "Right", "Up", "Down"}, "esp_player_hp_type", pl_main)	
	CreateCheckBox("Armor Bar", 5, 145, "esp_player_ap", true, pl_main, 165)
	CreateDropdown("Armor Bar Pos", 5, 165, {"Left", "Right", "Up", "Down"}, "esp_player_ap_type", pl_main)	
	CreateCheckBox("Name", 5, 205, "esp_player_name", true, pl_main, 165)
	CreateCheckBox("Health", 5, 225, "esp_player_health", true, pl_main, 165)
	CreateCheckBox("Armor", 5, 245, "esp_player_armor", true, pl_main, 165)
	CreateCheckBox("Weapon Class", 5, 265, "esp_player_weapon", true, pl_main, 165)
	CreateCheckBox("Weapon Name", 5, 285, "esp_player_weapon_fancy", false, pl_main)
	CreateCheckBox("Group(Rank)", 5, 305, "esp_player_rank", true, pl_main, 165)
	CreateCheckBox("Team", 5, 325, "esp_player_team", false, pl_main)
	CreateCheckBox("Distance", 5, 345, "esp_player_distance", true, pl_main, 165)
	CreateCheckBox("DarkRP Money", 5, 365, "esp_player_money", true, pl_main, 165)
	CreateCheckBox("Dormant Indicator", 5, 385, "esp_player_dormant_ind", true, pl_main, 165)
	CreateCheckBox("Snaplines", 5, 405, "esp_player_snaplines", true, pl_main, 165)
	CreateDropdown("Snapline Style", 5, 425, {"From Player", "Crosshair", "Aim Spot"}, "esp_player_snaplines_pos", pl_main)
	
	CreateCheckBox("Player Skeleton", 5, 25, "esp_player_skeleton", true, pl_render, 165)
	CreateCheckBox("Player Sights", 5, 45, "esp_player_sights", true, pl_render, 165)
	CreateCheckBox("Player Hitbox", 5, 65, "esp_player_hitbox", true, pl_render, 165)
	CreateCheckBox("Bullet Beam", 5, 85, "esp_player_bulletbeam", true, pl_render, 165)
	
	CreateCheckBox("Glow ESP", 5, 25, "esp_player_glow", true, pl_effect, 165)
	CreateDropdown("Glow Style", 5, 45, {"Default", "Cover", "Outline", "Visible Only"}, "esp_player_glow_type", pl_effect)
	CreateCheckBox("Hitsound", 5, 85, "esp_other_hitsound", false, pl_effect)
	CreateCheckBox("HitNumbers", 5, 105, "esp_other_hitnumbers", false, pl_effect)
    CreateCheckBox("Attachment Glow", 5, 125, "esp_attachments_glow", true, pl_effect, 165)
	CreateCheckBox("HitMarker", 5, 145, "esp_player_hitmarker", false, pl_effect)
	CreateDropdown("Hitsound", 5, 165, {"Classic", "Bell", "Bubble", "Rust", "Good One", "Nice Shot", "Neverlose", "Metallic", "Stapler", "Skeet", "Stuck"}, "esp_hitsound_sound", pl_effect)	

	CreateCheckBox("Visible Chams", 5, 25, "esp_player_chams", true, pl_chams, 165)
	CreateCheckBox("Player Chams Overlay", 5, 45, "esp_player_chams_overlay", true, pl_chams, 165)
	CreateCheckBox("Player Chams XYZ", 5, 65, "esp_player_chams_xyz", true, pl_chams, 165)	
	CreateCheckBox("Draw Model", 5, 85, "esp_player_drawmodel", false, pl_chams)
	CreateCheckBox("Draw Attachment Model", 5, 105, "esp_player_drawmodelatt", false, pl_chams)
	CreateButton("Chams Material", "Opens the cham material selector.", CreateMaterialList, 5, 125, pl_chams)	
	
	CreateCheckBox("Ignore Teammates", 5, 25, "esp_player_teamfilter", false, pl_performance)
	CreateCheckBox("Ignore Bots", 5, 45, "esp_player_botfilter", false, pl_performance)
	CreateSlider("ESP Max Render Distance", 5, 65, "esp_player_render_distance", 500, 10000, 0, pl_performance)
	CreateCheckBox("Hide Dormant Players", 5, 105, "esp_player_dormant", false, pl_performance)
	CreateCheckBox("Highlight Friends Box", 5, 125, "esp_player_highlight_box", true, pl_performance, 165)
	CreateCheckBox("Highlight Friends Name", 5, 145, "esp_player_highlight_name", true, pl_performance, 165)
	CreateCheckBox("ESP Compensation", 5, 165, "esp_comp", false, pl_performance)
	
    CreateSlider("Name X", 10, 30, "name_x", -250, 250, 0, esps_poss)
	CreateSlider("Name Y", 10, 70, "name_y", -250, 250, 0, esps_poss)

	CreateSlider("Health X", 10, 110, "health_x", -250, 250, 0, esps_poss)
	CreateSlider("Health Y", 10, 150, "health_y", -250, 250, 0, esps_poss)

	CreateSlider("Armor X", 10, 190, "armor_x", -250, 250, 0, esps_poss)
	CreateSlider("Armor Y", 10, 230, "armor_y", -250, 250, 0, esps_poss)

	CreateSlider("Weapon X", 10, 270, "wep_x", -250, 250, 0, esps_poss)
	CreateSlider("Weapon Y", 10, 310, "wep_y", -250, 250, 0, esps_poss)

	CreateSlider("Team X", 10, 350, "tm_x", -250, 250, 0, esps_poss)
	CreateSlider("Team Y", 10, 390, "tm_y", -250, 250, 0, esps_poss)

	CreateSlider("Rank X", 10, 430, "rank_x", -250, 250, 0, esps_poss)
	CreateSlider("Rank Y", 10, 470, "rank_y", -250, 250, 0, esps_poss)

	CreateSlider("Distance X", 10, 510, "ds_x", -250, 250, 0, esps_poss)
	CreateSlider("Distance Y", 10, 550, "ds_y", -250, 250, 0, esps_poss)

	CreateSlider("Money X", 10, 590, "mn_x", -250, 250, 0, esps_poss)
	CreateSlider("Money Y", 10, 630, "mn_y", -250, 250, 0, esps_poss)

	CreateSlider("Dormant X", 10, 670, "di_x", -250, 250, 0, esps_poss)
	CreateSlider("Dormant Y", 10, 710, "di_y", -250, 250, 0, esps_poss)	
	
    CreateDropdown("Name Position", 5, 30, {"Left", "Right", "Up", "Down"}, "name_pos", esps_aligns)
	CreateDropdown("Health Position", 5, 70, {"Left", "Right", "Up", "Down"}, "health_pos", esps_aligns)	
	CreateDropdown("Armor Position", 5, 110, {"Left", "Right", "Up", "Down"}, "armor_pos", esps_aligns)	
	CreateDropdown("Weapon Position", 5, 150, {"Left", "Right", "Up", "Down"}, "wep_pos", esps_aligns)
	CreateDropdown("Team Position", 5, 190, {"Left", "Right", "Up", "Down"}, "tm_pos", esps_aligns)
	CreateDropdown("Rank Position", 5, 230, {"Left", "Right", "Up", "Down"}, "rank_pos", esps_aligns)
	CreateDropdown("Distance Position", 5, 270, {"Left", "Right", "Up", "Down"}, "ds_pos", esps_aligns)
	CreateDropdown("Money Position", 5, 310, {"Left", "Right", "Up", "Down"}, "mn_pos", esps_aligns)
	CreateDropdown("Dormant Position", 5, 350, {"Left", "Right", "Up", "Down"}, "di_pos", esps_aligns)
	
	CreateDropdown("Main Font", 5, 30, CheatFonts, "name_font", esps_fonts)
	CreateSlider("Main Font Size", 5, 70, "name_font_size", 10, 20, 0, esps_fonts)
	CreateDropdown("Flag Font", 5, 110, CheatFonts, "flag_font", esps_fonts)
	CreateSlider("Flag Font Size", 5, 150, "flags_font_size", 10, 20, 0, esps_fonts)	
	
	CreateCheckBox("Thirdperson", 10, 30, "esp_other_thirdperson", false, self_view)
	CreateKeybind(140, 30, "thirdperson_key", self_view)
	CreateSlider("Thirdperson Distance", 10, 50, "esp_other_thirdperson_distance", 5, 50, 0, self_view)
	CreateCheckBox("Freecam", 10, 90, "esp_other_freecam", false, self_view)
	CreateKeybind(140, 90, "freecam_key", self_view)
	CreateSlider("Freecam Speed", 10, 110, "esp_other_freecam_speed", 1, 10, 0, self_view)
	CreateCheckBox("Override FOV", 10, 150, "misc_fov", false, self_view)
	CreateSlider("FOV Value", 10, 170, "misc_fov_value", 50, 160, 0, self_view)
	CreateCheckBox("Viewmodel Changer", 10, 210, "misc_viewmodel", false, self_view)
	CreateCheckBox("Remove Bob", 10, 230, "misc_bob", false, self_view)
	CreateCheckBox("Remove Sway", 10, 250, "misc_sway", false, self_view)
	CreateSlider("Viewmodel X", 10, 290, "misc_vm_x", -50, 50, 0, self_view)
	CreateSlider("Viewmodel Y", 10, 330, "misc_vm_y", -30, 30, 0, self_view)
	CreateSlider("Viewmodel Z", 10, 370, "misc_vm_z", -20, 20, 0, self_view)
	CreateSlider("Viewmodel Pitch", 10, 410, "misc_vm_p", -90, 90, 0, self_view)
	CreateSlider("Viewmodel Yaw", 10, 450, "misc_vm_ya", -90, 90, 0, self_view)
	CreateSlider("Viewmodel Roll", 10, 490, "misc_vm_r", -90, 90, 0, self_view)
	CreateCheckBox("Thirdperson Wall Detect", 10, 530, "esp_other_thirdperson_walldetect", false, self_view)
    CreateCheckBox("Swing Animation", 10, 550, "esp_other_swinganim", false, self_view)
	CreateCheckBox("Hand Chams", 10, 570, "esp_self_hand_chams", true, self_view, 165)
	CreateCheckBox("Gun Chams", 10, 590, "esp_self_gun_chams", true, self_view, 165)	
	
	CreateCheckBox("Draw Aimbot FOV", 10, 30, "esp_other_drawfov", true, self_other, 165)
	CreateCheckBox("Bullet Tracer", 10, 50, "esp_self_bullet_tracers", true, self_other, 165)
	CreateCheckBox("Laser Sights", 10, 70, "esp_self_laser_sight", true, self_other, 165)
	CreateCheckBox("DLight", 10, 90, "esp_self_dlight", true, self_other, 165)
	CreateCheckBox("DLight HSV", 10, 110, "esp_self_dlight_hsv", false, self_other)
	CreateCheckBox("Predict Fall", 10, 130, "esp_self_predict_me", false, self_other)
	CreateCheckBox("AimFov Fill", 10, 150, "esp_other_drawfov_fill", false, self_other, 165)
	CreateCheckBox("Velocity Crosshair", 10, 170, "esp_self_velocity_crosshair", true, self_other, 165)
	CreateCheckBox("Player Hat", 10, 190, "esp_self_hat", false, self_other, 165)	
	CreateDropdown("Hat model", 10, 210, {"Nimbus", "Hat", "Cap", "Bomb"}, "esp_self_hat_type", self_other)
	CreateCheckBox("Agent Changer", 10, 250, "esp_self_customagent", false, self_other, 165)	
	CreateDropdown("Agent", 10, 270, {"SAS", "Pirat", "Anarchist", "Pro"}, "esp_self_customagent_agent", self_other)
	CreateCheckBox("Fake Lag Chams", 10, 310, "esp_self_fakelagchams", true, self_other, 165)		

	CreateCheckBox("Watermark", 10, 30, "hud_watermark", false, self_hud )
	CreateCheckBox("Disable HL2 HUD", 10, 70, "hud_disable_hl2_hud", false, self_hud )
	CreateCheckBox("CrossHair", 10, 110, "hud_crosshair", false, self_hud )
    CreateDropdown("CrossHair Style", 10, 130, {"Classic", "Зига", "Смачная Наиплотнейшая Зигота"}, "hud_crosshair_type", self_hud)
	CreateCheckBox("KeyStrokes", 10, 170, "hud_keystrokes", false, self_hud )
    CreateDropdown("KeyStrokes Style", 10, 190, {"WASD", "WASD-SPACE", "WASD-LMB-RMB", "All"}, "hud_keystrokes_style", self_hud)
	CreateCheckBox("KillAura Circle", 10, 230, "hud_aimbotstatus", false, self_hud )
	CreateCheckBox("KillStreak", 10, 250, "hud_killstreak", false, self_hud )
	CreateCheckBox("Bind list", 10, 270, "hud_arraylist", false, self_hud )
	CreateCheckBox("Top Line", 10, 290, "hud_topline", false, self_hud )
	CreateDropdown("Top Line Style", 10, 310, {"Outlined", "Normal", "Glow"}, "hud_topline_style", self_hud)
	CreateCheckBox("Packets", 10, 350, "hud_bsp", false, self_hud )

	CreateCheckBox("Storage ESP", 10, 30, "esp_ent_storage_esp", true, wrld_ents , 165)
	CreateCheckBox("Crosshair Entity", 10, 50, "esp_ent_crosshair", false, wrld_ents , 165)	
	
	CreateCheckBox("Enable Minimap", 10, 30, "map_enable", true, wrld_minimap, 165)
	CreateSlider("Radar FOV", 10, 50, "map_zoom", 5, 100, 0, wrld_minimap)
	CreateSlider("Radar Size", 10, 90, "map_size", 0, 1000, 0, wrld_minimap)
	CreateSlider("Radar X", 10, 130, "map_x", 0, ScrW(), 0, wrld_minimap)
	CreateSlider("Radar Y", 10, 170, "map_y", 0, ScrH(), 0, wrld_minimap)
	CreateCheckBox("Player Names", 10, 210, "map_names", true, wrld_minimap, 165)
	CreateCheckBox("Player Team", 10, 230, "map_teams", false, wrld_minimap, 165) 	
	
	CreateCheckBox("Fog Modulation", 10, 30, "esp_other_fog", true, wrld_effects, 165)
	CreateSlider("Fog Start", 10, 50, "esp_other_fog_start", 0, 50000, 0, wrld_effects)
	CreateSlider("Fog End", 10, 90, "esp_other_fog_end", 0, 50000, 0, wrld_effects)
	CreateSlider("Fog Density", 10, 130, "esp_other_fog_density", 0, 1, 1, wrld_effects)
	CreateCheckBox("NoSky (2D)", 10, 170, "esp_other_nosky", false, wrld_effects)
	CreateCheckBox("SkyBox Draw Rect", 10, 190, "esp_other_skyboxrect", true, wrld_effects, 165)
	CreateCheckBox("Disable 3d Sky", 10, 210, "esp_other_3dskydisabler", false, wrld_effects)
	CreateSlider("Bloom Scale", 10, 230, "esp_other_bloom", 0, 1, 2, wrld_effects)	
	CreateCheckBox("HL1 Flashlight", 10, 270, "esp_other_hlflashlight", false, wrld_effects)	
	CreateCheckBox("World Color", 10, 290, "esp_other_worldmod", true, wrld_effects, 165)
	CreateCheckBox("Prop Color", 10, 310, "esp_other_propmod", true, wrld_effects, 165)
	CreateCheckBox("Fullbright", 10, 330, "esp_other_fullbright", false, wrld_effects, 165)		
	
	CreateCheckBox("Color Correction", 10, 30, "esp_other_cc", false, wrld_cc)
	CreateSlider("Contrast Scale", 10, 50, "esp_other_cc_scale", 0, 1, 1, wrld_cc)
	CreateSlider("Add Red", 10, 90, "esp_other_cc_addr", 0, 255, 0, wrld_cc)
	CreateSlider("Add Green", 10, 130, "esp_other_cc_addg", 0, 255, 0, wrld_cc)
	CreateSlider("Add Blue", 10, 170, "esp_other_cc_addb", 0, 255, 0, wrld_cc)
	CreateSlider("Color", 10, 210, "esp_other_cc_color", 0, 1, 0, wrld_cc)
	CreateSlider("MulR", 10, 250, "esp_other_cc_mulr", 0, 255, 0, wrld_cc)
	CreateSlider("MulG", 10, 290, "esp_other_cc_mulg", 0, 255, 0, wrld_cc)
	CreateSlider("MulB", 10, 330, "esp_other_cc_mulrb", 0, 255, 0, wrld_cc)	
	
	CreateCheckBox("Auto Bunnyhop", 10, 30, "misc_autobunnyhop", false, misc_movement)
	CreateCheckBox("Auto Strafe", 10, 50, "misc_autostrafe", false, misc_movement)
	CreateDropdown("Strafe Type", 10, 70, {"Legit", "Rage", "Free Move", "Directional"}, "misc_autostrafe_type", misc_movement)
	CreateCheckBox("Infinity Duck", 10, 110, "misc_infinitduck", false, misc_movement)
	CreateCheckBox("Air Duck", 10, 130, "misc_airduck", false, misc_movement)
	CreateDropdown("AirDuck Style", 10, 150, {"Input", "Command", "No Stop"}, "misc_airduckmetod", misc_movement)
	CreateCheckBox("Micromovement", 10, 190, "slowwalk", false, misc_movement)
	CreateKeybind(140, 190, "misc_mm_keybind", misc_movement)
	CreateSlider("Micromovement speed", 10, 210, "slowwalk_speed", 10, 60, 0, misc_movement)
	CreateCheckBox("180° turn", 10, 250, "misc_180turn", false, misc_movement)
	CreateKeybind(140, 250, "180turn_keybind", misc_movement)
	CreateCheckBox("Circle Strafe", 10, 270, "misc_circlestrafer", false, misc_movement)
	CreateKeybind(140, 270, "circlestrafer_key", misc_movement)	
	CreateCheckBox("Fake Crouch", 10, 290, "misc_fakecrouch", false, misc_movement)
	
	CreateCheckBox("TTT/Murder info", 10, 30, "misc_ttt", false, misc_mmgames)
    CreateCheckBox("Arest Leave", 10, 50, "misc_antiarest", false, misc_mmgames)
	CreateDropdown("Leave Method", 10, 70, {"Suicide", "Retry", "/Hobo (Job)"}, "misc_antiarest_metod", misc_mmgames)	
    CreateCheckBox("RP Name changer", 10, 110, "misc_rpnamer", false, misc_mmgames)	
    CreateSlider("RPName Delay", 10, 130, "misc_rpnamer_time", 1, 300, 0, misc_mmgames)		
	
	CreateCheckBox("Name Stealer", 10, 30, "misc_fnamechanger", false, misc_player)
	CreateCheckBox("Rainbow Physgun", 10, 50, "misc_rainbow", false, misc_player)
	CreateCheckBox("Rainbow Player", 10, 70, "misc_rainbowply", false, misc_player)
	CreateSlider("Rainbow Speed", 10, 90, "misc_rainbow_speed", 1, 100, 0, misc_player)
	CreateCheckBox("Chat Spammer", 10, 130, "misc_chat_spam", false, misc_player)	
	CreateCheckBox("Kill Say", 10, 150, "misc_gaysay", false, misc_player)	
	CreateDropdown("KillSay Type", 10, 170, {"Русский", "D3D9C style", "Русский 2", "Arabian", "Omerican"}, "misc_gaysays", misc_player)		
	CreateCheckBox("Flashlight Spammmer", 10, 210, "misc_flashlight", false, misc_player)	
	CreateCheckBox("Use Spammer", 10, 230, "misc_use", false, misc_player)	
	CreateCheckBox("Za Putina", 120, 230, "misc_doundo", false, misc_player)	
	
	CreateCheckBox("Event log", 10, 30, "misc_eventlog", false, misc_logs)
	CreateCheckBox("Log Connection", 10, 50, "misc_eventlog_connects", false, misc_logs)	
	CreateCheckBox("Log Disconnects", 10, 70, "misc_eventlog_dconects", false, misc_logs)
	CreateCheckBox("Log Hurt", 10, 90, "misc_eventlog_hurt", false, misc_logs)	
	
    CreateCheckBox("Info List", 10, 30, "misc_infolist", false, misc_panels)
	CreateSlider("Info List X", 10, 50, "misc_infolist_x", 0, ScrW(), 0, misc_panels)
	CreateSlider("Info List Y", 10, 90, "misc_infolist_y", 0, ScrH(), 0, misc_panels)
	CreateCheckBox("Spectator List", 10, 130, "misc_speclist", false, misc_panels)
	CreateSlider("Spectator List X", 10, 150, "misc_speclist_x", 0, ScrW(), 0, misc_panels)
	CreateSlider("Spectator List Y", 10, 190, "misc_speclist_y", 0, ScrH(), 0, misc_panels)
	CreateCheckBox("Admin List", 10, 230, "misc_adminlist", false, misc_panels)
	CreateSlider("Admin List X", 10, 250, "misc_adminlist_x", 0, ScrW(), 0, misc_panels)
	CreateSlider("Admin List Y", 10, 290, "misc_adminlist_y", 0, ScrH(), 0, misc_panels)	

	CreateCheckBox("Fake Lags", 10, 30, "bsp_fake_lags", false, misc_packets)
	CreateSlider("FakeLag Limit", 10, 50, "bsp_fake_lags_value", 1, 128, 0, misc_packets)
	CreateDropdown("FakeLag Conditions", 10, 90, {"Always On", "In Move", "In Stand", "On Ground", "In Air", "On Attack", "Off Attack"}, "bsp_fake_lags_conditions", misc_packets)
	CreateCheckBox("Evade bullets", 10, 130, "bsp_evadebullets", false, misc_packets)
	CreateCheckBox("Airstack", 10, 150, "misc_pairstack", false, misc_packets)
	CreateKeybind(140, 150, "airstack", misc_packets)
	
    CreateLabel("Menu Keybind", 10, 30, cfg_tab)
	CreateKeybind(140, 30, "menu_key", cfg_tab)
	local usercfgs = {}
	cfgDropdown = vgui.Create("DComboBox", cfg_tab)
	cfgDropdown:SetSize(200, 20)
	cfgDropdown:SetPos(10, 50)
	if loadedCfg[0] != nil then
		cfgDropdown:ChooseOption(loadedCfg[0], loadedCfg[1])
	end
	for k, v in ipairs(files) do
		cfgDropdown:AddChoice(v)
	end
	cfgDropdown:SetSortItems(false)

	CreateButton("Save Config", "Save Config.", SaveConfig, 10, 75, cfg_tab)
	CreateButton("Load Config", "Load Config.", LoadConfig, 10, 100, cfg_tab)
	CreateButton("Create Config", "Create Config.", CreateConfig, 10, 125, cfg_tab)
	CreateButton("Delete Config", "Delete Config.", DeleteConfig, 10, 150, cfg_tab)
	CreateTextInput("Config Name", "config_name", 10, 175, 16, cfg_tab)

	CreateLabel("Unload Key", 10, 195, cfg_tab)
	CreateKeybind(10, 210, "panic_key", cfg_tab)
    CreateDropdown("Server", 10, 230, {"Comunity", "D3S HvH"}, "gameserver", cfg_tab)
	
    	
	--Other shit
	CreateButton("Entity List", "Open Entity List.", CreateEntityList, 10, 70, wrld_ents)	
	CreateButton("Player List", "Open the player list menu.", CreatePlayerList, 5, 190, pl_performance)
	--CreateButton("Filter Teams", "The filter will be applied when the filter menu is closed. This filter applies to ESP and Aimbot.", CreateFilterPanel, 330, 3, topframe)
    CreateButton("ESP Mode " .. GetRenderMode(), "If your ESP is not working on a server try changing this to unsafe. (THIS SHOULD ALWAYS BE PROTECTED WHEN POSSIBLE TO MAXIMIZE SCREENGRAB PROTECTION)", SwapRender, 5, 215, pl_performance)	
	CreateButton("Unload", "Fully unloads the cheat.", Unload, 10, 275, cfg_tab)  
	
	if teamFilterWasOpen then
		CreateFilterPanel()
		teamFilterWasOpen = false
	end
	if pListWasOpen then
		CreatePlayerList()
		pListWasOpen = false
	end
	if entityFrameWasOpen then
		CreateEntityList()
		entityFrameWasOpen = false
	end
	if chamFrameWasOpen then
		CreateMaterialList()
		chamFrameWasOpen = false
	end
end

-- ===================== GUI Logic

AddHook("Think", RandomString(), function()
    if config.keybinds["menu_key"] != 0 && input.IsKeyDown(config.keybinds["menu_key"]) && !insertdown && !config["menu_key"] then
		if teamFilter then
			teamFilterX, teamFilterY = teamFilter:GetPos()
			config["esp_player_filter"] = teamFilterEnable:GetChecked()
			for k, v in pairs(teamList:GetSelected()) do
				if !table.HasValue(teamFilterSelected, v:GetValue(1)) then
					table.insert(teamFilterSelected, v:GetValue(1))
				end
			end
			teamFilter:Remove()
			teamFilterWasOpen = true
			teamFilter = false
		end
		if entityFrame then
			entityFrameX, entityFrameY = entityFrame:GetPos()
			entityFrame:Remove()
			entityFrameWasOpen = true
			entityFrame = false
		end
		if chamFrame then
			chamFrameX, chamFrameY = chamFrame:GetPos()
			chamFrame:Remove()
			chamFrameWasOpen = true
			chamFrame = false
		end
		if colorWindow then
			colorWindow:Remove()
			colorWindow = false
		end
		if pList then
			pList:Remove()
			pListWasOpen = true
			pList = false
		end
		if frame then
			CloseFrame()
		else
			HavocGUI()
			RestoreCursorPosition()
		end
    end
    if config.keybinds["logger_key"] != 0 && input.IsKeyDown(config.keybinds["logger_key"]) && !homedown && !config["logger_key"] then
		if !exploit_menu:IsVisible() then
			gui.EnableScreenClicker(true)
			RestoreCursorPosition()
			exploit_menu:MakePopup()
			exploit_menu:SetVisible(true)
		else
			RememberCursorPosition()
			gui.EnableScreenClicker(false)
			exploit_menu:Hide()
			exploit_menu:SetVisible(false)
		end
	end
	insertdown = input.IsKeyDown(config.keybinds["menu_key"])
	homedown = input.IsKeyDown(config.keybinds["logger_key"])
	panicdown = input.IsKeyDown(config.keybinds["panic_key"])
	if !panicdown && input.IsKeyDown(config.keybinds["panic_key"]) && config.keybinds["panic_key"] != 0 then
		Unload()
	end
end)
do
--===================================
--=================================== Visuals
--===================================
function draw.Circle( x, y, radius, seg )
	local cir = {}
	table.insert( cir, { x = x, y = y, u = 0.5, v = 0.5 } )
	for i = 0, seg do
		local a = math.rad( ( i / seg ) * -360 )
		table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	end
	local a = math.rad( 0 ) -- This is needed for non absolute segment counts
	table.insert( cir, { x = x + math.sin( a ) * radius, y = y + math.cos( a ) * radius, u = math.sin( a ) / 2 + 0.5, v = math.cos( a ) / 2 + 0.5 } )
	surface.DrawPoly( cir )
end
-- ======================= ESP
local bones = {
	{ S = "ValveBiped.Bip01_Head1", E = "ValveBiped.Bip01_Neck1" },
	{ S = "ValveBiped.Bip01_Neck1", E = "ValveBiped.Bip01_Spine4" },
	{ S = "ValveBiped.Bip01_Spine4", E = "ValveBiped.Bip01_Spine2" },
	{ S = "ValveBiped.Bip01_Spine2", E = "ValveBiped.Bip01_Spine1" },
	{ S = "ValveBiped.Bip01_Spine1", E = "ValveBiped.Bip01_Spine" },
	{ S = "ValveBiped.Bip01_Spine", E = "ValveBiped.Bip01_Pelvis" },
	{ S = "ValveBiped.Bip01_Spine2", E = "ValveBiped.Bip01_L_UpperArm" },
	{ S = "ValveBiped.Bip01_L_UpperArm", E = "ValveBiped.Bip01_L_Forearm" },
	{ S = "ValveBiped.Bip01_L_Forearm", E = "ValveBiped.Bip01_L_Hand" },
	{ S = "ValveBiped.Bip01_Spine2", E = "ValveBiped.Bip01_R_UpperArm" },
	{ S = "ValveBiped.Bip01_R_UpperArm", E = "ValveBiped.Bip01_R_Forearm" },
	{ S = "ValveBiped.Bip01_R_Forearm", E = "ValveBiped.Bip01_R_Hand" },
	{ S = "ValveBiped.Bip01_Pelvis", E = "ValveBiped.Bip01_L_Thigh" },
	{ S = "ValveBiped.Bip01_L_Thigh", E = "ValveBiped.Bip01_L_Calf" },
	{ S = "ValveBiped.Bip01_L_Calf", E = "ValveBiped.Bip01_L_Foot" },
	{ S = "ValveBiped.Bip01_L_Foot", E = "ValveBiped.Bip01_L_Toe0" },
	{ S = "ValveBiped.Bip01_Pelvis", E = "ValveBiped.Bip01_R_Thigh" },
	{ S = "ValveBiped.Bip01_R_Thigh", E = "ValveBiped.Bip01_R_Calf" },
	{ S = "ValveBiped.Bip01_R_Calf", E = "ValveBiped.Bip01_R_Foot" },
	{ S = "ValveBiped.Bip01_R_Foot", E = "ValveBiped.Bip01_R_Toe0" },
}
local function DoESP()
	if !ss then
		for k, v in ipairs(player.GetAll()) do
			if ValidateESP(v) then
				local MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8, isVis = GetENTPos( v )
				if isVis then
					if config["esp_player_box"] then
						if config["esp_player_highlight_box"] then
							local ColAlt
							if table.HasValue(config["friends"], v:SteamID()) then
								surfSetDrawColor(string.ToColor(config.colors["esp_player_highlight_box"]))
								ColAlt = string.ToColor(config.colors["esp_player_highlight_box"])
							else
							if config["esp_player_box_hsv"] then
						    local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
						    surfSetDrawColor(hsv.r,hsv.g,hsv.b,255)
						    else
						    surfSetDrawColor(string.ToColor(config.colors["esp_player_box"]))
							ColAlt = string.ToColor(config.colors["esp_player_box"])
							end
							end
						else
						if config["esp_player_box_hsv"] then
						local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
						surfSetDrawColor(hsv.r,hsv.g,hsv.b,255)
						else
						surfSetDrawColor(string.ToColor(config.colors["esp_player_box"]))
						ColAlt = string.ToColor(config.colors["esp_player_box"])
						end
						end
						if config["esp_player_box_mode"] == 2 then
							local XLen, YLen = MaxX - MinX, MaxY - MinY
							surfDrawLine( MaxX, MaxY, MinX + XLen * 0.7, MaxY)
							surfDrawLine( MinX, MaxY, MinX + XLen * 0.3, MaxY)
							surfDrawLine( MaxX, MaxY, MaxX, MinY + YLen * 0.75)
							surfDrawLine( MaxX, MinY, MaxX, MinY + YLen * 0.25)
							surfDrawLine( MinX, MinY, MaxX - XLen * 0.7, MinY )
							surfDrawLine( MaxX, MinY, MaxX - XLen * 0.3, MinY )
							surfDrawLine( MinX, MinY, MinX, MaxY - YLen * 0.75)
							surfDrawLine( MinX, MaxY, MinX, MaxY - YLen * 0.25)
						elseif config["esp_player_box_mode"] == 3 then
							cam.Start3D()
							    if config["esp_player_box_hsv"] then
								local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
								render.DrawWireframeBox( v:GetPos(), Angle(0, 0, 0), v:OBBMins(), v:OBBMaxs(), Color(hsv.r,hsv.g,hsv.b,255), true )
								else
								render.DrawWireframeBox( v:GetPos(), Angle(0, 0, 0), v:OBBMins(), v:OBBMaxs(), ColAlt, true )
								end
							cam.End3D()
						elseif config["esp_player_box_mode"] == 4 then
						local XLen, YLen = MaxX - MinX, MaxY - MinY
						if config["esp_player_box_hsv"] then
						local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
						surfSetDrawColor(hsv.r,hsv.g,hsv.b,255)
						else
						surfSetDrawColor(string.ToColor(config.colors["esp_player_box"]))
                        end						
	                    surface.SetMaterial( Material("gui/ps_hover.png") ) 
	                    surfDrawTexturedRect( MinX, MinY, XLen, YLen )
                        elseif config["esp_player_box_mode"] == 5 then
						local XLen, YLen = MaxX - MinX, MaxY - MinY
						if config["esp_player_box_hsv"] then
						local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
						surfSetDrawColor(hsv.r,hsv.g,hsv.b,255)
						else
						surfSetDrawColor(string.ToColor(config.colors["esp_player_box"]))
                        end	
	                    surface.SetMaterial( Material("gui/sm_hover.png") ) 
	                    surfDrawTexturedRect( MinX, MinY, XLen, YLen ) 	
                        elseif config["esp_player_box_mode"] == 6 then
						local XLen, YLen = MaxX - MinX, MaxY - MinY
						surface.DrawOutlinedRect( MinX, MinY, XLen, YLen, 1 )
						elseif config["esp_player_box_mode"] == 7 then
						local XLen, YLen = MaxX - MinX, MaxY - MinY
						surfSetDrawColor(Color(0,0,0))
						surface.DrawOutlinedRect( MinX, MinY, XLen, YLen, 3 )
						surfSetDrawColor(string.ToColor(config.colors["esp_player_box"]))
						surface.DrawOutlinedRect( MinX+1, MinY+1, XLen-2, YLen-2, 1 )
						else
							surfDrawLine( MaxX, MaxY, MinX, MaxY )
							surfDrawLine( MaxX, MaxY, MaxX, MinY )
							surfDrawLine( MinX, MinY, MaxX, MinY )
							surfDrawLine( MinX, MinY, MinX, MaxY )
						end
					end
					if config["esp_player_name"] then
						surfSetFont("ESP_Font_Main")
						local w, h = surfGetTextSize(v:Nick())
						local col
						if config["esp_player_highlight_name"] then
							if table.HasValue(config["friends"], v:SteamID()) then
								col = string.ToColor(config.colors["esp_player_highlight_name"])
							else
								col = string.ToColor(config.colors["esp_player_name"])
							end
						else
							col = string.ToColor(config.colors["esp_player_name"])
						end
						if config["name_pos"] == 1 then
						drawSimpleOutlinedText(v:Name(), "ESP_Font_Main", MinX-config["name_x"], MinY+config["name_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["name_pos"] == 2 then
						drawSimpleOutlinedText(v:Name(), "ESP_Font_Main", MaxX+config["name_x"], MinY+config["name_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["name_pos"] == 3 then
						drawSimpleOutlinedText(v:Name(), "ESP_Font_Main", MaxX-(MaxX-MinX)/2-w/2+config["name_x"], MinY-config["name_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["name_pos"] == 4 then  
						drawSimpleOutlinedText(v:Name(), "ESP_Font_Main", MaxX-(MaxX-MinX)/2-w/2+config["name_x"], MaxY+config["name_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						end
					end
					if config["esp_player_hp"] then
						local hpMultiplier = v:Health() / v:GetMaxHealth()
						hpMultiplier = math.Clamp(hpMultiplier, 0, 1)
						local barLen = MinY - MaxY
						barlen = barLen * hpMultiplier
						local appliedBar = (MinY - MaxY) - barlen	
						local barLen2 = MinX - MaxX
						barlen2 = barLen2 * hpMultiplier
						local appliedBar2 = (MinX - MaxX) - barlen2
						colnormal = string.ToColor(config.colors["esp_player_hp"])
						if config["esp_player_hp_type"] == 1 then	
						surfSetDrawColor(0, 0, 0, 250)
						surfDrawLine( MinX-2, MinY, MinX-2, MaxY )
						surfDrawLine( MinX-3, MinY, MinX-3, MaxY )
						surfSetDrawColor(colnormal)
						surfDrawLine( MinX-2, MinY-appliedBar, MinX-2, MaxY )
						surfDrawLine( MinX-3, MinY-appliedBar, MinX-3, MaxY )
						elseif config["esp_player_hp_type"] == 2 then
						surfSetDrawColor(0, 0, 0, 250)
						surfDrawLine( MaxX+2, MaxY, MaxX+2, MinY )
						surfDrawLine( MaxX+3, MaxY, MaxX+3, MinY )
                        surfSetDrawColor(colnormal)
						surfDrawLine( MaxX+2, MaxY, MaxX+2, MinY-appliedBar )
						surfDrawLine( MaxX+3, MaxY, MaxX+3, MinY-appliedBar )
						elseif config["esp_player_hp_type"] == 3 then
                        surfSetDrawColor(0, 0, 0, 250)
						surfDrawLine( MinX, MinY-2, MaxX, MinY-2 )
						surfDrawLine( MinX, MinY-3, MaxX, MinY-3 )
                        surfSetDrawColor(colnormal)
						surfDrawLine( MinX-appliedBar2, MinY-2, MaxX, MinY-2 )
						surfDrawLine( MinX-appliedBar2, MinY-3, MaxX, MinY-3 )
						elseif config["esp_player_hp_type"] == 4 then
						surfSetDrawColor(0, 0, 0, 250)
						surfDrawLine( MinX, MaxY+2, MaxX, MaxY+2 )
						surfDrawLine( MinX, MaxY+3, MaxX, MaxY+3 )
                        surfSetDrawColor(colnormal)
						surfDrawLine( MinX-appliedBar2, MaxY+2, MaxX, MaxY+2 )
						surfDrawLine( MinX-appliedBar2, MaxY+3, MaxX, MaxY+3 )
						end
					end
					if config["esp_player_health"] then
						surfSetFont("ESP_Font_Flag")
						local w, h = surfGetTextSize(v:Health())
						local col = string.ToColor(config.colors["esp_player_health"])
						if config["health_pos"] == 1 then
						drawSimpleOutlinedText(v:Health(), "ESP_Font_Flag", MinX-config["health_x"], MinY+config["health_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["health_pos"] == 2 then
						drawSimpleOutlinedText(v:Health(), "ESP_Font_Flag", MaxX+config["health_x"], MinY+config["health_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["health_pos"] == 3 then
						drawSimpleOutlinedText(v:Health(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["health_x"], MinY-config["health_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["health_pos"] == 4 then  
						drawSimpleOutlinedText(v:Health(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["health_x"], MaxY+config["health_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						end
					end
					if config["esp_player_ap"] then
						local apMultiplier = v:Armor() / v:GetMaxArmor()
						apMultiplier = math.Clamp(apMultiplier, 0, 1)
						local barLen = MinY - MaxY
						barlen = barLen * apMultiplier
						local appliedBar = (MinY - MaxY) - barlen			
						local barLen2 = MinX - MaxX
						barlen2 = barLen2 * apMultiplier
						local appliedBar2 = (MinX - MaxX) - barlen2				
						colnormal = string.ToColor(config.colors["esp_player_ap"])
						if v:Armor() > 0 then
						if config["esp_player_ap_type"] == 1 then	
						surfSetDrawColor(0, 0, 0, 225)
						surfDrawLine( MinX-2, MinY, MinX-2, MaxY )
						surfDrawLine( MinX-3, MinY, MinX-3, MaxY )
						surfSetDrawColor(colnormal)
						surfDrawLine( MinX-2, MinY-appliedBar, MinX-2, MaxY )
						surfDrawLine( MinX-3, MinY-appliedBar, MinX-3, MaxY )
						elseif config["esp_player_ap_type"] == 2 then
						surfSetDrawColor(0, 0, 0, 225)
						surfDrawLine( MaxX+2, MaxY, MaxX+2, MinY )
						surfDrawLine( MaxX+3, MaxY, MaxX+3, MinY )
                        surfSetDrawColor(colnormal)
						surfDrawLine( MaxX+2, MaxY, MaxX+2, MinY-appliedBar )
						surfDrawLine( MaxX+3, MaxY, MaxX+3, MinY-appliedBar )
						elseif config["esp_player_ap_type"] == 3 then
                        surfSetDrawColor(0, 0, 0, 225)
						surfDrawLine( MinX, MinY-2, MaxX, MinY-2 )
						surfDrawLine( MinX, MinY-3, MaxX, MinY-3 )
                        surfSetDrawColor(colnormal)
						surfDrawLine( MinX-appliedBar2, MinY-2, MaxX, MinY-2 )
						surfDrawLine( MinX-appliedBar2, MinY-3, MaxX, MinY-3 )
						elseif config["esp_player_ap_type"] == 4 then
						surfSetDrawColor(0, 0, 0, 225)
						surfDrawLine( MinX, MaxY+2, MaxX, MaxY+2 )
						surfDrawLine( MinX, MaxY+3, MaxX, MaxY+3 )
                        surfSetDrawColor(colnormal)
						surfDrawLine( MinX-appliedBar2, MaxY+2, MaxX, MaxY+2 )
						surfDrawLine( MinX-appliedBar2, MaxY+3, MaxX, MaxY+3 )
						end
						end
					end
					if config["esp_player_armor"] then
						surfSetFont("ESP_Font_Flag")
						local w, h = surfGetTextSize(v:Armor())
						local col = string.ToColor(config.colors["esp_player_armor"])
					if v:Armor() > 0 or frame then
						if config["armor_pos"] == 1 then
						drawSimpleOutlinedText(v:Armor(), "ESP_Font_Flag", MinX-config["armor_x"], MinY+config["armor_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["armor_pos"] == 2 then
						drawSimpleOutlinedText(v:Armor(), "ESP_Font_Flag", MaxX+config["armor_x"], MinY+config["armor_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["armor_pos"] == 3 then
						drawSimpleOutlinedText(v:Armor(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["armor_x"], MinY-config["armor_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["armor_pos"] == 4 then  
						drawSimpleOutlinedText(v:Armor(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["armor_x"], MaxY+config["armor_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						end
					end
					end
					if config["esp_player_weapon"] then
						surfSetFont("ESP_Font_Flag")
					if IsValid(v:GetActiveWeapon()) then
						local w, h = surfGetTextSize(config["esp_player_weapon_fancy"] and v:GetActiveWeapon():GetPrintName() or v:GetActiveWeapon():GetClass())
						local col = string.ToColor(config.colors["esp_player_weapon"])
						if config["wep_pos"] == 1 then
						drawSimpleOutlinedText(config["esp_player_weapon_fancy"] and v:GetActiveWeapon():GetPrintName() or v:GetActiveWeapon():GetClass(), "ESP_Font_Flag", MinX-config["wep_x"], MinY+config["wep_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["wep_pos"] == 2 then
						drawSimpleOutlinedText(config["esp_player_weapon_fancy"] and v:GetActiveWeapon():GetPrintName() or v:GetActiveWeapon():GetClass(), "ESP_Font_Flag", MaxX+config["wep_x"], MinY+config["wep_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["wep_pos"] == 3 then
						drawSimpleOutlinedText(config["esp_player_weapon_fancy"] and v:GetActiveWeapon():GetPrintName() or v:GetActiveWeapon():GetClass(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["wep_x"], MinY-config["wep_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["wep_pos"] == 4 then  
						drawSimpleOutlinedText(config["esp_player_weapon_fancy"] and v:GetActiveWeapon():GetPrintName() or v:GetActiveWeapon():GetClass(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["wep_x"], MaxY+config["wep_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						end
					end
					end
					if config["esp_player_rank"] then
						surfSetFont("ESP_Font_Flag")
                        local w, h = surfGetTextSize(v:GetUserGroup())
						local col = string.ToColor(config.colors["esp_player_rank"])
						if config["rank_pos"] == 1 then
						drawSimpleOutlinedText(v:GetUserGroup(), "ESP_Font_Flag", MinX-config["rank_x"], MinY+config["rank_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["rank_pos"] == 2 then
						drawSimpleOutlinedText(v:GetUserGroup(), "ESP_Font_Flag", MaxX+config["rank_x"], MinY+config["rank_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["rank_pos"] == 3 then
						drawSimpleOutlinedText(v:GetUserGroup(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["rank_x"], MinY-config["rank_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["rank_pos"] == 4 then  
						drawSimpleOutlinedText(v:GetUserGroup(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["rank_x"], MaxY+config["rank_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						end
					end
					if config["esp_player_team"] then
						surfSetFont("ESP_Font_Flag")
                        local w, h = surfGetTextSize(team.GetName(v:Team()))
						local col = team.GetColor(v:Team())
						if config["tm_pos"] == 1 then
						drawSimpleOutlinedText(team.GetName(v:Team()), "ESP_Font_Flag", MinX-config["tm_x"], MinY+config["tm_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["tm_pos"] == 2 then
						drawSimpleOutlinedText(team.GetName(v:Team()), "ESP_Font_Flag", MaxX+config["tm_x"], MinY+config["tm_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["tm_pos"] == 3 then
						drawSimpleOutlinedText(team.GetName(v:Team()), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["tm_x"], MinY-config["tm_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["tm_pos"] == 4 then  
						drawSimpleOutlinedText(team.GetName(v:Team()), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["tm_x"], MaxY+config["tm_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						end
					end
					if config["esp_player_distance"] then
						surfSetFont("ESP_Font_Flag")
                        local w, h = surfGetTextSize(v:GetUserGroup())
						local col = string.ToColor(config.colors["esp_player_distance"])
						local distance = math.Round((LocalPlayer():GetPos() - v:GetPos()):Length())
						if config["ds_pos"] == 1 then
						drawSimpleOutlinedText("Dist:" .. distance, "ESP_Font_Flag", MinX-config["ds_x"], MinY+config["ds_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["ds_pos"] == 2 then
						drawSimpleOutlinedText("Dist:" .. distance, "ESP_Font_Flag", MaxX+config["ds_x"], MinY+config["ds_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["ds_pos"] == 3 then
						drawSimpleOutlinedText("Dist:" .. distance, "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["ds_x"], MinY-config["ds_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["ds_pos"] == 4 then  
						drawSimpleOutlinedText("Dist:" .. distance, "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["ds_x"], MaxY+config["ds_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						end
					end
					if config["esp_player_dormant_ind"] then
						surfSetFont("ESP_Font_Flag")
                        local w, h = surfGetTextSize("Dormant")
						local col = string.ToColor(config.colors["esp_player_dormant_ind"])
						if v:IsDormant() then
						if config["di_pos"] == 1 then
						drawSimpleOutlinedText("Dormant", "ESP_Font_Flag", MinX-config["di_x"], MinY+config["di_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["di_pos"] == 2 then
						drawSimpleOutlinedText("Dormant", "ESP_Font_Flag", MaxX+config["di_x"], MinY+config["di_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["di_pos"] == 3 then
						drawSimpleOutlinedText("Dormant", "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["di_x"], MinY-config["di_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["di_pos"] == 4 then  
						drawSimpleOutlinedText("Dormant", "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["di_x"], MaxY+config["di_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						end
						end
					end
					if config["esp_player_money"] then
					    local Money = v:GetNetworkedInt("money")
		                if v.DarkRPVars and v.DarkRPVars.money then
			                Money = v.DarkRPVars.money
		                end
						surfSetFont("ESP_Font_Flag")
                        local w, h = surfGetTextSize(tostring(Money).. " $")
						local col = string.ToColor(config.colors["esp_player_money"])
						if config["mn_pos"] == 1 then
						drawSimpleOutlinedText(tostring(Money).. " $", "ESP_Font_Flag", MinX-config["mn_x"], MinY+config["mn_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["mn_pos"] == 2 then
						drawSimpleOutlinedText(tostring(Money).. " $", "ESP_Font_Flag", MaxX+config["mn_x"], MinY+config["mn_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["mn_pos"] == 3 then
						drawSimpleOutlinedText(tostring(Money).. " $", "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["mn_x"], MinY-config["mn_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["mn_pos"] == 4 then  
						drawSimpleOutlinedText(tostring(Money) .. " $", "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["mn_x"], MaxY+config["mn_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						end
					end
					if config["esp_player_snaplines"] then
					    if config["esp_player_snaplines_pos"] == 1 then
						surfSetDrawColor( string.ToColor(config.colors["esp_player_snaplines"]))
						surfDrawLine( ScrW() / 2 - 1, ScrH() , MaxX - ( MaxX - MinX ) / 2 - 1, MaxY )
					    elseif config["esp_player_snaplines_pos"] == 2 then
					    surfSetDrawColor( string.ToColor(config.colors["esp_player_snaplines"]))
						surfDrawLine( ScrW() / 2 , ScrH() / 2 , MaxX - ( MaxX - MinX ) / 2 - 1, MaxY )
					    end
					end
                    if config["esp_player_drawmodel"] then
	                    cam.Start3D()
		                    v:DrawModel()
		                cam.End3D()
	                end
					--if config["esp_player_drawmodelatt"] then
					--local vwep = v:GetActiveWeapon()
	                --    cam.Start3D()
		            --        vwep:DrawModel()
		            --    cam.End3D()
	                --end
					if config["esp_player_skeleton"] then
						for _, b in pairs( bones ) do
							if v:LookupBone(b.S) != nil && v:LookupBone(b.E) != nil then
								local spos, epos = v:GetBonePosition(v:LookupBone(b.S)):ToScreen(), v:GetBonePosition(v:LookupBone(b.E)):ToScreen()
								if spos.visible && epos.visible then
									surfSetDrawColor( string.ToColor(config.colors["esp_player_skeleton"]) )
									surfDrawLine( spos.x, spos.y, epos.x, epos.y )
								end
							end
						end
					end
					if config["esp_player_hitbox"] then
						if v:GetHitBoxGroupCount() != nil then
							for group = 0, v:GetHitBoxGroupCount() - 1 do 
							 	for hitbox = 0, v:GetHitBoxCount( group ) - 1 do
							 		local pos, ang = v:GetBonePosition( v:GetHitBoxBone(hitbox, group) )
							 		local mins, maxs = v:GetHitBoxBounds(hitbox, group)
							 		cam.Start3D()
										render.DrawWireframeBox( pos, ang, mins, maxs, string.ToColor(config.colors["esp_player_hitbox"]), true)
									cam.End3D()
								end
							end
						end
					end
					if v.Traitor then
						surfSetFont("ESP_Font_Flag")
						local w, h = surfGetTextSize("Traitor")
						drawSimpleOutlinedText("Traitor", "ESP_Font_Flag", MaxX+5, MinY + h, Color(255, 0, 0) , TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
					end
					if config["misc_ttt"] && engine.ActiveGamemode() == "murder" then
						if v:HasWeapon("weapon_mu_knife") then
							surfSetFont("ESP_Font_Flag")
							local w, h = surfGetTextSize("Murderer")
							drawSimpleOutlinedText("Murderer", "ESP_Font_Flag", MaxX+5, MinY + h, Color(255, 0, 0) , TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))	
						end 	
					end
				end
			end
		end
		for k, v in ipairs(ents.GetAll()) do
			if table.HasValue(config["entities"], v:GetClass()) then
				if v && v:GetOwner() != LocalPlayer() && IsValid(v) && v:GetPos():Distance(LocalPlayer():GetPos()) <= config["esp_player_render_distance"] then
					local MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8, isVis = GetENTPos( v )
					if config["esp_entity_box"] then
						surfSetDrawColor(string.ToColor(config.colors["esp_entity_box"]))
						surfDrawLine( MaxX, MaxY, MinX, MaxY )
						surfDrawLine( MaxX, MaxY, MaxX, MinY )
						surfDrawLine( MinX, MinY, MaxX, MinY )
						surfDrawLine( MinX, MinY, MinX, MaxY )
					end
					if config["esp_entity_name"] then
						surfSetFont("ESP_Font_Flag")
						local w, h = surfGetTextSize(v:GetClass())
						drawSimpleOutlinedText(v:GetClass(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2, MinY-1, string.ToColor(config.colors["esp_entity_name"]), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
					end
				end
			end
		end
		if config["misc_adminlist"] then
		local rgbcol = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
			for k, v in ipairs(onlineStaff) do
				if IsValid(v) then
					local a
					local x,y = math.Round(config["misc_adminlist_x"]), math.Round(config["misc_adminlist_y"])
					surfSetFont("smallest_pixel")
					local w = surfGetTextSize("Admins Online")
					if v:IsSuperAdmin() then a =  " (" .. v:GetUserGroup() .. ") " elseif v:IsAdmin() then a = "(" .. v:GetUserGroup() .. ")" else a = v:GetUserGroup() end
		            draw.RoundedBox( 3, x, y, 200, 25, Color(25,25,25))
			        draw.RoundedBox( 10, x+2, y+1, 196, 3, Color(rgbcol.r,rgbcol.g,rgbcol.b))
					
		            surfSetDrawColor( 255, 255, 255, 60 ) 
	                surface.SetMaterial(Material("gui/center_gradient")) 
	                surfDrawTexturedRect(x+4, y+1, 200-4, 3)
					
                    draw.SimpleText( "Admins Online", "smallest_pixel", x+(200/2) - w/2, y+5, color_white )
					
					surfSetFont("smallest_pixel")
					local nameWidth, nameHeight = surfGetTextSize(v:Name().." ("..a..")")
					surfSetDrawColor( 11, 11, 11, 200 ) 
	                surface.SetMaterial(Material("gui/gradient")) 
	                surfDrawTexturedRect(x+2, y+28 + (15 * ( k - 1 ) ), nameWidth + 50, nameHeight)
					draw.SimpleText(v:Name()..a, "smallest_pixel", x+3, y+28 + (15 * ( k - 1 ) ), Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
				end
			end
		end
		if config["misc_infolist"] then
		    local rgbcol = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
		    local killo,detho,velo,fpso,health,ap = LocalPlayer():Frags(),LocalPlayer():Deaths(),me:GetVelocity():Length(),tostring(math.floor(1 / RealFrameTime())),me:Health(),me:Armor()
			local x,y = math.Round(config["misc_infolist_x"]), math.Round(config["misc_infolist_y"])
			surfSetFont("smallest_pixel")
			local w = surfGetTextSize("Info Panel")
		    draw.RoundedBox( 3, x, y, 200, 25, Color(25,25,25))
			draw.RoundedBox( 10, x+2, y+1, 196, 3, Color(rgbcol.r,rgbcol.g,rgbcol.b))
            draw.RoundedBox( 3, x, y+26, 200, 130, Color(25,25,25,100))
			
		    surfSetDrawColor( 255, 255, 255, 60 ) 
	        surface.SetMaterial(Material("gui/center_gradient")) 
	        surfDrawTexturedRect(x+4, y+1, 200-4, 3)

            draw.SimpleText( "Info Panel", "smallest_pixel", x+(200/2) - w/2, y+5, color_white )

			draw.SimpleText("Frags: " .. killo, "smallest_pixel", x+3, y+28, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			draw.SimpleText("Deaths: " ..detho, "smallest_pixel", x+3, y+28+20, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			draw.SimpleText("Velocity: " .. math.Round(velo), "smallest_pixel", x+3, y+28+20+20, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			draw.SimpleText("FPS: " ..fpso, "smallest_pixel", x+3, y+28+20+20+20, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			
			draw.SimpleText("Health: " .. health, "smallest_pixel", x+3, y+28+20+20+20+20, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			draw.SimpleText("Armor: " ..ap, "smallest_pixel", x+3, y+28+20+20+20+20+20, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			
		end
		if config["misc_speclist"] then
		    local rgbcol = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
			local x,y = math.Round(config["misc_speclist_x"]), math.Round(config["misc_speclist_y"])
			surfSetFont("smallest_pixel")
			local w = surfGetTextSize("Spectators")
		    draw.RoundedBox( 3, x, y, 250, 25, Color(25,25,25))
			draw.RoundedBox( 10, x+2, y+1, 246, 3, Color(rgbcol.r,rgbcol.g,rgbcol.b))		
		    surfSetDrawColor( 255, 255, 255, 60 ) 
	        surface.SetMaterial(Material("gui/center_gradient")) 
	        surfDrawTexturedRect(x+4, y+1, 246, 3)
            draw.SimpleText( "Spectators", "smallest_pixel", x+(250/2) - w/2, y+5, color_white )
			for k, v in ipairs(observingPlayers.spec) do		
				if IsValid(v) then
					surfSetFont("smallest_pixel")
					local nameWidth, nameHeight = surfGetTextSize("Spectator: "..v:Name())
					surfSetDrawColor( 11, 11, 11, 200 ) 
	                surface.SetMaterial(Material("gui/gradient")) 
	                surfDrawTexturedRect(x+2, y+15 + (15 * k - 1), nameWidth + 50, nameHeight)
				    draw.SimpleText("Spectator: "..v:Name(), "smallest_pixel", x + 3, y + 15 --[[+ (15 * #observingPlayers.watcher)]] + (15 * k - 1), color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			    end
			end
		end
		if config["esp_ent_crosshair"] then
		    draw.SimpleText( LocalPlayer():GetEyeTrace().Entity, "smallest_pixel", (ScrW()/2) - 100, ScrH() / 2 + 65, color_white )
		end
        if config["hud_watermark"] && !frame then
		    surface.SetFont("smallest_pixel")
		    local textwi = surface.GetTextSize("PenisDeda.NET " .. PenisDedushki.Version .. "|username: " .. LocalPlayer():Name() .. " |gm: " .. engine.ActiveGamemode() .. " |latency:" .. LocalPlayer():Ping() .. " |tick:"..math.Round(1/engine.TickInterval()-1) )
			local textwid = textwi + 5
			local rgbcol = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
		    draw.RoundedBox( 3, 5, 5, textwid, 25, Color(25,25,25))
			draw.RoundedBox( 10, 7, 6, textwid-4, 3, Color(rgbcol.r,rgbcol.g,rgbcol.b))
		    surfSetDrawColor( 255, 255, 255, 60 ) 
	        surface.SetMaterial(Material("gui/center_gradient")) 
	        surfDrawTexturedRect(7, 6, textwid-4, 3)
            draw.SimpleText( "PenisDeda.NET " .. PenisDedushki.Version .. "|username: " .. LocalPlayer():Name() .. " |gm: " .. engine.ActiveGamemode() .. " |latency:" .. LocalPlayer():Ping() .. " |tick:"..math.Round(1/engine.TickInterval()-1) , "smallest_pixel", 8, 10, color_white )
        end
		if config["hud_topline"] then
		local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
		    if config["hud_topline_style"] == 1 then
			surfSetDrawColor(0,0,0,255)
            surfDrawRect(0, 0, ScrW(), 4)
			surfSetDrawColor(hsv.r,hsv.g,hsv.b,255)
            surfDrawRect(1, 1, ScrW(), 2)
			elseif config["hud_topline_style"] == 2 then
			surfSetDrawColor(hsv.r,hsv.g,hsv.b,255)
            surfDrawRect(0, 0, ScrW(), 4)
			elseif config["hud_topline_style"] == 3 then
			surfSetDrawColor(hsv.r,hsv.g,hsv.b,200)
            surfDrawRect(0, 0, ScrW(), 4)
	        surface.SetMaterial(Material("gui/gradient_down"))
	        surfDrawTexturedRect( 0, 4, ScrW(), 15 )
			end
		end

		if config["hud_crosshair"] then
		if config["hud_crosshair_type"] == 1 then
		surfSetDrawColor(0,0,0,255)
        surfDrawRect(ScrW() / 2 - 2, ScrH() / 2 - 2, 4, 4)
		surfSetDrawColor(0,255,0,255)
        surfDrawRect((ScrW() / 2) - 1, (ScrH() / 2) - 1, 2, 2)
		elseif config["hud_crosshair_type"] == 2 then
		draw.SimpleText( "卐", "Trebuchet24", ScrW() / 2, ScrH() / 2, color_white, TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER )
		end
		end
		if config["hud_keystrokes"] then
		if config["hud_keystrokes_style"] == 1 then
		AddKeyRectangle("W", IN_FORWARD, 35,550)
        AddKeyRectangle("A", IN_MOVELEFT, 0,550+35)
        AddKeyRectangle("D", IN_MOVERIGHT, 70,550+35)
        AddKeyRectangle("S", IN_BACK, 35,550+35)
		elseif config["hud_keystrokes_style"] == 2 then
		AddKeyRectangle("W", IN_FORWARD, 35,550)
        AddKeyRectangle("A", IN_MOVELEFT, 0,550+35)
        AddKeyRectangle("D", IN_MOVERIGHT, 70,550+35)
        AddKeyRectangle("S", IN_BACK, 35,550+35)
		AddKeySquare("SPACE",IN_JUMP,0,550+70)
		elseif config["hud_keystrokes_style"] == 3 then
		AddKeyRectangle("W", IN_FORWARD, 35,550)
        AddKeyRectangle("A", IN_MOVELEFT, 0,550+35)
        AddKeyRectangle("D", IN_MOVERIGHT, 70,550+35)
        AddKeyRectangle("S", IN_BACK, 35,550+35)
        AddKeyRectangleMouse("LMB", IN_ATTACK, 0,550+70)
		AddKeyRectangleMouse("RMB", IN_ATTACK2, 52,550+70)
		elseif config["hud_keystrokes_style"] == 4 then
		AddKeyRectangle("W", IN_FORWARD, 35,550)
        AddKeyRectangle("A", IN_MOVELEFT, 0,550+35)
        AddKeyRectangle("D", IN_MOVERIGHT, 70,550+35)
        AddKeyRectangle("S", IN_BACK, 35,550+35)
        AddKeyRectangleMouse("LMB", IN_ATTACK, 0,550+70)
		AddKeyRectangleMouse("RMB", IN_ATTACK2, 52,550+70)	
		AddKeySquare("SPACE",IN_JUMP,0,550+105)		
		end
		end
		if config["aim_master_toggle"] && config["esp_other_drawfov"] then
		local X1 = math.tan( math.rad( config["aim_fov"] ) / 1.25 )
		local X2 = math.tan( math.rad( LocalPlayer():GetFOV() / 2 ) )
		local r = X1 / X2
		local pxR = r * ( ScrW() / 2 )
		surfDrawCircle(ScrW() / 2, ScrH() / 2, pxR, string.ToColor(config.colors["esp_other_drawfov"]))
	    end
		if config["esp_other_drawfov_fill"] && config["aim_master_toggle"] then
		local X1 = math.tan( math.rad( config["aim_fov"] ) / 1.25 )
		local X2 = math.tan( math.rad( LocalPlayer():GetFOV() / 2 ) )
		local r = X1 / X2
		local pxR = r * ( ScrW() / 2 )
		local col = string.ToColor(config.colors["esp_other_drawfov"])
		surfSetDrawColor(col.r,col.g,col.b,col.a/2.5)
	    surface.SetMaterial(Material("vgui/white"))
		draw.Circle(ScrW() / 2, ScrH() / 2,pxR,30)
	    end
		if config["esp_self_velocity_crosshair"] then
		surfSetDrawColor(string.ToColor(config.colors["esp_self_velocity_crosshair"]))
	    surface.SetMaterial(Material("vgui/white"))
		draw.Circle(ScrW() / 2, ScrH() / 2,LocalPlayer():GetVelocity():Length() / 4,180)
		end
		for k, v in ipairs( ents.FindByClass( "npc_*" ) ) do
		local MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8, isVis = GetENTPos( v )
		if config["esp_npc_box"] then
		cam.Start3D()
		render.DrawWireframeBox( v:GetPos(), Angle(0, 0, 0), v:OBBMins(), v:OBBMaxs(), string.ToColor(config.colors["esp_npc_box"]), true )
		cam.End3D()
		end
		if config["esp_npc_name"] then
		surfSetFont("ESP_Font_Main")
		local w, h = surfGetTextSize(v:GetClass())
		drawSimpleOutlinedText(v:GetClass(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2, MinY-1, string.ToColor(config.colors["esp_npc_name"]), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
		end
		if config["esp_npc_health"] then
		surfSetFont("ESP_Font_Main")
		local w, h = surfGetTextSize(v:GetClass())
		drawSimpleOutlinedText(v:Health() .. "HP", "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2, MinY-10, string.ToColor(config.colors["esp_npc_health"]), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
		end
		if config["esp_npc_snaplines"] then
		surfSetDrawColor( string.ToColor(config.colors["esp_npc_snaplines"]))
		surfDrawLine( ScrW() / 2 - 1, ScrH() , MaxX - ( MaxX - MinX ) / 2 - 1, MaxY )
		end
	    end
		--Simple radar
		if config["map_enable"] then
		local size = math.Round(config["map_size"])
        local fov = math.Round(config["map_zoom"])
        local x = math.Round(config["map_x"])
        local y = math.Round(config["map_y"])
		local col = string.ToColor(config.colors["map_enable"])
		local nametag_col = string.ToColor(config.colors["map_names"])
		local rgbcol = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
		--local dist = math.Round((m:GetPos() - v:GetPos()):Length())
        draw.RoundedBox( 3, x, y, size, size, Color(20, 20, 20, col.a))
		draw.RoundedBox( 3, x - 2, y - 2, size + 4, size + 4, Color(col.r, col.g, col.b,col.a))
		for key, ply in pairs(player.GetAll()) do

        local teamcol, teamcol2 = nametag_col

        if ply != me and ply:Alive() and ply:GetPos():Distance(LocalPlayer():GetPos()) < config["esp_player_render_distance"] then

            local lx = me:GetPos().x - ply:GetPos().x

            local ly = me:GetPos().y - ply:GetPos().y

            local ang = EyeAngles().y

            local cos = math.cos(math.rad(-ang))

            local sin = math.sin(math.rad(-ang))

            local px = (ly * cos) + (lx * sin)

            local py = (lx * cos) - (ly * sin)

            px = px / fov

            py = py / fov

            px = math.Clamp(px, -(size * 0.50), size * 0.50)

            py = math.Clamp(py, -(size * 0.50), size * 0.50)

            local name = player.GetAll()[key]:Nick()
			local team = team.GetName(player.GetAll()[key]:Team())
			--local teamcol3 = string.ToColor( team.GetColor(player.GetAll()[key]:Team() ) )
            if config["map_names"] then
            draw.SimpleText(name, "default", x + size - (size * 0.50) + px - 13, y + size - (size * 0.50) + py - 7, nametag_col, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
			if config["map_teams"] then
			draw.SimpleText(team, "default", x + size - (size * 0.50) + px - 13, y + size - (size * 0.50) + py - 15, nametag_col, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
            end
            surface.SetDrawColor(teamcol)

            surface.DrawRect(x + size - (size * 0.50) + px, y + size - (size * 0.50) + py, 3, 3)
            end
        end	
		draw.RoundedBox( 3, x - 2, y - 27,size + 4, 25, Color(35,35,35))
		draw.RoundedBox( 10, x, y - 26, size, 3, Color(rgbcol.r,rgbcol.g,rgbcol.b))
		surfSetDrawColor( 255, 255, 255, 60 ) 
	    surface.SetMaterial(Material("gui/center_gradient")) 
	    surfDrawTexturedRect( x, y - 26, size, 3)
		surface.SetFont("smallest_pixel")
		local xmax = surface.GetTextSize("Mini Map")    
        draw.SimpleText( "Mini Map", "smallest_pixel", x + (size / 2 ) - (xmax / 2), y - 20, color_white )		
		draw.RoundedBox( 3, (x -2)+ (size/2), (y-2) + (size/2), 4, 4, Color(rgbcol.r,rgbcol.g,rgbcol.b) ) --me
		end	
		local wep, viewmodel, muzzle, trace, startpos, endpos
		local blockedWeps = {
	    "weapon_physgun",
	    "pocket",
	    "keys",
	    "gmod_tool",
        }
		if config["esp_self_laser_sight"] then 
		local lasercol = string.ToColor(config.colors["esp_self_laser_sight"])
		wep = LocalPlayer():GetActiveWeapon()
	    viewmodel = LocalPlayer():GetViewModel()
	    trace = LocalPlayer():GetEyeTrace().HitPos

	    if viewmodel && IsValid( wep ) && IsValid( viewmodel ) then
		
		-- ignore blocked weps
		if !table.HasValue( blockedWeps, wep:GetClass() ) then
			
			muzzle = viewmodel:LookupAttachment( "muzzle" )
			
			-- failsafe
			if muzzle == 0 then
				
				muzzle = viewmodel:LookupAttachment( "1" )
				
			end
			
			if viewmodel:GetAttachment( muzzle ) then
				
				cam.Start3D()
					
					-- Set laser start/end pos
					startpos = viewmodel:GetAttachment( muzzle ).Pos					
					endpos = trace
					
					-- Draw the beam
					render.SetMaterial( Material( "trails/laser" ) )
					
					render.DrawBeam( startpos, endpos, 3, 0, 0, Color(lasercol.r, lasercol.g, lasercol.b)   )
					
					-- End of laser dot thing. Credits to sethhack for being the first to do this.
					render.SetMaterial( Material( "Sprites/light_glow02_add_noz" ) )
					
					render.DrawQuadEasy( 
						endpos, 
						( EyePos() - trace ):GetNormal(),
						20, 20,
						color_white,
						0
					)
					
				cam.End3D()
			
			end
			
		end
		
	    end
		end
	end
end 
--Swap Render
function SwapRender(init)
	
	init = init or false

	if !init then
		config["esp_render_mode"] = !config["esp_render_mode"]
	end

	if !config["esp_render_mode"] then
		if table.HasValue(hooks, "HUDPaint") then
			hook.Remove("HUDPaint", table.KeyFromValue(hooks, "HUDPaint"))
			table.RemoveByValue(hooks, "HUDPaint")
		end
		AddHook("CheatHUDPaint", RandomString(), DoESP)
	else
		if table.HasValue(hooks, "CheatHUDPaint") then
			hook.Remove("CheatHUDPaint", table.KeyFromValue(hooks, "CheatHUDPaint"))
			table.RemoveByValue(hooks, "CheatHUDPaint")
		end
		AddHook("HUDPaint", RandomString(), DoESP)
	end

	if !init then
		if frame then
			CloseFrame()
			HavocGUI()
		end
	end

end

SwapRender(true)

end

do
--================HUD============--
--keystrokes
surface.CreateFont("KeyStroke", {
    font = "Roboto",
    size = 20,
    weight = 400,
    antialias = true
})
function AddKeySquare(text,key,x,y)
local rainbow_col = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
local color_white = Color(255,255,255)
local color_black = Color(20, 20, 20)
local gray = Color(30, 30, 30)
local size = 35
    if LocalPlayer():KeyDown(key) then
        surfSetDrawColor(rainbow_col.r, rainbow_col.g, rainbow_col.b)
        surfDrawRect(x, y, size * 3, size)
        draw.SimpleText(""..text.."", "KeyStroke", x+26, y+7, color_black)
    else
        surfSetDrawColor(gray)
        surfDrawRect(x, y, size * 3, size)
        draw.SimpleText(""..text.."", "KeyStroke", x+26, y+7, color_white)
    end
end
function AddKeyRectangle(text,key,x,y)
local rainbow_col = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
local color_white = Color(255,255,255)
local color_black = Color(20, 20, 20)
local gray = Color(30, 30, 30)
local size = 35
    surfSetDrawColor(rainbow_col.r, rainbow_col.g, rainbow_col.b, 100)
    if LocalPlayer():KeyDown(key) then 
        surfDrawRect(x, y, size, size)
        draw.SimpleText(""..text.."", "KeyStroke", x+11, y+7, color_black)
    else
        surfSetDrawColor(gray)
        surfDrawRect(x, y, size, size)
        draw.SimpleText(""..text.."", "KeyStroke", x+11, y+7, color_white)
    end
end
function AddKeyRectangleMouse(text,key,x,y)
local rainbow_col = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
local color_white = Color(255,255,255)
local color_black = Color(20, 20, 20)
local gray = Color(30, 30, 30)
local size = 53
    surfSetDrawColor(rainbow_col.r, rainbow_col.g, rainbow_col.b, 100)
    if LocalPlayer():KeyDown(key) then 
        surfDrawRect(x, y, size, 35)
        draw.SimpleText(""..text.."", "KeyStroke", x+11, y+7, color_black)
    else
        surfSetDrawColor(gray)
        surfDrawRect(x, y, size, 35)
        draw.SimpleText(""..text.."", "KeyStroke", x+11, y+7, color_white)
    end
end
--3D2D Хуйни
AddHook("PostDrawOpaqueRenderables", RandomString(), function()
if config["hud_aimbotstatus"] then
	local angle = Angle( 0, 0, 0 )
	local pos = LocalPlayer():GetBonePosition(LocalPlayer():LookupBone("ValveBiped.Bip01_Pelvis"))		
	cam.Start3D2D( pos, angle, 1 )
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	    surfSetDrawColor( hsv.r, hsv.g, hsv.b, 50 )
	    surface.SetMaterial(Material("vgui/white"))
		draw.Circle( 0, 0, 135 + math.sin( CurTime() ) * 15, 30 )
		surfDrawCircle( 0, 0, 135 + math.sin( CurTime() ) * 15, Color( hsv.r, hsv.g, hsv.b ) )
		surfDrawCircle( 1, 0, 135 + math.sin( CurTime() ) * 15, Color( hsv.r, hsv.g, hsv.b ) )
	cam.End3D2D()
end
if config["aim_autopeek3"] then
	local angle = Angle( 0, 0, 0 )
	local matspark = Material("gui/npc.png")
    cam.Start3D2D( oldposition , angle, 1 )
	    if config["aim_autopeek3"] && input.IsKeyDown(config.keybinds["aim_autopeek"]) && peeked then    
            surface.SetDrawColor( 255, 255, 255, 250 ) 
	        surface.SetMaterial( matspark )
	        surface.DrawTexturedRect( -64, -64, 128, 128 )
	    elseif config["aim_autopeek3"] && !peeked then
            surface.SetDrawColor( 255, 25, 25, 250 )
	        surface.SetMaterial( matspark )
	        surface.DrawTexturedRect( -64, -64, 128, 128 )
	    end			
    cam.End3D2D()
end
if config["esp_self_hat"] && config["esp_self_hat_type"] == 1 && !config["esp_self_customagent"] then
if intp then
local angle = Angle( 0, 0, 0 )
local pos = LocalPlayer():GetBonePosition(LocalPlayer():LookupBone("ValveBiped.Bip01_Head1")) + Vector(0,0,10)	
	cam.Start3D2D( pos, angle, 1 )
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	    surfSetDrawColor( hsv.r, hsv.g, hsv.b, 50 )
		surfDrawCircle( 0, 0, 5, Color( hsv.r, hsv.g, hsv.b ) )
	cam.End3D2D()
else end
end
end )
end

do
local hatmodel = ClientsideModel( "models/player/items/humans/top_hat.mdl" )
hatmodel:SetNoDraw( true )

local hatmodel2 = ClientsideModel( "models/player/items/humans/graduation_cap.mdl" )
hatmodel2:SetNoDraw( true )

local hatmodel3 = ClientsideModel( "models/dynamite/dynamite.mdl" )
hatmodel3:SetNoDraw( true )

AddHook( "PostPlayerDraw" , RandomString() , function( ply )

if config["esp_self_hat"] && config["esp_self_hat_type"] != 1 && !config["esp_self_customagent"] then
	if not IsValid(ply) or not ply:Alive() then return end

	local attach_id = ply:LookupAttachment('eyes')
	if not attach_id then return end
			
	local attach = ply:GetAttachment(attach_id)
			
	if not attach then return end
			
	local pos = attach.Pos
	local ang = attach.Ang
		
	if config["esp_self_hat_type"] == 2 then
	hatmodel:SetModelScale(1, 0)
	pos = pos + (ang:Forward() * -2.5)
	ang:RotateAroundAxis(ang:Right(), 20)
		
	hatmodel:SetPos(pos)
	hatmodel:SetAngles(ang)

	hatmodel:SetRenderOrigin(pos)
	hatmodel:SetRenderAngles(ang)
	hatmodel:SetupBones()
	hatmodel:DrawModel()
	hatmodel:SetRenderOrigin()
	hatmodel:SetRenderAngles()
	elseif config["esp_self_hat_type"] == 3 then
	hatmodel:SetModelScale(1, 0)
	pos = pos + (ang:Forward() * -2.5)
	ang:RotateAroundAxis(ang:Right(), 20)
		
	hatmodel2:SetPos(pos)
	hatmodel2:SetAngles(ang)

	hatmodel2:SetRenderOrigin(pos)
	hatmodel2:SetRenderAngles(ang)
	hatmodel2:SetupBones()
	hatmodel2:DrawModel()
	hatmodel2:SetRenderOrigin()
	hatmodel2:SetRenderAngles()
	elseif config["esp_self_hat_type"] == 4 then
	hatmodel3:SetModelScale(1, 0)
	pos = pos + (ang:Forward() * -2.5)
	ang:RotateAroundAxis(ang:Right(), 20)
		
	hatmodel3:SetPos(pos)
	hatmodel3:SetAngles(ang)

	hatmodel3:SetRenderOrigin(pos)
	hatmodel3:SetRenderAngles(ang)
	hatmodel3:SetupBones()
	hatmodel3:DrawModel()
	hatmodel3:SetRenderOrigin()
	hatmodel3:SetRenderAngles()
	end
end
end)
--Custom agents (WIP)
AddHook("PrePlayerDraw",  RandomString(), function()
if config["esp_self_customagent"] then
for k, v in ipairs(player.GetAll()) do
    LocalPlayer():InvalidateBoneCache()
	if config["esp_self_customagent_agent"] == 1 then
	LocalPlayer():SetModel("models/player/ctm_sas_variante.mdl")
	elseif config["esp_self_customagent_agent"] == 2 then
	LocalPlayer():SetModel("models/player/tm_pirate_variantb.mdl")
	elseif config["esp_self_customagent_agent"] == 3 then
	LocalPlayer():SetModel("models/player/tm_anarchist_varianta.mdl")
	elseif config["esp_self_customagent_agent"] == 4 then
	LocalPlayer():SetModel("models/player/tm_professional.mdl")
	end
	LocalPlayer():GetModel()
	LocalPlayer():SetupBones()	
end
end
end)
AddHook("PrePlayerDraw",RandomString(), function(ply)
	if config["aim_act_disabler"] and ply != me then
		for i = 0, 13 do
			if ply:IsValidLayer(i) then
				local seqname = ply:GetSequenceName(ply:GetLayerSequence(i))
				if seqname:StartWith("taunt_") then
					ply:SetLayerDuration(i, 0.001)
					break
				end
			end
		end
	end
	--if settings.Visuals.AntiAimChams and ply == me then
	--	return true
	--end
end)



end

do
--Смачная зигота !!
local function DEG2RAD(x) return x * math.pi / 180 end
local function RAD2DEG(x) return x * 180 / math.pi end

local rainbow = 0.00
local rotationdegree = 0.000;

local function hsv2rgb(h, s, v, a)
    local r, g, b
 
    local i = math.floor(h * 6);
    local f = h * 6 - i;
    local p = v * (1 - s);
    local q = v * (1 - f * s);
    local t = v * (1 - (1 - f) * s);
 
    i = i % 6
 
    if i == 0 then r, g, b = v, t, p
    elseif i == 1 then r, g, b = q, v, p
    elseif i == 2 then r, g, b = p, v, t
    elseif i == 3 then r, g, b = p, q, v
    elseif i == 4 then r, g, b = t, p, v
    elseif i == 5 then r, g, b = v, p, q
    end
 
    return r * 255, g * 255, b * 255, a * 255
end

local function draw_svaston(x, y, size)
    local frametime = FrameTime()
    local a = size / 60
    local gamma = math.atan(a / a)
    rainbow = rainbow + (frametime * 0.5)
    if rainbow > 1.0 then rainbow = 0.0 end
    if rotationdegree > 89 then rotationdegree = 0 end

    for i = 0, 4 do 
        local p_0 = (a * math.sin(DEG2RAD(rotationdegree + (i * 90))))
        local p_1 = (a * math.cos(DEG2RAD(rotationdegree + (i * 90))))
        local p_2 =((a / math.cos(gamma)) * math.sin(DEG2RAD(rotationdegree + (i * 90) + RAD2DEG(gamma))))
        local p_3 =((a / math.cos(gamma)) * math.cos(DEG2RAD(rotationdegree + (i * 90) + RAD2DEG(gamma))))

        surfSetDrawColor(hsv2rgb(rainbow,1, 1, 1))
        surfDrawLine(x, y, x + p_0, y - p_1)
        surfDrawLine(x + p_0, y - p_1, x + p_2, y - p_3)
    end
    rotationdegree = rotationdegree + (frametime * 150)
end

AddHook("HUDPaint",RandomString(),function()
if config["hud_crosshair"] then
	if config["hud_crosshair_type"] == 3 then
    local screenW, screenH = ScrW() ,ScrH()
    draw_svaston(screenW / 2, screenH / 2, screenH /2)
	end
end
end)
--Hide HL2 HUD
local hide = {
    ["CHudHealth"] = true,
	["CHudBattery"] = true,
	["CHudWeapon"] = true,
	["CHudVehicle"] = true,
	["CHudCrosshair"] = true,
	["CHudAmmo"] = true
}
local hidecrosshair = {
	["CHudCrosshair"] = true,
}
AddHook( "HUDShouldDraw", RandomString(), function( name ) if config["hud_disable_hl2_hud"] then if ( hide[ name ] ) then return false end end end)
AddHook( "HUDShouldDraw", RandomString(), function( name ) if config["hud_crosshair"] then if ( hidecrosshair[ name ] ) then return false end end end)

end


do
-- ======================= Bullet Tracers
-- Self
tracerTable = {}
AddHook("PreDrawOpaqueRenderables", RandomString(), function ()
if config["esp_self_bullet_tracers"] then
        for k,v in next, tracerTable do
        if(v[3] <= 0) then
            table.remove(tracerTable, k);
            continue;
        end
        tracerTable[k][3] = tracerTable[k][3] - FrameTime();
        local pos1, pos2 = v[1], v[2];
        cam.Start3D();
        render.SetMaterial(Material("sprites/tp_beam001"))
        render.DrawBeam(v[1], v[2], 4, 1, 1, v[4])
        cam.End3D();
    end
end
end)
-- Enemy
local traces = {}
local optimize_tbl = {}
AddHook("player_hurt", RandomString(), function(tbl)
if config["esp_player_bulletbeam"] then
local ENTITY = FindMetaTable("Entity") local _GetPos = ENTITY.GetPos local time = 5 local IsValid = IsValid local Player = Player local CurTime = CurTime local table_remove = table.remove
    local target = Player(tbl.userid or 0)
    if target ~= LocalPlayer() then return end

    local attacker = Player(tbl.attacker or 0)
    if not IsValid(attacker) then return end
    
    if optimize_tbl[attacker] then
        table_remove(traces, optimize_tbl[attacker])
    end
    
    local trace = {}
    trace.time = CurTime() + time
    trace.startpos = _GetPos(attacker) + Vector(0, 0, 50)
    trace.endpos = _GetPos(target) + Vector(0, 0, 50)
    trace.attacker = attacker
    local table_insert = table.insert   
    optimize_tbl[attacker] = table_insert(traces, trace)
end
end)

AddHook("PreDrawEffects", RandomString(), function()
if config["esp_player_bulletbeam"] then
local time = 5 local width = 8 local CurTime = CurTime local table_remove = table.remove local cam_Start3D, cam_End3D = cam.Start3D, cam.End3D local render_SetMaterial = render.SetMaterial local render_DrawBeam = render.DrawBeam
    for i = #traces, 1, -1 do
        local trace = traces[i]
        
        if trace.time < CurTime() then
            table_remove(traces, i)
            optimize_tbl[trace.attacker] = nil
            continue
        end
        
        local startpos = trace.startpos
        local endpos = trace.endpos
        
        cam_Start3D()
            render_SetMaterial(Material("sprites/tp_beam001"))
            render_DrawBeam(startpos, endpos, width, 1, 1, string.ToColor(config.colors["esp_player_bulletbeam"]))
        cam_End3D()
    end
end
end)
-- ======================= HitMarker
-- 3D
hitmarkerTable = {}
AddHook("HUDPaint", RandomString(),function ()
if config["esp_player_hitmarker"] then
    for k, v in next, hitmarkerTable do
        local pos = v[1]:ToScreen()
 
        if(v[2] <= 0) then
            table.remove(hitmarkerTable, k);
            continue;
        end
        v[2] = v[2] - FrameTime()
        surfSetDrawColor(255, 255,255)
        surfDrawLine( pos.x - 8, pos.y - 8, pos.x - 2, pos.y - 2 )
        surfDrawLine( pos.x - 8, pos.y + 8, pos.x - 2, pos.y + 2 )
        surfDrawLine( pos.x + 8, pos.y - 8, pos.x + 2, pos.y - 2 )
        surfDrawLine( pos.x + 8, pos.y + 8, pos.x + 2, pos.y + 2 )
    end
end
end)
-- ======================= Beam/Hitmarker end
AddHook("PlayerTraceAttack", RandomString(), function (ent, dmg, dir, trace) 
    if(!IsFirstTimePredicted()) then return; end
    local vHitPos, vSrc;
    vHitPos = trace.HitPos;
    vSrc = trace.StartPos;
	if config["esp_self_bullet_tracers"] then
    table.insert(tracerTable, {vHitPos, vSrc, 5, string.ToColor(config.colors["esp_self_bullet_tracers"]), LocalPlayer():GetPos()});
	end
	table.insert(hitmarkerTable, {vHitPos, 1})
end)
-- ======================= Hand/Gun chams
AddHook("PreDrawPlayerHands", RandomString(), function()
col = string.ToColor(config.colors["esp_self_hand_chams"])
if config["esp_self_hand_chams"] then
    render.SetColorModulation(col.r/255,col.g/255,col.b/255)
    render.MaterialOverride(Material("models/wireframe"))
    render.SetBlend(1)
end	
end)
AddHook("PostDrawPlayerHands", RandomString(), function()
if config["esp_self_hand_chams"] then
    render.SetColorModulation(1, 1, 1)
    render.MaterialOverride(Material(""))
    render.SetBlend(1)
end
end)
AddHook("PreDrawViewModel", RandomString(), function()
col = string.ToColor(config.colors["esp_self_gun_chams"])
if config["esp_self_gun_chams"] then
    render.SetColorModulation(col.r/255,col.g/255,col.b/255)
    render.MaterialOverride(Material("models/wireframe"))
    render.SetBlend(1)
end
end)
AddHook("PostDrawViewModel", RandomString(), function()
if config["esp_self_gun_chams"] then
    render.SetColorModulation(1, 1, 1)
    render.MaterialOverride(Material(""))
    render.SetBlend(1)
end
end)


end

--[[
do
local c_net_fakeloss = GetConVar("net_fakeloss")
local net_fakeloss = 0
net_fakeloss = 99
c_net_fakeloss:SetValue(net_fakeloss)
if config["misc_pairstack"] && config["gameserver"] == 2 then
if input.IsKeyDown(config.keybinds["airstack"]) then
    c_net_fakeloss:SetValue(net_fakeloss)
else
    c_net_fakeloss:SetValue(0)
end
end



end
]]


do
-- ======================= Event Logger

AddHook("player_connect", RandomString(), function(data)
    local name = data.name			
    local steamid = data.networkid	
    local ip = data.address	
    if config["misc_eventlog"] then
	
	if config["misc_eventlog_connects"] then
    if ip == nil then
        addEventlistMessage(name .. " | " .. steamid .. " connected!")
    else
        addEventlistMessage(name .. " | " .. steamid .. " connected|ip - " .. ip)
    end
	end
	
	end
end)

AddHook("player_disconnect", RandomString(), function(data)
local name = data.name
local steamid = data.networkid	
local reason = data.reason
    if config["misc_eventlog"] then
	if config["misc_eventlog_dconects"] then
        addEventlistMessage(name .. " | " .. steamid .. " disconnected|reason - " .. reason)
		end
	end
end)


AddHook("player_hurt", RandomString(), function(data)
local userid = data.userid
local attacker = data.attacker
local hurter = nil
    if config["misc_eventlog"] then
        for _, ply in next, player.GetAll() do
            if (attacker == ply:UserID()) then
	            hurter = ply
	        end
        end
		for _, ply in next, player.GetAll() do
            local health = ply:Health() - data.health
		    if (userid == ply:UserID()) then
			if config["misc_eventlog_hurt"] then
                if hurter == nil then
                    addEventlistMessage("??? hurted " .. ply:Name() .. "|Dealed " .. health .. " dmg|using ??? !")
                else
                    addEventlistMessage(hurter:Name() .. " hurted " .. ply:Name() .. "|Dealed " .. health .. " dmg|using " .. hurter:GetActiveWeapon():GetClass() .. " !")
                end
			end
            end
        end
    end
end)



local csaysss = {
	[1] = {

	},
	[2] = {
		"Lucky Shot - Arab shot",
		"Lucky Shot!!",
		"Omg WTF Man Im so luckyyyy!!!",
		"Omg Nice aim!",
		"Чел забей",
		"Чел ты не шарищ",
		"Чел мне жаль но твоя мать еще жива",
		"И камнем вниииииииззззззззз!",
		"Я прямо как Ильназ Галяиев",
		"Найс софт чел без читов ты 0",
		"Чел ты без читов 0",
		"Держи зонтик тебя абасали",
		"Го 1 на 1 или зассал?Точно ты же до 1 считать не умееш...",
		"Отправляйся в детдом!!!1",
		"Я псрал а ты все сьел",
		"Рукоблуд санина очко блядун вагина",
		"Мне похуй на закон!Я буду грабить и ебать",
		"Я муслим мне похуй на кризис мой пенис вырос",
		"Чел в бан летиш",
		"Чел это бабабуз как бы",
		"Мы в НОНРП Зоне как бы да чел отлетаеш",
		"Найс баг абуз чел папа жива?",
		"Loading… ██████████ Lifehack.cfg Activated",
		"Tapt by Anti-Hack",
		"Kys 1yo autist",
		"Ало скорая тут такой случай шкiла упала в месорубку",
		"Откисай молодой!"
	},
	[3] = {
    "говори буду плохо говорить буду сосать, буду плохо сосать буду пересасывать",
	"долбаеб иди башмачки в сундучок школьный собирай",
	"ботинок ебаный чо слетел",
	"братик маме привет передай",
    "не противник",
    "а ты че клоун???",
	"я обоссал тебя (",
	"ты че там отлетел то?",
	"Я твою маму дуже сильно поважаю , нехай береже її Степан Бендера",
    "упал хуета ебаная , но в боди забрал да похуй все равно упал",
    "ливай с хвх (",
	"до связи башмак",
    "нищета глупейшая играть учись",
	"опущен сын твари",
    "нищий улетел",
	"пофикси нищ",
	"сразу видно кфг иссуе мб конфиг у меня прикупишь ?",
    "животное аддон скачай а то падаешь",
	"оттарабанен армянская королева",
	"сука не позорься и ливни",
    "улетел тапочек ебаный",
	"единицей свалился фуфлыжник",
	"Вот тебе паяльник , запаяй себе ебальник",
    "зачем ты играешь тут безмозглый", "иди кумыса попей очередняра",
	"Ты как кофе , 3 в одном - пидр , чмошник и гандон",
    "откисай сочняра",
	"АХАХА ЕБАТЬ У ТЕБЯ ЧЕРЕПНАЯ КОРОБКА ПРЯМ КАК [XML-RPC] No-Spread 24/7 | aim_ag_texture_2 ONLY!",
    "на мыло и веревку то деньги есть????",
	"ИЩИ СЕБЯ НА pornoeb.cc/so4niki",
    "свежий кабанчик",
	"до связи на подскоке кабанчик",
	"скажи маме сухарики купить долбаеб",
	"ебать ты красиво на бутылку присел , тебе дать альт ?",
	"Извини дорогая , не хотел на лицо",
    "прости что без смазки)",
	"алло это скорая? тут такая ситуация парню который упал нужна скорая)",
	"ало ты мапу лузаешь , дура очнись",
    "ЕБУЧЕСТЬ ВТОРОГО РАЗРЯДА ВЫДВИЖЕНЕЦ ОТКИС",
	"але , а противники то где???",
	"ты по легиту играешь ?",
	"ХУЕПРЫГАЛО ТУСОВОЧНОЕ КУДА ПОЛЕТЕЛО",
	"ты куда жертва козьего аборта",
    "iq?", "·٠●•۩۞۩ОтДыХаЙ (ٿ) НуБяРа۩۞۩•●٠·",
	"ты то куда лезешь сын фантомного стационарного спец изолированого металлформовочного механизма",
	"╭∩╮( ⚆ ʖ ⚆)╭∩╮ ДоПрыГался(ت)ДрУжоЧеК",
	"Тебе в ротик или на животик ?"
	},
	[4] = {

	},
	[5] = {

	},
}


AddHook("entity_killed", RandomString(), function(data)
local victim = Entity(data.entindex_killed)
local attacker = Entity(data.entindex_attacker)

    if attacker == me and attacker != victim and (victim:IsPlayer() or victim:IsBot()) then 
        if config["misc_gaysay"] then
			local csaysss = csaysss[config["misc_gaysays"]]
			
			local csay = csaysss[math.random(#csaysss)]
			if csay:find("%s") then csay = csay:format(victim:Nick()) end
			
			if DarkRP then
				csay = "/ooc " .. csay
			end
			
			RunConsoleCommand("say", csay)
        end
	end
end)

end

do
-- ======================= Sights
AddHook("HUDPaint", RandomString(), function()
    if !ss then
        if config["esp_player_sights"] then
            for _, ply in next, player.GetAll() do
                cam.Start3D(EyePos(), EyeAngles())
                    local Ang_Eye = ply:EyeAngles()
				    local trace = {}
				    trace.start = ply:GetShootPos()
				    trace.endpos = ply:GetShootPos() + Ang_Eye:Forward() * 25650
				    trace.filter = ply
				    local tr = util.TraceLine(trace)
				    render.DrawLine(tr.StartPos, tr.HitPos, string.ToColor(config.colors["esp_player_sights"]), true)
                cam.End3D()
            end
        end
	end
end)
-- ======================= Glow
AddHook("PreDrawHalos", RandomString(), function()
	if !ss then
		if config["esp_player_glow"] then
		if config["esp_player_glow_type"] == 1 then
			halo.Add(playerTable, string.ToColor(config.colors["esp_player_glow"]), 1, 1, 2, true, true)
		elseif config["esp_player_glow_type"] == 2 then
		    halo.Add(playerTable, string.ToColor(config.colors["esp_player_glow"]), 5, 5, 2, true, true)
		elseif config["esp_player_glow_type"] == 3 then
		    halo.Add(playerTable, string.ToColor(config.colors["esp_player_glow"]), 0.1, 0.1, 2, true, true)
		elseif config["esp_player_glow_type"] == 4 then
		    halo.Add(playerTable, string.ToColor(config.colors["esp_player_glow"]), 1, 1, 2, true, false)
		end
		end
		if config["esp_npc_halo"] then
		    halo.Add(ents.FindByClass( "npc_*"), string.ToColor(config.colors["esp_npc_halo"]), 1, 1, 2, true, true)
		end
	end
end)
AddHook("PreDrawHalos", RandomString(), function()
for k,v in next, player.GetAll() do
    if !ss then
	    if config["esp_attachments_glow"] then 
		local wep = v:GetActiveWeapon()
		halo.Add({wep}, string.ToColor(config.colors["esp_attachments_glow"]), 1, 1, 2, true, true)
		end
	end
end
end)
-- ======================= Chams
--FL Chams
local FakeLaggModelChams = NULL
local function CopyPoseParams(pEntityFrom, pEntityTo)
    for i = 0, pEntityFrom:GetNumPoseParameters() - 1 do
        local flMin, flMax = pEntityFrom:GetPoseParameterRange(i)
        local sPose = pEntityFrom:GetPoseParameterName(i)
        pEntityTo:SetPoseParameter(sPose, math.Remap(pEntityFrom:GetPoseParameter(sPose), 0, 1, flMin, flMax))
    end
end

local alpha2 = 1;
local plus_or_minus2 = true;
local function DrawFakeLagModel()
    local col = string.ToColor(config.colors["esp_self_fakelagchams"])
    if(FakeLaggModelChams == NULL) then
        FakeLaggModelChams = ClientsideModel(LocalPlayer():GetModel(), 1)
        FakeLaggModelChams.cs_filter = true
    end
    FakeLaggModelChams:SetNoDraw(true)
    if bSendPacket then
        FakeLaggModelChams:SetSequence(LocalPlayer():GetSequence())
        FakeLaggModelChams:SetCycle(LocalPlayer():GetCycle())
        
        FakeLaggModelChams:SetModel(LocalPlayer():GetModel())
        FakeLaggModelChams:SetPos(LocalPlayer():GetPos())
        
        CopyPoseParams(LocalPlayer(),FakeLaggModelChams)
        
        FakeLaggModelChams:InvalidateBoneCache()
        FakeLaggModelChams:SetRenderAngles(Angle(0, LocalPlayer():GetAngles().y, 0))
    end
    cam.Start3D()
        if(FakeLaggModelChams:IsValid()) then
            render.SuppressEngineLighting(true)     
            FakeLaggModelChams:SetRenderMode(RENDERMODE_TRANSALPHA)
            render.MaterialOverride(Material("models/shiny"))
            render.SetColorModulation( col.r/255,col.g/255,col.b/255)

            if alpha2 <= 0 then
                plus_or_minus2 = !plus_or_minus2;
            elseif alpha2 >= 0.5 then
                plus_or_minus2 = !plus_or_minus2;
            end
            if plus_or_minus2 then
                alpha2 = alpha2 - 0.005
            else
                alpha2 = alpha2 + 0.005
            end
            alpha2 = math.Clamp(alpha2, 0, 0.5);
    
            render.SetBlend(alpha2)

            FakeLaggModelChams:DrawModel()

            render.SetBlend(1)

            render.SetColorModulation( 1,1,1 )

            render.SuppressEngineLighting(false) 
        end
    cam.End3D()
end

fakeanglesss = Angle(0,0,0)
AntiAimAngle = Angle(0,0,0)
AntiAimFakeAngle = Angle(0,0,0)
fakeModelChams = NULL
fakeAAModelChams = NULL
FakeLaggModelChams = NULL
local function CopyPoseParams(pEntityFrom, pEntityTo)
    for i = 0, pEntityFrom:GetNumPoseParameters() - 1 do
        local flMin, flMax = pEntityFrom:GetPoseParameterRange(i)
        local sPose = pEntityFrom:GetPoseParameterName(i)
        pEntityTo:SetPoseParameter(sPose, math.Remap(pEntityFrom:GetPoseParameter(sPose), 0, 1, flMin, flMax))
    end
end
function DrawFakeAngle()
    if(fakeModelChams == NULL) then
        fakeModelChams = ClientsideModel(LocalPlayer():GetModel(), 1)
        fakeModelChams.cs_filter = true
    end
    fakeModelChams:SetNoDraw(true)
    fakeModelChams:SetSequence(LocalPlayer():GetSequence())
    fakeModelChams:SetCycle(LocalPlayer():GetCycle())
        
    fakeModelChams:SetModel(LocalPlayer():GetModel())
    fakeModelChams:SetPos(LocalPlayer():GetPos())
        
    CopyPoseParams(LocalPlayer(), fakeModelChams)

    fakeModelChams:SetPoseParameter("aim_pitch", AntiAimAngle.x)
    fakeModelChams:SetPoseParameter("head_pitch", AntiAimAngle.x)
    fakeModelChams:SetPoseParameter("head_yaw", AntiAimAngle.y)
    fakeModelChams:SetPoseParameter("aim_yaw", AntiAimAngle.y)
        
    fakeModelChams:InvalidateBoneCache()
    fakeModelChams:SetRenderAngles(Angle(0, AntiAimAngle.y, 0))
    cam.Start3D()
        if(fakeModelChams:IsValid()) then
            render.SuppressEngineLighting(true)     
            fakeModelChams:SetRenderMode(RENDERMODE_TRANSALPHA)
            render.MaterialOverride()
            render.SetColorModulation(0,255,0)

            render.SetBlend(200)

            fakeModelChams:DrawModel()

            render.SetBlend(1)

            render.SetColorModulation( 1,1,1 )

            render.SuppressEngineLighting(false) 
        end
    cam.End3D()
end
local alpha = 1;
local plus_or_minus = true;
function DrawFakeAAAngle()
    if(fakeAAModelChams == NULL) then
        fakeAAModelChams = ClientsideModel(LocalPlayer():GetModel(), 1)
        fakeAAModelChams.cs_filter = true
    end
    fakeAAModelChams:SetNoDraw(true)
    fakeAAModelChams:SetSequence(LocalPlayer():GetSequence())
    fakeAAModelChams:SetCycle(LocalPlayer():GetCycle())
        
    fakeAAModelChams:SetModel(LocalPlayer():GetModel())
    fakeAAModelChams:SetPos(LocalPlayer():GetPos())
        
    CopyPoseParams(LocalPlayer(),fakeAAModelChams)

    fakeAAModelChams:SetPoseParameter("aim_pitch", AntiAimFakeAngle.x)
    fakeAAModelChams:SetPoseParameter("head_yaw", AntiAimFakeAngle.y)
    fakeAAModelChams:SetPoseParameter("head_pitch", AntiAimFakeAngle.x)
    fakeAAModelChams:SetPoseParameter("aim_yaw", AntiAimFakeAngle.y)
        
    fakeAAModelChams:InvalidateBoneCache()
    fakeAAModelChams:SetRenderAngles(Angle(0, AntiAimFakeAngle.y, 0))
    cam.Start3D()
        if(fakeAAModelChams:IsValid()) then
            render.SuppressEngineLighting(true)     
            fakeAAModelChams:SetRenderMode(RENDERMODE_TRANSALPHA)
            render.MaterialOverride(chamsHMaterialZ)
            render.SetColorModulation(255,0,0)

            if alpha <= 0 then
                plus_or_minus = !plus_or_minus;
            elseif alpha >= 0.5 then
                plus_or_minus = !plus_or_minus;
            end
            if plus_or_minus then
                alpha = alpha - 0.005
            else
                alpha = alpha + 0.005
            end
            alpha = math.Clamp(alpha, 0, 0.5);
    
            render.SetBlend(alpha)

            fakeAAModelChams:DrawModel()

            render.SetBlend(1)

            render.SetColorModulation( 1,1,1 )

            render.SuppressEngineLighting(false) 
        end
    cam.End3D()
end

AddHook("RenderScreenspaceEffects", RandomString(), function()

	local colorFix = (1 / 255)
	if config["esp_player_chams_hsv"] then  
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	chamColVis = Color(hsv.r,hsv.g,hsv.b)
	else
	chamColVis = string.ToColor(config.colors["esp_player_chams"])
	end
	chamSelf = string.ToColor(config.colors["esp_self_chams"])
	chamVWep = string.ToColor(config.colors["esp_attachments_chams"])
	chamSelfWep = string.ToColor(config.colors["esp_self_chams_wep"])
	local chamColOver = string.ToColor(config.colors["esp_player_chams_overlay"])
	local chamColInvis = string.ToColor(config.colors["esp_player_chams_xyz"])
	chamColInvis.a = math.Clamp(chamColInvis.a, 0, 254)
	local chamMatVis = config["esp_player_chams_material"]
	local chamMatOver = config["esp_player_overlay_chams_material"]
	local chamsMatInvis = config["esp_player_xyz_chams_material"]


	if ss && !config["esp_player_drawmodel"] then
		cam.Start3D( EyePos(), EyeAngles() )
			for k, v in ipairs(ents.GetAll()) do
				if IsValid(v) then
					render.MaterialOverride()
					cam.IgnoreZ(false)
					v:SetRenderMode(0)
					v:SetColor(color_white)
					v:DrawModel()
				end
			end
		cam.End3D()
		return
	end

	if config["esp_player_chams_xyz"] then
		cam.Start3D( EyePos(), EyeAngles() )
			for k, v in ipairs(player.GetAll()) do	
				if ValidateESP(v) then
					cam.IgnoreZ(true)
					render.SetColorModulation( chamColInvis.r * colorFix, chamColInvis.g * colorFix, chamColInvis.b * colorFix )
					render.SetBlend( chamColInvis.a * colorFix)
					render.MaterialOverride(Material(chamsMatInvis))
					v:SetRenderMode(1)
					v:DrawModel()
					cam.IgnoreZ(false)
					render.SetColorModulation(1, 1, 1)
					render.SetBlend(1)
					render.MaterialOverride()
					v:DrawModel()
				end
			end
		cam.End3D()
	end
	if config["esp_player_chams"] then
		cam.Start3D( EyePos(), EyeAngles() )
			for k, v in ipairs(player.GetAll()) do
				if ValidateESP(v) then
					render.SetColorModulation( chamColVis.r * colorFix, chamColVis.g * colorFix, chamColVis.b * colorFix )
					render.SetBlend( chamColVis.a * colorFix)
					render.MaterialOverride(Material(chamMatVis))
					v:SetRenderMode(1)
					v:SetColor(Color(255, 255, 255, 0))
					v:DrawModel()
				end
			end
		cam.End3D()
	end
	if config["esp_player_chams_overlay"] then
		cam.Start3D( EyePos(), EyeAngles() )
			for k, v in ipairs(player.GetAll()) do
				if ValidateESP(v) then
					render.SetColorModulation( chamColOver.r * colorFix, chamColOver.g * colorFix, chamColOver.b * colorFix )
					render.SetBlend( chamColOver.a * colorFix)
					render.MaterialOverride(Material(chamMatOver))
					v:SetRenderMode(1)
					v:DrawModel()
				end
			end
		cam.End3D()
	end
	if !config["esp_player_chams"] && !config["esp_player_chams_xyz"] then
		for k, v in pairs(player.GetAll()) do
			v:SetRenderMode(0)
		end
	end
    if config["esp_self_fakelagchams"] && config["bsp_fake_lags"] && LocalPlayer():GetVelocity():Length() > 50 then DrawFakeLagModel() end
	if config["fa_chams"] then DrawFakeAngle() end
    if config["aa_chams"] then DrawFakeAAAngle() end
end)




end

-- ======================= Fog

do

AddHook("SetupWorldFog", RandomString(), function()
	if !ss then
		if config["esp_other_fog"] then
			local col = string.ToColor(config.colors["esp_other_fog"])

			render.FogMode( MATERIAL_FOG_LINEAR )
			render.FogStart(config["esp_other_fog_start"])
			render.FogEnd(config["esp_other_fog_end"])
			render.FogMaxDensity(config["esp_other_fog_density"])
			render.FogColor(col.r, col.g, col.b)

			return true
		end
	end
end)

AddHook("SetupSkyboxFog", RandomString(), function( skyboxscale )
	if !ss then
		if config["esp_other_fog"] then

			local col = string.ToColor(config.colors["esp_other_fog"])

			render.FogMode( MATERIAL_FOG_LINEAR )
			render.FogStart(config["esp_other_fog_start"] * skyboxscale)
			render.FogEnd(config["esp_other_fog_end"] * skyboxscale)
			render.FogMaxDensity(config["esp_other_fog_density"])
			render.FogColor(col.r, col.g, col.b)

			return true
		end
	end
end)

-- ======================= Modulation

local OldWorldModState, OldWorldModColor, OldPropModState, OldPropModColor, LastFrameSS = config["esp_other_worldmod"], config.colors["esp_other_worldmod"], config["esp_other_propmod"], config.colors["esp_other_propmod"], false
local OldFontSize1, OldFontSize2, OldFont, OldFont2 = config["name_font_size"], config["flags_font_size"], config["name_font"], config["flag_font"]

local function UpdateWorldModulation()

	local col = string.ToColor(config.colors["esp_other_worldmod"])

	for k, v in pairs( Entity( 0 ):GetMaterials() ) do
   		Material( v ):SetVector( "$color", Vector(col.r * (1 / 255), col.g * (1 / 255), col.b * (1 / 255)) )
   		Material( v ):SetFloat( "$alpha", col.a * (1 / 255) )
	end

end

local function UpdatePropModulation()

	local col = string.ToColor(config.colors["esp_other_propmod"])

	for k, v in pairs(ents.FindByClass("prop_physics")) do
		v:SetRenderMode( RENDERMODE_TRANSCOLOR )
		v:SetColor(col)
	end

end

AddHook("Think", RandomString(), function()

	if ss then 
		if config["esp_other_worldmod"] then
			DisableWorldModulation()
		end
		if config["esp_other_propmod"] then
			DisablePropModulation()
		end
		LastFrameSS = true
	end
	if LastFrameSS then
		if config["esp_other_worldmod"] then
			UpdateWorldModulation()
		end
		if config["esp_other_propmod"] then
			UpdatePropModulation()
		end
		LastFrameSS = false
	end

	if OldWorldModState != config["esp_other_worldmod"] && config["esp_other_worldmod"] then
		UpdateWorldModulation()
		OldWorldModState, OldWorldModColor = config["esp_other_worldmod"], config.colors["esp_other_worldmod"]
	elseif OldWorldModState != config["esp_other_worldmod"] && !config["esp_other_worldmod"] then
		DisableWorldModulation()
		OldWorldModState, OldWorldModColor = config["esp_other_worldmod"], config.colors["esp_other_worldmod"]
	end
	if OldWorldModColor != config.colors["esp_other_worldmod"] && config["esp_other_worldmod"] then
		UpdateWorldModulation()
		OldWorldModState, OldWorldModColor = config["esp_other_worldmod"], config.colors["esp_other_worldmod"]
	end

	if OldPropModState != config["esp_other_propmod"] && config["esp_other_propmod"] then
		UpdatePropModulation()
		OldPropModState, OldPropModColor = config["esp_other_propmod"], config.colors["esp_other_propmod"]
	elseif OldPropModState != config["esp_other_propmod"] && !config["esp_other_propmod"] then
		DisablePropModulation()
		OldPropModState, OldPropModColor = config["esp_other_propmod"], config.colors["esp_other_propmod"]
	end
	if OldPropModColor != config.colors["esp_other_propmod"] && config["esp_other_propmod"] then
		UpdatePropModulation()
		OldPropModState, OldPropModColor = config["esp_other_propmod"], config.colors["esp_other_propmod"]
	end

	if ( OldFontSize1 != config["name_font_size"] ) or ( OldFont != config["name_font"] ) then
		UpdateNameFont()
		OldFontSize1, OldFont = config["name_font_size"], config["name_font"]
	end
	if ( OldFontSize2 != config["flags_font_size"] ) or ( OldFont2 != config["flag_font"] ) then
		UpdateFlagFont()
		OldFontSize2, OldFont2 = config["flags_font_size"], config["flag_font"]
	end
	
end)

if config["esp_other_worldmod"] then
	UpdateWorldModulation()
end
if config["esp_other_propmod"] then
	UpdatePropModulation()
end

--=================================== No Sky
AddHook("PreDrawSkyBox", RandomString(), function()
	if config["esp_other_nosky"] then
		return true
	else
		return false
	end
end)
AddHook("PostDraw2DSkyBox", RandomString(), function()
if config["esp_other_skyboxrect"] then
render.OverrideDepthEnable( true, false )
cam.Start2D()
color = string.ToColor(config.colors["esp_other_skyboxrect"])
surfSetDrawColor(color.r, color.g, color.b)
surfDrawRect(0,0,ScrW(), ScrH())
cam.End2D()
render.OverrideDepthEnable( false, false )
end
end)
--=================================== Nightmode

AddHook("RenderScreenspaceEffects", RandomString(), function()
	if !ss then
		if config["esp_other_cc"] then
			local color_correction = {
				[ "$pp_colour_addr" ] = config["esp_other_cc_addr"] * (1 / 255),
				[ "$pp_colour_addg" ] = config["esp_other_cc_addg"] * (1 / 255),
				[ "$pp_colour_addb" ] = config["esp_other_cc_addb"] * (1 / 255),
				[ "$pp_colour_brightness" ] = -0.2,
				[ "$pp_colour_contrast" ] = config["esp_other_cc_scale"],
				[ "$pp_colour_colour" ] = config["esp_other_cc_color"],
				[ "$pp_colour_mulr" ] = config["esp_other_cc_mulr"],
				[ "$pp_colour_mulg" ] = config["esp_other_cc_mulg"],
				[ "$pp_colour_mulb" ] = config["esp_other_cc_mulrb"]
			}
			DrawColorModify( color_correction )
		end
	end
end)

--=================================== Bloom

AddHook("RenderScreenspaceEffects", RandomString(), function()
	DrawBloom(0.45, config["esp_other_bloom"] * 4, 9, 9, 1, 1, 1, 1, 1 )
end)

--=================================== Hitsound

--"Classic", "Bell", "Bubble", "Rust", "Fatality", "Nice Shot", "Neverlose", "Metallic", "Stapler", "Skeet", "COD"
AddHook("ScalePlayerDamage", RandomString(), function(ply, group, dmginfo)
	if config["esp_other_hitsound"] then
		if dmginfo:GetAttacker() == LocalPlayer() then
		    if config["esp_hitsound_sound"] == 1 then
			surface.PlaySound("phx/hmetal1.wav")
		    elseif config["esp_hitsound_sound"] == 2 then
			surface.PlaySound("bell.wav")
			elseif config["esp_hitsound_sound"] == 3 then
			surface.PlaySound("bubble.wav")
			elseif config["esp_hitsound_sound"] == 4 then
			surface.PlaySound("rustheadshot.wav")
			elseif config["esp_hitsound_sound"] == 5 then
			surface.PlaySound("bot/good_one.wav")
			elseif config["esp_hitsound_sound"] == 6 then
			surface.PlaySound("killsound.wav")
			elseif config["esp_hitsound_sound"] == 7 then
			surface.PlaySound("never.wav")
			elseif config["esp_hitsound_sound"] == 8 then
			surface.PlaySound("metallic.wav")
			elseif config["esp_hitsound_sound"] == 9 then
			surface.PlaySound("stapler.wav")
			elseif config["esp_hitsound_sound"] == 10 then
			surface.PlaySound("skeet.wav")
			elseif config["esp_hitsound_sound"] == 11 then
			surface.PlaySound("common/stuck1.wav")
			end
		end
	end
end)

--=================================== Fullbright


local LightingModeChanged = false
AddHook("PreRender", RandomString(), function()
	if !ss then
		if config["esp_other_fullbright"] then
			render.SetLightingMode( 1 )
			LightingModeChanged = true
		end
	end
end )

local function EndOfLightingMod()
	if LightingModeChanged then
		render.SetLightingMode( 0 )
		LightingModeChanged = false
	end
end
AddHook("PostRender", RandomString(), EndOfLightingMod)
AddHook("PreDrawHUD", RandomString(), EndOfLightingMod)

end

local Crimwalk

do

local crimwalkcombos = {
	
}

local holdtypes = {
	low = {
		{"ar2", 4}, {"smg", 4}, {"shotgun", 3}, {"crossbow", 3},
		{"pistol", 5}, {"revolver", 4}, {"physgun", 2}, {"melee", 3},
		{"grenade", 4}, {"rpg", 1}, {"camera", 4}
	},
	high = {
		{"ar2", 3}, {"smg", 3}, {"shotgun", 3}, {"crossbow", 3},
		{"pistol", 4}, {"revolver", 5}, {"physgun", 2}, {"melee", 5},
		{"grenade", 5}, {"rpg", 5}, {"camera", 4}
	}
}

local angles = {
	{89, -89},
	{180.00000762939, -180},
	{89, -180},
	{180.00000762939, 180.00008},
	{89, 180.00008}
}

local function AddCombo(q, a1, a2, h1, h2)
	crimwalkcombos[#crimwalkcombos + 1] = {
		q = q,
		a1 = a1, a2 = a2,
		h1 = h1, h2 = h2
	}
end


for i = 1, #holdtypes.low do
	local hl = holdtypes.low[i]
	for j = 1, #holdtypes.high do
		local hj = holdtypes.high[j]
		for k = 1, #angles do
			local a = angles[k]
			AddCombo(hl[2] + hj[2], a[1], a[2], hl[1], hj[1])
		end
	end
end

local function GetCrimwalk()
	local weaps = me:GetWeapons()
	local holdtypes = {}
	
	for i = 1, #weaps do
		local weap = weaps[i]
		local weapht = weap:GetHoldType()
		
		if !holdtypes[weapht] then
			holdtypes[weapht] = {weap}
			continue
		end
		
		local ht = holdtypes[weapht]
		ht[#ht + 1] = weap
	end
	
	local available = {}
	
	for i = 1, #crimwalkcombos do
		local v = crimwalkcombos[i]
		local h1, h2 = v.h1, v.h2
		
		if !holdtypes[h1] or !holdtypes[h2] then
			continue
		end
		
		available[#available + 1] = v
	end
	
	local qmax = 0
	for i = 1, #available do
		local q = available[i].q
		if q > qmax then
			qmax = q
		end
	end
	
	local bestcrimwalks = {}
	local bestq = 0
	
	for i = 1, #available do
		local v = available[i]
		
		if v.q == qmax then
			local weaps1 = holdtypes[v.h1]
			local weaps2 = holdtypes[v.h1]
			
			v.w1 = weaps1[mrandom(#weaps1)]
			v.w2 = weaps2[mrandom(#weaps2)]
			
			bestcrimwalks[#bestcrimwalks + 1] = v
			bestq = v.q
		end
	end
	
	return bestcrimwalks
end

local ci, nextchange = 1, 0
function Crimwalk(cmd)
	local crimwalks = GetCrimwalk()
	
	if #crimwalks == 0 then return end
	
	if CurTime() > nextchange then
		ci = mrandom(1, #crimwalks)
		nextchange = CurTime() + 0.3
	end
	
	if ci > #crimwalks then
		ci = mrandom(1, #crimwalks)
	end
	
	local cw = crimwalks[ci]
	
	cmd:SelectWeapon(cmd:CommandNumber() % 2 == 0 and cw.w1 or cw.w2)
	cmd:SetViewAngles(Angle(cmd:CommandNumber() % 2 == 0 and cw.a1 or cw.a2, GetPlayerYawInv() - (mrandom(0, 1) == 0 and -45 or 45), 0))
	
	if cmd:CommandNumber() % 2 == 0 then
		cmd:SetButtons(bit.bor(cmd:GetButtons(), IN_DUCK))
	end
	
	if cmd:CommandNumber() % 4 == 0 then
		local vel = me:GetVelocity()
		local spd = vel:Length2D()
		local dir = vel:Angle()
		
		dir.y = cmd:GetViewAngles().y - dir.y
		
		local negDir = dir:Forward() * -spd

		cmd:SetForwardMove(negDir.x)
		cmd:SetSideMove(negDir.y)
	end
end

end

do

AddHook("CalcView", RandomString(), function(ply, pos, ang, fov, origin )
	if ss then return end
	
	if config["esp_other_freecam"] && NoclipOn then
		local inspeed, infw, inback, inleft, inright = input.GetKeyCode(input.LookupBinding("+speed")), input.GetKeyCode(input.LookupBinding("+forward")), input.GetKeyCode(input.LookupBinding("+back")), input.GetKeyCode(input.LookupBinding("+moveleft")), input.GetKeyCode(input.LookupBinding("+moveright"))
		-- Had to do it like this instead of LocalPlayer():KeyDown(IN_FORWARD) etc because for some reason that would get stuck on true sometimes after moving and then toggeling, cba to figure it out so this works as a fix.
		local Camera = {}
		local Speed = config["esp_other_freecam_speed"]
		local MouseAngs = Angle( NoclipY, NoclipX, 0 )
		if input.IsKeyDown(inspeed) then
			Speed = Speed * 5
		end
		if input.IsKeyDown(infw) then
			NoclipPos = NoclipPos+(MouseAngs:Forward()*Speed)
		end
		if input.IsKeyDown(inback) then
			NoclipPos = NoclipPos-(MouseAngs:Forward()*Speed)
		end
		if input.IsKeyDown(inleft) then
			NoclipPos = NoclipPos-(MouseAngs:Right()*Speed)
		end
		if input.IsKeyDown(inright) then
			NoclipPos = NoclipPos+(MouseAngs:Right()*Speed)
		end
		if NoclipJump then
			NoclipPos = NoclipPos+Vector(0,0,Speed)
		end
		if NoclipDuck then
			NoclipPos = NoclipPos-Vector(0,0,Speed)
		end
		Camera.origin = NoclipPos
		Camera.angles = MouseAngs
		Camera.fov = FOV
		Camera.drawviewer = true
		return Camera
	end
	
	if config["esp_other_thirdperson"] && intp && !config["esp_other_thirdperson_walldetect"] then
		local Camera = {}
		Camera.origin = pos - ( ang:Forward() * (config["esp_other_thirdperson_distance"] * 10) ) 
		Camera.angles = ang
		Camera.fov = fov
		Camera.drawviewer = true
		return Camera
	end
	
	if !intp && !NoclipOn then
		local Camera = {}
		if config["misc_fov"] then
			Camera.fov = config["misc_fov_value"]
		end
		if config["aim_norecoil"] then
			Camera.angles = LocalPlayer():EyeAngles()
		end
		return Camera
	end
end)



local function scopeAiming()
	local wep = LocalPlayer():GetActiveWeapon()
	return IsValid(wep) && input.IsMouseDown(MOUSE_RIGHT) 
end
AddHook('ShouldDrawLocalPlayer', 'ThirdPersonDrawPlayer', function()
	if config["esp_other_thirdperson_walldetect"] && intp then
		return ((not LocalPlayer():InVehicle()) and (not scopeAiming()))	
	end
end)
local camOffset = {
	UD = 0, 
	RL = 0, 
	FB = -(config["esp_other_thirdperson_distance"] * 15)
}
AddHook('CalcView', RandomString(), function (pl, origin, ang, fov)
if !config["esp_other_thirdperson"] && intp && config["esp_other_thirdperson_walldetect"] && !scopeAiming() then
	return {
		origin = util.TraceLine({
			start = origin,
			endpos = origin + (ang:Up() * camOffset.UD) + (ang:Right() * camOffset.RL) + (ang:Forward() * camOffset.FB),
			filter = pl,
				
		}).HitPos + (ang:Forward() * 16),
		angles = ang,
		fov = fov
	}
end
end)
 
local OEyeAngles = OEyeAngles or FindMetaTable( "Player" ).SetEyeAngles

FindMetaTable( "Player" ).SetEyeAngles = function( self, angle )

    if ( string.find( string.lower( debug.getinfo( 2 ).short_src ), "/weapons/" ) ) and config["aim_norecoil"] then return end

    OEyeAngles( self, angle )

end

end

--=================================== CreateMove (Aimbot, Triggerbot, BHop, AutoStrafe, Autofire, Misc Calcs)

do

local predictedWeapons = {
	["weapon_crossbow"] = 3110
}

local pred, realAng

local function FixMovement(cmd, fa)
	if config["movement_fix"] == 1 then
	
	local vec = Vector(cmd:GetForwardMove(), cmd:GetSideMove(), 0)
	local vel = math.sqrt(vec.x * vec.x + vec.y * vec.y)
	local mang = vec:Angle()
	local yaw = cmd:GetViewAngles().y - fa.y + mang.y

	if ( ( cmd:GetViewAngles().p + 90 ) % 360 ) > 180 then
		yaw = 180 - yaw
	end
	yaw = ( ( yaw + 180 ) % 360 ) - 180
	cmd:SetForwardMove( math.cos( math.rad( yaw ) ) * vel )
	cmd:SetSideMove( math.sin( math.rad( yaw ) ) * vel )
	
    elseif config["movement_fix"] == 2 then
	
    vec = Vector( cmd:GetForwardMove(), cmd:GetSideMove(), cmd:GetUpMove() )
    vel = math.sqrt( vec.x * vec.x + vec.y * vec.y )
    mang = vec:Angle()
    yaw = math.rad( cmd:GetViewAngles().y - fa.y + mang.y )
    cmd:SetForwardMove( (math.cos(yaw) * vel) * 1 )
    cmd:SetSideMove( math.sin(yaw) * vel )
	
    end
end

local function GetAngleDiffrence(from, to)

	local ang, aim

	ang = from:Forward()
	aim = to:Forward()

	return math.deg( math.acos( aim:Dot(ang) / aim:LengthSqr() ) )

end

local function HitScan(v)
	local bones = {}
	local centerx, centery = ScrW() / 2, ScrH() / 2
	local BPHead, BPUpperChest, BPChest, BPLowerChest, BPPelvis, HeadDis, UpperChestDis, ChestDis, LowerChestDis, PelvisDis

	if v:LookupBone("ValveBiped.Bip01_Head1") != nil then
		BPHead = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Head1"))
		HeadDis = math.sqrt((centerx - BPHead:ToScreen().x) * (centerx - BPHead:ToScreen().x) + (centery - BPHead:ToScreen().y) * (centery - BPHead:ToScreen().y))
		table.insert(bones, HeadDis)
	end
	if v:LookupBone("ValveBiped.Bip01_Spine4") != nil then
		BPUpperChest = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Spine4"))
		UpperChestDis = math.sqrt((centerx - BPUpperChest:ToScreen().x) * (centerx - BPUpperChest:ToScreen().x) + (centery - BPUpperChest:ToScreen().y) * (centery - BPUpperChest:ToScreen().y))
		table.insert(bones, UpperChestDis)
	end
	if v:LookupBone("ValveBiped.Bip01_Spine2") != nil then
		BPChest = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Spine2"))
		ChestDis = math.sqrt((centerx - BPChest:ToScreen().x) * (centerx - BPChest:ToScreen().x) + (centery - BPChest:ToScreen().y) * (centery - BPChest:ToScreen().y))
		table.insert(bones, ChestDis)
	end
	if v:LookupBone("ValveBiped.Bip01_Spine1") != nil then
		BPLowerChest = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Spine1"))
		LowerChestDis = math.sqrt((centerx - BPLowerChest:ToScreen().x) * (centerx - BPLowerChest:ToScreen().x) + (centery - BPLowerChest:ToScreen().y) * (centery - BPLowerChest:ToScreen().y))
		table.insert(bones, LowerChestDis)
	end
	if v:LookupBone("ValveBiped.Bip01_Pelvis") != nil then
		BPPelvis = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Pelvis"))
		PelvisDis = math.sqrt((centerx - BPPelvis:ToScreen().x) * (centerx - BPPelvis:ToScreen().x) + (centery - BPPelvis:ToScreen().y) * (centery - BPPelvis:ToScreen().y))
		table.insert(bones, PelvisDis)
	end

	if table.IsEmpty(bones) then return v:LocalToWorld(v:OBBCenter()) + pred end

	local ClosestBone = math.min(unpack(bones))
	if ClosestBone == HeadDis then
		AimSpot = BPHead + Vector(0, 0, 1) + pred
		AimBone = "Head"
	elseif ClosestBone == UpperChestDis then
		AimSpot = BPUpperChest + pred
		AimBone = "Upper Chest"
	elseif ClosestBone == ChestDis then
		AimSpot = BPChest + pred
		AimBone = "Chest"
	elseif ClosestBone == LowerChestDis then
		AimSpot = BPLowerChest + pred
		AimBone = "Lower Chest"
	elseif ClosestBone == PelvisDis then
		AimSpot = BPPelvis + pred
		AimBone = "Pelvis"
	else
		AimSpot = v:LocalToWorld(v:OBBCenter()) + pred
	end	
	return AimSpot
end

local function Prediction(v, pos)
	local ply = LocalPlayer()
	if ( type( v:GetVelocity() ) == "Vector" ) then
		local dis, wep = v:GetPos():Distance( ply:GetPos() ), ( ply.GetActiveWeapon && IsValid( ply:GetActiveWeapon() ) && ply:GetActiveWeapon():GetClass() )
		if ( wep && predictedWeapons[ wep ]  ) then
			local t = dis / predictedWeapons[ wep ]
			return ( pos + v:GetVelocity() * t )
		end
		return pos
	end
	return pos
end

local function isVisible( v )
	if !config["aim_ignoreinvis"] then
		return true
	end
	--if !dop or !ply  or !pos then return true end
	local ply = LocalPlayer()	
	local pos = v:LocalToWorld(v:OBBCenter())	
	if config["aim_hitbox"] == 1 then     
	    pos = v:LocalToWorld(v:OBBCenter()) 
	elseif config["aim_hitbox"] == 2 && v:LookupBone("ValveBiped.Bip01_Head1") != nil then
	    pos = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Head1")) + Vector(0,0,1) 
	elseif config["aim_hitbox"] == 3 && v:LookupBone("ValveBiped.Bip01_Pelvis") != nil then 
        pos = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Pelvis")) 
    elseif config["aim_hitbox"] == 2 && v:LookupBone("ValveBiped.Bip01_Head1") == nil then
	    pos = v:LocalToWorld(v:OBBCenter()) 
	elseif config["aim_hitbox"] == 3 && v:LookupBone("ValveBiped.Bip01_Pelvis") == nil then 
        pos = v:LocalToWorld(v:OBBCenter()) 	
	else
        pos = v:LocalToWorld(v:OBBCenter()) 
	end	
	local trace = { 
		start = ply:GetShootPos(), 
		endpos = pos, 
		filter = { ply, v }, 
		mask = MASK_SHOT
	}	
	local tr = util.TraceLine( trace )	
	if (!tr.Hit) then
		return true
    end
	return false
end

local function Smoothing( ang )
	if ( config["aim_smoothing_value"] == 0 ) then return ang end
	local speed, ply = RealFrameTime() / ( config["aim_smoothing_value"] / 10 ), LocalPlayer()
	local angl = LerpAngle( speed, ply:EyeAngles(), ang )
	return Angle( angl.p, angl.y, 0 )
end

local function AutoShoot( ucmd )
ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 1));
end
local dswing_delay = 1.2
local dswing_occur = true

local function DealySwing( ucmd )
    if dswing_occur then
	    ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 1));
	    dswing_occur = false
	    timer.Simple( dswing_delay, function() dswing_occur = true end )
    end
end

local function Micromovement( ucmd )
if config.keybinds["misc_mm_keybind"] != 0 then
if(input.IsKeyDown(config.keybinds["misc_mm_keybind"])) then
    if(input.IsKeyDown(KEY_A)) then
        ucmd:SetSideMove(-config["slowwalk_speed"]) 
    end
    if(input.IsKeyDown(KEY_D)) then
        ucmd:SetSideMove(config["slowwalk_speed"])
    end
    if(input.IsKeyDown(KEY_W)) then
        ucmd:SetForwardMove(config["slowwalk_speed"])
    end
    if(input.IsKeyDown(KEY_S)) then
        ucmd:SetForwardMove(-config["slowwalk_speed"])
    end
end
else
if(ucmd:KeyDown(IN_WALK)) then
    if(input.IsKeyDown(KEY_A)) then
        ucmd:SetSideMove(-config["slowwalk_speed"]) 
    end
    if(input.IsKeyDown(KEY_D)) then
        ucmd:SetSideMove(config["slowwalk_speed"])
    end
    if(input.IsKeyDown(KEY_W)) then
        ucmd:SetForwardMove(config["slowwalk_speed"])
    end
    if(input.IsKeyDown(KEY_S)) then
        ucmd:SetForwardMove(-config["slowwalk_speed"])
    end
end
end
end



local function One80Turn( ucmd )
    if input.IsKeyDown(config.keybinds["180turn_keybind"]) && config["misc_180turn"] then
        if !timerfix then
            LocalPlayer():SetEyeAngles(LocalPlayer():EyeAngles() - Angle(0, 180, 0))
        end
        ucmd.SetViewAngles(ucmd, LocalPlayer():EyeAngles())
        timerfix = true
        timer.Simple(1, function() timerfix = false end)
    end
end

local crouched = 0
local function FakeCrouch(cmd)
	if config["misc_fakecrouch"] then
	if em.GetMoveType(me) == MOVETYPE_NOCLIP then return end
	if me:Team() == TEAM_SPECTATOR then return end
	if not me:Alive() or me:Health() < 1 then return end
	if LocalPlayer():IsFlagSet(1024) then return end
		if me:KeyDown(IN_DUCK) then
			if crouched <= 5 then
				cmd:SetButtons(cmd:GetButtons() + IN_DUCK)
			elseif crouched >= 25 then
				crouched = 0
			end
			crouched = crouched + 1
		else
			if crouched <= 5 then
				cmd:SetButtons(cmd:GetButtons() + IN_DUCK)
			elseif crouched >= 12.5 then
				crouched = 0
			end
			crouched = crouched + 1
		end
	end
end
--local bor = bit.bor
local me = LocalPlayer()
local autostrafe_wish_dir = 0
local autostrafe_calc_dir = 0
local autostrafe_rough_dir = 0
local autostrafe_transition = false
local autostrafe_step = 0

local function GetRoughDir(base, true_dir)
	-- Make array with our four rough directions
	local minimum = {0, 180, 135, -135, 90, -90, 45, -45}
	local best_angle, best_delta = 181, 999999999

	-- Loop through our rough directions and find which one is closest to our true direction
	for i = 1, #minimum do
		local rough_dir = base.y + minimum[i]
		local delta = mabs(math.NormalizeAngle(true_dir - rough_dir))

		-- Only the smallest delta wins out
		if delta < best_delta then
			best_angle = rough_dir
			best_delta = delta
		end
	end

	return best_angle
end
local function CalcForward(ucmd)
	if mabs(ucmd:GetForwardMove()) < 1 then
		if mabs(ucmd:GetSideMove()) < 1 and mabs(ucmd:GetMouseX()) < 1 and me:IsOnGround() then
			return 10000
		else
			local mx = mabs(ucmd:GetMouseX()) * 2
			if mx == 0 then
				mx = 1
			elseif mx > 80 then
				return
			end
			
			local spd = me:GetVelocity():Length2D()
			if spd == 0 then
				spd = 1
			end
			
			return 50000 * (1 / (spd * mx))
		end
	end
end
local function CalcSide(ucmd)
	if !me:IsOnGround() and mabs(ucmd:GetSideMove()) < 1 then
		if mabs(ucmd:GetMouseX()) > 1 then
			return ucmd:GetMouseX() * 12
		else
			return ucmd:CommandNumber() % 2 == 0 and 10000 or -10000
		end
	end
end
local function DirSrafe(ucmd)
	if !ucmd:KeyDown(IN_JUMP) then return end
	if me:GetMoveType() == MOVETYPE_NOCLIP or me:GetMoveType() == MOVETYPE_LADDER or me:WaterLevel() > 1 then return end
	
	local iam = me:EyeAngles()
	
	if config["misc_autostrafe_type"] == 4 then
		if me:IsOnGround() and !ucmd:KeyDown(IN_JUMP) then
			autostrafe_wish_dir = iam.y + 0
			autostrafe_transition = false
		else
			if ucmd:KeyDown(IN_FORWARD) then
				if ucmd:KeyDown(IN_MOVELEFT) then
					autostrafe_wish_dir = iam.y + 45 -- forward left
				elseif ucmd:KeyDown(IN_MOVERIGHT) then
					autostrafe_wish_dir = iam.y + -45 -- forward right
				else
					autostrafe_wish_dir = iam.y + 0 -- forward
				end
			elseif ucmd:KeyDown(IN_BACK) then
				if ucmd:KeyDown(IN_MOVELEFT) then
					autostrafe_wish_dir = iam.y + 135 -- back left
				elseif ucmd:KeyDown(IN_MOVERIGHT) then
					autostrafe_wish_dir = iam.y + -135 -- back right
				else
					autostrafe_wish_dir = iam.y + 180 -- back
				end
			elseif ucmd:KeyDown(IN_MOVELEFT) then
				autostrafe_wish_dir = iam.y + 90 -- left
			elseif ucmd:KeyDown(IN_MOVERIGHT) then
				autostrafe_wish_dir = iam.y + -90 -- right
			else
				autostrafe_wish_dir = iam.y + 0
				
			end
		end
	else
		autostrafe_transition = false
	end
	
	local true_dir = me:GetVelocity():Angle().y
	local speed_rotation = math.min(math.deg(math.asin(30 / me:GetVelocity():Length2D())) * 0.5, 45)
	
	if config["misc_autostrafe_type"] == 4 && autostrafe_transition then
		-- Calculate the step by using our ideal strafe rotation
		local ideal_step = speed_rotation + autostrafe_calc_dir
		autostrafe_step = mabs(math.NormalizeAngle(autostrafe_calc_dir - ideal_step))

		-- Check when the calculated direction arrives close to the wish direction
		if mabs(math.NormalizeAngle(autostrafe_wish_dir - autostrafe_calc_dir)) > autostrafe_step then
			local add = math.NormalizeAngle(autostrafe_calc_dir + autostrafe_step)
			local sub = math.NormalizeAngle(autostrafe_calc_dir - autostrafe_step)

			-- Step in direction that gets us closer to our wish direction
			if mabs(math.NormalizeAngle(autostrafe_wish_dir - add)) >= mabs(math.NormalizeAngle(autostrafe_wish_dir - sub)) then
				autostrafe_calc_dir = autostrafe_calc_dir - autostrafe_step
			else
				autostrafe_calc_dir = autostrafe_calc_dir + autostrafe_step
			end
		else
			autostrafe_transition = false
		end
	elseif config["misc_autostrafe_type"] == 4 then 
		-- Get rough direction and setup calculated direction only when not transitioning
		autostrafe_rough_dir = GetRoughDir(iam, true_dir)
		autostrafe_calc_dir = autostrafe_rough_dir

		-- When we have a difference between our current (rough) direction and our wish direction, then transition
		if autostrafe_rough_dir != autostrafe_wish_dir then
			autostrafe_transition = true
		end
	else
		autostrafe_transition = false
	end
	
	if autostrafe_transition then
		ucmd:SetForwardMove(0)
		ucmd:SetSideMove(0)
		
		local movex = CalcForward(ucmd) or 0
		local movey = CalcSide(ucmd) or 0

		-- Calculate ideal rotation based on our newly calculated direction
		local direction = (ucmd:CommandNumber() % 2 == 0 and speed_rotation or -speed_rotation) + autostrafe_calc_dir

		-- Rotate our direction based on our new, defininite direction
		local rotation = math.rad(iam.y - direction)
	
		local cos_rot = math.cos(rotation)
		local sin_rot = math.sin(rotation)

		local forwardmove = (cos_rot * movex) - (sin_rot * movey)
		local sidemove = (sin_rot * movex) + (cos_rot * movey)

		-- Apply newly rotated movement
		ucmd:SetForwardMove(forwardmove)
		ucmd:SetSideMove(sidemove)
	else
		
		local fwd, side = CalcForward(ucmd), CalcSide(ucmd)
		if fwd then
			ucmd:SetForwardMove(fwd)
		end
		
		if side then
			ucmd:SetSideMove(side)
		end
	end
end

CircleStrafeVal = 0
CircleStrafeSpeed = 1
local function CircleMove(ucmd, rotation) --cmd = ucmd
	rot_cos = math.cos(rotation)
	rot_sin = math.sin(rotation)
	cur_forwardmove = ucmd:GetForwardMove()
	cur_sidemove = ucmd:GetSideMove()
	ucmd:SetForwardMove(((rot_cos * cur_forwardmove) - (rot_sin * cur_sidemove)))
	ucmd:SetSideMove(((rot_sin * cur_forwardmove) + (rot_cos * cur_sidemove)))
end
local function CircleStrafer(ucmd)
    if(input.IsKeyDown(config.keybinds["circlestrafer_key"])) then
        strafe = true
        CircleStrafeVal = CircleStrafeVal + CircleStrafeSpeed
        if((CircleStrafeVal > 0) && ((CircleStrafeVal / CircleStrafeSpeed) > 361)) then
			CircleStrafeVal = 0
	    end
        CircleMove(ucmd, math.rad((CircleStrafeVal - engine.TickInterval())))
		else
		strafing = false
		CircleStrafeVal = 0
	end
end
local function ScrollAttack(ucmd)
    if ( ucmd:GetMouseWheel() != 0 ) then ucmd:SetButtons( 1 ) end
end
local function FastSwitch(ucmd)
    local guns = LocalPlayer():GetWeapons()
    if ( ucmd:GetMouseWheel() != 0 ) then ucmd:SelectWeapon( guns ) end
end

servertime = 0

local function BulletTime()
    wep = pm.GetActiveWeapon(ply)
    if (!wep || !em.IsValid(wep) || config["aim_bullettime"]) then return(true) end
    return(servertime >= wm.GetNextPrimaryFire(wep))	
end
AddHook("Move", RandomString() , function()
    if(!IsFirstTimePredicted()) then return end
	servertime = CurTime()
end)
local cones = {};
local nullvec = Vector() * -1;
GAMEMODE["EntityFireBullets"] = function(self, p, data)
	local w = pm.GetActiveWeapon(me);
	local Spread = data.Spread * -1;
	if(!w || !em.IsValid(w) || cones[em.GetClass(w)] == Spread || Spread == nullvec) then return; end
	cones[em.GetClass(w)] = Spread;
end
local function NoRecoil(ang)
	local w = me:GetActiveWeapon()
	local c = w:GetClass()

	if c:StartWith("m9k_") then
		return ang
	else
		ang = ang - me:GetViewPunchAngles()
	end

	return ang
end
 
local function PredictSpread(cmd, ang)
    local w = LocalPlayer():GetActiveWeapon()
	local class = w:GetClass()
    if (!w || !w:IsValid() || !cones[w:GetClass()]) then return ang end
    local ang = (dickwrap.Predict(cmd, ang:Forward(), cones[w:GetClass()])):Angle()
    ang.y, ang.x = math.NormalizeAngle(ang.y), math.NormalizeAngle(ang.x)
	
    return(ang)
end

--Facestab
local function ForceBackStap( ucmd )
    --RMB
    local ent = LocalPlayer():GetEyeTrace().Entity
	local wep = LocalPlayer():GetActiveWeapon()
	target = ent
	local pose = LocalPlayer():GetEyeTrace().HitPos
	plyangle = ucmd:GetViewAngles()
        if target:IsPlayer() and pose:Distance(LocalPlayer():GetPos()) < 65 then
            bd = true
        end
    if(bd == true) then
	    if wep:IsValid() and string.find(wep:GetClass(),"csgo") and ent:IsPlayer() then		    
			target = ent
            ucmd:SetViewAngles(plyangle + Angle(45, 90 , 0))
            RunConsoleCommand("+attack2")
            timer.Simple(0.07, function() RunConsoleCommand("-attack2") end)
            timer.Simple(0.05, function() bd = false end)			
		end
    end
end
local function KnifeBotik( ucmd )
    local ent = LocalPlayer():GetEyeTrace().Entity
	local wep = LocalPlayer():GetActiveWeapon()
	target = ent
	local pose = LocalPlayer():GetEyeTrace().HitPos
    if wep:IsValid() and string.find(wep:GetClass(),"csgo") and ent:IsPlayer() then	
        if target:IsPlayer() and pose:Distance(LocalPlayer():GetPos()) < 90 then
		    ucmd:RemoveKey(bit.bor(ucmd:GetButtons(), 2048))
            ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 1))
		elseif target:IsPlayer() and pose:Distance(LocalPlayer():GetPos()) < 65 then
		    ucmd:RemoveKey(bit.bor(ucmd:GetButtons(), 1))
		    ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 2048))
        end
    end
end
local function AAS( cmd ) 
    if config["aa_enable"] then
	if(!fakeanglesss) then fakeanglesss = cmd:GetViewAngles(); end
	fakeanglesss = fakeanglesss + Angle(cmd:GetMouseY() * .023, cmd:GetMouseX() * -.023, 0);
	fakeanglesss.x = math.NormalizeAngle(fakeanglesss.x);
	fakeanglesss.p = math.Clamp(fakeanglesss.p, -89, 89);
	if(cmd:CommandNumber() == 0) then
		cmd:SetViewAngles(fakeanglesss);
		return;
    end
	end
end
local function AAFM( cmd )
    if config["aa_enable"] then
    local move = Vector( cmd:GetForwardMove(), cmd:GetSideMove(), cmd:GetUpMove() )
    local speed = math.sqrt( move.x * move.x + move.y * move.y )
    local mang = move:Angle()
    local yaw = math.rad( cmd:GetViewAngles().y - fakeanglesss.y + mang.y )
    cmd:SetForwardMove( (math.cos(yaw) * speed) * 1 )
    cmd:SetSideMove( math.sin(yaw) * speed )
	end
end
AddHook("CreateMove", RandomString(), function(ucmd)
	if config["aa_enable"] then
	    Antihit(ucmd) 
	else
	    bSendPacket = true
	end
    AAS(ucmd)
    AAFM(ucmd)
end)

AddHook("CreateMove", RandomString(), function(ucmd, world_click)
    if config["crimwalk"] then
	    if input.IsKeyDown(config.keybinds["freecam_key"]) then
	        Crimwalk(ucmd)
		end
	end
	if( config["misc_ropes"] and me:KeyDown(IN_ATTACK2)) then
        local aids = Angle(math.random(-90, 90), math.random(-180, 180), 0)
        aids:Normalize()
        ucmd:SetViewAngles(aids)
    if me:KeyDown(IN_ATTACK2) then ucmd:RemoveKey(IN_ATTACK2) end
    end
    FakeCrouch(ucmd)
    if config["aim_interp"] then
    RunConsoleCommand("cl_interp", 0)
	RunConsoleCommand("cl_updaterate", 100000)
	RunConsoleCommand("cl_interp_ratio", 0)
    else
	RunConsoleCommand("cl_interp", 1)
	RunConsoleCommand("cl_updaterate", 100000)
	RunConsoleCommand("cl_interp_ratio", 1)
    end
    if config["aim_facestab"] then
        ForceBackStap(ucmd)
	end
	if config["aim_knifebot"] then
        KnifeBotik(ucmd)
	end
	if config["aim_animknife"] then
        KnifeAnimation(ucmd)
	end
    if config["bsp_fake_lags"] then
		if config["bsp_fake_lags_conditions"] == 1 then  
            bSendPacket = (ucmd:CommandNumber() % config["bsp_fake_lags_value"]) < 3 
	    elseif config["bsp_fake_lags_conditions"] == 2 then
		    if LocalPlayer():GetVelocity():Length() > 50 then
		        bSendPacket = (ucmd:CommandNumber() % config["bsp_fake_lags_value"]) < 3
			end
		elseif config["bsp_fake_lags_conditions"] == 3 then
		    if LocalPlayer():GetVelocity():Length() < 20 then
		        bSendPacket = (ucmd:CommandNumber() % config["bsp_fake_lags_value"]) < 3
			end
		elseif config["bsp_fake_lags_conditions"] == 4 then
		    if LocalPlayer():IsOnGround() then
		        bSendPacket = (ucmd:CommandNumber() % config["bsp_fake_lags_value"]) < 3
		    end
		elseif config["bsp_fake_lags_conditions"] == 5 then
		    if !LocalPlayer():IsOnGround() then
		        bSendPacket = (ucmd:CommandNumber() % config["bsp_fake_lags_value"]) < 3
		    end
		elseif config["bsp_fake_lags_conditions"] == 6 then
		    if ucmd:KeyDown(IN_ATTACK) then
		        bSendPacket = (ucmd:CommandNumber() % config["bsp_fake_lags_value"]) < 3
		    end
		elseif config["bsp_fake_lags_conditions"] == 7 then
		    if !ucmd:KeyDown(IN_ATTACK) then
		        bSendPacket = (ucmd:CommandNumber() % config["bsp_fake_lags_value"]) < 3
		    end
	    end
    end
    if config["antihit_fd"] then
        if input.IsKeyDown(config.keybinds["antihit_fd_key"]) then
	        if !bSendPacket then
                RunConsoleCommand("-duck")
            elseif bSendPacket then
                RunConsoleCommand("+duck")
            end	    
		end
    end
	if config["aim_silent"] == 2 then
	    if(!realAng) then realAng = ucmd:GetViewAngles(); end
	    realAng = realAng + Angle(ucmd:GetMouseY() * .023, ucmd:GetMouseX() * -.023, 0);
	    realAng.x = math.NormalizeAngle(realAng.x);
	    realAng.p = math.Clamp(realAng.p, -89, 89);
	    if(ucmd:CommandNumber() == 0) then
		    ucmd:SetViewAngles(realAng);
		    return;
        end
	end
	if config["misc_scrollattack"] then
	ScrollAttack(ucmd)
	end
	
	if config["misc_fastswitch"] then
	FastSwitch(ucmd)
	end
	
	if config["misc_m9kstopper"] then
	    if IsValid(me:GetActiveWeapon()) and me:GetActiveWeapon():GetClass():StartWith("m9k_") and ucmd:KeyDown(IN_SPEED) and AimP then
			ucmd:RemoveKey(IN_SPEED)
		end
	end
	if config["esp_other_freecam"] then
		if config.keybinds["freecam_key"] == 0 then 
			NoclipOn = true
		elseif ( ( ( config.keybinds["freecam_key"] >= 107 && config.keybinds["freecam_key"] <= 113 ) && input.IsMouseDown(config.keybinds["freecam_key"] ) && !toggledelayN ) || input.IsKeyDown(config.keybinds["freecam_key"]) && !toggledelayN ) then
			if NoclipOn then	
				NoclipOn = false
				toggledelayN = true
				timer.Simple(0.5, function() toggledelayN = false end)
			else
				NoclipOn = true
				NoclipPos, NoclipAngles = LocalPlayer():EyePos(), ucmd:GetViewAngles()
				NoclipY, NoclipX = ucmd:GetViewAngles().x, ucmd:GetViewAngles().y
				toggledelayN = true
				timer.Simple(0.5, function() toggledelayN = false end)
			end
		end
		if NoclipOn then
			ucmd:ClearMovement()
			if ucmd:KeyDown(IN_JUMP) then
				ucmd:RemoveKey(IN_JUMP)
				NoclipJump = true
			elseif NoclipJump then
				NoclipJump = false
			end
			if ucmd:KeyDown(IN_DUCK) then
				ucmd:RemoveKey(IN_DUCK)
				NoclipDuck = true
			elseif NoclipDuck then
				NoclipDuck = false
			end
			NoclipX = NoclipX-(ucmd:GetMouseX()/10)
			if NoclipY+(ucmd:GetMouseY()/10) > 89 then NoclipY = 89 elseif NoclipY+(ucmd:GetMouseY()/10) < -89 then NoclipY = -89 else NoclipY = NoclipY+(ucmd:GetMouseY()/10) end
			ucmd:SetViewAngles(NoclipAngles)
		end
	elseif NoclipOn == true then
		NoclipOn = false
	end

	if config["esp_other_thirdperson"] || config["esp_other_thirdperson_walldetect"] then
		if config.keybinds["thirdperson_key"] == 0 then 
			intp = true
		elseif ( ( ( config.keybinds["thirdperson_key"] >= 107 && config.keybinds["thirdperson_key"] <= 113 ) && input.IsMouseDown(config.keybinds["thirdperson_key"] ) && !toggledelay3 || input.IsKeyDown(config.keybinds["thirdperson_key"]) && !toggledelay3 ) ) then
			intp = !intp
			toggledelay3 = true
			timer.Simple(0.5, function() toggledelay3 = false end)
		end
	end
	if ( frame ) && not gui.IsConsoleVisible() && not gui.IsGameUIVisible() && not editingText && not NoclipOn then
		local ply = LocalPlayer()
		local f, b, l, r, j, d = input.GetKeyCode(input.LookupBinding("+forward")), input.GetKeyCode(input.LookupBinding("+back")), input.GetKeyCode(input.LookupBinding("+moveleft")), input.GetKeyCode(input.LookupBinding("+moveright")), input.GetKeyCode(input.LookupBinding("+jump")), input.GetKeyCode(input.LookupBinding("+duck"))
		if input.IsKeyDown( f ) then ucmd:SetForwardMove( ply:GetMaxSpeed() ) end
		if input.IsKeyDown( b ) then ucmd:SetForwardMove( -ply:GetMaxSpeed() ) end
		if input.IsKeyDown( r ) then ucmd:SetSideMove( ply:GetMaxSpeed() ) end
		if input.IsKeyDown( l ) then ucmd:SetSideMove( -ply:GetMaxSpeed() ) end
		if input.IsKeyDown( d ) then ucmd:SetButtons( IN_DUCK ) end
		if input.IsKeyDown( j ) then ucmd:SetButtons( IN_JUMP ) end
	end
	if config["misc_circlestrafer"] then
	CircleStrafer(ucmd)
	end
	if config["misc_autostrafe"] then
		local ply = LocalPlayer()
		if ply:GetMoveType() == MOVETYPE_LADDER || ply:GetMoveType() == MOVETYPE_NOCLIP then return end
		if config["misc_autostrafe_type"] == 1 then
		if ucmd:KeyDown( IN_JUMP ) then
			if ucmd:GetMouseX() < 0 then
				ucmd:SetSideMove(-450)
			elseif ucmd:GetMouseX() > 0 then
				ucmd:SetSideMove(450)
			end
		end
		elseif config["misc_autostrafe_type"] == 2 then
		if ucmd:KeyDown( IN_JUMP ) then
			if ucmd:GetMouseX() < 0 then
				ucmd:SetSideMove(-10000)
			elseif ucmd:GetMouseX() > 0 then
				ucmd:SetSideMove(10000)
			end
		end
		elseif config["misc_autostrafe_type"] == 3 then
		    if ucmd:KeyDown( IN_JUMP ) then
			    if ucmd:KeyDown( IN_FORWARD ) then
			        if ucmd:GetMouseX() < 0 then
				        ucmd:SetSideMove(-10000)
			        elseif ucmd:GetMouseX() > 0 then
				        ucmd:SetSideMove(10000)
			        end
					ucmd:SetForwardMove(10000)
			    end
			    if ucmd:KeyDown( IN_BACK ) then
			        if ucmd:GetMouseX() < 0 then
				        ucmd:SetSideMove(-10000)
			        elseif ucmd:GetMouseX() > 0 then
				        ucmd:SetSideMove(10000)
			        end
					ucmd:SetForwardMove(-10000)
			    end
				if ucmd:KeyDown( IN_LEFT ) then
			        if ucmd:GetSideMove() < 0 then
				        ucmd:SetMouseX(-10000)
			        elseif ucmd:GetSideMove() > 0 then
				        ucmd:SetMouseX(10000)
			        end		
                    ucmd:SetSideMove(-10000)				
			    end
				if ucmd:KeyDown( IN_RIGHT ) then
			        if ucmd:GetSideMove() < 0 then
				        ucmd:SetMouseX(-10000)
			        elseif ucmd:GetSideMove() > 0 then
				        ucmd:SetMouseX(10000)
			        end
                    ucmd:SetSideMove(10000)			        
			    end
		    end
		end
	end
	if config["misc_autostrafe"] && config["misc_autostrafe_type"] == 4 then
	DirSrafe(ucmd)
	end
	if config["misc_autobunnyhop"] then
		local ply = LocalPlayer()
		if ply:GetMoveType() == MOVETYPE_LADDER || ply:GetMoveType() == MOVETYPE_NOCLIP then return end
		if ucmd:KeyDown( IN_JUMP ) then
			if !ply:OnGround() then
				ucmd:SetButtons( ucmd:GetButtons() - IN_JUMP )
			end
		end
	end
	if config["misc_autoclick"] then
		if LocalPlayer():Alive() && IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():GetClass() != "weapon_physgun" then
			if LocalPlayer():KeyDown( IN_ATTACK ) then ucmd:RemoveKey(IN_ATTACK) end
		end
	end
	if config["misc_180turn"] then
		One80Turn(ucmd)
	end
	if config["misc_antiafk"] then
		AntiAFK(ucmd)
	end
	if config["misc_jittermove"] then
		JitterMove(ucmd)
	end
	if config["misc_infinitduck"] then
		if LocalPlayer():Alive() then
			if LocalPlayer():KeyDown( IN_DUCK ) then ucmd:RemoveKey(IN_DUCK) end
		end
	end
	if config["misc_duckwalk"] then
	    if LocalPlayer():Alive() then
		    if LocalPlayer():IsOnGround() then 
			    if !LocalPlayer():KeyDown(4) then
		            ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 4));
				end
		    end
	    end
	end
    if config["misc_airduck"] then
	if config["misc_airduckmetod"] == 1 then
		if LocalPlayer():Alive() then
			if !LocalPlayer():IsOnGround() then 
			ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 4));
			end
		end
	end
	if config["misc_airduckmetod"] == 2 then
	    if LocalPlayer():Alive() then
		    if !LocalPlayer():IsOnGround() then 
		    RunConsoleCommand("+duck")
			else
			RunConsoleCommand("-duck")
		    end
		end
	end
	if config["misc_airduckmetod"] == 3 then
	if LocalPlayer():Alive() then
	    if LocalPlayer():IsOnGround() then
		grounded = false
		else
	    if(!grounded) then
		hasJumped = true
		RunConsoleCommand("+duck")
	    grounded = true
		end
		if(hasJumped) then timer.Simple(0.3, function() RunConsoleCommand("-duck") hasJumped = false end) end
	end
	end
	end
	end
	if config["aim_master_toggle"] then
		if !config["aim_onkey"] || ( config.keybinds["aim_onkey_key"] != 0 && ( ( config.keybinds["aim_onkey_key"] >= 107 && config.keybinds["aim_onkey_key"] <= 113 ) && input.IsMouseDown(config.keybinds["aim_onkey_key"]) ) || input.IsKeyDown(config.keybinds["aim_onkey_key"]) ) && !frame then
			if !LocalPlayer():Alive() then return end
			if IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():Clip1() != 0 then
			local centerx, centery = ScrW() / 2, ScrH() / 2
			local PlayerDistance, NewPlayerDistance, PlayerHealth, NewPlayerHealth, playerCenter, newPlayerCenter = math.huge, math.huge, math.huge, math.huge, math.huge, math.huge
				for k, v in pairs(player.GetAll()) do
					if ValidateAimbot(v) and GetIgnorePlayers(v) then
						if isVisible(v) || ( isVisible(v) && BulletTime() ) then	
							local tarFrames, plyFrames = RealFrameTime() / ( 1 / frametime ), RealFrameTime() / ( 1 / frametime ) 
							if config["aim_velocitypred"] then
							pred = v:GetVelocity() * tarFrames - LocalPlayer():GetVelocity() * plyFrames
							else
							pred = Vector(0,0,0)
							end
							LOS, AimP, InFOV, KillAuraP = false, false, false, false
							local CurAngle = ucmd:GetViewAngles()
							local CurPos = LocalPlayer():GetShootPos()
							local AimSpot
                            
							if config["aim_hitbox"] == 1 then

								AimSpot = HitScan(v)

							elseif config["aim_hitbox"] == 2 && v:LookupBone("ValveBiped.Bip01_Head1") != nil then

								AimSpot = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Head1")) + Vector(0, 0, 1) + pred

							elseif config["aim_hitbox"] == 3 && v:LookupBone("ValveBiped.Bip01_Pelvis") != nil then

								AimSpot = v:GetBonePosition(v:LookupBone("ValveBiped.Bip01_Pelvis")) + pred

							else

								AimSpot = v:LocalToWorld(v:OBBCenter()) + pred

							end

							if IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():GetClass() == "weapon_crossbow" then

								AimSpot = Prediction(v, AimSpot)

							end
							
							local FinAngle = ( AimSpot - CurPos ):Angle()
							FinAngle:Normalize()
				
				            if config["aim_norecoil_true"] then
                                FinAngle = NoRecoil(FinAngle)
							end	
							if config["aim_target"] == 1 && !config["killaura_toggle"] then

								if math.sqrt((AimSpot:ToScreen().x - centerx) * (AimSpot:ToScreen().x - centerx) + (AimSpot:ToScreen().y - centery) * (AimSpot:ToScreen().y - centery)) < playerCenter then newPlayerCenter = math.sqrt((AimSpot:ToScreen().x - centerx) * (AimSpot:ToScreen().x - centerx) + (AimSpot:ToScreen().y - centery) * (AimSpot:ToScreen().y - centery)) AimP = true end
							
							elseif config["aim_target"] == 2 then

								if v:Health() < PlayerHealth then NewPlayerHealth = v:Health() AimP = true end
							
							elseif config["aim_target"] == 3 then

								if LocalPlayer():GetPos():Distance(v:GetPos()) < PlayerDistance then NewPlayerDistance = LocalPlayer():GetPos():Distance(v:GetPos()) AimP = true end
					        
							end
                            
							if config["killaura_toggle"] then
							    if config["killaura_disttype"] == 1 then
							    if math.Round((LocalPlayer():GetPos() - v:GetPos()):Length()) <= 175 then AimP = true end
							    if math.Round((LocalPlayer():GetPos() - v:GetPos()):Length()) <= 175 then KillAuraP = true end
								elseif config["killaura_disttype"] == 2 then
								if math.Round((LocalPlayer():GetPos() - v:GetPos()):Length()) <= 55 then AimP = true end
							    if math.Round((LocalPlayer():GetPos() - v:GetPos()):Length()) <= 55 then KillAuraP = true end
								elseif config["killaura_disttype"] == 3 then
								if math.Round((LocalPlayer():GetPos() - v:GetPos()):Length()) <= 115 then AimP = true end
							    if math.Round((LocalPlayer():GetPos() - v:GetPos()):Length()) <= 115 then KillAuraP = true end
								end
							end
							
							local angDiff = GetAngleDiffrence(CurAngle, FinAngle)

							angDiff = mabs(math.NormalizeAngle(angDiff))

							if angDiff < config["aim_fov"] then

								InFOV = true 
							
							end
							if config["aim_silent"] == 3 then
							    if AimP && InFOV then
							        if not world_click then return end 
                                    if not ucmd:GetInWorldClicker() then 
                                        ucmd:SetInWorldClicker(true)
                                        ucmd:SetWorldClickerAngles(FinAngle:Forward())
                                    end
							    end
							end
                            if AimP && InFOV && isVisible(v) && config["aim_autofire"] then
							    if config["killaura_delay"] then								    					    
							        if !LocalPlayer():KeyDown(1) then
							            DealySwing(ucmd)
							        end
							    else
							        if !LocalPlayer():KeyDown(1) then
							            AutoShoot(ucmd)
							        end
								end
							end
							if AimP && InFOV && isVisible(v) && config["autoslow"] then
							ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 262144))
							end
							if AimP && InFOV && isVisible(v) && config["autocrouch"] then
							ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 4))
							end
                            if config["aim_autoreload"] then
							    if IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():Clip1() == 0 then
							        ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 8192))
								end
							end
							if config["killaura_crits"] then
							    if AimP && KillAuraP && InFOV && isVisible(v) then
								    if LocalPlayer():GetActiveWeapon():GetClass() == "mc_weapon_sword_diamond" then
									    if math.Round((LocalPlayer():GetPos() - v:GetPos()):Length()) <= 150 then
										if !input.IsKeyDown(KEY_SPACE) then
                                            ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 2))
									    end
										end
								    end
							    end
							end
							if AimP && InFOV && isVisible(v) && config["killaura_magnet"] && KillAuraP then
							    if math.Round((LocalPlayer():GetPos() - v:GetPos()):Length()) <= 150 then
							        if !LocalPlayer():KeyDown(8) then
							            ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 8))
							        end
								elseif math.Round((LocalPlayer():GetPos() - v:GetPos()):Length()) <= 45 then
							        if !LocalPlayer():KeyDown(16) then
							            ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 16))
							        end
							    end
							end
							
							local sprdang 
							if config["aim_nospread"] then
						    sprdang = PredictSpread(ucmd, Angle())
							else
							sprdang = Angle()
							end						
							if AimP && InFOV && config["aim_silent"] != 3 then
								if config["aim_smoothing"] && (IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():GetClass() != "weapon_crossbow" ) then
									playerCenter = newPlayerCenter
									PlayerHealth = NewPlayerHealth
									PlayerDistance = NewPlayerDistance
									ucmd:SetViewAngles(Smoothing(FinAngle))
									if config["aim_silent"] == 2 then
										FixMovement(ucmd, realAng)
									end
								else
									playerCenter = newPlayerCenter
									PlayerHealth = NewPlayerHealth
									PlayerDistance = NewPlayerDistance
									ucmd:SetViewAngles(FinAngle + sprdang)
									if config["aim_silent"] == 2 then
										FixMovement(ucmd, realAng)
									end
								end
							end	
						end
					end
				end
			end
		end
	end
	if config["trigger_master_toggle"] then
		if !config["trigger_onkey"] || ( config.keybinds["trigger_onkey_key"] && ( ( config.keybinds["trigger_onkey_key"] >= 107 && config.keybinds["trigger_onkey_key"] <= 113 ) && input.IsMouseDown(config.keybinds["trigger_onkey_key"]) ) || input.IsKeyDown(config.keybinds["trigger_onkey_key"]) ) && !frame then
			if IsValid(LocalPlayer()) && LocalPlayer():Alive() then
				if IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():GetClass() != "weapon_physgun" then
					local tr = LocalPlayer():GetEyeTraceNoCursor()
					if tr.Entity:IsPlayer() then
						ply = tr.Entity
						if ValidateAimbot(ply) then
							if ucmd:KeyDown( IN_ATTACK2 ) && ucmd:KeyDown( IN_DUCK ) then 
								ucmd:SetButtons( IN_DUCK + IN_ATTACK2 + IN_ATTACK )
								timer.Simple( 0.05, function() RunConsoleCommand( "-attack" ) end ) 
							elseif ucmd:KeyDown( IN_DUCK ) then 
								ucmd:SetButtons( IN_DUCK + IN_ATTACK )
								timer.Simple( 0.05, function() RunConsoleCommand( "-attack" ) end )
							elseif ucmd:KeyDown( IN_ATTACK2 ) then 
								ucmd:SetButtons( IN_ATTACK2 + IN_ATTACK )
								timer.Simple( 0.05, function() RunConsoleCommand( "-attack" ) end ) 
							else
								ucmd:SetButtons( IN_ATTACK ) 
								timer.Simple( 0.05, function() RunConsoleCommand( "-attack" ) end )
							end
						end
					end
				end
			end
		end
	end
	if config["slowwalk"] then
	Micromovement(ucmd)
	end

	--d3s servers autopeek
    peeked = false
	if config["aim_autopeek3"] && config["gameserver"] == 2 then
	    if input.IsKeyDown(config.keybinds["aim_autopeek"]) then
	        RunConsoleCommand("autopeek_start_alt")
		    peeked = true
		    oldposition = me:GetPos()
	    elseif config["aim_autopeek3"] && ucmd:KeyDown(IN_ATTACK) then
	        timer.Simple( config["aim_autopeek_timer"] / 10, function() RunConsoleCommand("autopeek_end_alt") peeked = false end)
		    oldposition = oldposition
	    end
	end
	--autopeek end
	
	
	
	
end)

end

--===================================
--=================================== Misc
--===================================
AddHook("Think", RandomString(), function()
--[[local FName = _fhook_changename
local randomplayer = player.GetAll()[math.random(#player.GetAll())]
if config["misc_fnamechanger"]  then
    _fhook_changename(randomplayer:Name() .. " ")
end]]
end)

do

--Fall Prediction
isCanTrace = true
function Trace()
if (!isCanTrace) then return end
isCanTrace = false
index = 1
indexF = index * .1
trace = util.TraceEntity({start=LocalPlayer():GetPos(),endpos=physenv.GetGravity()*(0.5*indexF*indexF)+LocalPlayer():GetVelocity()*indexF+LocalPlayer():GetPos(),filter=LocalPlayer()},LocalPlayer())
while (!trace.Hit) do
render.DrawLine(trace.StartPos,trace.HitPos,Color(255,128,128),true)
index = index + 1
indexF = index * .1
indexFN = index * .1 - .1
trace = util.TraceEntity({start=physenv.GetGravity()*(0.5*indexFN*indexFN)+LocalPlayer():GetVelocity()*indexFN+LocalPlayer():GetPos(),endpos=physenv.GetGravity()*(0.5*indexF*indexF)+LocalPlayer():GetVelocity()*indexF+LocalPlayer():GetPos(),filter=LocalPlayer()},LocalPlayer())
if (index > 256) then break end
end
render.DrawLine(trace.StartPos,trace.HitPos,Color(255,128,128),true)
isCanTrace = true
return trace.HitPos
end
AddHook("PostDrawTranslucentRenderables",RandomString(),function(bD,bS)
if config["esp_self_predict_me"] && !LocalPlayer():IsOnGround() then 
local pw = Trace()
render.DrawWireframeBox(pw,Angle(),LocalPlayer():OBBMins(),LocalPlayer():OBBMaxs(),Color(250,250,250),true)
end
end)

--FlashLight
AddHook("CreateMove",RandomString(),function(ucmd)
    if config["misc_flashlight"] && input.IsKeyDown( KEY_F ) then
	ucmd:SetImpulse(100) 
	end 
	if config["misc_use"] then
		if LocalPlayer():Alive() then
			if LocalPlayer():KeyDown(IN_USE) then ucmd:RemoveKey(IN_USE) end
		end
	end
end)
--HitNumbers
surface.CreateFont("45", {font = "smallest_pixel", extended = false, shadow = true, outline = true, size = 20, weight = 900, antialias = true})
surface.CreateFont("56",{font = "smallest_pixel", extended = false, shadow = true, outline = true, size = 20, weight = 900, antialias = true})
local a = {}
AddHook("HUDPaint",RandomString(),function()
    if config["esp_other_hitnumbers"]  then
        local b = {}
        for c, d in pairs(a) do
            cam.Start3D()
            local e = d.pos:ToScreen()
            local f = e.x
            local g = e.y
            cam.End3D()
            cam.Start2D()
            surfSetFont("56")
            local h = surfGetTextSize(tostring(d.num))
            surfSetTextColor(0, 0, 0, 255 * d.life)
            surfSetTextPos(f - h / 2, g)
            surfDrawText(tostring(d.num))
            surfSetFont("45")
            surfSetTextColor(255, 45 - d.num, 45 - d.num, 255 * d.life)
            surfSetTextPos(f - h / 2, g)
            surfDrawText(tostring(d.num))
            d.pos = d.pos + Vector(0, 0, RealFrameTime() * 32)
            d.pos = d.pos + d.vec * RealFrameTime() * 8
            d.life = d.life - RealFrameTime() * 1 / 0.75
            if d.life > 0 then
                table.insert(b, d)
            end
            cam.End2D()
        end
        a = b
	end
end)
AddHook("player_hurt",RandomString(),function(i)
    if config["esp_other_hitnumbers"]  then
        local j = 0
        for d, l in pairs(player.GetAll()) do
            if l:UserID() == i.userid then
                entt = l
                j = l:Health()
            end
            if l:UserID() == i.attacker then
                k = l
            end
        end
        if entt:Health() == 0 then
            return
        end
        if not k == LocalPlayer() then
            return
        end
        local k = entt:GetPos() + Vector(0, 0, 60)
        local m = string.Replace(i.health - j, "-", "")
        m = math.Round(m, 1)
        table.insert(a, {pos = k, life = 1, num = m, vec = VectorRand()})
	end
end)


function FPS_FIX()
	RunConsoleCommand( "cl_detailfade", "800" )
end



--RPName changer
timer.Create( "RPNameChanger", config["misc_rpnamer_time"], 0, function() if config["misc_rpnamer"] then RunConsoleCommand("say", "/rpname " .. math.random(1000000,9999999)) end end)
--Poop Spammer
if input.IsKeyDown(config.keybinds["misc_supkill_key"]) && config["misc_supkill"] then
timer.Create("PoopSpam", 1, function() for i = 1, 10 do
rp.RunCommand('poop')
end end)
end

AddHook("Think", RandomString(), function()
--RGB Gun/Ply
    local col = HSVToColor( ( CurTime() * config["misc_rainbow_speed"] ) % 360, 1, 1 )
	if config["misc_rainbow"] then
		if me:Alive() && IsValid(me:GetActiveWeapon()) && me:GetActiveWeapon():GetClass() == "weapon_physgun" then
			me:SetWeaponColor( Color(col.r, col.g, col.b):ToVector() )
		end
	end
	if config["misc_rainbowply"] then
		if me:Alive() then
		    me:SetPlayerColor(Vector(col.r/255,col.g/255,col.b/255))
		end
	end
--Undo Spam
if config["misc_doundo"] then
timer.Simple(0, function() 
RunConsoleCommand("undo")
end)
end
local actdelay = 0
--Act spammer
if config["antihit_act"] && !me:IsPlayingTaunt() && CurTime() > actdelay then
    if config["antihit_act_type"] == 1 then
    RunConsoleCommand("act", "dance")
    elseif config["antihit_act_type"] == 2 then
	RunConsoleCommand("act", "robot")
	elseif config["antihit_act_type"] == 3 then
	RunConsoleCommand("act", "muscle")
	elseif config["antihit_act_type"] == 4 then
	RunConsoleCommand("act", "bow")
	elseif config["antihit_act_type"] == 5 then
	RunConsoleCommand("act", "wave")
	elseif config["antihit_act_type"] == 6 then
	RunConsoleCommand("act", "zombie")
	elseif config["antihit_act_type"] == 7 then
	RunConsoleCommand("act", "disagree")
	elseif config["antihit_act_type"] == 8 then
	RunConsoleCommand("act", "forward")
	elseif config["antihit_act_type"] == 9 then
	RunConsoleCommand("act", "pers")
	elseif config["antihit_act_type"] == 10 then
	RunConsoleCommand("act", "salute")
	end
actdelay = CurTime() + 0.3
end
function TacticalLeanDisabler()
RunConsoleCommand("-alt1")
RunConsoleCommand("-alt2")
end
if config["antihit_lean"]  then
    if config["antihit_lean_dir"] == 1 then
    RunConsoleCommand("+alt1")
	RunConsoleCommand("-alt2")
	elseif config["antihit_lean_dir"] == 2 then
	RunConsoleCommand("+alt2")
	RunConsoleCommand("-alt1")
	elseif config["antihit_lean_dir"] == 3 then
	if(input.IsKeyDown(KEY_A)) then
	RunConsoleCommand("+alt1")
	RunConsoleCommand("-alt2")
	elseif(input.IsKeyDown(KEY_D)) then
	RunConsoleCommand("+alt2")
	RunConsoleCommand("-alt1")
	end
	elseif config["antihit_lean_dir"] == 4 then
	if(input.IsKeyDown(KEY_A)) then
	RunConsoleCommand("-alt1")
	RunConsoleCommand("+alt2")
	elseif(input.IsKeyDown(KEY_D)) then
	RunConsoleCommand("-alt2")
	RunConsoleCommand("+alt1")
	end
	end
end
--Other
if config["misc_chat_spam"]  then
    RunConsoleCommand("say", "PenisDeda.NET - Everything you need!")
end
if config["esp_other_3dskydisabler"]  then
    RunConsoleCommand("r_3dsky", "0")
else
    RunConsoleCommand("r_3dsky", "1")
end
if config["esp_self_dlight"]  then
local dlightcolor = string.ToColor(config.colors["esp_self_dlight"])
local dhsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
local dlight = DynamicLight( LocalPlayer():EntIndex() )
	if ( dlight ) then
		dlight.pos = LocalPlayer():GetShootPos()
		if config["esp_self_dlight_hsv"] then
		dlight.r = dhsv.r 
		dlight.g = dhsv.g
		dlight.b = dhsv.b
		else
		dlight.r = dlightcolor.r 
		dlight.g = dlightcolor.g
		dlight.b = dlightcolor.b
		end
		dlight.brightness = 2
		dlight.Decay = 1000
		dlight.Size = 300
		dlight.DieTime = CurTime() + 1
	end
end
if config["esp_other_hlflashlight"]  then
local dlight = DynamicLight( LocalPlayer():EntIndex() )
if ( dlight ) then
	dlight.pos = LocalPlayer():GetEyeTrace().HitPos
	dlight.r = 128
	dlight.g = 128
	dlight.b = 128
	dlight.brightness = 1
	dlight.Decay = 1000
	dlight.Size = 400
	dlight.DieTime = CurTime() + 1
end
end
if config["bot_healthkit"]  then
if LocalPlayer():Health() < 65 && LocalPlayer():Alive() then
RunConsoleCommand("gm_spawnsent", "item_healthkit")  
end
end
if config["bot_armorkit"]  then
if LocalPlayer():Armor() < 100 && LocalPlayer():Alive() then
RunConsoleCommand("gm_spawnsent", "item_battery")  
end
end
--AntiArest
for k, v in pairs(player.GetAll()) do
    if config["misc_antiarest"] then
	    if config["misc_antiarest_metod"] == 1 then
		local me = LocalPlayer()
		if v != me and v:EyePos():Distance( me:GetPos() ) < 120 and me:Alive() and ( v:GetActiveWeapon() and v:GetActiveWeapon():IsValid() and v:GetActiveWeapon():GetClass() == "arrest_stick" ) then
		chat.AddText(Color(255,120,120), "[WARNING] Automatically suicided to avoid being arrested by "..v:Nick() )
		RunConsoleCommand( "kill" )
		end
		elseif config["misc_antiarest_metod"] == 2 then
		local me = LocalPlayer()
		if v != me and v:EyePos():Distance( me:GetPos() ) < 120 and me:Alive() and ( v:GetActiveWeapon() and v:GetActiveWeapon():IsValid() and v:GetActiveWeapon():GetClass() == "arrest_stick" ) then
		MsgC(Color(255,120,120), "[WARNING] Automatically suicided to avoid being arrested by "..v:Nick() )
		RunConsoleCommand( "retry" )
		end
		elseif config["misc_antiarest_metod"] == 3 then
		local me = LocalPlayer()
		if v != me and v:EyePos():Distance( me:GetPos() ) < 120 and me:Alive() and ( v:GetActiveWeapon() and v:GetActiveWeapon():IsValid() and v:GetActiveWeapon():GetClass() == "arrest_stick" ) then
		MsgC(Color(255,120,120), "[WARNING] Automatically suicided to avoid being arrested by "..v:Nick() )
		RunConsoleCommand( "say", "/hobo" )
		end
		end
		
		if me:GetActiveWeapon():GetClass() == "" then
		MsgC(Color(255,120,120), "[WARNING] Automatically leaved server to avoid being arrested")
		RunConsoleCommand("retry")
		end
    end
end
end)

end
--=================================== TTT

for _,v in ipairs(player.GetAll()) do
    v.Traitor = nil
end

AddHook("Think", RandomString(), function()
	if config["misc_ttt"] && engine.ActiveGamemode() == "terrortown" then
	    if GAMEMODE.round_state != ROUND_ACTIVE then
	        for _,v in ipairs(player.GetAll()) do
                v.Traitor = nil
	        end
	        return
	    end
	    for _, v in ipairs( player.GetAll() ) do
	        if IsValid(v) && v:IsTerror() && !v:IsDetective() && !v.Traitor && v != LocalPlayer() then
	            for _, w in ipairs(v:GetWeapons()) do
	            	if w and w.CanBuy and table.HasValue(w.CanBuy, ROLE_TRAITOR) && w.AutoSpawnable == false then
	            		v.Traitor = true
	            		chat.AddText(Color(61, 149, 217), "[Penis Deda] ", Color(222, 222, 222), v:Nick(),  " is a ", Color(255,0,0), "TRAITOR", Color(222, 222, 222), " with a ", Color(0, 255, 0), w:GetClass() .. "!")
	            	end
	            end
	        end
	    end
	end
end)

--=================================== Viewmodel Changer

AddHook("CalcViewModelView", RandomString(), function(Weapon, ViewModel, OldPos, OldAngle, EyePos, EyeAngle)

	if ss then return end
		
	if config["misc_bob"] then
		EyeAngle = OldAngle
	end
	if config["misc_sway"] then
		EyePos = OldPos
	end
    
	
	if config["misc_viewmodel"] then
	
	local OverridePos = Vector(config["misc_vm_x"], config["misc_vm_y"], config["misc_vm_z"])
	local OverrideAngle = Angle(config["misc_vm_p"], config["misc_vm_ya"], config["misc_vm_r"])

	EyeAngle = EyeAngle * 1

	EyeAngle:RotateAroundAxis(EyeAngle:Right(), OverrideAngle.x * 1.0)
	EyeAngle:RotateAroundAxis(EyeAngle:Up(), OverrideAngle.y * 1.0)
	EyeAngle:RotateAroundAxis(EyeAngle:Forward(), OverrideAngle.z* 1.0)

	EyePos = EyePos + OverridePos.x * EyeAngle:Right() * 1.0
	EyePos = EyePos + OverridePos.y * EyeAngle:Forward() * 1.0
	EyePos = EyePos + OverridePos.z * EyeAngle:Up() * 1.0 

    end
	
	return EyePos, EyeAngle
    
end)
--================================Anti-Aim
local real_switch = 0
local real_plus = true
local fake_switch = 0
local fake_plus = true
bSendPacket = true
fakeanglesss = Angle(0,0,0)
function Antihit( cmd )
	if config["aa_enable"] then
        local yawq = 0
        local pich = 0 

        local fakeyaw = 0
        local fakepich = 0
        --== PITCH ==--
	    if config["aa_pitch"] == 1 then 
		pich = fakeanglesss.x 
		elseif config["aa_pitch"] == 2 then	
		pich = 0 
		elseif config["aa_pitch"] == 3 then	
		pich = 80 
		elseif config["aa_pitch"] == 4 then	
		pich = -80
		elseif config["aa_pitch"] == 5 then	
		pich = -180
		elseif config["aa_pitch"] == 6 then	
		pich = 180.00000762939
		elseif config["aa_pitch"] == 7 then	
		pich = mrandom(0,180)
		elseif config["aa_pitch"] == 8 then	
		pich = config["aa_cpitch"]
		end
	    --== YAW ==--
		if config["aa_yaw"] == 1 then	
		yawq = fakeanglesss.y 
		elseif config["aa_yaw"] == 2 then	
		yawq = fakeanglesss.y-180 
		elseif config["aa_yaw"] == 3 then	
		yawq = fakeanglesss.y
		elseif config["aa_yaw"] == 4 then	
		yawq = fakeanglesss.y-90
		elseif config["aa_yaw"] == 5 then	
		yawq = fakeanglesss.y+90
		elseif config["aa_yaw"] == 6 then	
		yawq = mrandom(-config["aa_jitter_range"],config["aa_jitter_range"])
		elseif config["aa_yaw"] == 7 then	
		yawq = mNormalizeAng(CurTime() * 360)
		elseif config["aa_yaw"] == 8 then	
		yawq = config["aa_cyaw"]
		end
		
		--======================= Fake Angles =======================--
		
	    if config["fa_pitch"] == 1 then 
		fakepich = fakeanglesss.x 
		elseif config["fa_pitch"] == 2 then	
		fakepich = 0 
		elseif config["fa_pitch"] == 3 then	
		fakepich = 80 
		elseif config["fa_pitch"] == 4 then	
		fakepich = -80
		elseif config["fa_pitch"] == 5 then	
		fakepich = -180
		elseif config["fa_pitch"] == 6 then	
		fakepich = 180.00000762939
		elseif config["fa_pitch"] == 7 then	
		fakepich = mrandom(0,180)
		elseif config["fa_pitch"] == 8 then	
		fakepich = config["fa_cpitch"]
		end
	    --== YAW ==--
		if config["fa_yaw"] == 1 then	
		fakeyaw = fakeanglesss.y 
		elseif config["fa_yaw"] == 2 then	
		fakeyaw = fakeanglesss.y-180 
		elseif config["fa_yaw"] == 3 then	
		fakeyaw = fakeanglesss.y
		elseif config["fa_yaw"] == 4 then	
		fakeyaw = fakeanglesss.y-90
		elseif config["fa_yaw"] == 5 then	
		fakeyaw = fakeanglesss.y+90
		elseif config["fa_yaw"] == 6 then	
		fakeyaw = mrandom(-config["fa_jitter_range"],config["fa_jitter_range"])
		elseif config["fa_yaw"] == 7 then	
		fakeyaw = mNormalizeAng(CurTime() * 360)
		elseif config["fa_yaw"] == 8 then	
		fakeyaw = config["fa_cyaw"]
		end	
		
        if !bSendPacket then
            cmd:SetViewAngles(Angle(pich,yaw,0))
            AntiAimAngle = cmd:GetViewAngles()
        elseif bSendPacket then
            if config["fa_enable"] then
                cmd:SetViewAngles(Angle(fakepich,fakeyaw,0))
                AntiAimFakeAngle = cmd:GetViewAngles()
            end
        end
    end
end








eventListOpen()
--==================== PostInject

MsgC(Color(255, 15, 15), "\n████████████████████████████████████████\n████████████████░░██████████████████████\n███████████████▀░░░▀▀▀▀▀▀███████████████\n███████████▀▀░░░░░░░░░░░░░░▀▀███████████\n████████▀░░░░▄▄░░░▄░░▀███▄▄░░░░▀████████\n██████▀░░░▄███░░░██▄░░░██████▄░░░▀██████\n█████▀░░▄████▀░░▄████░░░███████▄░░▀█████\n████▀░░▄█████░░░██████░░░▀██████▄░░▀████\n████░░░█████▀░░████████▄░░▀████▀▀░░░░▀██\n████░░██████░░▄███████▀▀░░░░░░░░░░░░▄▄██\n████░░█████░░░▀▀▀░░░░░░░░▄░░░▄████░░████\n███▀░░░▀░░░░░░░░▄▄▄▄▄██████░░░▀██░░░████\n██▄░░░░░▄▄░░░███████████████▄░░▀▀░░▄████\n█████▄░░▀░░░█████████████████▄░░░░▄█████\n██████▄░░░░░█████████████████▀░░░░██████\n████████░░░░░▀▀██████████▀▀░░░░▄░░░▀████\n███████▀░░▄▄▄░░░░░░░░░░░░░░▄▄████▄░░▀███\n███████░░░█████▄▄▄▄▄▄▄▄▄▄█████████▄▄▄███\n██████▄▄▄███████████████████████████████\n████████████████████████████████████████\n")
MsgC( Color(255,15,15), "Loaded PenisDeda " .. PenisDedushki.Version .."  | " .. os.date("%I:%M %p") .. "\n" )

notification.AddLegacy("Loaded PenisDeda " .. PenisDedushki.Version .."  | " .. os.date("%I:%M %p"), NOTIFY_HINT, 5)

for k, v in ipairs(files) do
	if string.lower(v) == "default.json" then
		LoadDefault()
	end
end
