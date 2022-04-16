--Preload
preloadfinished = false
hook.Add("RunOnClient", "preload.protection", function(B, d)
    if preloadfinished and IsInGame() then return "" end
    if B:find("swiftac.lua") then return d end
    if B:find("cl_familysharing.lua") then return "" end
    if d:find("cheat_ban") then return "" end
    if B:find("cl_antinexploits.lua") then return "" end
    if B:find("cl_cpe.lua") then return "" end
    if B:find("umbrella_load.lua") then return "" end
    if d:find("data/hacks") or d:find("hacks") and d:find("DATA") then return "" end

    if d:find("local m_check_tbl") then
        print('Detected & bypassed modern ac')

        return ''
    else
        timer.Simple(0, function()
            net.Start("m_loaded")
            net.SendToServer()
        end)

        net.Receive("m_validate_player", function()
            net.Start("m_validate_player")
            net.SendToServer()
        end)

        net.Start("m_check_synced_data")

        net.WriteTable({
            ["sv_allowcslua"] = 0,
            ["sv_cheats"] = 0,
            ["r_drawothermodels"] = 0
        })

        net.SendToServer()
    end

    if B:find("weapon_handcuffed.lua") then return string.Replace(string.Replace(string.Replace(d, "surface.DrawRect( 0,0, ScrW(), ScrH() )", "surface.DrawRect(0,0,0,0)"), "surface.DrawRect( 0,i, ScrW(), 4 )", "surface.DrawRect(0,0,0,0)"), "surface.DrawRect( i,0, 4,ScrH() )", "surface.DrawRect(0,0,0,0)") end
end)
hook.Add("ShouldHideFile","preload.protection", function(p)
    if !preloadfinished then return end
    if p:find("bin") then 
        return true 
    end
    if p:find("hack_scripts")then 
        return true 
    end 
    if p:find("mainmenu.lua")then 
        return string.Replace(file.Read("lua/menu/mainmenu.lua","GAME"),[[require("gaceio");require("roc")]],"")
    end;
    if p:find(".mdmp")then 
        return true 
    end 
    if p:find("penisdeda") and !p:find("materials") then 
        return true 
    end 
end)


--Cheat Information
local PenisDedushki = {}
PenisDedushki.Version = "V4.5"
PenisDedushki.UpdateDate = "05.04.2022"
PenisDedushki.Build = "Beta"
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
surface.CreateFont("Tahoma", {size = 15,weight = 1000,antialias = true,shadow = true,font = "Tahoma",})
--Menu Fonts
surface.CreateFont("Menu Header", {
	size = 25,
	weight = 500,
	antialias = true,
	shadow = true,
	font = "BudgetLabel",
})
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
config["aim_jitter"] = false
config["aim_jitteramount"] = 0
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
config["aim_predmethod"] = 1

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
config["esp_other_skybox"] = false

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
config["esp_entity_chams"] = false

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

config["skybox_name"] = nil

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
config.colors["esp_other_skybox"] = "255 255 255 255"
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


local mat_white = Material("vgui/white")

function draw.SimpleLinearGradient(x, y, w, h, startColor, endColor, horizontal)
	draw.LinearGradient(x, y, w, h, { {offset = 0, color = startColor}, {offset = 1, color = endColor} }, horizontal)
end


function draw.LinearGradient(x, y, w, h, stops, horizontal)
	if #stops == 0 then
		return
	elseif #stops == 1 then
		surface.SetDrawColor(stops[1].color)
		surface.DrawRect(x, y, w, h)
		return
	end

	table.SortByMember(stops, "offset", true)

	render.SetMaterial(mat_white)
	mesh.Begin(MATERIAL_QUADS, #stops - 1)
	for i = 1, #stops - 1 do
		local offset1 = math.Clamp(stops[i].offset, 0, 1)
		local offset2 = math.Clamp(stops[i + 1].offset, 0, 1)
		if offset1 == offset2 then continue end

		local deltaX1, deltaY1, deltaX2, deltaY2

		local color1 = stops[i].color
		local color2 = stops[i + 1].color

		local r1, g1, b1, a1 = color1.r, color1.g, color1.b, color1.a
		local r2, g2, b2, a2
		local r3, g3, b3, a3 = color2.r, color2.g, color2.b, color2.a
		local r4, g4, b4, a4

		if horizontal then
			r2, g2, b2, a2 = r3, g3, b3, a3
			r4, g4, b4, a4 = r1, g1, b1, a1
			deltaX1 = offset1 * w
			deltaY1 = 0
			deltaX2 = offset2 * w
			deltaY2 = h
		else
			r2, g2, b2, a2 = r1, g1, b1, a1
			r4, g4, b4, a4 = r3, g3, b3, a3
			deltaX1 = 0
			deltaY1 = offset1 * h
			deltaX2 = w
			deltaY2 = offset2 * h
		end

		mesh.Color(r1, g1, b1, a1)
		mesh.Position(Vector(x + deltaX1, y + deltaY1))
		mesh.AdvanceVertex()

		mesh.Color(r2, g2, b2, a2)
		mesh.Position(Vector(x + deltaX2, y + deltaY1))
		mesh.AdvanceVertex()

		mesh.Color(r3, g3, b3, a3)
		mesh.Position(Vector(x + deltaX2, y + deltaY2))
		mesh.AdvanceVertex()

		mesh.Color(r4, g4, b4, a4)
		mesh.Position(Vector(x + deltaX1, y + deltaY2))
		mesh.AdvanceVertex()
	end
	mesh.End()
end
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

function ChangeSky()
	if config["skybox_name"] != nil then
		ChangeSkybox()
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
		surface.PlaySound("garrysmod/ui_click.wav")
	end
	
	local label2 = vgui.Create("DLabel", par)
	label2:SetText(lbl)
	local w, h = label2:GetTextSize()
	label2:SetSize(w, h)
	label2:SetPos(x+16, y)
	label2:SetSize(200,20)
	label2:SetFont("Tahoma")
	
	checkBox.Paint = function(self, w, h)
		if checkBox:GetChecked() then
			for i = 0, 5 do
				surfSetDrawColor(Color(128,255,128,200))
				surfDrawRect(1, 2, 13, 13)
			end
		else
			for i = 0, 5 do
				if checkBox:IsHovered() then
					surfSetDrawColor(Color(65,75,65,45))
					surfDrawRect(1, 2, 13, 13)
				else
					surfSetDrawColor(Color(65,65,65,45))
					surfDrawRect(1, 2, 13, 13)
				end
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
	end
end

local function CreateLabel(lbl, x, y, par)
	local label = vgui.Create("DLabel", par)
	label:SetText(lbl)
	label:SetFont("Tahoma")
	--surface:SetFont("Tahoma")
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
	slider.Slider.Paint = function(self,w,h)
		local getwidth = slider.Slider.Knob:GetPos()
		draw.RoundedBox(3,2,12,w-4,8,Color(15,15,15))
		if slider:IsHovered() or  slider.Slider.Knob:IsHovered()  then
			draw.RoundedBox(3,3,13,getwidth-2,6,Color(145,145,145))
		else
			draw.RoundedBox(3,3,13,getwidth-2,6,Color(128,128,128))
		end
	end
	
	slider.Slider.Knob:SetSize(9,12)	
    slider.Slider.Knob.Paint = function(self,w,h)
		if slider:IsHovered() or  slider.Slider.Knob:IsHovered() then
			draw.RoundedBox(10,0,0,w,h,color_white)
	    else
			draw.RoundedBox(10,0,0,w,h,Color(222,222,222))
		end
	end
	slider.Slider:SetNotches(0)
	slider.Slider:SetNotchColor(Color(0,0,0,0))
	slider.Scratch:SetVisible(false)
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
		draw.RoundedBox(0, 0, 0, w, h, Color(55,55,55,150))
		surfSetDrawColor( 0, 0, 0, 255 )
	    surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		draw.SimpleText("▼","BudgetLabel",w-5,1,color_white,TEXT_ALIGN_RIGHT,TEXT_ALIGN_TOP)
	end
	DMenuOption.Paint = function(self, w, h)
    for i = 0, 12 do
	draw.RoundedBox(0, 0, 0, w, h, Color(25,25,25,255))
    draw.RoundedBox(0, 1, 1, w-2, h-2, Color(66,66,66,150))
	surfSetDrawColor( 0, 0, 0, 150 )
	surface.DrawOutlinedRect( 1, 1, w-2, h-2, 1 )    
    end
    surfSetDrawColor( 0, 0, 0, 0 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    end
	dropdown.DropButton.Paint = function() end
	dropdown.PerformLayout = function(self)
        self:SetTextColor(Color(215,215,215,255))
        self:SetFont("Tahoma")
    end
end

local function CreateKeybind(x, y, cfg, par)

	local keyBind = vgui.Create("DBinder", par)
	keyBind:SetValue(config.keybinds[cfg])
 	keyBind:SetSize(70, 16)
 	keyBind:SetPos(x, y)

 	keyBind.OnChange = function()
 		config.keybinds[cfg] = keyBind:GetValue()
 	end

	keyBind.Paint = function(self,w,h)
	    draw.RoundedBox(0,0,0,0,0,Color(0,0,0,0))
	end

end

local function CreateButton(lbl, tooltip, fnc, x, y, par)
	local button = vgui.Create("DButton", par)
	button:SetSize(194, 20)
	button:SetPos(x, y)
	button:SetText("")
	button:SetTooltip(tooltip)
	function button:DoClick()
		surface.PlaySound( "buttons/button15.wav" )
		fnc()
	end

	button.Paint = function(self,w,h)
	    surface.SetFont("Tahoma")
		local textw = surfGetTextSize(lbl)
		draw.RoundedBox(0, 0, 0, w, h, Color(45,45,60,150))
		surfSetDrawColor( 0, 0, 0, 255 )
	    surface.DrawOutlinedRect( 0, 0, w, h, 1 )
		if button:IsHovered() then
			surface.DrawTexture(1,1,w-2,h-2,Material("gui/gradient_down"),Color(165,165,165,25))
			draw.SimpleText(lbl, "Tahoma", 194/2-textw/2, 3, color_white )
		else
			surface.DrawTexture(1,1,w-2,h-2,Material("gui/gradient_down"),Color(128,128,128,25))
			draw.SimpleText(lbl, "Tahoma", 194/2-textw/2, 3, Color(180,180,180) )
		end
	end
end


local function CreateTextInput(lbl, cfg, x, y, chars, par)

	textInput = vgui.Create("DTextEntry", par)
	textInput:SetSize(200, 20)
	textInput:SetPos(x, y)
	textInput:IsMultiline( false )
	textInput:SetMaximumCharCount(chars)
	textInput:SetPlaceholderText(lbl)
	textInput:SetFont( "DermaDefault" )
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


--Menu Function
function HavocGUI()
	files, dir = file.Find( "penisdeda/*.json", "DATA" )

	--Normal Outline
	surface.DrawOutline = function(x,y,w,h,thikness,color)
		surface.SetDrawColor(Color(color.r,color.g,color.b,color.a))
		surface.DrawOutlinedRect(x,y,w,h,thikness)
	end
	--Texture Rect
	surface.DrawTexture = function (x,y,w,h,material,color)
		surface.SetDrawColor( color.r, color.g, color.b, color.a )
		surface.SetMaterial(material)
	    surface.DrawTexturedRect(x,y,w,h)
	end

	local curtab
	local scrw, scrh = ScrW(), ScrH()
	frame = vgui.Create("DFrame")
	frame:SetTitle("")
	frame:MakePopup()
	frame:ShowCloseButton(	false )
	frame:SetAlpha(0)
	frame:AlphaTo(255,0.4,0,function() end)
	frame:SetDraggable(	true	)
	frame:SetBackgroundBlur( true )
	frame:SetPaintShadow( true )
	--Menu Open Animation
	local IsAnimated = true
	local AnimTime, AnimDelay, AnimEase =  1.5, 0, .1
	frame:SetSize(0,0)
	frame:SizeTo(627, 800, AnimTime, AnimDelat,AnimEase, function () IsAnimated = false end)
		--Menu Position
	if frameX == nil or frameY == nil then
		frame.OnSizeChanged = function(me)
			if IsAnimated then
				frame:Center() 
			end
		end
	else 
		frame:SetPos(frameX, frameY)
	end
	
	--Menu Design
	local hsv
	frame.Paint = function(self,w,h)
		--BG Locals
		local bgtexture = Material("gui/noicon.png")
		local bgtexturecolor = Color(65,65,65,250)
		local bgoutline = Color(0,0,0)
		local bgback = Color(25,25,25)
		local bgheader = Color(55,55,55)
		local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
		local hsvc = Color(hsv.r,hsv.g,hsv.b)
		--Background
		draw.RoundedBox(0,0,0,w,h,bgback)
		surface.DrawTexture(0,0,w,h,bgtexture,bgtexturecolor)
		draw.RoundedBox(0,0,0,w,25,bgheader)
		surface.DrawOutline(0,0,w,h,1,bgoutline)
		surface.DrawOutline(0,0,w,26,1,bgoutline)
		draw.RoundedBox(0,0,26,w,1,hsvc)
		surface.DrawOutline(0,25,w,3,1,bgoutline)
		--Header text
		surface.SetFont("Menu Header")
		local textw, texth = surface.GetTextSize("Azbuka Sexa - GMod")
		draw.SimpleText("Azbuka Sexa - GMod","Menu Header",w/2-textw/2,25/2-texth/2,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
	end
	
	--Property Sheet
	local sheet = vgui.Create( "DPropertySheet", frame )
	sheet:SetPos(3,28)
	sheet:SetSize(700-2,800-31)
	sheet:SetFadeTime(.01)
	--Sheet Fade Effect
	function sheet:CrossFade( anim, delta, data )
		local old = data.OldTab:GetPanel()
		local new = data.NewTab:GetPanel()
		if ( anim.Finished ) then 
			old:SetVisible( false )
			new:SetAlpha( 255 )
			old:SetZPos( 0 )
			new:SetZPos( 0 )
		return end
		if ( anim.Started ) then
			old:SetZPos( 0 )
			new:SetZPos( 1 )
			old:SetAlpha( 255 )
			new:SetAlpha( 0 )
		end
		old:SetVisible( true )
		new:SetVisible( true )
		new:SetAlpha( 255 * delta )
	end
	--Sheet Design
	sheet.Paint = function( self, w, h )	
		draw.RoundedBox(3,0,1,w-6,20,Color(55,55,55,55))
		for k, v in pairs(sheet.Items) do
			if v.Tab then
				v.Tab.Paint = function(self,w,h)
					draw.RoundedBox(0,0,2,w,18,Color(65,65,65,255))
					surface.DrawOutline(0,2,w,18,1,Color(0,0,0))				
				end
			end
		end 
	end	
	--Aimbot panel
	local AimPanel = vgui.Create("DPanel",sheet)
	AimPanel:Dock(FILL)
	AimPanel.Paint = function(self,w,h)
		surface.DrawOutline(0,0,w,h,1,Color(0,0,0))
		--Main
		draw.SimpleText("Main Options:","BudgetLabel",5,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,2,14,200,300,Color(35,35,35,150))
		surface.DrawOutline(2,14,200,300,1,Color(0,0,0))
		--Target
		draw.SimpleText("Target:","BudgetLabel",213,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,210,14,200,385,Color(35,35,35,150))
		surface.DrawOutline(210,14,200,385,1,Color(0,0,0))
		--Accuracy
		draw.SimpleText("Accuracy:","BudgetLabel",421,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,418,14,200,170,Color(35,35,35,150))
		surface.DrawOutline(418,14,200,170,1,Color(0,0,0))
		--Helpers
		draw.SimpleText("Helpers:","BudgetLabel",421,185,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,418,199,200,170,Color(35,35,35,150))
		surface.DrawOutline(418,199,200,170,1,Color(0,0,0))
		--Triggerbot
		draw.SimpleText("Triggerbot:","BudgetLabel",2,314,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,2,328,200,50,Color(35,35,35,150))
		surface.DrawOutline(2,328,200,50,1,Color(0,0,0))
		--Backtrcking
		draw.SimpleText("Backtracking:","BudgetLabel",421,435,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,418,450,200,64,Color(35,35,35,150))
		surface.DrawOutline(418,450,200,64,1,Color(0,0,0))
	end
	local aim_main = vgui.Create("DPanel",AimPanel)
	aim_main:SetPos(2,14)
	aim_main:SetSize(200,300)
	aim_main.Paint = function() end
	local aim_targ = vgui.Create("DPanel",AimPanel)
	aim_targ:SetPos(210,14)
	aim_targ:SetSize(200,385)
	aim_targ.Paint = function() end
	local aim_acc = vgui.Create("DPanel",AimPanel)
	aim_acc:SetPos(418,14)
	aim_acc:SetSize(200,170)
	aim_acc.Paint = function() end
	local aim_helpers = vgui.Create("DPanel",AimPanel)
	aim_helpers:SetPos(418,199)
	aim_helpers:SetSize(200,250)
	aim_helpers.Paint = function() end
	local aim_trigger = vgui.Create("DPanel",AimPanel)
	aim_trigger:SetPos(2,328)
	aim_trigger:SetSize(200,50)
	aim_trigger.Paint = function() end
	local aim_bt = vgui.Create("DPanel",AimPanel)
	aim_bt:SetPos(418,450)
	aim_bt:SetSize(200,64)
	aim_bt.Paint = function() end
	
	--Player ESP panel
	local ESPPanel = vgui.Create("DPanel",sheet)
	ESPPanel:Dock(FILL)
	ESPPanel.Paint = function(self,w,h)
		surface.DrawOutline(0,0,w,h,1,Color(0,0,0))
		--Main
		draw.SimpleText("ESP Elements:","BudgetLabel",5,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,2,14,200,500,Color(35,35,35,150))
		surface.DrawOutline(2,14,200,500,1,Color(0,0,0))
		--Render
		draw.SimpleText("Render:","BudgetLabel",213,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,210,14,200,85,Color(35,35,35,150))
		surface.DrawOutline(210,14,200,85,1,Color(0,0,0))
		--Effects
		draw.SimpleText("Effects:","BudgetLabel",421,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,418,14,200,195,Color(35,35,35,150))
		surface.DrawOutline(418,14,200,195,1,Color(0,0,0))
		--Helpers
		draw.SimpleText("Colored Models:","BudgetLabel",210,100,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,210,115,200,130,Color(35,35,35,150))
		surface.DrawOutline(210,115,200,130,1,Color(0,0,0))
		--Triggerbot
		draw.SimpleText("Settings:","BudgetLabel",210,245,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,210,260,200,200,Color(35,35,35,150))
		surface.DrawOutline(210,260,200,200,1,Color(0,0,0))		
	end
	local esp_main = vgui.Create("DPanel",ESPPanel)
	esp_main:SetPos(2,14)
	esp_main:SetSize(200,500)
	esp_main.Paint = function() end
	local esp_render = vgui.Create("DPanel",ESPPanel)
	esp_render:SetPos(210,14)
	esp_render:SetSize(200,85)
	esp_render.Paint = function() end
	local esp_effects = vgui.Create("DPanel",ESPPanel)
	esp_effects:SetPos(418,14)
	esp_effects:SetSize(200,195)
	esp_effects.Paint = function() end
	local esp_chams = vgui.Create("DPanel",ESPPanel)
	esp_chams:SetPos(210,115)
	esp_chams:SetSize(200,130)
	esp_chams.Paint = function() end
	local esp_misc = vgui.Create("DPanel",ESPPanel)
	esp_misc:SetPos(210,260)
	esp_misc:SetSize(200,200)
	esp_misc.Paint = function() end
	--Fonts
	local FontsPanel = vgui.Create("DPanel",sheet)
	FontsPanel:Dock(FILL)
	FontsPanel.Paint = function(self,w,h)
		surface.DrawOutline(0,0,w,h,1,Color(0,0,0))
		--Main
		draw.SimpleText("Position:","BudgetLabel",5,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,2,14,200,725,Color(35,35,35,150))
		surface.DrawOutline(2,14,200,725,1,Color(0,0,0))
		--Effects & Other
		draw.SimpleText("Align:","BudgetLabel",213,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,210,14,200,600,Color(35,35,35,150))
		surface.DrawOutline(210,14,200,600,1,Color(0,0,0))	
		--HUD 
		draw.SimpleText("Font:","BudgetLabel",420,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,418,14,200,450,Color(35,35,35,150))
		surface.DrawOutline(418,14,200,450,1,Color(0,0,0))	
	end
	local esps_poss = vgui.Create("DPanel",FontsPanel)
	esps_poss:SetPos(2,14)
	esps_poss:SetSize(200,725)
	esps_poss.Paint = function() end
	local esps_aligns = vgui.Create("DPanel",FontsPanel)
	esps_aligns:SetPos(210,14)
	esps_aligns:SetSize(200,600)
	esps_aligns.Paint = function() end
	local esps_fonts = vgui.Create("DPanel",FontsPanel)
	esps_fonts:SetPos(418,14)
	esps_fonts:SetSize(200,300)
	esps_fonts.Paint = function() end
	--Self
	local SelfPanel = vgui.Create("DPanel",sheet)
	SelfPanel:Dock(FILL)
	SelfPanel.Paint = function(self,w,h)
		surface.DrawOutline(0,0,w,h,1,Color(0,0,0))
		--Main
		draw.SimpleText("View:","BudgetLabel",5,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,2,14,200,600,Color(35,35,35,150))
		surface.DrawOutline(2,14,200,600,1,Color(0,0,0))
		--Effects & Other
		draw.SimpleText("Effects / Other:","BudgetLabel",213,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,210,14,200,300,Color(35,35,35,150))
		surface.DrawOutline(210,14,200,300,1,Color(0,0,0))	
		--HUD 
		draw.SimpleText("HUD:","BudgetLabel",420,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,418,14,200,450,Color(35,35,35,150))
		surface.DrawOutline(418,14,200,450,1,Color(0,0,0))	
	end
	local self_view = vgui.Create("DPanel",SelfPanel)
	self_view:SetPos(2,14)
	self_view:SetSize(200,600)
	self_view.Paint = function() end
	local self_other = vgui.Create("DPanel",SelfPanel)
	self_other:SetPos(210,14)
	self_other:SetSize(200,300)
	self_other.Paint = function() end
	local self_hud = vgui.Create("DPanel",SelfPanel)
	self_hud:SetPos(418,14)
	self_hud:SetSize(200,450)
	self_hud.Paint = function() end
	--World
	local WorldPanel = vgui.Create("DPanel",sheet)
	WorldPanel:Dock(FILL)
	WorldPanel.Paint = function(self,w,h)
		surface.DrawOutline(0,0,w,h,1,Color(0,0,0))
		--Minimap
		draw.SimpleText("Minimap:","BudgetLabel",5,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,2,14,200,235,Color(35,35,35,150))
		surface.DrawOutline(2,14,200,235,1,Color(0,0,0))
		--Effects & Other
		draw.SimpleText("Effects:","BudgetLabel",213,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,210,14,200,350,Color(35,35,35,150))
		surface.DrawOutline(210,14,200,350,1,Color(0,0,0))	
		--HUD 
		draw.SimpleText("Color Correction:","BudgetLabel",420,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,418,14,200,450,Color(35,35,35,150))
		surface.DrawOutline(418,14,200,450,1,Color(0,0,0))	
	end
	local wrld_minimap = vgui.Create("DPanel",WorldPanel)
	wrld_minimap:SetPos(2,14)
	wrld_minimap:SetSize(200,235)
	wrld_minimap.Paint = function() end
	local wrld_effects = vgui.Create("DPanel",WorldPanel)
	wrld_effects:SetPos(210,14)
	wrld_effects:SetSize(200,350)
	wrld_effects.Paint = function() end
	local wrld_cc = vgui.Create("DPanel",WorldPanel)
	wrld_cc:SetPos(418,14)
	wrld_cc:SetSize(200,450)
	wrld_cc.Paint = function() end
	--Lsits
	local ListsPanel = vgui.Create("DPanel",sheet)
	ListsPanel:Dock(FILL)
	ListsPanel.Paint = function(self,w,h) 
		surface.DrawOutline(0,0,w,h,1,Color(0,0,0))
		--Entity options
		draw.SimpleText("Entity:","BudgetLabel",3,255,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,2,270,290,100,Color(35,35,35,150))
		surface.DrawOutline(2,270,290,100,1,Color(0,0,0))	
		--Player options
		draw.SimpleText("Players:","BudgetLabel",302,255,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,300,270,290,100,Color(35,35,35,150))
		surface.DrawOutline(300,270,290,100,1,Color(0,0,0))	
	end

	local entList = vgui.Create("DListView", ListsPanel)
	entList:DockMargin(0, 0, 100, 0)
	entList:SetPos(0,0)
	entList:SetSize(620,250)
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

	local enable = vgui.Create("DCheckBoxLabel", ListsPanel)
	enable:SetText("Enable ESP")
	enable:SetPos(5, 272)
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

	CreateCheckBox("Box ESP", 5, 292, "esp_entity_box", true, ListsPanel, 165)
	CreateCheckBox("Name ESP", 5, 312, "esp_entity_name", true, ListsPanel, 165)
	CreateCheckBox("Chams", 5, 332, "esp_entity_chams", false, ListsPanel, 165)

	function entList:OnRowSelected(ind, line)
		if table.HasValue(config["entities"], line:GetColumnText(1)) then
			enable:SetValue(true)
		else
			enable:SetValue(false)
		end
	end
	--Player List
	local dlist = vgui.Create("DListView", ListsPanel)
	dlist:DockMargin(0, 0, 150, 0)
	dlist:SetPos(0,380)
	dlist:SetSize(620,350)
	dlist:SetMultiSelect(false)
	dlist:AddColumn("Name")
	dlist:AddColumn("Steam ID")
	dlist:AddColumn("Rank")
	
	for k, v in ipairs(player.GetAll()) do
		if v != LocalPlayer() then
			dlist:AddLine(v:Name(), v:SteamID(), v:GetUserGroup())
		end
	end
	
	local profile = vgui.Create("DButton", ListsPanel)
	profile:SetSize(130, 20)
	profile:SetPos(305, 272)
	profile:SetText("Open Profile")
	profile:SetTooltip("Opens the selected players steam profile.")
	function profile:DoClick()
		if dlist:GetSelectedLine() != nil then
			local _, line = dlist:GetSelectedLine()
			player.GetBySteamID(line:GetColumnText(2)):ShowProfile()
		end
	end
	
	local steamid = vgui.Create("DButton", ListsPanel)
	steamid:SetSize(130, 20)
	steamid:SetPos(305, 272+25)
	steamid:SetText("Copy SteamID")
	steamid:SetTooltip("Copies the selected players SteamID.")
	function steamid:DoClick()
		if dlist:GetSelectedLine() != nil then
			local _, line = dlist:GetSelectedLine()
			SetClipboardText(line:GetColumnText(2))
			chat.AddText(Color(61, 149, 217), "[PenisDeda] ", Color(222, 222, 222), "SteamID copied to clipboard.")
		end
	end
	
	local friend = vgui.Create("DCheckBoxLabel", ListsPanel)
	friend:SetText("Friend")
	friend:SetPos(305, 272+50)
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
	--Misc
	local MiscPanel = vgui.Create("DPanel",sheet)
	MiscPanel:Dock(FILL)
	MiscPanel.Paint = function(self,w,h) 
		surface.DrawOutline(0,0,w,h,1,Color(0,0,0))
		--Movement
		draw.SimpleText("Movement:","BudgetLabel",5,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,2,14,200,310,Color(35,35,35,150))
		surface.DrawOutline(2,14,200,310,1,Color(0,0,0))
		--misc
		draw.SimpleText("Misc:","BudgetLabel",213,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,210,14,200,600,Color(35,35,35,150))
		surface.DrawOutline(210,14,200,600,1,Color(0,0,0))	
		--others 
		draw.SimpleText("Event Logs:","BudgetLabel",420,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,418,14,200,150,Color(35,35,35,150))
		surface.DrawOutline(418,14,200,150,1,Color(0,0,0))	
		--Panels 
		draw.SimpleText("Panels:","BudgetLabel",420,170,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,418,190,200,350,Color(35,35,35,150))
		surface.DrawOutline(418,190,200,350,1,Color(0,0,0))
		--bSendPackets
		draw.SimpleText("bSendPackets:","BudgetLabel",2,324,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,2,344,200,200,Color(35,35,35,150))
		surface.DrawOutline(2,344,200,200,1,Color(0,0,0))		
	end
	local misc_movement = vgui.Create("DPanel",MiscPanel)
	misc_movement:SetPos(2,14)
	misc_movement:SetSize(200,310)
	misc_movement.Paint = function() end
	local misc_misc = vgui.Create("DPanel",MiscPanel)
	misc_misc:SetPos(210,14)
	misc_misc:SetSize(200,600)
	misc_misc.Paint = function() end
	local misc_logs = vgui.Create("DPanel",MiscPanel)
	misc_logs:SetPos(418,14)
	misc_logs:SetSize(200,150)
	misc_logs.Paint = function() end
	local misc_panels = vgui.Create("DPanel",MiscPanel)
	misc_panels:SetPos(418,190)
	misc_panels:SetSize(200,350)
	misc_panels.Paint = function() end
	local misc_packets = vgui.Create("DPanel",MiscPanel)
	misc_packets:SetPos(2,344)
	misc_packets:SetSize(200,200)
	misc_packets.Paint = function() end
	--Config
	local CfgPanel = vgui.Create("DPanel",sheet)
	CfgPanel:Dock(FILL)
	CfgPanel.Paint = function(self,w,h) 
		surface.DrawOutline(0,0,w,h,1,Color(0,0,0))
		--Movement
		draw.SimpleText("Configs:","BudgetLabel",5,1,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		draw.RoundedBox(0,2,14,200,350,Color(35,35,35,150))
		surface.DrawOutline(2,14,200,350,1,Color(0,0,0))
	end


	sheet:AddSheet( "Aimbot", AimPanel, "icon16/gun.png", false, false, "All you need to shoot kids =)")
	sheet:AddSheet( "Players", ESPPanel, "icon16/eye.png", false, false, "Player ESP,Chams,Effects.")
	sheet:AddSheet( "ESP Fonts", FontsPanel, "icon16/style_edit.png", false, false, "Size,Font,Pos of ESP Elements.")
	sheet:AddSheet( "Self", SelfPanel, "icon16/emoticon_tongue.png", false, false, "Self view,chams,effects.")
	sheet:AddSheet( "World", WorldPanel, "icon16/world.png", false, false, "World color,Skybox,Effects.")
	sheet:AddSheet( "Lists", ListsPanel, "icon16/application_double.png", false, false, "Entity/Player List.")	
	sheet:AddSheet( "Misc", MiscPanel, "icon16/wrench.png", false, false, "Movement/misc.")	
	sheet:AddSheet( "Config", CfgPanel, "icon16/application_double.png", false, false, "Config / Menu themes.")	
	sheet:SwitchToName(activeTab)
		for k, v in pairs(sheet:GetItems()) do
			function v.Tab:OnDepressed()
			activeTab = v.Name
		end
	end

	--CreateButton("Unload", "Fully unloads the cheat.", Unload, 5, 3, frame)  
	
	--Aimbot
   	CreateCheckBox("Enable Aimbot", 5, 5, "aim_master_toggle", false, aim_main)
	CreateCheckBox("Aimbot On Key", 5, 25, "aim_onkey", false, aim_main)
	CreateKeybind(140, 25, "aim_onkey_key", aim_main)
	CreateDropdown("Silent Aim", 5, 45, {"None", "Clientside", "Serverside"}, "aim_silent", aim_main)
    CreateSlider("Aimbot FOV", 5, 85, "aim_fov", 0, 180, 0, aim_main)	
	CreateCheckBox("Aimbot Smoothing", 5, 125, "aim_smoothing", false, aim_main)
	CreateSlider("Smoothing Scale", 5, 145, "aim_smoothing_value", 0, 2, 2, aim_main) 
	CreateCheckBox("Aim Jitter", 5, 185, "aim_jitter", false, aim_main)
	CreateSlider("Jitter Scale", 5, 205, "aim_jitteramount", 0, 5, 2, aim_main)
	CreateDropdown("Prediction Method", 5, 245, {"Velocity", "Engine", "Engine 2"}, "aim_predmethod", aim_main)

	CreateDropdown("Target Selection", 5, 5, {"Crosshair", "Closest Distance", "Lowest Health"}, "aim_target", aim_targ)
	CreateDropdown("Hitbox Selection", 5, 45, {"Hitscan", "Head", "Body"}, "aim_hitbox", aim_targ)	
	CreateCheckBox("Multipoint", 5, 85, "aim_jitter", false, aim_targ)
	CreateSlider("Multipoint Scale", 5, 105, "aim_jitteramount", 0, 4, 0, aim_targ) 
	CreateDropdown("Multipoint Hitbox", 5, 145, {"Auto", "Head", "Body"}, "aim_hitbox", aim_targ)	
	CreateCheckBox("Ignore Friends", 5, 195, "aim_ignorefriends", false, aim_targ)
	CreateCheckBox("Ignore BOTS", 5, 215, "aim_ignorebots", false, aim_targ)
	CreateCheckBox("Ignore Staff", 5, 235, "aim_ignoreadmins", false, aim_targ)
	CreateCheckBox("Ignore Noclipping", 5, 255, "aim_ignorenoclip", false, aim_targ)
	CreateCheckBox("Ignore Same Team", 5, 275, "aim_ignoreteam", false, aim_targ)
	CreateCheckBox("Ignore Non-Visible", 5, 295, "aim_ignoreinvis", false, aim_targ)
	CreateCheckBox("Jump Check", 5, 315, "aim_jump_check", false, aim_targ)
	CreateCheckBox("Ignore No-Draw", 5, 335, "aim_nodraw", false, aim_targ)
	CreateCheckBox("Ignore God", 5, 355, "aim_godded", false, aim_targ)

	CreateCheckBox("Remove Visual Recoil", 5, 5, "aim_norecoil", false, aim_acc)
	CreateCheckBox("Remove Recoil", 5, 25, "aim_norecoil_true", false, aim_acc)
	CreateCheckBox("Predict Spread", 5, 45, "aim_nospread", false, aim_acc)	
	CreateCheckBox("Auto Slow", 5, 65, "autoslow", false, aim_acc)
	CreateCheckBox("Auto Crouch", 5, 85, "autocrouch", false, aim_acc)
	CreateCheckBox("Bullet Time", 5, 105, "aim_bullettime", false, aim_acc)	
	CreateCheckBox("Prediction", 5, 125, "aim_velocitypred", false, aim_acc)		
    CreateCheckBox("Interp Disabler", 5, 145, "aim_interp", false, aim_acc)

	CreateCheckBox("Automatic Fire", 5, 5, "aim_autofire", false, aim_helpers)
	CreateCheckBox("Automatic Reload", 5, 25, "aim_autoreload", false, aim_helpers)
	CreateCheckBox("Auto Click k(Rapid Fire)", 5, 45, "misc_autoclick", false, aim_helpers)
	CreateCheckBox("M9K Sprint disabler", 5, 65, "misc_m9kstopper", false, aim_helpers)
	CreateCheckBox("Force Backstab", 5, 85, "aim_facestab", false, aim_helpers)
	CreateCheckBox("Knife BOT", 5, 105, "aim_knifebot", false, aim_helpers)
	CreateCheckBox("Act Disabler", 5, 125, "aim_act_disabler", false, aim_helpers)
	CreateCheckBox("Rope Spam", 5, 145, "misc_ropes", false, aim_helpers)	
	
	CreateCheckBox("Enable Triggerbot", 5, 5, "trigger_master_toggle", false, aim_trigger)
	CreateCheckBox("Triggerbot On Key", 5, 25, "trigger_onkey", false, aim_trigger)
	CreateKeybind(140, 25, "trigger_onkey_key", aim_trigger)	

	CreateCheckBox("Enable backtracking", 5, 5, "backtrack_enable", false, aim_bt)
	CreateSlider("Backtrack Amount", 5, 25, "backtrack_amount", 0, 200, 0, aim_bt)	

	--ESP
	CreateCheckBox("Bounding Box", 5, 5, "esp_player_box", true, esp_main, 165)
	CreateDropdown("Box Style", 5, 25, {"Line | Box", "Line | Corners", "3D Box", "Neon Red", "Neon Blue", "Box | Default", "Box | Outlined"}, "esp_player_box_mode", esp_main)
	CreateCheckBox("Health Bar", 5, 65, "esp_player_hp", true, esp_main, 165)
	CreateDropdown("Health Bar Pos", 5, 85, {"Left", "Right", "Up", "Down"}, "esp_player_hp_type", esp_main)	
	CreateCheckBox("Armor Bar", 5, 125, "esp_player_ap", true, esp_main, 165)
	CreateDropdown("Armor Bar Pos", 5, 145, {"Left", "Right", "Up", "Down"}, "esp_player_ap_type", esp_main)	
	CreateCheckBox("Name", 5, 185, "esp_player_name", true, esp_main, 165)
	CreateCheckBox("Health", 5, 205, "esp_player_health", true, esp_main, 165)
	CreateCheckBox("Armor", 5, 225, "esp_player_armor", true, esp_main, 165)
	CreateCheckBox("Weapon Class", 5, 245, "esp_player_weapon", true, esp_main, 165)
	CreateCheckBox("Weapon Name", 5, 265, "esp_player_weapon_fancy", false, esp_main)
	CreateCheckBox("Group(Rank)", 5, 285, "esp_player_rank", true, esp_main, 165)
	CreateCheckBox("Team", 5, 305, "esp_player_team", false, esp_main)
	CreateCheckBox("Distance", 5, 325, "esp_player_distance", true, esp_main, 165)
	CreateCheckBox("DarkRP Money", 5, 345, "esp_player_money", true, esp_main, 165)
	--CreateCheckBox("Dormant Indicator", 5, 365, "esp_player_dormant_ind", true, esp_main, 165)
	CreateCheckBox("Snaplines", 5, 365, "esp_player_snaplines", true, esp_main, 165)
	CreateDropdown("Snapline Style", 5, 385, {"From Player", "Crosshair", "Aim Spot"}, "esp_player_snaplines_pos", esp_main)

	CreateCheckBox("Player Skeleton", 5, 5, "esp_player_skeleton", true, esp_render, 165)
	CreateCheckBox("Player Sights", 5, 25, "esp_player_sights", true, esp_render, 165)
	CreateCheckBox("Player Hitbox", 5, 45, "esp_player_hitbox", true, esp_render, 165)
	CreateCheckBox("Bullet Beam", 5, 65, "esp_player_bulletbeam", true, esp_render, 165)

	CreateCheckBox("Glow ESP", 5, 5, "esp_player_glow", true, esp_effects, 165)
	CreateDropdown("Glow Style", 5, 25, {"Default", "Cover", "Outline"}, "esp_player_glow_type", esp_effects)
	CreateCheckBox("Hitsound", 5, 65, "esp_other_hitsound", false, esp_effects)
	CreateCheckBox("HitNumbers", 5, 85, "esp_other_hitnumbers", false, esp_effects)
    CreateCheckBox("Attachment Glow", 5, 105, "esp_attachments_glow", true, esp_effects, 165)
	CreateCheckBox("HitMarker", 5, 125, "esp_player_hitmarker", false, esp_effects)
	CreateDropdown("Hitsound", 5, 145, {"Classic", "Bell", "Bubble", "Rust", "Good One", "Nice Shot", "Neverlose", "Metallic", "Stapler", "Skeet", "Stuck"}, "esp_hitsound_sound", esp_effects)	

	CreateCheckBox("Visible Chams", 5, 5, "esp_player_chams", true, esp_chams, 165)
	CreateCheckBox("Player Chams Overlay", 5, 25, "esp_player_chams_overlay", true, esp_chams, 165)
	CreateCheckBox("Player Chams XYZ", 5, 45, "esp_player_chams_xyz", true, esp_chams, 165)	
	CreateCheckBox("Draw Model", 5, 65, "esp_player_drawmodel", false, esp_chams)
	CreateCheckBox("Draw Attachment Model", 5, 85, "esp_player_drawmodelatt", false, esp_chams)
	CreateButton("Chams Material", "Opens the cham material selector.", CreateMaterialList, 3, 105, esp_chams)
	
	CreateCheckBox("Ignore Teammates", 5, 5, "esp_player_teamfilter", false, esp_misc)
	CreateCheckBox("Ignore Bots", 5, 25, "esp_player_botfilter", false, esp_misc)
	CreateSlider("ESP Max Render Distance", 5, 45, "esp_player_render_distance", 0, 15000, 0, esp_misc)
	CreateCheckBox("Hide Dormant Players", 5, 85, "esp_player_dormant", false, esp_misc)
	CreateCheckBox("Highlight Friends Box", 5, 105, "esp_player_highlight_box", true, esp_misc, 165)
	CreateCheckBox("Highlight Friends Name", 5, 125, "esp_player_highlight_name", true, esp_misc, 165)
	CreateCheckBox("ESP Compensation", 5, 145, "esp_comp", false, esp_misc)	
    CreateButton("ESP Mode " .. GetRenderMode(), "If your ESP is not working on a server try changing this to unsafe. (THIS SHOULD ALWAYS BE PROTECTED WHEN POSSIBLE TO MAXIMIZE SCREENGRAB PROTECTION)", SwapRender, 3, 165, esp_misc)	
	--Self
	CreateCheckBox("Thirdperson", 5, 5, "esp_other_thirdperson", false, self_view)
	CreateKeybind(140, 5, "thirdperson_key", self_view)
	CreateSlider("Thirdperson Distance", 5, 25, "esp_other_thirdperson_distance", 5, 15, 0, self_view)
	CreateCheckBox("Freecam", 5, 65, "esp_other_freecam", false, self_view)
	CreateKeybind(140, 65, "freecam_key", self_view)
	CreateSlider("Freecam Speed", 5, 85, "esp_other_freecam_speed", 1, 5, 0, self_view)
	CreateCheckBox("Override FOV", 5, 125, "misc_fov", false, self_view)
	CreateSlider("FOV Value", 5, 145, "misc_fov_value", 50, 160, 0, self_view)
	CreateCheckBox("Viewmodel Changer", 5, 185, "misc_viewmodel", false, self_view)
	CreateCheckBox("Remove Bob", 5, 205, "misc_bob", false, self_view)
	CreateCheckBox("Remove Sway", 5, 225, "misc_sway", false, self_view)
	CreateSlider("Viewmodel X", 5, 245, "misc_vm_x", -50, 50, 0, self_view)
	CreateSlider("Viewmodel Y", 5, 285, "misc_vm_y", -30, 30, 0, self_view)
	CreateSlider("Viewmodel Z", 5, 325, "misc_vm_z", -20, 20, 0, self_view)
	CreateSlider("Viewmodel Pitch", 5, 365, "misc_vm_p", -90, 90, 0, self_view)
	CreateSlider("Viewmodel Yaw", 5, 405, "misc_vm_ya", -90, 90, 0, self_view)
	CreateSlider("Viewmodel Roll", 5, 445, "misc_vm_r", -90, 90, 0, self_view)
	CreateCheckBox("Thirdperson Wall Detect", 5, 485, "esp_other_thirdperson_walldetect", false, self_view)
	CreateCheckBox("Hand Chams", 5, 505, "esp_self_hand_chams", true, self_view, 165)
	CreateCheckBox("Gun Chams", 5, 525, "esp_self_gun_chams", true, self_view, 165)	

	CreateCheckBox("Draw Aimbot FOV", 5, 5, "esp_other_drawfov", true, self_other, 165)
	CreateCheckBox("Bullet Tracer", 5, 25, "esp_self_bullet_tracers", true, self_other, 165)
	CreateCheckBox("Laser Sights", 5, 45, "esp_self_laser_sight", true, self_other, 165)
	CreateCheckBox("DLight", 5, 65, "esp_self_dlight", true, self_other, 165)
	CreateCheckBox("DLight HSV", 5, 85, "esp_self_dlight_hsv", false, self_other)
	CreateCheckBox("Predict Fall", 5, 105, "esp_self_predict_me", false, self_other)
	CreateCheckBox("AimFov Fill", 5, 125, "esp_other_drawfov_fill", false, self_other, 165)
	CreateCheckBox("Velocity Crosshair", 5, 145, "esp_self_velocity_crosshair", true, self_other, 165)
	CreateCheckBox("Player Hat", 5, 165, "esp_self_hat", false, self_other, 165)	
	CreateDropdown("Hat model", 5, 185, {"Nimbus", "Hat", "Cap", "Bomb"}, "esp_self_hat_type", self_other)
	CreateCheckBox("Agent Changer", 5, 225, "esp_self_customagent", false, self_other, 165)	
	CreateDropdown("Agent", 5, 245, {"SAS", "Pirat", "Anarchist", "Pro"}, "esp_self_customagent_agent", self_other)
	--CreateCheckBox("Fake Lag Chams", 5, 310, "esp_self_fakelagchams", true, self_other, 165)	

	CreateCheckBox("Watermark", 5, 5, "hud_watermark", false, self_hud )
	CreateCheckBox("Disable HL2 HUD", 5, 25, "hud_disable_hl2_hud", false, self_hud )
	CreateCheckBox("CrossHair", 5, 45, "hud_crosshair", false, self_hud )
    CreateDropdown("CrossHair Style", 5, 65, {"Classic", "Зига", "Смачная Наиплотнейшая Зигота"}, "hud_crosshair_type", self_hud)
	CreateCheckBox("KeyStrokes", 5, 105, "hud_keystrokes", false, self_hud )
    CreateDropdown("KeyStrokes Style", 5, 125, {"WASD", "WASD-SPACE", "WASD-LMB-RMB", "All"}, "hud_keystrokes_style", self_hud)
	CreateCheckBox("KillAura Circle", 5, 165, "hud_aimbotstatus", false, self_hud )
	CreateCheckBox("KillStreak", 5, 185, "hud_killstreak", false, self_hud )
	CreateCheckBox("Bind list", 5, 205, "hud_arraylist", false, self_hud )
	CreateCheckBox("Top Line", 5, 225, "hud_topline", false, self_hud )
	CreateDropdown("Top Line Style", 5, 245, {"Outlined", "Normal", "Glow"}, "hud_topline_style", self_hud)
	CreateCheckBox("Packets", 5, 285, "hud_bsp", false, self_hud )

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

	--CreateSlider("Dormant X", 10, 670, "di_x", -250, 250, 0, esps_poss)
	--CreateSlider("Dormant Y", 10, 710, "di_y", -250, 250, 0, esps_poss)	
	
    CreateDropdown("Name Position", 5, 30, {"Left", "Right", "Up", "Down"}, "name_pos", esps_aligns)
	CreateDropdown("Health Position", 5, 70, {"Left", "Right", "Up", "Down"}, "health_pos", esps_aligns)	
	CreateDropdown("Armor Position", 5, 110, {"Left", "Right", "Up", "Down"}, "armor_pos", esps_aligns)	
	CreateDropdown("Weapon Position", 5, 150, {"Left", "Right", "Up", "Down"}, "wep_pos", esps_aligns)
	CreateDropdown("Team Position", 5, 190, {"Left", "Right", "Up", "Down"}, "tm_pos", esps_aligns)
	CreateDropdown("Rank Position", 5, 230, {"Left", "Right", "Up", "Down"}, "rank_pos", esps_aligns)
	CreateDropdown("Distance Position", 5, 270, {"Left", "Right", "Up", "Down"}, "ds_pos", esps_aligns)
	CreateDropdown("Money Position", 5, 310, {"Left", "Right", "Up", "Down"}, "mn_pos", esps_aligns)
	--CreateDropdown("Dormant Position", 5, 350, {"Left", "Right", "Up", "Down"}, "di_pos", esps_aligns)
	
	CreateDropdown("Main Font", 5, 30, CheatFonts, "name_font", esps_fonts)
	CreateSlider("Main Font Size", 5, 70, "name_font_size", 10, 20, 0, esps_fonts)
	CreateDropdown("Flag Font", 5, 110, CheatFonts, "flag_font", esps_fonts)
	CreateSlider("Flag Font Size", 5, 150, "flags_font_size", 10, 20, 0, esps_fonts)

	CreateCheckBox("Enable Minimap", 5, 5, "map_enable", true, wrld_minimap, 165)
	CreateSlider("Radar FOV", 5, 25, "map_zoom", 5, 100, 0, wrld_minimap)
	CreateSlider("Radar Size", 5, 65, "map_size", 0, 1000, 0, wrld_minimap)
	CreateSlider("Radar X", 5, 105, "map_x", 0, ScrW(), 0, wrld_minimap)
	CreateSlider("Radar Y", 5, 145, "map_y", 0, ScrH(), 0, wrld_minimap)
	CreateCheckBox("Player Names", 5, 185, "map_names", true, wrld_minimap, 165)
	CreateCheckBox("Player Team", 5, 205, "map_teams", false, wrld_minimap, 165)

	CreateCheckBox("Fog Modulation", 5, 5, "esp_other_fog", true, wrld_effects, 165)
	CreateSlider("Fog Start", 5, 25, "esp_other_fog_start", 0, 50000, 0, wrld_effects)
	CreateSlider("Fog End", 5, 65, "esp_other_fog_end", 0, 50000, 0, wrld_effects)
	CreateSlider("Fog Density", 5, 105, "esp_other_fog_density", 0, 1, 1, wrld_effects)
	CreateCheckBox("NoSky (2D)", 5, 145, "esp_other_nosky", false, wrld_effects)
	CreateCheckBox("SkyBox Draw Rect", 5, 165, "esp_other_skyboxrect", true, wrld_effects, 165)
	CreateCheckBox("Disable 3d Sky", 5, 185, "esp_other_3dskydisabler", false, wrld_effects)
	CreateSlider("Bloom Scale", 5, 205, "esp_other_bloom", 0, 1, 2, wrld_effects)	
	CreateCheckBox("HL1 Flashlight", 5, 245, "esp_other_hlflashlight", false, wrld_effects)	
	CreateCheckBox("World Color", 5, 265, "esp_other_worldmod", true, wrld_effects, 165)
	CreateCheckBox("Prop Color", 5, 285, "esp_other_propmod", true, wrld_effects, 165)
	CreateCheckBox("Fullbright", 5, 305, "esp_other_fullbright", false, wrld_effects, 165)	
	CreateCheckBox("SkyBox", 5, 325, "esp_other_skybox", false, wrld_effects, 165)	

	CreateCheckBox("Color Correction", 5, 5, "esp_other_cc", false, wrld_cc)
	CreateSlider("Contrast Scale", 5, 25, "esp_other_cc_scale", 0, 1, 1, wrld_cc)
	CreateSlider("Add Red", 5, 65, "esp_other_cc_addr", 0, 255, 0, wrld_cc)
	CreateSlider("Add Green", 5, 105, "esp_other_cc_addg", 0, 255, 0, wrld_cc)
	CreateSlider("Add Blue", 5, 145, "esp_other_cc_addb", 0, 255, 0, wrld_cc)
	CreateSlider("Color", 5, 185, "esp_other_cc_color", 0, 1, 0, wrld_cc)
	CreateSlider("MulR", 5, 225, "esp_other_cc_mulr", 0, 255, 0, wrld_cc)
	CreateSlider("MulG", 5, 265, "esp_other_cc_mulg", 0, 255, 0, wrld_cc)
	CreateSlider("MulB", 5, 305, "esp_other_cc_mulrb", 0, 255, 0, wrld_cc)	
	
	CreateCheckBox("Auto Bunnyhop", 5, 5, "misc_autobunnyhop", false, misc_movement)
	CreateCheckBox("Auto Strafe", 5, 25, "misc_autostrafe", false, misc_movement)
	CreateDropdown("Strafe Type", 5, 45, {"Legit", "Rage", "Free Move", "Directional"}, "misc_autostrafe_type", misc_movement)
	CreateCheckBox("Infinity Duck", 5, 85, "misc_infinitduck", false, misc_movement)
	CreateCheckBox("Air Duck", 5, 105, "misc_airduck", false, misc_movement)
	CreateDropdown("AirDuck Style", 5, 125, {"Input", "Command", "No Stop"}, "misc_airduckmetod", misc_movement)
	CreateCheckBox("Micromovement", 5, 165, "slowwalk", false, misc_movement)
	CreateKeybind(140, 165, "misc_mm_keybind", misc_movement)
	CreateSlider("Micromovement speed", 5, 185, "slowwalk_speed", 10, 60, 0, misc_movement)
	CreateCheckBox("180° turn", 5, 225, "misc_180turn", false, misc_movement)
	CreateKeybind(140, 225, "180turn_keybind", misc_movement)
	CreateCheckBox("Circle Strafe", 5, 245, "misc_circlestrafer", false, misc_movement)
	CreateKeybind(140, 245, "circlestrafer_key", misc_movement)	
	CreateCheckBox("Fake Crouch", 5, 265, "misc_fakecrouch", false, misc_movement)
	CreateCheckBox("Crimwalk", 5, 285, "crimwalk", false, misc_movement)
	CreateKeybind(140, 285, "crimwalkkey", misc_movement)	

	CreateCheckBox("TTT/Murder info", 5, 5, "misc_ttt", false, misc_misc)
    CreateCheckBox("Arest Leave", 5, 25, "misc_antiarest", false, misc_misc)
	CreateDropdown("Leave Method", 5, 45, {"Suicide", "Retry", "/Hobo (Job)"}, "misc_antiarest_metod", misc_misc)	
    CreateCheckBox("RP Name changer", 5, 85, "misc_rpnamer", false, misc_misc)	
    CreateSlider("RPName Delay", 5, 105, "misc_rpnamer_time", 1, 300, 0, misc_misc)		
	CreateCheckBox("Name Stealer", 5, 145, "misc_fnamechanger", false, misc_misc)
	CreateCheckBox("Rainbow Physgun", 5, 165, "misc_rainbow", false, misc_misc)
	CreateCheckBox("Rainbow Player", 5, 185, "misc_rainbowply", false, misc_misc)
	CreateSlider("Rainbow Speed", 5, 205, "misc_rainbow_speed", 1, 100, 0, misc_misc)
	CreateCheckBox("Chat Spammer", 5, 245, "misc_chat_spam", false, misc_misc)	
	CreateCheckBox("Kill Say", 5, 265, "misc_gaysay", false, misc_misc)	
	CreateDropdown("KillSay Type", 5, 285, {"Русский", "D3D9C style", "Русский 2", "Arabian", "Omerican"}, "misc_gaysays", misc_misc)		
	CreateCheckBox("Flashlight Spammmer", 5, 325, "misc_flashlight", false, misc_misc)	
	CreateCheckBox("Use Spammer", 5, 345, "misc_use", false, misc_misc)	
	CreateCheckBox("Za Putina", 5, 365, "misc_doundo", false, misc_misc)
	CreateButton("Calculator", "Basic Calculator.", OpenCalculator, 3, 385, misc_misc)

	CreateCheckBox("Event log", 5, 5, "misc_eventlog", false, misc_logs)
	CreateCheckBox("Log Connection", 5, 25, "misc_eventlog_connects", false, misc_logs)	
	CreateCheckBox("Log Disconnects", 5, 45, "misc_eventlog_dconects", false, misc_logs)
	CreateCheckBox("Log Hurt", 5, 65, "misc_eventlog_hurt", false, misc_logs)	
	CreateButton("Open Logs", "Open log windows.", OpenLogsWindow, 3, 85, misc_logs)

    CreateCheckBox("Info List", 5, 5, "misc_infolist", false, misc_panels)
	CreateSlider("Info List X", 5, 25, "misc_infolist_x", 0, ScrW(), 0, misc_panels)
	CreateSlider("Info List Y", 5, 65, "misc_infolist_y", 0, ScrH(), 0, misc_panels)
	CreateCheckBox("Spectator List", 5, 105, "misc_speclist", false, misc_panels)
	CreateSlider("Spectator List X", 5, 125, "misc_speclist_x", 0, ScrW(), 0, misc_panels)
	CreateSlider("Spectator List Y", 5, 165, "misc_speclist_y", 0, ScrH(), 0, misc_panels)
	CreateCheckBox("Admin List", 5, 205, "misc_adminlist", false, misc_panels)
	CreateSlider("Admin List X", 5, 225, "misc_adminlist_x", 0, ScrW(), 0, misc_panels)
	CreateSlider("Admin List Y", 5, 265, "misc_adminlist_y", 0, ScrH(), 0, misc_panels)	

	CreateCheckBox("Fake Lags", 5, 5, "bsp_fake_lags", false, misc_packets)
	CreateSlider("FakeLag Limit", 5, 25, "bsp_fake_lags_value", 1, 128, 0, misc_packets)
	CreateDropdown("FakeLag Conditions", 5, 65, {"Always On", "In Move", "In Stand", "On Ground", "In Air", "On Attack", "Off Attack"}, "bsp_fake_lags_conditions", misc_packets)
	CreateCheckBox("Evade bullets", 5, 105, "bsp_evadebullets", false, misc_packets)
	CreateCheckBox("Airstack", 5, 125, "misc_pairstack", false, misc_packets)
	CreateKeybind(140, 125, "airstack", misc_packets)
	
    CreateLabel("Menu Keybind", 10, 16, CfgPanel)
	CreateKeybind(100, 16, "menu_key", CfgPanel)
	local usercfgs = {}
	cfgDropdown = vgui.Create("DComboBox", CfgPanel)
	cfgDropdown:SetSize(192, 20)
	cfgDropdown:SetPos(5, 36)
	if loadedCfg[0] != nil then
		cfgDropdown:ChooseOption(loadedCfg[0], loadedCfg[1])
	end
	for k, v in ipairs(files) do
		cfgDropdown:AddChoice(v)
	end
	cfgDropdown:SetSortItems(false)

	CreateButton("Save Config", "Save Config.", SaveConfig, 3, 60, CfgPanel)
	CreateButton("Load Config", "Load Config.", LoadConfig, 3, 85, CfgPanel)
	CreateButton("Create Config", "Create Config.", CreateConfig, 3, 110, CfgPanel)
	CreateButton("Delete Config", "Delete Config.", DeleteConfig, 3, 135, CfgPanel)
	CreateTextInput("Config Name", "config_name", 2, 160, 16, CfgPanel)

	CreateLabel("Unload Key", 10, 195, CfgPanel)
	CreateKeybind(10, 210, "panic_key", CfgPanel)
    CreateDropdown("Server", 10, 230, {"Comunity", "D3S HvH"}, "gameserver", CfgPanel)

	--CreateButton("Filter Teams", "The filter will be applied when the filter menu is closed. This filter applies to ESP and Aimbot.", CreateFilterPanel, 330, 3, topframe)
	CreateButton("Unload", "Fully unloads the cheat.", Unload, 3, 275, CfgPanel) 

	--CreateCheckBox("Storage ESP", 10, 30, "esp_ent_storage_esp", true, wrld_ents , 165)
	--CreateCheckBox("Crosshair Entity", 10, 50, "esp_ent_crosshair", false, wrld_ents , 165)	


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

--=================================== Other
do

function OpenLogsWindow()


end

function OpenCalculator()
    if !cframe then 

		local cframe = vgui.Create("DFrame") 
		cframe:SetPos(255, 255)  
		cframe:SetSize(115, 245)
		cframe:SetTitle("") 
		cframe:MakePopup()
		cframe:ShowCloseButton(false)

		cframe.Paint = function(self,w,h)
			local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
			surfSetFont("Trebuchet24")
			local tw,th = surfGetTextSize("Calculator")
			draw.RoundedBox(0,0,0,w,h,Color(45,45,50))
			draw.SimpleText("Culculator","Trebuchet18",5,6,color_white,TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
			draw.RoundedBox(0,1,1,w,4,Color(hsv.r,hsv.g,hsv.b))
			Wrad(1,1,w,4)
			surfSetDrawColor(Color(2,2,2))
			surface.DrawOutlinedRect(0,0,w,h,1)
			surface.DrawOutlinedRect(5,30,w-10,h-35,1)
		end

		local cbutton = vgui.Create( "DButton", cframe ) 
		cbutton:SetText( "" )		
		cbutton:SetPos( 93, 7 )					
		cbutton:SetSize( 20, 20 )					
		cbutton.DoClick = function()				
			cframe:Close()	
		end

		cbutton.Paint = function(self,w,h)				
			draw.RoundedBox(0,0,0,w,h,Color(255,88,88))
			surfSetDrawColor(Color(5,5,5))
			surface.DrawOutlinedRect(0,0,w,h,1)


            draw.SimpleText("X","BudgetLabel",7,3,Color(245,245,245),TEXT_ALIGN_LEFT,TEXT_ALIGN_TOP)
		end

		local entry = vgui.Create( "DTextEntry", cframe ) 
	    entry:SetSize(95,20)
		entry:SetPos(8,32)
		entry:SetNumeric(false)
		entry:SetEditable(false)
		entry:SetFont("Trebuchet18")

		-- number buttons
		local num = 0
		local memoryplus = 0
		local memorymin = 0 
		local memory = 0
		local memcheck = 0
		local check = 0 
		local operation = ""
		local value2 = 0
		local value1 = 0
		local posx = 10
		local posy = 180
		entry:SetValue( "0" )
		for i = 1, 9 do
			-- print( "Building button " .. i )
			local calc_but = vgui.Create( "DButton", cframe )
			calc_but:SetSize( 20, 20 )
			calc_but:SetPos( posx, posy )
			calc_but:SetText( i )
			calc_but.DoClick = function()
				memcheck = 0
				if check == 1 then check = 0 entry:SetValue( 0 ) end
				num = entry:GetValue()
				if num == "0" then
					entry:SetValue( i )
				else
					entry:SetValue( num .. i )
				end
				-- print( "value 2 " .. value )
			end
			
			posx = posx + 25
			if posx > 75 then
				posx = 10
			end
			
			if i == 3 then 
				posy = 155
			elseif i == 6 then
				posy = 130
			end
		end
		
		local zero_but = vgui.Create( "DButton", cframe )
		zero_but:SetSize( 45, 20 )
		zero_but:SetPos( 10, 205 )
		zero_but:SetText( 0 )
		zero_but.DoClick = function()
			memcheck = 0
			if check == 1 then check = 0 entry:SetValue( 0 ) end
			num = entry:GetValue()
			-- print( "value " .. value )
			-- print( "num " .. num )
			-- print( "i " .. 0 ) 
			if num == "0" then
				entry:SetValue( 0 )
			else
				entry:SetValue( num .. 0 )
			end
		end
		
		
		-- memory function buttons 
		
		local mshow_but = vgui.Create( "DButton", cframe )
		mshow_but:SetSize( 20, 20 )
		mshow_but:SetPos( 10, 55 )
		mshow_but:SetText( "MR" )
		mshow_but.DoClick = function()
			if tonumber( memory ) == 0 then	 -- set memory value
				if isnumber( tonumber( entry:GetValue())) == true then
					memory = tonumber( entry:GetValue() )
				else
					memory = 0 
				end
				print( "Added " .. memory .. " to memory" )
			else
				if memcheck == 1 then 	-- clear memory
					print( "Cleared calc memory!" )
					entry:SetValue( 0 )
					num = 0
					memory = 0 
					memcheck = 0
					memorymin = 0 
					memoryplus = 0
				elseif memcheck == 0 then 	-- set text to value
					entry:SetValue( memory )
					memcheck = 1
				end
			end
		end
		
		local mplus_but = vgui.Create( "DButton", cframe )
		mplus_but:SetSize( 20, 20 )
		mplus_but:SetPos( 35, 55 )
		mplus_but:SetText( "M+" )
		mplus_but.DoClick = function()
			memcheck = 0
			if entry:GetValue() == 0 or entry:GetValue() == "0" then
			//pass
			else
				if memoryplus == 0 then 
					if isnumber(tonumber( entry:GetValue() )) == true then
						num = tonumber( entry:GetValue() )
					else
						num = 0 
					end
					memoryplus = num
				else 
					num = memoryplus
				end
			end
			-- if isstring( memory ) == true then memory = 0 end
			memory = memory + num 
			entry:SetValue( memory )
		end
		
		local mmin_but = vgui.Create( "DButton", cframe )
		mmin_but:SetSize( 20, 20 )
		mmin_but:SetPos( 60, 55 )
		mmin_but:SetText( "M-" )
		mmin_but.DoClick = function()
			memcheck = 0
			if entry:GetValue() == 0 or entry:GetValue() == "0" then
			//pass
			else
				if memorymin == 0 then 
					if isnumber(tonumber( entry:GetValue() )) == true then
						num = tonumber( entry:GetValue() )
					else
						num = 0 
					end
					memorymin = num
				else 
					num = memorymin
				end
			end
			
			memory = memory - num 
			entry:SetValue( memory )
			-- end
		end
		
		// special function buttons now with more filler 
		
		
		
		local rad_but = vgui.Create( "DButton", cframe )
		rad_but:SetSize( 20, 20 )
		rad_but:SetPos( 85, 80 )
		rad_but:SetText( "√" )
		rad_but.DoClick = function()
			if check == 1 then check = 0 entry:SetValue( 0 ) end
			memcheck = 0
			value1 = entry:GetFloat()
			entry:SetValue( math.sqrt( value1 ) )
			check = 1
		end
		
		local exp_but = vgui.Create( "DButton", cframe )
		exp_but:SetSize( 20, 20 )
		exp_but:SetPos( 10, 105 )
		exp_but:SetText( "^" )
		exp_but.DoClick = function()
			memcheck = 0
			operation = "^"
			value1 = entry:GetFloat()
			entry:SetValue( 0 )
		end
		
		
		
		
		
		
		
		// function buttons
		local clear_but = vgui.Create( "DButton", cframe )
		clear_but:SetSize( 45, 20 )
		clear_but:SetPos( 10, 80 )
		clear_but:SetText( "C" )
		clear_but.DoClick = function()
			memcheck = 0
			memorymin = 0 
			memoryplus = 0
			value = 0
			operation = ""
			value1 = 0
			value2 = 0 
			entry:SetValue( 0 )
		end
		
		local plus_but = vgui.Create( "DButton", cframe )
		plus_but:SetSize( 20, 45 )
		plus_but:SetPos( 85, 130 )
		plus_but:SetText( "+" )
		plus_but.DoClick = function()
			memcheck = 0
			operation = "+"
			value1 = entry:GetFloat()
			entry:SetValue( 0 )
		end
		
		local sub_but = vgui.Create( "DButton", cframe )
		sub_but:SetSize( 20, 20 )
		sub_but:SetPos( 85, 105 )
		sub_but:SetText( "-" )
		sub_but.DoClick = function()
			memcheck = 0
			operation = "-"
			value1 = entry:GetFloat()
			entry:SetValue( 0 )
		end
		
		local div_but = vgui.Create( "DButton", cframe )
		div_but:SetSize( 20, 20 )
		div_but:SetPos( 35, 105 )
		div_but:SetText( "÷" )
		div_but.DoClick = function()
			memcheck = 0
			operation = "/"
			value1 = entry:GetFloat()
			entry:SetValue( 0 )
		end
		
		local multi_but = vgui.Create( "DButton", cframe )
		multi_but:SetSize( 20, 20 )
		multi_but:SetPos( 60, 105 )
		multi_but:SetText( "x" )
		multi_but.DoClick = function()
			memcheck = 0
			operation = "*"
			value1 = entry:GetFloat()
			entry:SetValue( 0 )
		end
		
		// this used to be the pi button but I thought that a % function would be more useful.
		local pi_but = vgui.Create( "DButton", cframe )
		pi_but:SetSize( 20, 20 )
		pi_but:SetPos( 60, 80 )
		pi_but:SetText( "%" )
		pi_but.DoClick = function()
			memcheck = 0
			operation = "%"
			value1 = entry:GetFloat()
			entry:SetValue( 0 )
		end
		
		local dot_but = vgui.Create( "DButton", cframe )
		dot_but:SetSize( 20, 20 )
		dot_but:SetPos( 60, 205 )
		dot_but:SetText( "." )
		dot_but.DoClick = function()
			memcheck = 0
			num = entry:GetValue()
			entry:SetValue( num .. "." )
		end
		
		local negpos_but = vgui.Create( "DButton", cframe )
		negpos_but:SetSize( 20, 20 )
		negpos_but:SetPos( 85, 55 )
		negpos_but:SetText( "+/-" )
		negpos_but.DoClick = function()
			memcheck = 0
			num = entry:GetValue()
			if isnumber( tonumber( entry:GetValue())) == true then
				num = tonumber( entry:GetValue() )
			else
				num = 0 
			end
			entry:SetValue( num * -1 )
		end
		
		local equal_but = vgui.Create( "DButton", cframe )
		equal_but:SetSize( 20, 45 )
		equal_but:SetPos( 85, 180 )
		equal_but:SetText( "=" )
		equal_but.DoClick = function()
			memcheck = 0
			
			value2 = entry:GetFloat()
			
			-- checks to make sure values are valid
			if value1 == nil or isstring( value1 ) == true then value1 = 0 end
			if value2 == nil or isstring( value2 ) == true then value2 = 0 end
			
			if operation == "+" then
				entry:SetValue( tonumber( value1 ) + tonumber( value2 ) )
			elseif operation == "-" then
				entry:SetValue( tonumber( value1 ) - tonumber( value2 ) )
			elseif operation == "/" then
				entry:SetValue( tonumber( value1 ) / tonumber( value2 ) )
			elseif operation == "*" then
				entry:SetValue( tonumber( value1 ) * tonumber( value2 ) )
			elseif operation == "^" then
				entry:SetValue( math.pow( tonumber( value1 ), tonumber( value2 ) ) )
			elseif operation == "%" then
				entry:SetValue( ( tonumber( value2 ) / 100 ) * tonumber( value1 ) )
			else
				entry:SetValue( 0 )

			end
			check = 1
		end

		--[[button.Paint = function(self,w,h)				
			draw.RoundedBox(0,0,0,w,h,Color(50,50,55))
			surfSetDrawColor(Color(2,2,2))
			surface.DrawOutlinedRect(0,0,w,h,1,Color(2,2,2))
		end]]

    end
end

end
--===================================
--=================================== Visuals
--===================================

SourceSkyname = GetConVar("sv_skyname"):GetString()
SourceSkyPre = {"lf", "ft", "rt", "bk", "dn", "up"}
SourceSkyMat = {
    Material("skybox/".. SourceSkyname.. "lf"),
    Material("skybox/".. SourceSkyname.. "ft"),
    Material("skybox/".. SourceSkyname.. "rt"),
    Material("skybox/".. SourceSkyname.. "bk"),
    Material("skybox/".. SourceSkyname.. "dn"),
    Material("skybox/".. SourceSkyname.. "up")
}

function ChangeSkybox()
	for i = 1, 6 do
		skebox = Material("skybox/".. config["skybox_name"].. SourceSkyPre[i]):GetTexture("$basetexture")
		SourceSkyMat[i]:SetTexture("$basetexture", skebox)
	end
end

AddHook("RenderScene", RandomString(), ChangeSky)

do
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
					if config["esp_entity_chams"] then
						cam.Start3D()
							v:DrawModel()
						cam.End3D()
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
					surfSetFont("Tahoma")
					local w = surfGetTextSize("Admins Online")
					if v:IsSuperAdmin() then a =  " (" .. v:GetUserGroup() .. ") " elseif v:IsAdmin() then a = "(" .. v:GetUserGroup() .. ")" else a = v:GetUserGroup() end
		            draw.RoundedBox( 3, x, y, 200, 25, Color(25,25,25))
			        draw.RoundedBox( 10, x+2, y+1, 196, 3, Color(rgbcol.r,rgbcol.g,rgbcol.b))
					
		            surfSetDrawColor( 255, 255, 255, 60 ) 
	                surface.SetMaterial(Material("gui/center_gradient")) 
	                surfDrawTexturedRect(x+4, y+1, 200-4, 3)
					
                    draw.SimpleText( "Admins Online", "Tahoma", x+(200/2) - w/2, y+5, color_white )
					
					surfSetFont("Tahoma")
					local nameWidth, nameHeight = surfGetTextSize(v:Name().." ("..a..")")
					surfSetDrawColor( 11, 11, 11, 200 ) 
	                surface.SetMaterial(Material("gui/gradient")) 
	                surfDrawTexturedRect(x+2, y+28 + (15 * ( k - 1 ) ), nameWidth + 50, nameHeight)
					draw.SimpleText(v:Name()..a, "Tahoma", x+3, y+28 + (15 * ( k - 1 ) ), Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
				end
			end
		end
		if config["misc_infolist"] then
		    local rgbcol = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
		    local killo,detho,velo,fpso,health,ap = LocalPlayer():Frags(),LocalPlayer():Deaths(),me:GetVelocity():Length(),tostring(math.floor(1 / RealFrameTime())),me:Health(),me:Armor()
			local x,y = math.Round(config["misc_infolist_x"]), math.Round(config["misc_infolist_y"])
			surfSetFont("Tahoma")
			local w = surfGetTextSize("Info Panel")
		    draw.RoundedBox( 3, x, y, 200, 25, Color(25,25,25))
			draw.RoundedBox( 10, x+2, y+1, 196, 3, Color(rgbcol.r,rgbcol.g,rgbcol.b))
            draw.RoundedBox( 3, x, y+26, 200, 130, Color(25,25,25,100))
			
		    surfSetDrawColor( 255, 255, 255, 60 ) 
	        surface.SetMaterial(Material("gui/center_gradient")) 
	        surfDrawTexturedRect(x+4, y+1, 200-4, 3)

            draw.SimpleText( "Info Panel", "Tahoma", x+(200/2) - w/2, y+5, color_white )

			draw.SimpleText("Frags: " .. killo, "Tahoma", x+3, y+28, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			draw.SimpleText("Deaths: " ..detho, "Tahoma", x+3, y+28+20, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			draw.SimpleText("Velocity: " .. math.Round(velo), "Tahoma", x+3, y+28+20+20, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			draw.SimpleText("FPS: " ..fpso, "Tahoma", x+3, y+28+20+20+20, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			
			draw.SimpleText("Health: " .. health, "Tahoma", x+3, y+28+20+20+20+20, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			draw.SimpleText("Armor: " ..ap, "Tahoma", x+3, y+28+20+20+20+20+20, Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			
		end
		if config["misc_speclist"] then
		    local rgbcol = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
			local x,y = math.Round(config["misc_speclist_x"]), math.Round(config["misc_speclist_y"])
			surfSetFont("Tahoma")
			local w = surfGetTextSize("Spectators")
		    draw.RoundedBox( 3, x, y, 250, 25, Color(25,25,25))
			draw.RoundedBox( 10, x+2, y+1, 246, 3, Color(rgbcol.r,rgbcol.g,rgbcol.b))		
		    surfSetDrawColor( 255, 255, 255, 60 ) 
	        surface.SetMaterial(Material("gui/center_gradient")) 
	        surfDrawTexturedRect(x+4, y+1, 246, 3)
            draw.SimpleText( "Spectators", "Tahoma", x+(250/2) - w/2, y+5, color_white )
			for k, v in ipairs(observingPlayers.spec) do		
				if IsValid(v) then
					surfSetFont("Tahoma")
					local nameWidth, nameHeight = surfGetTextSize("Spectator: "..v:Name())
					surfSetDrawColor( 11, 11, 11, 200 ) 
	                surface.SetMaterial(Material("gui/gradient")) 
	                surfDrawTexturedRect(x+2, y+15 + (15 * k - 1), nameWidth + 50, nameHeight)
				    draw.SimpleText("Spectator: "..v:Name(), "Tahoma", x + 3, y + 15 --[[+ (15 * #observingPlayers.watcher)]] + (15 * k - 1), color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
			    end
			end
		end
		if config["esp_ent_crosshair"] then
		    draw.SimpleText( LocalPlayer():GetEyeTrace().Entity, "Tahoma", (ScrW()/2) - 100, ScrH() / 2 + 65, color_white )
		end
        if config["hud_watermark"] && !frame then
		    surface.SetFont("Tahoma")
		    local textwi = surface.GetTextSize("PenisDeda.NET " .. PenisDedushki.Version .. "|username: " .. LocalPlayer():Name() .. " |gm: " .. engine.ActiveGamemode() .. " |latency:" .. LocalPlayer():Ping() .. " |tick:"..math.Round(1/engine.TickInterval()-1) )
			local textwid = textwi + 5
			local rgbcol = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
		    draw.RoundedBox( 3, 5, 5, textwid, 25, Color(25,25,25))
			draw.RoundedBox( 10, 7, 6, textwid-4, 3, Color(rgbcol.r,rgbcol.g,rgbcol.b))
		    surfSetDrawColor( 255, 255, 255, 60 ) 
	        surface.SetMaterial(Material("gui/center_gradient")) 
	        surfDrawTexturedRect(7, 6, textwid-4, 3)
            draw.SimpleText( "PenisDeda.NET " .. PenisDedushki.Version .. "|username: " .. LocalPlayer():Name() .. " |gm: " .. engine.ActiveGamemode() .. " |latency:" .. LocalPlayer():Ping() .. " |tick:"..math.Round(1/engine.TickInterval()-1) , "Tahoma", 8, 10, color_white )
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
		surface.SetFont("Tahoma")
		local xmax = surface.GetTextSize("Mini Map")    
        draw.SimpleText( "Mini Map", "Tahoma", x + (size / 2 ) - (xmax / 2), y - 20, color_white )		
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
							local jitterangles = Angle(math.random(-config["aim_jitteramount"], config["aim_jitteramount"]), math.random(-config["aim_jitteramount"], config["aim_jitteramount"]), 0)
							jitterangles:Normalize()				
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
									if config["aim_jitter"] then
										ucmd:SetViewAngles(FinAngle + jitterangles)
									else
										ucmd:SetViewAngles(FinAngle + sprdang)
									end
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
surface.CreateFont("45", {font = "Tahoma", extended = false, shadow = true, outline = true, size = 20, weight = 900, antialias = true})
surface.CreateFont("56",{font = "Tahoma", extended = false, shadow = true, outline = true, size = 20, weight = 900, antialias = true})
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
--finish preload
preloadfinished = true
