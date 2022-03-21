--Cheat inf
local penisversion = "V3.5.5"
--Gavno
local surface, draw = surface, draw
local ply, me = LocalPlayer(), LocalPlayer()
local em = FindMetaTable"Entity"
local wm = FindMetaTable"Weapon"
local pm = FindMetaTable"Player"
local config = {}
local teamFilterSelected = {}
config.colors = {}
config.keybinds = {}
//Fonts
surface.CreateFont("smallest_pixel", {size = 15,weight = 1000,antialias = true,shadow = true,font = "smallest_pixel-7",})
surface.CreateFont("Arial_Menu", {size = 15,weight = 500,antialias = true,shadow = true,font = "Arial",})
surface.CreateFont("Arial 12p", {size = 12,weight = 700,antialias = true,shadow = true,font = "Arial",})
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
--require("dickwrap")
require("enginepred")
require("context")
require("bsendpacket")
//PenisDeduration
config["aim_master_toggle"] = false
config["aim_onkey"] = false
config["aim_norecoil"] = false
config["aim_nospread"] = false
config["aim_nospread_type"] = 1
config["aim_prediction"] = false
config["aim_prediction_metod"] = 1
config["aim_silent"] = false
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
config["aim_ignoreinvis"] = false
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
config["aim_nadecheck"] = false
config["aim_bullettime"] = false

config["killaura_crits"] = false
config["killaura_key"] = false
config["killaura_magnet"] = false
config["killaura_on_key"] = false
config["killaura_toggle"] = false
config["killaura_delay"] = false
config["killaura_disttype"] = 1

config["gunmod_m9k"] = false
config["gunmod_m9k_dmg"] = false
config["gunmod_m9k_drecoil"] = false
config["gunmod_m9k_penetretion"] = false

config["gunmod_tfa"] = false
config["gunmod_tfa_dmg"] = false
config["gunmod_tfa_pen"] = false
config["gunmod_tfa_sprd"] = false

config["bot_healthkit"] = false
config["bot_armorkit"] = false

config["trigger_master_toggle"] = false
config["trigger_onkey"] = false

config["antihit_act"] = false
config["antihit_act_type"] = 1
config["antihit_lean"] = false
config["antihit_lean_dir"] = 1

config["antihit_antiaim"] = false
config["yaw_base"] = 1
config["yaw_add"] = 1
config["pitch_add"] = 1

config["antihit_fd"] = false

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
config["esp_player_health"] = false config["health_x"] = 0 config["health_y"] = 10 config["health_pos"] = 1 
config["esp_player_armor"] = false config["armor_x"] = 0 config["armor_y"] = 20 config["armor_pos"] = 1 
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
config["hud_velo"] = false

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

config["misc_ttt"] = false
config["misc_antibot"] = false
config["misc_observerlist"] = false
config["misc_adminlist"] = false
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
config["misc_eventlog"] = false
config["misc_eventlog_type"] = 1
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

config["config_name"] = nil
config["name_font_size"] = 12
config["name_font"] = 1
config["flags_font_size"] = 12
config["flag_font"] = 2

config["bsp_fake_lags"] = false
config["bsp_fake_lags_value"] = 1
config["bsp_fake_lags_conditions"] = 1
config["bsp_fake_lagsr"] = false
config["bsp_fake_lagsr_value"] = 1

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

config.colors["esp_npc_box"] = "255 255 255 255"
config.colors["esp_npc_halo"] = "255 255 255 255"
config.colors["esp_npc_name"] = "255 255 255 255"
config.colors["esp_npc_health"] = "120 255 0 255"
config.colors["esp_npc_snaplines"] = "255 15 15 255"

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

config["friends"] = {}
config["entities"] = {}
//Exploits 
exp_vrmod = false
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
	["Platinum"] = "models/player/shared/ice_player",
	["Gold"] = "models/player/shared/gold_player",
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
	["Untextured"] = "1",
	["Wireframe"] = "!wireframe",
	["Flat"] = "!flat",
	["Textured"] = "!textured"
}
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
	DisableWorldModulation()
	DisablePropModulation()
	cvars.RemoveChangeCallback("pd_setmat", "update_chams")
	cvars.RemoveChangeCallback("pd_setxyzmat", "update_chams_xyz")
	cvars.RemoveChangeCallback("pd_setoverlaymat", "update_chams_overlay")
	print("Cheat was unloaded..")
end

local function GunMod()
--TFA
if config["gunmod_tfa"]  then
if config["gunmod_tfa_dmg"]  then
    RunConsoleCommand("sv_tfa_damage_multiplier", "100")
end
if config["gunmod_tfa_pen"]  then
    RunConsoleCommand("sv_tfa_bullet_penetration_power_mul", "100")
end
if config["gunmod_tfa_sprd"]  then
    RunConsoleCommand("sv_tfa_spread_multiplier", "0")
end
end
if !config["gunmod_tfa"]  then
if !config["gunmod_tfa_dmg"]  then
    RunConsoleCommand("sv_tfa_damage_multiplier", "1")
end
if !config["gunmod_tfa_pen"]  then
    RunConsoleCommand("sv_tfa_bullet_penetration_power_mul", "1")
end
if !config["gunmod_tfa_sprd"]  then
    RunConsoleCommand("sv_tfa_spread_multiplier", "1")
end
end
--M9K
if config["gunmod_m9k"]  then
if config["gunmod_m9k_dmg"]  then
    RunConsoleCommand("M9KDamageMultiplier", "1000")
end
if config["gunmod_m9k_penetretion"]  then
    RunConsoleCommand("M9KDisablePenetration", "1")
end
if config["gunmod_m9k_drecoil"]  then
    RunConsoleCommand("M9KDynamicRecoil", "0")
end
end
if !config["gunmod_m9k"]  then
if !config["gunmod_m9k_dmg"]  then
    RunConsoleCommand("M9KDamageMultiplier", "1")
end
if !config["gunmod_m9k_penetretion"]  then
    RunConsoleCommand("M9KDisablePenetration", "0")
end
if !config["gunmod_m9k_drecoil"]  then
    RunConsoleCommand("M9KDynamicRecoil", "1")
end
end
end

local function CheckObservers()

	if !config["misc_observerlist"] then return end

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
--==================== EXPLOITS =======================--
local function VRmodExploit()
for k,v in ipairs(ents.FindByClass("spawned_money")) do
    timer.Simple(k/1, function()
        net.Start("vrmod_doors")
            net.WriteEntity(v)
        net.SendToServer()
    end)
end
end
local function VRmodExploit2()
for k,v in ipairs(ents.FindByClass("spawned_weapon")) do
    timer.Simple(k/1, function()
        net.Start("vrmod_doors")
            net.WriteEntity(v)
        net.SendToServer()
    end)
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
    surface.SetDrawColor(Color(128,255,128,200))
    surface.DrawRect(1, 2, 13, 13)
	end
	else
    for i = 0, 5 do
    surface.SetDrawColor(Color(200,128,128,45))
    surface.DrawRect(1, 2, 13, 13)
	end
	end
	surface.SetDrawColor(Color(25,25,25,128)) 
	surface.SetMaterial( Material("gui/gradient_up") )
	surface.DrawTexturedRect( 0, 1, 14, 14 )
	surface.SetDrawColor( 0, 0, 0, 255 )
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
		surface.SetDrawColor( 0, 0, 0, 255 )
	    surface.DrawOutlinedRect( 2, 2, w-4, h-4, 1 )
		end
		function colorPicker:DoClick()
			if IsValid(colorWindow) then
				colorWindow:Remove()
			end
			colorPicker:SetColor(string.ToColor(config.colors[cfg]))
			colorWindow = vgui.Create("DFrame")
			colorWindow:SetSize(300, 225)
			colorWindow:SetTitle(lbl.." - Color Picker")
			colorWindow.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, 30, Color(15,15,15,255))
			draw.RoundedBox(0, 0, 30, w, 195, Color(35,35,35,255))
			surface.SetDrawColor( 255, 255, 255, 255 )
	        surface.DrawOutlinedRect( 1, 1, w-1, h-1, 1 )
			end
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
			colorPicker:SetColor(string.ToColor(config.colors[cfg]))
			end
		end
	end
end

local function ColorPickerLabel(lbl, x, y, cfg, col, par)

	local collabel = vgui.Create("DLabel", par)
	collabel:SetText(lbl)
	collabel:SetPos(x, y)
	collabel:SetFont("smallest_pixel")
	local w, h = collabel:GetTextSize()
	collabel:SetSize(w, h)
	
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
    surface.SetDrawColor(Color(128,255,128,200))
    surface.DrawRect(1, 2, 13, 13)
	end
	else
    for i = 0, 5 do
    surface.SetDrawColor(Color(200,128,128,45))
    surface.DrawRect(1, 2, 13, 13)
	end
	end
	surface.SetDrawColor(Color(25,25,25,128)) 
	surface.SetMaterial( Material("gui/gradient_up") )
	surface.DrawTexturedRect( 0, 1, 14, 14 )
	surface.SetDrawColor( 0, 0, 0, 255 )
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
	local w, h = label:GetTextSize()
	label:SetSize(w, h)
	label:SetPos(x, y)
	label:SetFont("smallest_pixel")

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
	surface.SetDrawColor(Color(255,255,255,255)) 
	surface.SetMaterial( Material("gui/lmb.png") )
	surface.DrawTexturedRect( 0, -5, 15, 15 )
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
		surface.SetDrawColor( 0, 0, 0, 255 )
	    surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	end
	DMenuOption.Paint = function(self, w, h)
    for i = 0, 12 do
	draw.RoundedBox(0, 0, 0, w, h, Color(55,55,55,255))
    draw.RoundedBox(0, 1, 1, w-2, h-2, Color(55,55,75,150))
	surface.SetDrawColor( 0, 0, 0, 150 )
	surface.DrawOutlinedRect( 1, 1, w-2, h-2, 1 )    
    end
    surface.SetDrawColor( 0, 0, 0, 0 )
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
	    surface.SetDrawColor(25,25,25,150)
        surface.DrawRect(0, 0, w-2, h)
	end
end

local function CreateButton(lbl, tooltip, fnc, x, y, par)

	local button = vgui.Create("DButton", par)
	button:SetSize(150, 20)
	button:SetPos(x, y)
	button:SetText(lbl)
	button:SetTooltip(tooltip)
	function button:DoClick()
		surface.PlaySound( "buttons/button15.wav" )
		fnc()
	end
	button.Paint = function(self,w,h)
		draw.RoundedBox(0, 0, 0, w, h, Color(45,45,60,150))
		surface.SetDrawColor( 0, 0, 0, 255 )
	    surface.DrawOutlinedRect( 0, 0, w, h, 1 )
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
        surface.SetDrawColor( 255, 255, 255, 255 )
	    surface.SetMaterial( mat )
	    surface.DrawTexturedRect( 0, 0, 15, 15 )
	else
        surface.SetDrawColor( 111, 111, 111, 200 )
	    surface.SetMaterial( mat )
	    surface.DrawTexturedRect( 0, 0, 15, 15 )
	end
	end
end

local function HealthColorButton(x, y, cfg, par)

	local hbox = vgui.Create("DCheckBox", par)
	hbox:SetPos(x, y)
	hbox:SetValue( config[cfg] )
	function hbox:OnChange( bVal )
		config[cfg] = bVal
	end
	hbox.Paint = function(self, w, h)
	local mat = Material("icon16/heart.png")
	if hbox:GetChecked() then
        surface.SetDrawColor( 255, 255, 255, 255 )
	    surface.SetMaterial( mat )
	    surface.DrawTexturedRect( 0, 0, 15, 15 )
	else
        surface.SetDrawColor( 111, 111, 111, 200 )
	    surface.SetMaterial( mat )
	    surface.DrawTexturedRect( 0, 0, 15, 15 )
	end
	end
end

local function CreateExpButton(lbl, tooltip, fnc, x, y, par, col)
	local expbutton = vgui.Create("DButton", par)
	expbutton:SetSize(150, 30)
	function expbutton:Paint(w, h)
		surface.SetDrawColor(25,25,25,255)
        surface.DrawRect(0, 0, w, h)
		surface.SetDrawColor(col.r,col.g,col.b,255)
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
		surface.SetDrawColor( 0, 0, 0, 255 )
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
		surface.SetDrawColor( 0, 0, 0, 255 )
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
		surface.SetDrawColor( 0, 0, 0, 255 )
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
		surface.SetDrawColor( 0, 0, 0, 255 )
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
		surface.SetDrawColor( 0, 0, 0, 255 )
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
--========================GUI Menu============================================--
function HavocGUI()

	files, dir = file.Find( "penisdeda/*.json", "DATA" )
	frame = vgui.Create("DFrame")
	frame:SetSize(ScrW(), ScrH())
	frame:Center()
	frame:SetTitle("")
	frame:MakePopup()
	frame:ShowCloseButton(false)
	frame:SetDraggable(false)
	function frame:Paint()
	draw.RoundedBox( 0, 0, 0, 99999, 99999, Color(15,15,15,150) )
	end

	local PANEL = vgui.Create( "DPanel", frame )
	PANEL:SetSize(ScrW(),ScrH())
	PANEL:SetPos(0,0)
	function PANEL:Paint() end
	
	local SHEET = vgui.Create( "DPropertySheet", PANEL )
    SHEET:Dock(FILL)
	SHEET.Paint = function( self, w, h ) 
	for k, v in pairs(SHEET.Items) do if v.Tab then v.Tab.Paint = function(self,w,h) draw.RoundedBoxEx( 3, 0, 0, w, 20, Color(45,45,60,225), false, false, true, true ) end end end
    end
	
	local AIM_SCROLL = vgui.Create( "DScrollPanel", SHEET )
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
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    draw.RoundedBox(0, 0, 0, w, h, Color(45, 45, 60, 150))
	end	
	local combat_aimbot = vgui.Create( "DPanel", AIM_SCROLL )
    combat_aimbot:SetSize(200,330)
    combat_aimbot:SetPos(10,5)
    function combat_aimbot:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/gun.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Aimbot:", "DermaDefault", 19, 2, color_white )
    end
	local combat_accuracy = vgui.Create( "DPanel", AIM_SCROLL )
    combat_accuracy:SetSize(200,300)
    combat_accuracy:SetPos(220,5)
    function combat_accuracy:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/wand.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Accuracy:", "DermaDefault", 19, 2, color_white )
    end
	local combat_triggerbot = vgui.Create( "DPanel", AIM_SCROLL )
    combat_triggerbot:SetSize(200,80)
    combat_triggerbot:SetPos(220,310)
    function combat_triggerbot:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/cursor.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Triggerbot:", "DermaDefault", 19, 2, color_white )
    end
	local combat_gunmod = vgui.Create( "DPanel", AIM_SCROLL )
    combat_gunmod:SetSize(200,350)
    combat_gunmod:SetPos(220,400)
    function combat_gunmod:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/fire.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "GunMod(Admin):", "DermaDefault", 19, 2, color_white )
    end
	local combat_filter = vgui.Create( "DPanel", AIM_SCROLL )
    combat_filter:SetSize(200,200)
    combat_filter:SetPos(430,5)
    function combat_filter:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/wrench.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Filter:", "DermaDefault", 19, 2, color_white )
    end
	local combat_killaura = vgui.Create( "DPanel", AIM_SCROLL )
    combat_killaura:SetSize(200,200)
    combat_killaura:SetPos(640,5)
    function combat_killaura:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/emoticon_evilgrin.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "KillAura:", "DermaDefault", 19, 2, color_white )
    end
	local combat_helpers = vgui.Create( "DPanel", AIM_SCROLL )
    combat_helpers:SetSize(200,300)
    combat_helpers:SetPos(860,5)
    function combat_helpers:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/keyboard_mute.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Helpers:", "DermaDefault", 19, 2, color_white )
    end
	local AA_SCROLL = vgui.Create( "DScrollPanel", SHEET )
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
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    draw.RoundedBox(0, 0, 0, w, h, Color(45, 45, 60, 150))
	end	
	local combat_antihit = vgui.Create( "DPanel", AA_SCROLL )
    combat_antihit:SetSize(200,330)
    combat_antihit:SetPos(5,5)
    function combat_antihit:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/arrow_rotate_clockwise.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Animations:", "DermaDefault", 19, 2, color_white )
    end
	local combat_antihitnotanim = vgui.Create( "DPanel", AA_SCROLL )
    combat_antihitnotanim:SetSize(200,330)
    combat_antihitnotanim:SetPos(210,5)
    function combat_antihitnotanim:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/link_break.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Anti-Aim:", "DermaDefault", 19, 2, color_white )
    end
	local antihit_misc = vgui.Create( "DPanel", AA_SCROLL )
    antihit_misc:SetSize(200,330)
    antihit_misc:SetPos(420,5)
    function antihit_misc:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("vgui/resource/icon_vac_new"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Misc:", "DermaDefault", 19, 2, color_white )
    end
	local VISUAL_SCROLL = vgui.Create( "DScrollPanel", SHEET )
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
	draw.RoundedBox( 5, 0, 0, w, h, Color(255,15,15) )
	draw.RoundedBox( 5, 2, 2, w-4, h-4, Color(15,15,15) )
	end
	
	local visual_player = vgui.Create( "DPanel", VISUAL_SCROLL )
    visual_player:SetSize(790,600)
    visual_player:SetPos(5,5)
    function visual_player:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/add.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Player ESP:", "DermaDefault", 19, 2, color_white )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 5, 35, 190, 560, 1 )
	draw.SimpleText( "-= Main Elements =-", "DermaDefault", 50, 20, color_white )
	surface.DrawOutlinedRect( 200, 35, 190, 200, 1 )
	draw.SimpleText( "-= Render Elements =-", "DermaDefault", 240, 20, color_white )
	surface.DrawOutlinedRect( 200, 250, 190, 200, 1 )
	draw.SimpleText( "-= Effects =-", "DermaDefault", 255, 235, color_white )
	surface.DrawOutlinedRect( 200, 465, 190, 130, 1 )
	draw.SimpleText( "-= Colored Models =-", "DermaDefault", 200, 450, color_white )
	surface.DrawOutlinedRect( 590, 35, 190, 300, 1 )
	draw.SimpleText( "-= Filter =-", "DermaDefault", 645, 20, color_white )
    end
	local visual_player_settings = vgui.Create( "DPanel", VISUAL_SCROLL )
    visual_player_settings:SetSize(400,930)
    visual_player_settings:SetPos(5,610)
    function visual_player_settings:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/bullet_wrench.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "ESP Settings:", "DermaDefault", 19, 2, color_white )
    end
	local SELF_SCROLL = vgui.Create( "DScrollPanel", SHEET )
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
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    draw.RoundedBox(0, 0, 0, w, h, Color(45, 45, 60, 150))
	end

	--[[local visual_npc = vgui.Create( "DPanel", SELF_SCROLL )
    visual_npc:SetSize(200,150)
    visual_npc:SetPos(420,5)
    function visual_npc:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/monkey.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "NPCs:", "DermaDefault", 19, 2, color_white )
    end
	]]
	local visual_self_view = vgui.Create( "DPanel", SELF_SCROLL )
    visual_self_view:SetSize(200,700)
    visual_self_view:SetPos(5,5)
    function visual_self_view:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/zoom.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "View:", "DermaDefault", 19, 2, color_white )
    end
	local visual_self = vgui.Create( "DPanel", SELF_SCROLL )
    visual_self:SetSize(200,650)
    visual_self:SetPos(210,5)
    function visual_self:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/user_edit.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Self:", "DermaDefault", 19, 2, color_white )
    end

	local visual_self_hud = vgui.Create( "DPanel", SELF_SCROLL )
    visual_self_hud:SetSize(200,550)
    visual_self_hud:SetPos(415,5)
    function visual_self_hud:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/vcard_add.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "HUD:", "DermaDefault", 19, 2, color_white )
    end
	local WORLD_SCROLL = vgui.Create( "DScrollPanel", SHEET )
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
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    draw.RoundedBox(0, 0, 0, w, h, Color(45, 45, 60, 150))
	end
	local world_effects = vgui.Create( "DPanel", WORLD_SCROLL )
    world_effects:SetSize(200,450)
    world_effects:SetPos(5,5)
    function world_effects:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/weather_cloudy.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Effects:", "DermaDefault", 19, 2, color_white )
    end
	local world_colors = vgui.Create( "DPanel", WORLD_SCROLL )
    world_colors:SetSize(200,100)
    world_colors:SetPos(210,5)
    function world_colors:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/color_wheel.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Colors:", "DermaDefault", 19, 2, color_white )
    end
	local world_cc = vgui.Create( "DPanel", WORLD_SCROLL )
    world_cc:SetSize(200,400)
    world_cc:SetPos(420,5)
    function world_cc:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/film_edit.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Color Correction:", "DermaDefault", 19, 2, color_white )
    end
	local world_ents = vgui.Create( "DPanel", WORLD_SCROLL )
    world_ents:SetSize(200,500)
    world_ents:SetPos(630,5)
    function world_ents:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/bricks.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Entity:", "DermaDefault", 19, 2, color_white )
    end
	local MISC_SCROLL = vgui.Create( "DScrollPanel", SHEET )
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
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    draw.RoundedBox(0, 0, 0, w, h, Color(45, 45, 60, 150))
	end
	local misc_movement = vgui.Create( "DPanel", MISC_SCROLL )
    misc_movement:SetSize(200,500)
    misc_movement:SetPos(5,5)
    function misc_movement:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/arrow_branch.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Movement:", "DermaDefault", 19, 2, color_white )
    end
	local bsendpacket_tab = vgui.Create( "DPanel", MISC_SCROLL )
    bsendpacket_tab:SetSize(200,250)
    bsendpacket_tab:SetPos(5,510)
    function bsendpacket_tab:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/bullet_error.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "bSendPacket:", "DermaDefault", 19, 2, color_white )
    end
	local misc_misc = vgui.Create( "DPanel", MISC_SCROLL )
    misc_misc:SetSize(200,1200)
    misc_misc:SetPos(210,5)
    function misc_misc:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/page_white_text.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Misc:", "DermaDefault", 19, 2, color_white )
    end
	
	local CFG_SCROLL = vgui.Create( "DScrollPanel", SHEET )
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
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
    draw.RoundedBox(0, 0, 0, w, h, Color(45, 45, 60, 150))
	end
	local cfg_tab = vgui.Create( "DPanel", CFG_SCROLL )
    cfg_tab:SetSize(500,500)
    cfg_tab:SetPos(5,5)
    function cfg_tab:Paint(w, h)
	draw.RoundedBox( 0, 0, 0, w, h, Color(55,55,60,225))
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 0, 0, w, h, 1 )
	surface.SetDrawColor( 0, 0, 0, 255 )
	surface.DrawOutlinedRect( 3, 20, w-6, h-23, 1 )
    surface.SetDrawColor( 255, 255, 255, 255 ) 
    surface.SetMaterial(Material("icon16/page_white_put.png"))
    surface.DrawTexturedRect( 2, 2, 15, 15 )
    draw.SimpleText( "Config:", "DermaDefault", 19, 2, color_white )
    end
	
	
    SHEET:AddSheet( "Combat", AIM_SCROLL, "icon16/gun.png", false, false, nil)
	SHEET:AddSheet( "Anti-hit", AA_SCROLL, "icon16/arrow_refresh.png", false, false, nil)
	SHEET:AddSheet( "Player", VISUAL_SCROLL, "icon16/group.png", false, false, nil)
	SHEET:AddSheet( "Self", SELF_SCROLL, "icon16/eye.png", false, false, nil)
	SHEET:AddSheet( "World", WORLD_SCROLL, "icon16/world.png", false, false, nil)
	SHEET:AddSheet( "Misc", MISC_SCROLL, "icon16/page_white_stack.png", false, false, nil)
	SHEET:AddSheet( "Config", CFG_SCROLL, "icon16/disk.png", false, false, nil)

	--======Other==================--
    SHEET:SwitchToName(activeTab)
	for k, v in pairs(SHEET:GetItems()) do
		function v.Tab:OnDepressed()
			activeTab = v.Name
		end
	end
    --=======FEATURES==============--
	
	
	//Combat
	CreateCheckBox("Enable Aimbot", 10, 30, "aim_master_toggle", false, combat_aimbot)
	CreateCheckBox("Aimbot On Key", 10, 50, "aim_onkey", false, combat_aimbot)
	CreateKeybind(140, 50, "aim_onkey_key", combat_aimbot)
	CreateCheckBox("Silent Aim", 10, 70, "aim_silent", false, combat_aimbot)
    CreateCheckBoxExperemental("pSilent", 90, 70, "aim_psilent", false, combat_aimbot)	
	CreateDropdown("Target Selection", 10, 90, {"Crosshair", "Closest Distance", "Lowest Health"}, "aim_target", combat_aimbot)
	CreateDropdown("Hitbox Selection", 10, 130, {"Hitscan", "Head", "Body"}, "aim_hitbox", combat_aimbot)	
	CreateCheckBoxExperemental("Automatic Fire", 10, 180, "aim_autofire", false, combat_aimbot)
	CreateCheckBoxExperemental("Automatic Reload", 10, 200, "aim_autoreload", false, combat_aimbot)
    CreateSlider("Aimbot FOV", 2, 220, "aim_fov", 0, 180, 0, combat_aimbot)
	CreateCheckBox("Aimbot Smoothing", 10, 260, "aim_smoothing", false, combat_aimbot)
	CreateSlider("Smoothing Scale", 2, 280, "aim_smoothing_value", 0, 2, 2, combat_aimbot)	
	CreateCheckBox("No-Recoil", 10, 30, "aim_norecoil", false, combat_accuracy)
	CreateCheckBox("Auto Slow", 10, 50, "autoslow", false, combat_accuracy)
	CreateCheckBox("Auto Crouch", 10, 70, "autocrouch", false, combat_accuracy)
	CreateCheckBoxExperemental("NoSpread", 10, 90, "aim_nospread", false, combat_accuracy)	
	CreateDropdown("NoSpread Type", 10, 110, {"MD5", "Module", "Module 2"}, "aim_nospread_type", combat_accuracy)
	CreateCheckBox("Prediction", 10, 150, "aim_prediction", false, combat_accuracy)	
	CreateDropdown("Prediction Method", 10, 170, {"Default", "Velocity", "Engine"}, "aim_prediction_metod", combat_accuracy)
	CreateCheckBox("Bullet Time", 10, 220, "aim_bullettime", false, combat_accuracy)	
	
	CreateCheckBox("Ignore Friends", 10, 30, "aim_ignorefriends", false, combat_filter)
	CreateCheckBox("Ignore BOTS", 10, 50, "aim_ignorebots", false, combat_filter)
	CreateCheckBox("Ignore Staff", 10, 70, "aim_ignoreadmins", false, combat_filter)
	CreateCheckBox("Ignore Noclipping", 10, 90, "aim_ignorenoclip", false, combat_filter)
	CreateCheckBox("Ignore Same Team", 10, 110, "aim_ignoreteam", false, combat_filter)
	CreateCheckBox("Ignore Non-Visible", 10, 130, "aim_ignoreinvis", false, combat_filter)
	CreateCheckBox("Jump Check", 10, 150, "aim_jump_check", false, combat_filter)
	CreateCheckBox("Bad Weapons Check", 10, 170, "aim_nadecheck", false, combat_filter)
	
	CreateCheckBox("Enable KillAura", 10, 30, "killaura_toggle", false, combat_killaura) 
	CreateCheckBox("On Key", 10, 50, "killaura_on_key", false, combat_killaura)
	CreateKeybind(140, 50, "killaura_key", combat_killaura)
	CreateCheckBox("Enable Magnet", 10, 70, "killaura_magnet", false, combat_killaura) 
	CreateCheckBox("Enable Delay", 10, 90, "killaura_delay", false, combat_killaura) 
	CreateCheckBox("Auto Jump", 10, 110, "killaura_crits", false, combat_killaura)  
	CreateDropdown("KillAura Distance", 10, 130, {"Unsafe far", "Safe close", "Medium"}, "killaura_disttype", combat_killaura)
	
	CreateCheckBox("Enable Triggerbot", 10, 30, "trigger_master_toggle", false, combat_triggerbot)
	CreateCheckBox("Triggerbot On Key", 10, 50, "trigger_onkey", false, combat_triggerbot)
	CreateKeybind(150, 50, "trigger_onkey_key", combat_triggerbot)

	CreateCheckBox("TFA Gun Mod", 10, 30, "gunmod_tfa", false, combat_gunmod)
	CreateCheckBox("TFA Damage Modifaer", 10, 50, "gunmod_tfa_dmg", false, combat_gunmod)
	CreateCheckBox("TFA Spread Modifaer", 10, 70, "gunmod_tfa_sprd", false, combat_gunmod)
	CreateCheckBox("TFA Penetration Modifaer", 10, 90, "gunmod_tfa_pen", false, combat_gunmod)
	CreateCheckBox("M9K Gun Mod", 10, 110, "gunmod_m9k", false, combat_gunmod)	
	CreateCheckBox("M9K Damage Modifaer", 10, 130, "gunmod_m9k_dmg", false, combat_gunmod)
	CreateCheckBox("M9K NoDRecoil", 10, 150, "gunmod_m9k_drecoil", false, combat_gunmod)
	CreateCheckBox("M9K Penetration", 10, 170, "gunmod_m9k_penetretion", false, combat_gunmod)	
	CreateButton("Update GunMod", "Updates gunmod.", GunMod, 10, 300, combat_gunmod)
	
	CreateCheckBox("Auto Click", 10, 30, "misc_autoclick", false, combat_helpers)
	CreateCheckBox("Scroll Attack", 10, 50, "misc_scrollattack", false, combat_helpers)
	CreateCheckBox("Fast Switch", 10, 70, "misc_fastswitch", false, combat_helpers)
	--AA
	CreateCheckBox("Dance Spam", 10, 30, "antihit_act", false, combat_antihit)
	CreateDropdown("Act", 10, 50, {"Dance", "Robot", "Sex", "Bow", "Wave", "Zombie", "Disagree", "Forward", "Pers", "Salute"}, "antihit_act_type", combat_antihit)
	CreateCheckBox("Tactical Leaning", 10, 90, "antihit_lean", false, combat_antihit)
	CreateDropdown("Leaning Direction", 10, 110, {"Left", "Right", "Directional", "Directional Inverted"}, "antihit_lean_dir", combat_antihit)
	CreateButton("Fix Leaning", "offs leaning.", TacticalLeanDisabler, 10, 160, combat_antihit)
	
	--AntiAims
	CreateCheckBox("Enable Anti-Aim", 10, 30, "antihit_antiaim", false, combat_antihitnotanim)
	CreateDropdown("Yaw Base", 10, 50, {"Static", "Sway", "Jitter", "LBY"}, "yaw_base", combat_antihitnotanim)
	CreateDropdown("Pitch", 10, 90, {"None","Zero", "Down", "Up", "Fake Down", "Fake Up"}, "pitch_add", combat_antihitnotanim)
	--AA Misc
	CreateCheckBox("Fake Duck", 10, 30, "antihit_fd", false, antihit_misc)
	CreateKeybind(140, 30, "antihit_fd_key", antihit_misc)
	--Visuals
	//Boxes & Bars
	CreateCheckBox("Bounding Box", 10, 40, "esp_player_box", true, visual_player, 165)
	CreateDropdown("Box Style", 10, 60, {"Default", "Corners", "3D Box", "Neon Red", "Neon Blue"}, "esp_player_box_mode", visual_player)
	CreateCheckBox("Health Bar", 10, 100, "esp_player_hp", true, visual_player, 165)
	CreateDropdown("Health Bar Pos", 10, 120, {"Left", "Right", "Up", "Down"}, "esp_player_hp_type", visual_player)	
	CreateCheckBox("Armor Bar", 10, 160, "esp_player_ap", true, visual_player, 165)
	CreateDropdown("Armor Bar Pos", 10, 180, {"Left", "Right", "Up", "Down"}, "esp_player_ap_type", visual_player)	
	//Info like Health, Names, Team
	CreateCheckBox("Name", 10, 220, "esp_player_name", true, visual_player, 165)
	CreateCheckBox("Health", 10, 240, "esp_player_health", true, visual_player, 165)
	CreateCheckBox("Armor", 10, 260, "esp_player_armor", true, visual_player, 165)
	CreateCheckBox("Weapon Class", 10, 280, "esp_player_weapon", true, visual_player, 165)
	CreateCheckBox("Weapon Name", 10, 300, "esp_player_weapon_fancy", false, visual_player)
	CreateCheckBox("Weapon Ammo", 10, 320, "esp_player_weapon_fancy", false, visual_player)
	CreateCheckBox("Group(Rank)", 10, 340, "esp_player_rank", true, visual_player, 165)
	CreateCheckBox("Team", 10, 360, "esp_player_team", false, visual_player)
	CreateCheckBox("Distance", 10, 380, "esp_player_distance", true, visual_player, 165)
	CreateCheckBox("DarkRP Money", 10, 400, "esp_player_money", true, visual_player, 165)
	CreateCheckBox("Dormant Indicator", 10, 420, "esp_player_dormant_ind", true, visual_player, 165)
	CreateCheckBox("Snaplines", 10, 440, "esp_player_snaplines", true, visual_player, 165)
	CreateDropdown("Snapline Style", 10, 460, {"From Player", "Crosshair"}, "esp_player_snaplines_pos", visual_player)
	//Render Elements
	CreateCheckBox("Player Skeleton", 205, 40, "esp_player_skeleton", true, visual_player, 165)
	CreateCheckBox("Player Sights", 205, 60, "esp_player_sights", true, visual_player, 165)
	CreateCheckBox("Player Hitbox", 205, 80, "esp_player_hitbox", true, visual_player, 165)
	CreateCheckBox("Bullet Beam", 205, 100, "esp_player_bulletbeam", true, visual_player, 165)
	CreateCheckBox("Hitbox", 205, 120, "esp_player_hitbox", true, visual_player, 165)
	//Effects
	CreateCheckBox("Glow ESP", 205, 255, "esp_player_glow", true, visual_player, 165)
	CreateDropdown("Glow Style", 205, 275, {"Default", "Cover", "Outline", "Visible Only"}, "esp_player_glow_type", visual_player)
	CreateCheckBox("Hitsound", 205, 315, "esp_other_hitsound", false, visual_player)
	CreateCheckBox("HitNumbers", 205, 335, "esp_other_hitnumbers", false, visual_player)
    CreateCheckBox("Attachment Glow", 205, 355, "esp_attachments_glow", true, visual_player, 165)
	CreateCheckBox("HitMarker", 205, 375, "esp_player_hitmarker", false, visual_player)
	CreateDropdown("Hitsound", 205, 395, {"Classic", "Bell", "Bubble", "Rust", "Good One", "Nice Shot", "Neverlose", "Metallic", "Stapler", "Skeet", "Stuck"}, "esp_hitsound_sound", visual_player)	
	//Colored Models
	CreateCheckBox("Visible Chams", 205, 470, "esp_player_chams", true, visual_player, 165)
	CreateCheckBox("Player Chams Overlay", 205, 490, "esp_player_chams_overlay", true, visual_player, 165)
	CreateCheckBox("Player Chams XYZ", 205, 510, "esp_player_chams_xyz", true, visual_player, 165)	
	CreateButton("Chams Material", "Opens the cham material selector.", CreateMaterialList, 205, 530, visual_player)
	CreateCheckBox("Draw Model", 205, 555, "esp_player_drawmodel", false, visual_player)
	//Performance & Filtering
	CreateCheckBox("Ignore Teammates", 595, 40, "esp_player_teamfilter", false, visual_player)
	CreateCheckBox("Ignore Bots", 595, 60, "esp_player_botfilter", false, visual_player)
	CreateCheckBox("Ignore Non-visible", 595, 80, "esp_visibleonly", false, visual_player)	
	CreateSlider("ESP Max Render Distance", 595, 100, "esp_player_render_distance", 500, 10000, 0, visual_player)
	CreateCheckBox("Hide Dormant Players", 595, 140, "esp_player_dormant", false, visual_player)
	CreateCheckBox("Highlight Friends Box", 595, 160, "esp_player_highlight_box", true, visual_player, 165)
	CreateCheckBox("Highlight Friends Name", 595, 180, "esp_player_highlight_name", true, visual_player, 165)
	CreateCheckBox("ESP Compensation", 595, 200, "esp_comp", false, visual_player)
	CreateButton("OBS Bypass", "Makes ESP OBSProof.", OBS_BYPASS, 595, 220, visual_player)
	CreateButton("FPS Booster", "Run fps  boost commands.", FPS_FIX, 595, 245, visual_player)
	//ESP Element Positions
	CreateSlider("Name X", 10, 30, "name_x", -250, 250, 0, visual_player_settings)
	CreateSlider("Name Y", 10, 70, "name_y", -250, 250, 0, visual_player_settings)

	CreateSlider("Health X", 10, 110, "health_x", -250, 250, 0, visual_player_settings)
	CreateSlider("Health Y", 10, 150, "health_y", -250, 250, 0, visual_player_settings)

	CreateSlider("Armor X", 10, 190, "armor_x", -250, 250, 0, visual_player_settings)
	CreateSlider("Armor Y", 10, 230, "armor_y", -250, 250, 0, visual_player_settings)

	CreateSlider("Weapon X", 10, 270, "wep_x", -250, 250, 0, visual_player_settings)
	CreateSlider("Weapon Y", 10, 310, "wep_y", -250, 250, 0, visual_player_settings)

	CreateSlider("Team X", 10, 350, "tm_x", -250, 250, 0, visual_player_settings)
	CreateSlider("Team Y", 10, 390, "tm_y", -250, 250, 0, visual_player_settings)

	CreateSlider("Rank X", 10, 430, "rank_x", -250, 250, 0, visual_player_settings)
	CreateSlider("Rank Y", 10, 470, "rank_y", -250, 250, 0, visual_player_settings)

	CreateSlider("Distance X", 10, 510, "ds_x", -250, 250, 0, visual_player_settings)
	CreateSlider("Distance Y", 10, 550, "ds_y", -250, 250, 0, visual_player_settings)

	CreateSlider("Money X", 10, 590, "mn_x", -250, 250, 0, visual_player_settings)
	CreateSlider("Money Y", 10, 630, "mn_y", -250, 250, 0, visual_player_settings)

	CreateSlider("Dormant X", 10, 670, "di_x", -250, 250, 0, visual_player_settings)
	CreateSlider("Dormant Y", 10, 710, "di_y", -250, 250, 0, visual_player_settings)
	
	CreateDropdown("Name Position", 200, 30, {"Left", "Right", "Up", "Down"}, "name_pos", visual_player_settings)
	CreateDropdown("Health Position", 200, 70, {"Left", "Right", "Up", "Down"}, "health_pos", visual_player_settings)	
	CreateDropdown("Armor Position", 200, 110, {"Left", "Right", "Up", "Down"}, "armor_pos", visual_player_settings)	
	CreateDropdown("Weapon Position", 200, 150, {"Left", "Right", "Up", "Down"}, "wep_pos", visual_player_settings)
	CreateDropdown("Team Position", 200, 190, {"Left", "Right", "Up", "Down"}, "tm_pos", visual_player_settings)
	CreateDropdown("Rank Position", 200, 230, {"Left", "Right", "Up", "Down"}, "rank_pos", visual_player_settings)
	CreateDropdown("Distance Position", 200, 270, {"Left", "Right", "Up", "Down"}, "ds_pos", visual_player_settings)
	CreateDropdown("Money Position", 200, 310, {"Left", "Right", "Up", "Down"}, "mn_pos", visual_player_settings)
	CreateDropdown("Dormant Position", 200, 350, {"Left", "Right", "Up", "Down"}, "di_pos", visual_player_settings)

	CreateDropdown("Main Font", 10, 750, CheatFonts, "name_font", visual_player_settings)
	CreateSlider("Main Font Size", 10, 790, "name_font_size", 10, 20, 0, visual_player_settings)
	CreateDropdown("Flag Font", 10, 830, CheatFonts, "flag_font", visual_player_settings)
	CreateSlider("Flag Font Size", 10, 870, "flags_font_size", 10, 20, 0, visual_player_settings)

	CreateCheckBox("Thirdperson", 10, 30, "esp_other_thirdperson", false, visual_self_view)
	CreateKeybind(140, 30, "thirdperson_key", visual_self_view)
	CreateSlider("Thirdperson Distance", 10, 50, "esp_other_thirdperson_distance", 5, 50, 0, visual_self_view)
	CreateCheckBox("Freecam", 10, 90, "esp_other_freecam", false, visual_self_view)
	CreateKeybind(140, 90, "freecam_key", visual_self_view)
	CreateSlider("Freecam Speed", 10, 110, "esp_other_freecam_speed", 1, 10, 0, visual_self_view)
	CreateCheckBox("Override FOV", 10, 150, "misc_fov", false, visual_self_view)
	CreateSlider("FOV Value", 10, 170, "misc_fov_value", 50, 160, 0, visual_self_view)
	CreateCheckBox("Viewmodel Changer", 10, 210, "misc_viewmodel", false, visual_self_view)
	CreateCheckBox("Remove Bob", 10, 230, "misc_bob", false, visual_self_view)
	CreateCheckBox("Remove Sway", 10, 250, "misc_sway", false, visual_self_view)
	CreateSlider("Viewmodel X", 10, 290, "misc_vm_x", -50, 50, 0, visual_self_view)
	CreateSlider("Viewmodel Y", 10, 330, "misc_vm_y", -30, 30, 0, visual_self_view)
	CreateSlider("Viewmodel Z", 10, 370, "misc_vm_z", -20, 20, 0, visual_self_view)
	CreateSlider("Viewmodel Pitch", 10, 410, "misc_vm_p", -90, 90, 0, visual_self_view)
	CreateSlider("Viewmodel Yaw", 10, 450, "misc_vm_ya", -90, 90, 0, visual_self_view)
	CreateSlider("Viewmodel Roll", 10, 490, "misc_vm_r", -90, 90, 0, visual_self_view)
	CreateCheckBox("Thirdperson Wall Detect", 10, 530, "esp_other_thirdperson_walldetect", false, visual_self_view)
    CreateCheckBox("Swing Animation", 10, 550, "esp_other_swinganim", false, visual_self_view)
	 

	CreateCheckBox("Draw Aimbot FOV", 10, 30, "esp_other_drawfov", true, visual_self, 165)
	CreateCheckBox("Bullet Tracer", 10, 50, "esp_self_bullet_tracers", true, visual_self, 165)
	CreateCheckBox("Laser Sights", 10, 70, "esp_self_laser_sight", false, visual_self, 165)
	CreateCheckBox("DLight", 10, 90, "esp_self_dlight", true, visual_self, 165)
	CreateCheckBox("DLight HSV", 10, 110, "esp_self_dlight_hsv", false, visual_self)
	CreateCheckBox("Predict Fall", 10, 130, "esp_self_predict_me", false, visual_self)
	CreateCheckBox("AimFov Fill", 10, 150, "esp_other_drawfov_fill", false, visual_self, 165)
	CreateCheckBox("Velocity Crosshair", 10, 170, "esp_self_velocity_crosshair", true, visual_self, 165)
	CreateCheckBox("Player Hat", 10, 190, "esp_self_hat", false, visual_self, 165)	
	CreateDropdown("Hat model", 10, 210, {"Nimbus", "Hat", "Cap", "Bomb"}, "esp_self_hat_type", visual_self)
	CreateCheckBox("Agent Changer", 10, 250, "esp_self_customagent", false, visual_self, 165)	
	CreateDropdown("Agent", 10, 270, {"SAS", "Pirat", "Anarchist", "Pro"}, "esp_self_customagent_agent", visual_self)
	--CreateCheckBox("Self Chmas", 10, 210, "esp_self_chams", true, visual_self, 165)
	--CreateCheckBox("Self Weapon Chmas", 10, 230, "esp_self_chams_wep", true, visual_self, 165)
	
	--CreateCheckBox("Box ESP", 10, 30, "esp_npc_box", true, visual_npc , 165)
	--CreateCheckBox("Glow ESP", 10, 50, "esp_npc_halo", true, visual_npc , 165)
	--CreateCheckBox("Class ESP", 10, 70, "esp_npc_name", true, visual_npc , 165)
	--CreateCheckBox("Health ESP", 10, 90, "esp_npc_health", true, visual_npc , 165)
	--CreateCheckBox("Snaplines", 10, 110, "esp_npc_snaplines", true, visual_npc , 165)	
	
	CreateButton("Entity List", "Open Entity List.", CreateEntityList, 10, 30, world_ents)
	CreateCheckBox("Storage ESP", 10, 50, "esp_ent_storage_esp", true, world_ents , 165)
	CreateCheckBox("Crosshair Emtity", 10, 70, "esp_ent_crosshair", false, world_ents , 165)
	
	CreateCheckBox("Watermark", 10, 30, "hud_watermark", false, visual_self_hud )
	CreateCheckBox("FPS Counter", 10, 50, "hud_fps_indicator", false, visual_self_hud )
	CreateCheckBox("Disable HL2 HUD", 10, 70, "hud_disable_hl2_hud", false, visual_self_hud )
	CreateCheckBox("Custom HUD", 10, 90, "hud_custom_hud", false, visual_self_hud )
	CreateCheckBox("CrossHair", 10, 110, "hud_crosshair", false, visual_self_hud )
    CreateDropdown("CrossHair Style", 10, 130, {"Classic", "Зига", "Смачная Наиплотнейшая Зигота"}, "hud_crosshair_type", visual_self_hud)
	CreateCheckBox("KeyStrokes", 10, 170, "hud_keystrokes", false, visual_self_hud )
    CreateDropdown("KeyStrokes Style", 10, 190, {"WASD", "WASD-SPACE", "WASD-LMB-RMB", "All"}, "hud_keystrokes_style", visual_self_hud)
	CreateCheckBox("KillAura Circle", 10, 230, "hud_aimbotstatus", false, visual_self_hud )
	CreateCheckBox("KillStreak", 10, 250, "hud_killstreak", false, visual_self_hud )
	CreateCheckBox("Bind list", 10, 270, "hud_arraylist", false, visual_self_hud )
	CreateCheckBox("Top Line", 10, 290, "hud_topline", false, visual_self_hud )
	CreateDropdown("Top Line Style", 10, 310, {"Outlined", "Normal", "Glow"}, "hud_topline_style", visual_self_hud)
	CreateCheckBox("Velocity", 10, 350, "hud_velo", false, visual_self_hud )
	
	
	--World
	CreateCheckBox("Fog Modulation", 10, 30, "esp_other_fog", true, world_effects, 165)
	CreateSlider("Fog Start", 10, 50, "esp_other_fog_start", 0, 50000, 0, world_effects)
	CreateSlider("Fog End", 10, 90, "esp_other_fog_end", 0, 50000, 0, world_effects)
	CreateSlider("Fog Density", 10, 130, "esp_other_fog_density", 0, 1, 1, world_effects)
	CreateCheckBox("NoSky (2D)", 10, 170, "esp_other_nosky", false, world_effects)
	CreateCheckBox("SkyBox Draw Rect", 10, 190, "esp_other_skyboxrect", true, world_effects, 165)
	CreateCheckBox("Disable 3d Sky", 10, 210, "esp_other_3dskydisabler", false, world_effects)
	CreateSlider("Bloom Scale", 10, 230, "esp_other_bloom", 0, 1, 2, world_effects)	
	CreateCheckBox("HL1 Flashlight", 10, 270, "esp_other_hlflashlight", false, world_effects)
	
	
	CreateCheckBox("World Modulation", 10, 30, "esp_other_worldmod", true, world_colors, 165)
	CreateCheckBox("Prop Modulation", 10, 50, "esp_other_propmod", true, world_colors, 165)
	CreateCheckBox("Fullbright", 10, 70, "esp_other_fullbright", false, world_colors, 165)	
	
	CreateCheckBox("Color Correction", 10, 30, "esp_other_cc", false, world_cc)
	CreateSlider("Contrast Scale", 10, 50, "esp_other_cc_scale", 0, 1, 1, world_cc)
	CreateSlider("Add Red", 10, 90, "esp_other_cc_addr", 0, 255, 0, world_cc)
	CreateSlider("Add Green", 10, 130, "esp_other_cc_addg", 0, 255, 0, world_cc)
	CreateSlider("Add Blue", 10, 170, "esp_other_cc_addb", 0, 255, 0, world_cc)
	CreateSlider("Color", 10, 210, "esp_other_cc_color", 0, 1, 0, world_cc)
	CreateSlider("MulR", 10, 250, "esp_other_cc_mulr", 0, 255, 0, world_cc)
	CreateSlider("MulG", 10, 290, "esp_other_cc_mulg", 0, 255, 0, world_cc)
	CreateSlider("MulB", 10, 330, "esp_other_cc_mulrb", 0, 255, 0, world_cc)	
	--Misc
	CreateCheckBox("Auto Bunnyhop", 10, 30, "misc_autobunnyhop", false, misc_movement)
	CreateCheckBox("Auto Strafe", 10, 50, "misc_autostrafe", false, misc_movement)
	CreateDropdown("Strafe Type", 10, 70, {"Legit", "Rage", "Free Move", "Directional"}, "misc_autostrafe_type", misc_movement)
	CreateCheckBox("Infinity Duck", 10, 110, "misc_infinitduck", false, misc_movement)
	CreateCheckBox("Air Duck", 10, 130, "misc_airduck", false, misc_movement)
	CreateCheckBox("Duck Walk", 10, 150, "misc_duckwalk", false, misc_movement)
	CreateDropdown("AirDuck Style", 10, 170, {"Input", "Command", "No Stop"}, "misc_airduckmetod", misc_movement)
	CreateCheckBox("Micromovement", 10, 210, "slowwalk", false, misc_movement)
	CreateKeybind(140, 210, "misc_mm_keybind", misc_movement)
	CreateSlider("Micromovement speed", 10, 230, "slowwalk_speed", 10, 60, 0, misc_movement)
	CreateCheckBox("180° turn", 10, 270, "misc_180turn", false, misc_movement)
	CreateKeybind(140, 270, "180turn_keybind", misc_movement)
	CreateCheckBox("Jitter Move", 10, 290, "misc_jittermove", false, misc_movement)
	CreateKeybind(140, 290, "jitter_keybind", misc_movement)
	CreateCheckBox("Anti-AFK", 10, 310, "misc_antiafk", false, misc_movement)
	CreateCheckBox("Circle Strafe", 10, 330, "misc_circlestrafer", false, misc_movement)
	CreateKeybind(140, 330, "circlestrafer_key", misc_movement)
	
	
	--CreateCheckBox("Sit Teleport", 10, 270, "misc_sitabuse", false, misc_movement)
	--CreateKeybind(140, 270, "misc_wallpush", misc_movement)
	
	CreateCheckBox("Reveal TTT/Murder Info", 10, 30, "misc_ttt", false, misc_misc)
	CreateCheckBox("Observer List", 10, 50, "misc_observerlist", false, misc_misc)
	CreateCheckBox("Admin List", 10, 70, "misc_adminlist", false, misc_misc)
	
	CreateCheckBox("Rainbow Physgun", 10, 110, "misc_rainbow", false, misc_misc)
	CreateSlider("Rainbow Speed", 10, 130, "misc_rainbow_speed", 1, 100, 0, misc_misc)
	CreateButton("Player List", "Open the player list menu.", CreatePlayerList, 10, 170, misc_misc)
	CreateButton("Filter Teams", "The filter will be applied when the filter menu is closed. This filter applies to ESP and Aimbot.", CreateFilterPanel, 10, 195, misc_misc)
	CreateCheckBox("Chat Spammer", 10, 215, "misc_chat_spam", false, misc_misc)	
	CreateCheckBox("Event Logs", 10, 235, "misc_eventlog", false, misc_misc)	
	CreateDropdown("Log Output", 10, 255, {"Notify", "Chat", "Console"}, "misc_eventlog_type", misc_misc)
	CreateCheckBox("Flashlight Spammmer", 10, 295, "misc_flashlight", false, misc_misc)	
    CreateCheckBox("Arest Leave", 10, 315, "misc_antiarest", false, misc_misc)
	CreateDropdown("Leave Method", 10, 335, {"Suicide", "Retry", "/Hobo (Job)"}, "misc_antiarest_metod", misc_misc)
	CreateCheckBox("Обосраца", 10, 375, "misc_supkill", false, misc_misc)
	CreateKeybind(140, 375, "misc_supkill_key", misc_misc)
	CreateCheckBox("Anti-Bot", 10, 395, "misc_antibot", false, misc_misc)
	CreateCheckBox("Rainbow Player", 10, 415, "misc_rainbowply", false, misc_misc)
	CreateCheckBox("Use Spammer", 10, 435, "misc_use", false, misc_misc)
    CreateCheckBox("Undo Spam", 10, 455, "misc_doundo", false, misc_misc)	
    CreateCheckBox("RP Name changer", 10, 475, "misc_rpnamer", false, misc_misc)	
    CreateSlider("RPName Delay", 10, 495, "misc_rpnamer_time", 1, 300, 0, misc_misc)
	
	CreateCheckBox("Fake Lags", 10, 30, "bsp_fake_lags", false, bsendpacket_tab)
	CreateSlider("FakeLag Limit", 10, 50, "bsp_fake_lags_value", 1, 128, 0, bsendpacket_tab)
	CreateDropdown("FakeLag Conditions", 10, 90, {"Always On", "In Move", "In Stand", "On Ground", "In Air", "On Attack", "Off Attack"}, "bsp_fake_lags_conditions", bsendpacket_tab)
	CreateCheckBox("FL Randomisation", 10, 130, "bsp_fake_lagsr", false, bsendpacket_tab)
	CreateSlider("Randomisation Limit", 10, 150, "bsp_fake_lagsr_value", 1, 64, 0, bsendpacket_tab)
	
	--CFG
    CreateLabel("Menu Keybind", 10, 10, cfg_tab)
	CreateKeybind(10, 30, "menu_key", cfg_tab)
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
	CreateButton("Unload", "Fully unloads the cheat.", Unload, 10, 200, cfg_tab)
	CreateLabel("Unload Key", 10, 225, cfg_tab)
	CreateKeybind(10, 245, "panic_key", cfg_tab)

	CreateButton("ESP Mode " .. GetRenderMode(), "If your ESP is not working on a server try changing this to unsafe. (THIS SHOULD ALWAYS BE PROTECTED WHEN POSSIBLE TO MAXIMIZE SCREENGRAB PROTECTION)", SwapRender, 10, 425, cfg_tab)
	
	
	
    --[[CreateCheckBox("Zeus Bot", 10, 70, "aim_zeusbot", false, aim2)
	
	CreateCheckBoxExperemental("Auto HealthKit (Sandbox)", 10, 110, "bot_healthkit", false, aim2)
	CreateCheckBoxExperemental("Auto ArmorKit (Sandbox)", 10, 130, "bot_armorkit", false, aim2) 
	CreateCheckBox("Kill Effect", 10, 230, "esp_other_killeffect", false, visother)
	


	

	
	

	


	CreateExpButton("VRMod money", "Picks up money on the floor(On the map)|Поднимает все деньги на карте", VRmodExploit ,0,0,exploits_tab,Color(0,255,255) )
	CreateExpButton("VRMod weapons", "Picks up weapons on the floor(On the map)|Поднимает все пушки на карте", VRmodExploit2 ,0,30,exploits_tab,Color(0,255,255) )

	

    CreateLabel("Theme Colors", 10, 10, menu_tab)	
    ColorPickerLabel("Panel Rect Color 1", 10, 30, "menu_rect1", true, menu_tab)	
	ColorPickerLabel("Panel Rect Color 2", 10, 50, "menu_rect2", true, menu_tab)	
	ColorPickerLabel("Panel Rect Color 3", 10, 70, "menu_rect3", true, menu_tab)	
	ColorPickerLabel("Panel Rect Color 4", 10, 90, "menu_rect4", true, menu_tab)	
	ColorPickerLabel("Outline", 10, 110, "menu_outline", true, menu_tab)	
	ColorPickerLabel("Outline Inside", 10, 130, "menu_outline_hsv", true, menu_tab)	
	ColorPickerLabel("Button Color", 10, 150, "menu_button_color", true, menu_tab)	
	ColorPickerLabel("Button Text", 10, 170, "menu_button_text_color", true, menu_tab)	
	ColorPickerLabel("Button Text Active", 10, 190, "menu_button_text_color_active", true, menu_tab)	
	ColorPickerLabel("Sheet Color", 10, 210, "menu_sheet", true, menu_tab)	
	ColorPickerLabel("Sheet Accent", 10, 230, "menu_sheet_accent", true, menu_tab)	
	ColorPickerLabel("Sub Category Top", 10, 250, "menu_sub_category", true, menu_tab)
	ColorPickerLabel("Sub Category", 10, 270, "menu_sub_category_bg", true, menu_tab)	
	ColorPickerLabel("Scroll color", 10, 290, "menu_scroll_scroller", true, menu_tab)	

    CreateCheckBox("Menu HSV Mode", 10, 310, "menu_hsv", false, menu_tab)]]

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
								surface.SetDrawColor(string.ToColor(config.colors["esp_player_highlight_box"]))
								ColAlt = string.ToColor(config.colors["esp_player_highlight_box"])
							else
							if config["esp_player_box_hsv"] then
						    local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
						    surface.SetDrawColor(hsv.r,hsv.g,hsv.b,255)
						    else
						    surface.SetDrawColor(string.ToColor(config.colors["esp_player_box"]))
							ColAlt = string.ToColor(config.colors["esp_player_box"])
							end
							end
						else
						if config["esp_player_box_hsv"] then
						local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
						surface.SetDrawColor(hsv.r,hsv.g,hsv.b,255)
						else
						surface.SetDrawColor(string.ToColor(config.colors["esp_player_box"]))
						ColAlt = string.ToColor(config.colors["esp_player_box"])
						end
						end
						if config["esp_player_box_mode"] == 2 then
							local XLen, YLen = MaxX - MinX, MaxY - MinY
							surface.DrawLine( MaxX, MaxY, MinX + XLen * 0.7, MaxY)
							surface.DrawLine( MinX, MaxY, MinX + XLen * 0.3, MaxY)
							surface.DrawLine( MaxX, MaxY, MaxX, MinY + YLen * 0.75)
							surface.DrawLine( MaxX, MinY, MaxX, MinY + YLen * 0.25)
							surface.DrawLine( MinX, MinY, MaxX - XLen * 0.7, MinY )
							surface.DrawLine( MaxX, MinY, MaxX - XLen * 0.3, MinY )
							surface.DrawLine( MinX, MinY, MinX, MaxY - YLen * 0.75)
							surface.DrawLine( MinX, MaxY, MinX, MaxY - YLen * 0.25)
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
						surface.SetDrawColor(hsv.r,hsv.g,hsv.b,255)
						else
						surface.SetDrawColor(string.ToColor(config.colors["esp_player_box"]))
                        end						
	                    surface.SetMaterial( Material("gui/ps_hover.png") ) 
	                    surface.DrawTexturedRect( MinX, MinY, XLen, YLen )
                        elseif config["esp_player_box_mode"] == 5 then
						local XLen, YLen = MaxX - MinX, MaxY - MinY
						if config["esp_player_box_hsv"] then
						local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
						surface.SetDrawColor(hsv.r,hsv.g,hsv.b,255)
						else
						surface.SetDrawColor(string.ToColor(config.colors["esp_player_box"]))
                        end	
	                    surface.SetMaterial( Material("gui/sm_hover.png") ) 
	                    surface.DrawTexturedRect( MinX, MinY, XLen, YLen ) 							
						else
							surface.DrawLine( MaxX, MaxY, MinX, MaxY )
							surface.DrawLine( MaxX, MaxY, MaxX, MinY )
							surface.DrawLine( MinX, MinY, MaxX, MinY )
							surface.DrawLine( MinX, MinY, MinX, MaxY )
						end
					end
					if config["esp_player_name"] then
						surface.SetFont("ESP_Font_Main")
						local w, h = surface.GetTextSize(v:Nick())
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
						draw.SimpleTextOutlined(v:Name(), "ESP_Font_Main", MinX-config["name_x"], MinY+config["name_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["name_pos"] == 2 then
						draw.SimpleTextOutlined(v:Name(), "ESP_Font_Main", MaxX+config["name_x"], MinY+config["name_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["name_pos"] == 3 then
						draw.SimpleTextOutlined(v:Name(), "ESP_Font_Main", MaxX-(MaxX-MinX)/2-w/2+config["name_x"], MinY-config["name_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["name_pos"] == 4 then  
						draw.SimpleTextOutlined(v:Name(), "ESP_Font_Main", MaxX-(MaxX-MinX)/2-w/2+config["name_x"], MaxY+config["name_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
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
						surface.SetDrawColor(0, 0, 0, 250)
						surface.DrawLine( MinX-2, MinY, MinX-2, MaxY )
						surface.DrawLine( MinX-3, MinY, MinX-3, MaxY )
						surface.SetDrawColor(colnormal)
						surface.DrawLine( MinX-2, MinY-appliedBar, MinX-2, MaxY )
						surface.DrawLine( MinX-3, MinY-appliedBar, MinX-3, MaxY )
						elseif config["esp_player_hp_type"] == 2 then
						surface.SetDrawColor(0, 0, 0, 250)
						surface.DrawLine( MaxX+2, MaxY, MaxX+2, MinY )
						surface.DrawLine( MaxX+3, MaxY, MaxX+3, MinY )
                        surface.SetDrawColor(colnormal)
						surface.DrawLine( MaxX+2, MaxY, MaxX+2, MinY-appliedBar )
						surface.DrawLine( MaxX+3, MaxY, MaxX+3, MinY-appliedBar )
						elseif config["esp_player_hp_type"] == 3 then
                        surface.SetDrawColor(0, 0, 0, 250)
						surface.DrawLine( MinX, MinY-2, MaxX, MinY-2 )
						surface.DrawLine( MinX, MinY-3, MaxX, MinY-3 )
                        surface.SetDrawColor(colnormal)
						surface.DrawLine( MinX-appliedBar2, MinY-2, MaxX, MinY-2 )
						surface.DrawLine( MinX-appliedBar2, MinY-3, MaxX, MinY-3 )
						elseif config["esp_player_hp_type"] == 4 then
						surface.SetDrawColor(0, 0, 0, 250)
						surface.DrawLine( MinX, MaxY+2, MaxX, MaxY+2 )
						surface.DrawLine( MinX, MaxY+3, MaxX, MaxY+3 )
                        surface.SetDrawColor(colnormal)
						surface.DrawLine( MinX-appliedBar2, MaxY+2, MaxX, MaxY+2 )
						surface.DrawLine( MinX-appliedBar2, MaxY+3, MaxX, MaxY+3 )
						end
					end
					if config["esp_player_health"] then
						surface.SetFont("ESP_Font_Flag")
						local w, h = surface.GetTextSize(v:Health())
						local col = string.ToColor(config.colors["esp_player_health"])
						if config["health_pos"] == 1 then
						draw.SimpleTextOutlined(v:Health(), "ESP_Font_Flag", MinX-config["health_x"], MinY+config["health_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["health_pos"] == 2 then
						draw.SimpleTextOutlined(v:Health(), "ESP_Font_Flag", MaxX+config["health_x"], MinY+config["health_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["health_pos"] == 3 then
						draw.SimpleTextOutlined(v:Health(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["health_x"], MinY-config["health_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["health_pos"] == 4 then  
						draw.SimpleTextOutlined(v:Health(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["health_x"], MaxY+config["health_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
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
						surface.SetDrawColor(0, 0, 0, 225)
						surface.DrawLine( MinX-2, MinY, MinX-2, MaxY )
						surface.DrawLine( MinX-3, MinY, MinX-3, MaxY )
						surface.SetDrawColor(colnormal)
						surface.DrawLine( MinX-2, MinY-appliedBar, MinX-2, MaxY )
						surface.DrawLine( MinX-3, MinY-appliedBar, MinX-3, MaxY )
						elseif config["esp_player_ap_type"] == 2 then
						surface.SetDrawColor(0, 0, 0, 225)
						surface.DrawLine( MaxX+2, MaxY, MaxX+2, MinY )
						surface.DrawLine( MaxX+3, MaxY, MaxX+3, MinY )
                        surface.SetDrawColor(colnormal)
						surface.DrawLine( MaxX+2, MaxY, MaxX+2, MinY-appliedBar )
						surface.DrawLine( MaxX+3, MaxY, MaxX+3, MinY-appliedBar )
						elseif config["esp_player_ap_type"] == 3 then
                        surface.SetDrawColor(0, 0, 0, 225)
						surface.DrawLine( MinX, MinY-2, MaxX, MinY-2 )
						surface.DrawLine( MinX, MinY-3, MaxX, MinY-3 )
                        surface.SetDrawColor(colnormal)
						surface.DrawLine( MinX-appliedBar2, MinY-2, MaxX, MinY-2 )
						surface.DrawLine( MinX-appliedBar2, MinY-3, MaxX, MinY-3 )
						elseif config["esp_player_ap_type"] == 4 then
						surface.SetDrawColor(0, 0, 0, 225)
						surface.DrawLine( MinX, MaxY+2, MaxX, MaxY+2 )
						surface.DrawLine( MinX, MaxY+3, MaxX, MaxY+3 )
                        surface.SetDrawColor(colnormal)
						surface.DrawLine( MinX-appliedBar2, MaxY+2, MaxX, MaxY+2 )
						surface.DrawLine( MinX-appliedBar2, MaxY+3, MaxX, MaxY+3 )
						end
						end
					end
					if config["esp_player_armor"] then
						surface.SetFont("ESP_Font_Flag")
						local w, h = surface.GetTextSize(v:Armor())
						local col = string.ToColor(config.colors["esp_player_armor"])
					if v:Armor() > 0 or frame then
						if config["armor_pos"] == 1 then
						draw.SimpleTextOutlined(v:Armor(), "ESP_Font_Flag", MinX-config["armor_x"], MinY+config["armor_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["armor_pos"] == 2 then
						draw.SimpleTextOutlined(v:Armor(), "ESP_Font_Flag", MaxX+config["armor_x"], MinY+config["armor_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["armor_pos"] == 3 then
						draw.SimpleTextOutlined(v:Armor(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["armor_x"], MinY-config["armor_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["armor_pos"] == 4 then  
						draw.SimpleTextOutlined(v:Armor(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["armor_x"], MaxY+config["armor_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						end
					end
					end
					if config["esp_player_weapon"] then
						surface.SetFont("ESP_Font_Flag")
					if IsValid(v:GetActiveWeapon()) then
						local w, h = surface.GetTextSize(config["esp_player_weapon_fancy"] and v:GetActiveWeapon():GetPrintName() or v:GetActiveWeapon():GetClass())
						local col = string.ToColor(config.colors["esp_player_weapon"])
						if config["wep_pos"] == 1 then
						draw.SimpleTextOutlined(config["esp_player_weapon_fancy"] and v:GetActiveWeapon():GetPrintName() or v:GetActiveWeapon():GetClass(), "ESP_Font_Flag", MinX-config["wep_x"], MinY+config["wep_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["wep_pos"] == 2 then
						draw.SimpleTextOutlined(config["esp_player_weapon_fancy"] and v:GetActiveWeapon():GetPrintName() or v:GetActiveWeapon():GetClass(), "ESP_Font_Flag", MaxX+config["wep_x"], MinY+config["wep_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["wep_pos"] == 3 then
						draw.SimpleTextOutlined(config["esp_player_weapon_fancy"] and v:GetActiveWeapon():GetPrintName() or v:GetActiveWeapon():GetClass(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["wep_x"], MinY-config["wep_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["wep_pos"] == 4 then  
						draw.SimpleTextOutlined(config["esp_player_weapon_fancy"] and v:GetActiveWeapon():GetPrintName() or v:GetActiveWeapon():GetClass(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["wep_x"], MaxY+config["wep_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						end
					end
					end
					if config["esp_player_rank"] then
						surface.SetFont("ESP_Font_Flag")
                        local w, h = surface.GetTextSize(v:GetUserGroup())
						local col = string.ToColor(config.colors["esp_player_rank"])
						if config["rank_pos"] == 1 then
						draw.SimpleTextOutlined(v:GetUserGroup(), "ESP_Font_Flag", MinX-config["rank_x"], MinY+config["rank_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["rank_pos"] == 2 then
						draw.SimpleTextOutlined(v:GetUserGroup(), "ESP_Font_Flag", MaxX+config["rank_x"], MinY+config["rank_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["rank_pos"] == 3 then
						draw.SimpleTextOutlined(v:GetUserGroup(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["rank_x"], MinY-config["rank_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["rank_pos"] == 4 then  
						draw.SimpleTextOutlined(v:GetUserGroup(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["rank_x"], MaxY+config["rank_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						end
					end
					if config["esp_player_team"] then
						surface.SetFont("ESP_Font_Flag")
                        local w, h = surface.GetTextSize(v:Team())
						local col = team.GetColor(v:Team())
						if config["tm_pos"] == 1 then
						draw.SimpleTextOutlined(v:Team(), "ESP_Font_Flag", MinX-config["tm_x"], MinY+config["tm_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["tm_pos"] == 2 then
						draw.SimpleTextOutlined(v:Team(), "ESP_Font_Flag", MaxX+config["tm_x"], MinY+config["tm_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["tm_pos"] == 3 then
						draw.SimpleTextOutlined(v:Team(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["tm_x"], MinY-config["tm_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["tm_pos"] == 4 then  
						draw.SimpleTextOutlined(v:Team(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["tm_x"], MaxY+config["tm_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						end
					end
					if config["esp_player_distance"] then
						surface.SetFont("ESP_Font_Flag")
                        local w, h = surface.GetTextSize(v:GetUserGroup())
						local col = string.ToColor(config.colors["esp_player_distance"])
						local distance = math.Round((LocalPlayer():GetPos() - v:GetPos()):Length())
						if config["ds_pos"] == 1 then
						draw.SimpleTextOutlined("Dist:" .. distance, "ESP_Font_Flag", MinX-config["ds_x"], MinY+config["ds_y"], col, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["ds_pos"] == 2 then
						draw.SimpleTextOutlined("Dist:" .. distance, "ESP_Font_Flag", MaxX+config["ds_x"], MinY+config["ds_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["ds_pos"] == 3 then
						draw.SimpleTextOutlined("Dist:" .. distance, "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["ds_x"], MinY-config["ds_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						elseif config["ds_pos"] == 4 then  
						draw.SimpleTextOutlined("Dist:" .. distance, "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2+config["ds_x"], MaxY+config["ds_y"], col, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
						end
					end
					if config["esp_player_snaplines"] then
					if config["esp_player_snaplines_pos"] == 1 then
						surface.SetDrawColor( string.ToColor(config.colors["esp_player_snaplines"]))
						surface.DrawLine( ScrW() / 2 - 1, ScrH() , MaxX - ( MaxX - MinX ) / 2 - 1, MaxY )
					elseif config["esp_player_snaplines_pos"] == 2 then
					    surface.SetDrawColor( string.ToColor(config.colors["esp_player_snaplines"]))
						surface.DrawLine( ScrW() / 2 , ScrH() / 2 , MaxX - ( MaxX - MinX ) / 2 - 1, MaxY )
				    elseif config["esp_player_snaplines_pos"] == 3 && config["esp_player_snaplines"] then

					end
					end
					if config["esp_player_skeleton"] then
						for _, b in pairs( bones ) do
							if v:LookupBone(b.S) != nil && v:LookupBone(b.E) != nil then
								local spos, epos = v:GetBonePosition(v:LookupBone(b.S)):ToScreen(), v:GetBonePosition(v:LookupBone(b.E)):ToScreen()
								if spos.visible && epos.visible then
									surface.SetDrawColor( string.ToColor(config.colors["esp_player_skeleton"]) )
									surface.DrawLine( spos.x, spos.y, epos.x, epos.y )
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
						surface.SetFont("ESP_Font_Flag")
						local w, h = surface.GetTextSize("Traitor")
						draw.SimpleTextOutlined("Traitor", "ESP_Font_Flag", MaxX+5, MinY + h, Color(255, 0, 0) , TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
					end
					if config["misc_ttt"] && engine.ActiveGamemode() == "murder" then
						if v:HasWeapon("weapon_mu_knife") then
							surface.SetFont("ESP_Font_Flag")
							local w, h = surface.GetTextSize("Murderer")
							draw.SimpleTextOutlined("Murderer", "ESP_Font_Flag", MaxX+5, MinY + h, Color(255, 0, 0) , TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))	
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
						surface.SetDrawColor(string.ToColor(config.colors["esp_entity_box"]))
						surface.DrawLine( MaxX, MaxY, MinX, MaxY )
						surface.DrawLine( MaxX, MaxY, MaxX, MinY )
						surface.DrawLine( MinX, MinY, MaxX, MinY )
						surface.DrawLine( MinX, MinY, MinX, MaxY )
					end
					if config["esp_entity_name"] then
						surface.SetFont("ESP_Font_Flag")
						local w, h = surface.GetTextSize(v:GetClass())
						draw.SimpleTextOutlined(v:GetClass(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2, MinY-1, string.ToColor(config.colors["esp_entity_name"]), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
					end
				end
			end
		end
		if config["misc_observerlist"] then
			for k, v in ipairs(observingPlayers.watcher) do
				if IsValid(v) then
					surface.SetFont("ESP_Font_Main")
					local nameWidth, nameHeight = surface.GetTextSize("Observer: "..v:Name())
					draw.SimpleText("Observer: "..v:Name(), "ESP_Font_Main", ScrW() - nameWidth - 2, 0 + (15 * ( k - 1 ) ), Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
				end
			end
			for k, v in ipairs(observingPlayers.spec) do
				if IsValid(v) then
	 				surface.SetFont("ESP_Font_Main")
					local nameWidth, nameHeight = surface.GetTextSize("Spectator: "..v:Name())
					draw.SimpleText("Spectator: "..v:Name(), "ESP_Font_Main", ScrW() - nameWidth - 2, -15 + (15 * #observingPlayers.watcher) + (15 * k - 1), Color(255, 0, 0), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
				end
			end
		end
		if config["misc_adminlist"] then
			for k, v in ipairs(onlineStaff) do
				if IsValid(v) then
					local a
					if v:IsSuperAdmin() then a = "Superadmin" elseif v:IsAdmin() then a = "Admin" else a = v:GetUserGroup() end
					surface.SetFont("ESP_Font_Main")
					local nameWidth, nameHeight = surface.GetTextSize(v:Name().." ("..a..")")
					draw.SimpleText(v:Name().." ("..a..")", "ESP_Font_Main", 2, 0 + (15 * ( k - 1 ) ), Color(255, 255, 255), TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP)
				end
			end
		end
		for k, v in ipairs( ents.FindByClass( "npc_*" ) ) do
		local MaxX, MaxY, MinX, MinY, V1, V2, V3, V4, V5, V6, V7, V8, isVis = GetENTPos( v )
		if config["esp_npc_box"] then
		cam.Start3D()
		render.DrawWireframeBox( v:GetPos(), Angle(0, 0, 0), v:OBBMins(), v:OBBMaxs(), string.ToColor(config.colors["esp_npc_box"]), true )
		cam.End3D()
		end
		if config["esp_npc_name"] then
		surface.SetFont("ESP_Font_Main")
		local w, h = surface.GetTextSize(v:GetClass())
		draw.SimpleTextOutlined(v:GetClass(), "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2, MinY-1, string.ToColor(config.colors["esp_npc_name"]), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
		end
		if config["esp_npc_health"] then
		surface.SetFont("ESP_Font_Main")
		local w, h = surface.GetTextSize(v:GetClass())
		draw.SimpleTextOutlined(v:Health() .. "HP", "ESP_Font_Flag", MaxX-(MaxX-MinX)/2-w/2, MinY-10, string.ToColor(config.colors["esp_npc_health"]), TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM, 1, Color(0,0,0))
		end
		if config["esp_npc_snaplines"] then
		surface.SetDrawColor( string.ToColor(config.colors["esp_npc_snaplines"]))
		surface.DrawLine( ScrW() / 2 - 1, ScrH() , MaxX - ( MaxX - MinX ) / 2 - 1, MaxY )
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
        surface.SetDrawColor(rainbow_col.r, rainbow_col.g, rainbow_col.b)
        surface.DrawRect(x, y, size * 3, size)
        draw.SimpleText(""..text.."", "KeyStroke", x+26, y+7, color_black)
    else
        surface.SetDrawColor(gray)
        surface.DrawRect(x, y, size * 3, size)
        draw.SimpleText(""..text.."", "KeyStroke", x+26, y+7, color_white)
    end
end
function AddKeyRectangle(text,key,x,y)
local rainbow_col = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
local color_white = Color(255,255,255)
local color_black = Color(20, 20, 20)
local gray = Color(30, 30, 30)
local size = 35
    surface.SetDrawColor(rainbow_col.r, rainbow_col.g, rainbow_col.b, 100)
    if LocalPlayer():KeyDown(key) then 
        surface.DrawRect(x, y, size, size)
        draw.SimpleText(""..text.."", "KeyStroke", x+11, y+7, color_black)
    else
        surface.SetDrawColor(gray)
        surface.DrawRect(x, y, size, size)
        draw.SimpleText(""..text.."", "KeyStroke", x+11, y+7, color_white)
    end
end
function AddKeyRectangleMouse(text,key,x,y)
local rainbow_col = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
local color_white = Color(255,255,255)
local color_black = Color(20, 20, 20)
local gray = Color(30, 30, 30)
local size = 53
    surface.SetDrawColor(rainbow_col.r, rainbow_col.g, rainbow_col.b, 100)
    if LocalPlayer():KeyDown(key) then 
        surface.DrawRect(x, y, size, 35)
        draw.SimpleText(""..text.."", "KeyStroke", x+11, y+7, color_black)
    else
        surface.SetDrawColor(gray)
        surface.DrawRect(x, y, size, 35)
        draw.SimpleText(""..text.."", "KeyStroke", x+11, y+7, color_white)
    end
end

--hack hud
function HackHUD()
local cur_fps = tostring(math.floor(1 / RealFrameTime()))
    if !ss then
	    if config["hud_velo"] then
		    local velo = math.Round(LocalPlayer():GetVelocity():Length())		    
			surface.SetDrawColor( -velo / 50, velo*3, 0, 200 ) 
	        surface.SetMaterial(Material("gui/center_gradient")) 
	        surface.DrawTexturedRect( ((ScrW()/2) - 250), (ScrH()-100), 512, 18 )
			draw.SimpleText( velo, "TargetID", (ScrW()/2), ScrH() - 100, Color(255 ,255,255) )
		end
	    if config["esp_ent_crosshair"] then
		    draw.SimpleText( LocalPlayer():GetEyeTrace().Entity, "smallest_pixel", (ScrW()/2) - 100, ScrH() / 2 + 65, color_white )
		end
        if config["hud_watermark"] then
		    surface.SetDrawColor( 25, 25, 25, 200 ) 
	        surface.SetMaterial(Material("gui/gradient")) 
	        surface.DrawTexturedRect( 0, 0, 512, 18 )
            draw.SimpleText( "PenisDeda.NET V2|BETA|username: " .. LocalPlayer():Name() .. " |gm: " .. engine.ActiveGamemode(), "smallest_pixel", 0, 0, color_white )
        end
        if config["hud_fps_indicator"] then
		if config["hud_watermark"] then
		surface.SetDrawColor( 25, 25, 25, 200 ) 
	    surface.SetMaterial(Material("gui/gradient")) 
	    surface.DrawTexturedRect( 0, 19, 512, 18 )
		draw.SimpleText( "Frames:" .. cur_fps , "smallest_pixel", 0, 19, color_white )
		draw.SimpleText( " |latency:" .. LocalPlayer():Ping() .. " |tick:"..math.Round(1/engine.TickInterval()-1), "smallest_pixel", 70, 19, color_white )
		else
		surface.SetDrawColor( 25, 25, 25, 200 ) 
	    surface.SetMaterial(Material("gui/gradient")) 
	    surface.DrawTexturedRect( 0, 0, 512, 18 )
		draw.SimpleText( "Frames:" .. cur_fps , "smallest_pixel", 0, 0, color_white )
		draw.SimpleText( " |latency:" .. LocalPlayer():Ping() .. " |tick:"..math.Round(1/engine.TickInterval()-1), "smallest_pixel", 70, 0, color_white )
        end		
		end
		if config["hud_custom_hud"] then
		
		end
		if config["hud_topline"] then
		local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
		    if config["hud_topline_style"] == 1 then
			surface.SetDrawColor(0,0,0,255)
            surface.DrawRect(0, 0, ScrW(), 4)
			surface.SetDrawColor(hsv.r,hsv.g,hsv.b,255)
            surface.DrawRect(1, 1, ScrW(), 2)
			elseif config["hud_topline_style"] == 2 then
			surface.SetDrawColor(hsv.r,hsv.g,hsv.b,255)
            surface.DrawRect(0, 0, ScrW(), 4)
			elseif config["hud_topline_style"] == 3 then
			surface.SetDrawColor(hsv.r,hsv.g,hsv.b,200)
            surface.DrawRect(0, 0, ScrW(), 4)
	        surface.SetMaterial(Material("gui/gradient_down"))
	        surface.DrawTexturedRect( 0, 4, ScrW(), 15 )
			end
		end
		if config["hud_arraylist"] then
		draw.SimpleText( "AimBot", "Impact", ScrW() - 65, 5, Color(255,255,255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP ) 
		draw.SimpleText( "Trigger", "Impact", ScrW() - 65, 30, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
		draw.SimpleText( "Thirdperson", "Impact", ScrW() - 65, 55, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
		draw.SimpleText( "Free Cam", "Impact", ScrW() - 65, 80, color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
		--Aimbot
        if config["aim_master_toggle"] && !config["aim_onkey"] || (input.IsMouseDown(config.keybinds["aim_onkey_key"])  || input.IsKeyDown(config.keybinds["aim_onkey_key"]) ) then
		draw.SimpleText( "[On]", "Impact", ScrW() - 5, 5, Color(0,255,0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
		else
		draw.SimpleText( "[Off]", "Impact", ScrW() - 5, 5, Color(255,0,0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
		end
		--Trigger
		if (input.IsMouseDown(config.keybinds["trigger_onkey_key"])  || input.IsKeyDown(config.keybinds["trigger_onkey_key"]) ) then
		draw.SimpleText( "[On]", "Impact", ScrW() - 5, 30, Color(0,255,0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
		else
		draw.SimpleText( "[Off]", "Impact", ScrW() - 5, 30, Color(255,0,0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
		end
		--3rdPerson
		if intp then
		draw.SimpleText( "[On]", "Impact", ScrW() - 5, 55, Color(0,255,0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
		else
		draw.SimpleText( "[Off]", "Impact", ScrW() - 5, 55, Color(255,0,0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
		end
		--Noclip
		if NoclipOn then
		draw.SimpleText( "[On]", "Impact", ScrW() - 5, 80, Color(0,255,0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
		else
		draw.SimpleText( "[Off]", "Impact", ScrW() - 5, 80, Color(255,0,0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
		end
		end
		if config["hud_crosshair"] then
		if config["hud_crosshair_type"] == 1 then
		surface.SetDrawColor(0,0,0,255)
        surface.DrawRect(ScrW() / 2 - 2, ScrH() / 2 - 2, 4, 4)
		surface.SetDrawColor(0,255,0,255)
        surface.DrawRect((ScrW() / 2) - 1, (ScrH() / 2) - 1, 2, 2)
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
		surface.DrawCircle(ScrW() / 2, ScrH() / 2, pxR, string.ToColor(config.colors["esp_other_drawfov"]))
	    end
		if config["esp_other_drawfov_fill"] && config["aim_master_toggle"] then
		local X1 = math.tan( math.rad( config["aim_fov"] ) / 1.25 )
		local X2 = math.tan( math.rad( LocalPlayer():GetFOV() / 2 ) )
		local r = X1 / X2
		local pxR = r * ( ScrW() / 2 )
		local col = string.ToColor(config.colors["esp_other_drawfov"])
		surface.SetDrawColor(col.r,col.g,col.b,col.a/2.5)
	    surface.SetMaterial(Material("vgui/white"))
		draw.Circle(ScrW() / 2, ScrH() / 2,pxR,30)
	    end
		if config["esp_self_velocity_crosshair"] then
		surface.SetDrawColor(string.ToColor(config.colors["esp_self_velocity_crosshair"]))
	    surface.SetMaterial(Material("vgui/white"))
		draw.Circle(ScrW() / 2, ScrH() / 2,LocalPlayer():GetVelocity():Length() / 4,180)
		end
		
    end
end
--3D2D Хуйни
AddHook("PostDrawOpaqueRenderables", RandomString(), function()
if config["hud_aimbotstatus"] then
	local angle = Angle( 0, 0, 0 )
	local pos = LocalPlayer():GetBonePosition(LocalPlayer():LookupBone("ValveBiped.Bip01_Pelvis"))		
	cam.Start3D2D( pos, angle, 1 )
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	    surface.SetDrawColor( hsv.r, hsv.g, hsv.b, 50 )
	    surface.SetMaterial(Material("vgui/white"))
		draw.Circle( 0, 0, 135 + math.sin( CurTime() ) * 15, 30 )
		surface.DrawCircle( 0, 0, 135 + math.sin( CurTime() ) * 15, Color( hsv.r, hsv.g, hsv.b ) )
		surface.DrawCircle( 1, 0, 135 + math.sin( CurTime() ) * 15, Color( hsv.r, hsv.g, hsv.b ) )
	cam.End3D2D()
end
if config["esp_self_hat"] && config["esp_self_hat_type"] == 1 && !config["esp_self_customagent"] then
if intp then
local angle = Angle( 0, 0, 0 )
local pos = LocalPlayer():GetBonePosition(LocalPlayer():LookupBone("ValveBiped.Bip01_Head1")) + Vector(0,0,10)	
	cam.Start3D2D( pos, angle, 1 )
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	    surface.SetDrawColor( hsv.r, hsv.g, hsv.b, 50 )
		surface.DrawCircle( 0, 0, 5, Color( hsv.r, hsv.g, hsv.b ) )
	cam.End3D2D()
else end
end
end )

AddHook("HUDPaint", RandomString(), HackHUD)
--Hats

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

        surface.SetDrawColor(hsv2rgb(rainbow,1, 1, 1))
        surface.DrawLine(x, y, x + p_0, y - p_1)
        surface.DrawLine(x + p_0, y - p_1, x + p_2, y - p_3)
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
        surface.SetDrawColor(255, 255,255)
        surface.DrawLine( pos.x - 8, pos.y - 8, pos.x - 2, pos.y - 2 )
        surface.DrawLine( pos.x - 8, pos.y + 8, pos.x - 2, pos.y + 2 )
        surface.DrawLine( pos.x + 8, pos.y - 8, pos.x + 2, pos.y - 2 )
        surface.DrawLine( pos.x + 8, pos.y + 8, pos.x + 2, pos.y + 2 )
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
-- ======================= KillStreak counter

-- ======================= Event Logger

AddHook("player_connect", RandomString(), function(data)
if config["misc_eventlog"] then
local name = data.name			// Same as Player:Nick()
local steamid = data.networkid	// Same as Player:SteamID()
local ip = data.address			// Same as Player:IPAddress()
if config["misc_eventlog_type"] == 1 then
local np = vgui.Create("DNotify")
np:SetPos(5, 150)
np:SetSize(650, 20)
local bg = vgui.Create("DPanel", np)
bg:Dock(FILL)
local DLabel = vgui.Create( "DLabel", bg )
DLabel:SetPos( 8, 6 )
DLabel:SetSize( 650, 12 )
DLabel:SetColor( color_white )
DLabel:SetWrap(true)
DLabel:SetFont("smallest_pixel")
if ip == nil then
notifyw3 = surface.GetTextSize(name .. " | " .. steamid .. " connected!")
DLabel:SetText(name .. " | " .. steamid .. " connected!")
else
notifyw3 = surface.GetTextSize(name .. " | " .. steamid .. " connected|ip - " .. ip)
DLabel:SetText(name .. " | " .. steamid .. " connected|ip - " .. ip)
end
function bg:Paint(w, h)
	draw.RoundedBoxEx( 5, 0, 0, 5, h, Color(250,45,45,255), true, false, true, false )
	draw.RoundedBoxEx( 3, 5, 0, 200, h, Color(25,25,25,255), false, true, false, true )
end
np:AddItem(bg)
end
end
if config["misc_eventlog_type"] == 2 then
local name = data.name			// Same as Player:Nick()
local steamid = data.networkid	// Same as Player:SteamID()
local ip = data.address			// Same as Player:IPAddress()
if ip == nil then
chat.AddText( Color( 250, 250, 250 ),name , " | " , steamid , " connected!"  )
else
chat.AddText( Color( 250, 250, 250 ),name , " | " , steamid , " connected|ip - " ,Color( 255, 250, 250 ), ip )
end
end
if config["misc_eventlog_type"] == 3 then
local name = data.name			// Same as Player:Nick()
local steamid = data.networkid	// Same as Player:SteamID()
local ip = data.address			// Same as Player:IPAddress()
if ip == nil then
MsgC( Color( 250, 250, 250 ),name , " | " , steamid , " connected!")
else
MsgC( Color( 250, 250, 250 ),name , " | " , steamid , " connected|ip - " ,Color( 255, 250, 250 ), ip )
end
end
end)
AddHook("player_disconnect", RandomString(), function(data)
if config["misc_eventlog"] then
local name = data.name			// Same as Player:Nick()
local steamid = data.networkid		// Same as Player:SteamID()
local reason = data.reason
if config["misc_eventlog_type"] == 1 then
local np = vgui.Create("DNotify")
np:SetPos(5, 175)
np:SetSize(650, 20)
local bg = vgui.Create("DPanel", np)
bg:Dock(FILL)
local DLabel = vgui.Create( "DLabel", bg )
DLabel:SetPos( 8, 6 )
DLabel:SetSize( 650, 12 )
DLabel:SetColor( color_white )
DLabel:SetWrap(true)
DLabel:SetFont("smallest_pixel")
notifyw2 = surface.GetTextSize(name .. " | " .. steamid .. " disconnected|reason - " .. reason)
DLabel:SetText(name .. " | " .. steamid .. " disconnected|reason - " .. reason )
function bg:Paint(w, h)
	draw.RoundedBoxEx( 5, 0, 0, 5, h, Color(45,45,45,255), true, false, true, false )
	draw.RoundedBoxEx( 3, 5, 0, 400, h, Color(25,25,25,255), false, true, false, true )
end
np:AddItem(bg)
end
if config["misc_eventlog_type"] == 2 then
chat.AddText( Color( 250, 250, 250 ),name , " | " .. steamid , " disconnected|reason - " , reason  )
end
if config["misc_eventlog_type"] == 3 then
MsgC( Color( 250, 250, 250 ),name , " | " .. steamid , " disconnected|reason - " , reason  )
end
end end)
AddHook("player_hurt", RandomString(), function(data)
if config["misc_eventlog"] then
local userid = data.userid
local attacker = data.attacker
local hurter = nil
if config["misc_eventlog_type"] == 1 then
local np = vgui.Create("DNotify")
np:SetPos(5, 200)
np:SetSize(650, 20)

local bg = vgui.Create("DPanel", np)
bg:Dock(FILL)

for _, ply in next, player.GetAll() do
    if (attacker == ply:UserID()) then
	    hurter = ply
	end
end

for _, ply in next, player.GetAll() do
local health = ply:Health() - data.health
if (userid == ply:UserID()) then

local DLabel = vgui.Create( "DLabel", bg )
DLabel:SetPos( 8, 6 )
DLabel:SetSize( 650, 12 )
DLabel:SetColor( color_white )
DLabel:SetWrap(true)
DLabel:SetFont("smallest_pixel")
if hurter == nil then
notifyw = surface.GetTextSize("??? hurted " .. ply:Name() .. "|Dealed " .. health .. " dmg|using ??? !")
DLabel:SetText("??? hurted " .. ply:Name() .. "|Dealed " .. health .. " dmg|using ??? !")
else
notifyw = surface.GetTextSize( hurter:Name() .. " hurted " .. ply:Name() .. "|Dealed " .. health .. " dmg|using " .. hurter:GetActiveWeapon():GetClass() .. " !" )
DLabel:SetText( hurter:Name() .. " hurted " .. ply:Name() .. "|Dealed " .. health .. " dmg|using " .. hurter:GetActiveWeapon():GetClass() .. " !" )
end

function bg:Paint(w, h)
	local hsv = HSVToColor( ( CurTime() * 50 ) % 360, 1, 1 )
	draw.RoundedBoxEx( 5, 0, 0, 5, h, Color(hsv.r,hsv.g,hsv.b,255), true, false, true, false )
	draw.RoundedBoxEx( 3, 5, 0, 500, h, Color(25,25,25,255), false, true, false, true )
end
np:AddItem(bg) end end end 
end
if config["misc_eventlog_type"] == 2 then
for _, ply in next, player.GetAll() do
    if (attacker == ply:UserID()) then
	    hurter = ply
	end
end

for _, ply in next, player.GetAll() do
local health = ply:Health() - data.health
if (userid == ply:UserID()) then
if hurter == nil then
chat.AddText(Color( 250, 250, 250 ),"??? hurted " , ply:Name() , "|Dealed " ,Color( 255, 128, 128 ), health ,Color( 250, 250, 250 ), " dmg|using ??? !")
else
chat.AddText(Color( 250, 250, 250 ),hurter:Name() , " hurted " .. ply:Name() , "|Dealed " ,Color( 255, 128, 128 ), health ,Color( 250, 250, 250 ), " dmg|using " , hurter:GetActiveWeapon():GetClass() , " !")
end
end
end
end
if config["misc_eventlog_type"] == 3 then
for _, ply in next, player.GetAll() do
    if (attacker == ply:UserID()) then
	    hurter = ply
	end
end

for _, ply in next, player.GetAll() do
local health = ply:Health() - data.health
if (userid == ply:UserID()) then
if hurter == nil then
MsgC(Color( 250, 250, 250 ),"??? hurted " , ply:Name() , "|Dealed " ,Color( 255, 128, 128 ), health ,Color( 250, 250, 250 ), " dmg|using ??? !")
else
MsgC(Color( 250, 250, 250 ),hurter:Name() , " hurted " , ply:Name() , "|Dealed " ,Color( 255, 128, 128 ), health ,Color( 250, 250, 250 ), " dmg|using " , hurter:GetActiveWeapon():GetClass() , " !")
end
end
end
end
end)
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
AddHook("HUDPaint", RandomString(), function()
    if config["esp_player_drawmodel"] then
	    cam.Start3D( EyePos(), EyeAngles() )
			for k, v in ipairs(player.GetAll()) do
				if ValidateESP(v) then
		            v:DrawModel()
		        end
			end
		cam.End3D()
	end
end)
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
end)
-- ======================= Fog

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
surface.SetDrawColor(color.r, color.g, color.b)
surface.DrawRect(0,0,ScrW(), ScrH())
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

--=================================== Camera Modifications


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
AddHook('CalcView', 'ThirdPersonCalcView', function (pl, origin, ang, fov)
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


	
--===================================
--=================================== Aimbot
--===================================

--=================================== No Recoil
 
local OEyeAngles = OEyeAngles or FindMetaTable( "Player" ).SetEyeAngles

FindMetaTable( "Player" ).SetEyeAngles = function( self, angle )

    if ( string.find( string.lower( debug.getinfo( 2 ).short_src ), "/weapons/" ) ) and config["aim_norecoil"] then return end

    OEyeAngles( self, angle )

end

--=================================== CreateMove (Aimbot, Triggerbot, BHop, AutoStrafe, Autofire, Misc Calcs)

local predictedWeapons = {
	["weapon_crossbow"] = 3110
}

local pred, realAng

local function FixMovement(cmd, fa)
	
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

	local ply = LocalPlayer()
	
	local pos = v:LocalToWorld(v:OBBCenter())
	
	local trace = { 
		start = ply:GetShootPos(), 
		endpos = pos, 
		filter = { ply, v }, 
		mask = MASK_SHOT
	}
	local tr = util.TraceLine( trace )
	
	if( !tr.Hit ) then
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
local function AutoSlow( ucmd )
ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 262144));
end
local function AutoCrouch( ucmd )
ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 4));
end
local function AutoReload( ucmd )
ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 8192));
end
local function AirDuck( ucmd )
ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 4));
end
local function ForceDuck( ucmd )
ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 4));
end
local function CritJump( ucmd )
ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 2));
end
local function MoveForward( ucmd )
ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 8));
end
local function MoveBack( ucmd )
ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 16));
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

local function JitterMove( ucmd )
    if input.IsKeyDown(config.keybinds["jitter_keybind"]) && config["misc_jittermove"] then
        if !timerfix then
            LocalPlayer():SetEyeAngles(LocalPlayer():EyeAngles() - Angle(0, 180, 0))
        end
        ucmd.SetViewAngles(ucmd, LocalPlayer():EyeAngles())
        timerfix = true
        timer.Simple(0.05, function() timerfix = false end)
    end
end

local function AntiAFK( ucmd )
    if config["misc_antiafk"] then
    ucmd:SetForwardMove( math.random( -300, 300 ) )
	ucmd:SetSideMove( math.random( -300, 300 ) )
	end
end

local function AutofireWallCheck( v )
	local ply = LocalPlayer()
	
	local pos = v:LocalToWorld(v:OBBCenter())
	
	local trace = { 
		start = ply:GetShootPos(), 
		endpos = pos, 
		filter = { ply, v }, 
		mask = MASK_SHOT
	}
	local tr = util.TraceLine( trace )
	
	if( !tr.Hit ) then
		return true
	end
	return false
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
		local delta = math.abs(math.NormalizeAngle(true_dir - rough_dir))

		-- Only the smallest delta wins out
		if delta < best_delta then
			best_angle = rough_dir
			best_delta = delta
		end
	end

	return best_angle
end
local function CalcForward(ucmd)
	if math.abs(ucmd:GetForwardMove()) < 1 then
		if math.abs(ucmd:GetSideMove()) < 1 and math.abs(ucmd:GetMouseX()) < 1 and me:IsOnGround() then
			return 10000
		else
			local mx = math.abs(ucmd:GetMouseX()) * 2
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
	if !me:IsOnGround() and math.abs(ucmd:GetSideMove()) < 1 then
		if math.abs(ucmd:GetMouseX()) > 1 then
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
		autostrafe_step = math.abs(math.NormalizeAngle(autostrafe_calc_dir - ideal_step))

		-- Check when the calculated direction arrives close to the wish direction
		if math.abs(math.NormalizeAngle(autostrafe_wish_dir - autostrafe_calc_dir)) > autostrafe_step then
			local add = math.NormalizeAngle(autostrafe_calc_dir + autostrafe_step)
			local sub = math.NormalizeAngle(autostrafe_calc_dir - autostrafe_step)

			-- Step in direction that gets us closer to our wish direction
			if math.abs(math.NormalizeAngle(autostrafe_wish_dir - add)) >= math.abs(math.NormalizeAngle(autostrafe_wish_dir - sub)) then
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
local function BulletTime()
    servertime = 0
    wep = pm.GetActiveWeapon(ply)
    if (!wep || !em.IsValid(wep) || config["aim_bullettime"]) then return(true) end
    return(servertime >= wm.GetNextPrimaryFire(wep))	
end
AddHook("Move", RandomString() , function()
    if(!IsFirstTimePredicted()) then return end
	servertime = CurTime()
end)

local function PredictSpread(ucmd, ang, spread)
	if config["aim_nospread"] then
		spread = (spread.x + spread.y) / 2
		local spreadDir = PredictSpread(ucmd, ang, spread)
		local newAngles = ang + spreadDir:Angle()
		newAngles:Normalize()
		
		return newAngles
	end
	
	return ang
end

local weapcones = {}
local function RemoveSpread(ucmd, ang)
	local weap = me:GetActiveWeapon()
	local class = weap:GetClass()
	
	if class:StartWith("cw_") then
		-- local memevec = Angle(0, cmd:CommandNumber() % 2 * 180, 0):Forward()
		
		local function CalculateSpread()
			if not weap.AccuracyEnabled then
				return
			end
			
			local aim = ang:Forward()
			local CT = CurTime()
			local dt = TICK_INTERVAL --FrameTime()
			
			if !me.LastView then
				me.LastView = aim
				me.ViewAff = 0
			else
				me.ViewAff = LerpCW20(dt * 10, me.ViewAff, (aim - me.LastView):Length() * 0.5)
				me.LastView = aim
			end
			
			local baseCone, maxSpreadMod = weap:getBaseCone()
			weap.BaseCone = baseCone
			
			if me:Crouching() then
				weap.BaseCone = weap.BaseCone * weap:getCrouchSpreadModifier()
			end
			
			weap.CurCone = weap:getFinalSpread(me:GetVelocity():Length2D(), maxSpreadMod)
			
			if CT > weap.SpreadWait then
				weap.AddSpread = mClamp(weap.AddSpread - 0.5 * weap.AddSpreadSpeed * dt, 0, weap:getMaxSpreadIncrease(maxSpreadMod))
				weap.AddSpreadSpeed = mClamp(weap.AddSpreadSpeed + 5 * dt, 0, 1)
			end
		end
		
		-- samoware.SetContextVector(ucmd, memevec)
		
		CalculateSpread()
		
		local cone = weap.CurCone
		if !cone then return ang end

		if me:Crouching() then
			cone = cone * 0.85
		end

		math.randomseed(ucmd:CommandNumber())
		ang = ang - Angle(mRand(-cone, cone), mRand(-cone, cone), 0) * 25
	elseif class:StartWith("arccw_") then
		local angDir = ang:Forward()

		local seed1 = weap:GetBurstCount()
		local seed2 = !game.SinglePlayer() and ucmd:CommandNumber() or CurTime()

		local randSeed = util.SharedRandom(seed1, -1337, 1337, seed2) * (weap:EntIndex() % 30241)
		math.randomseed(math.Round(randSeed))

		local spread = ArcCW.MOAToAcc * weap:GetBuff("AccuracyMOA")
		local disp = weap:GetDispersion() * ArcCW.MOAToAcc / 10

		angDir:Rotate(Angle(0, -ArcCW.StrafeTilt(weap), 0))
		angDir = angDir - VectorRand() * disp

		local randSeed = util.SharedRandom(1, -1337, 1337, seed2) * (weap:EntIndex() % 30241)
		math.randomseed(math.Round(randSeed))
		angDir = angDir - VectorRand() * spread

		return angDir:Angle()
	elseif class:StartWith("swb_") then
		local function CalculateSpread()
			local vel = me:GetVelocity():Length()
			local dir = ang:Forward()
			
			if !me.LastView then
				me.LastView = dir
				me.ViewAff = 0
			else
				me.ViewAff = Lerp(0.25, me.ViewAff, (dir - me.LastView):Length() * 0.5)
				--  me.LastView = dir
			end
			
			if weap.dt.State == SWB_AIMING then
				weap.BaseCone = weap.AimSpread
				
				if weap.Owner.Expertise then
					weap.BaseCone = weap.BaseCone * (1 - weap.Owner.Expertise["steadyaim"].val * 0.0015)
				end
			else
				weap.BaseCone = weap.HipSpread
				
				if weap.Owner.Expertise then
					weap.BaseCone = weap.BaseCone * (1 - weap.Owner.Expertise["wepprof"].val * 0.0015)
				end
			end
			
			if me:Crouching() then
				weap.BaseCone = weap.BaseCone * (weap.dt.State == SWB_AIMING and 0.9 or 0.75)
			end
			
			weap.CurCone = mClamp(weap.BaseCone + weap.AddSpread + (vel / 10000 * weap.VelocitySensitivity) * (weap.dt.State == SWB_AIMING and weap.AimMobilitySpreadMod or 1) + me.ViewAff, 0, 0.09 + weap.MaxSpreadInc)
			
			if CurTime() > weap.SpreadWait then
				weap.AddSpread = mClamp(weap.AddSpread - 0.005 * weap.AddSpreadSpeed, 0, weap.MaxSpreadInc)
				weap.AddSpreadSpeed = mClamp(weap.AddSpreadSpeed + 0.05, 0, 1)
			end
		end
		
		CalculateSpread()
		
		local cone = weap.CurCone
		if !cone then return ang end

		if me:Crouching() then
			cone = cone * 0.85
		end

		math.randomseed(ucmd:CommandNumber())
		ang = ang - Angle(mRand(-cone, cone), mRand(-cone, cone), 0) * 25
	elseif weapcones[class] then
		local spread = weapcones[class]
		return PredictSpread(ucmd, ang, spread)
	end
	
	return ang
end

local function PitchAA(ucmd)
	pitch = 180
	return pitch
end

local function YawAA(ucmd)
	yaw = 180
	return yaw
end


AddHook("CreateMove", RandomString(), function(ucmd, world_click)
    local pitch, yaw
    if config["antihit_antiaim"] then
	    if config["yaw_base"] == 1 then
	        yaw, pitch = YawAA(ucmd)
		end
		if config["pitch_add"] != 1 then
		    pitch = PitchAA(ucmd)
		end	 	
	local angles = Angle(pitch, yaw, 0)
	ucmd:SetViewAngles(angles)
	else
	local angles = ucmd:GetViewAngles()
	end
    bSendPacket = 0
    if config["bsp_fake_lags"] then
	if config["bsp_fake_lagsr"] then
	local rlag = math.random( config["bsp_fake_lagsr_value"],config["bsp_fake_lags_value"])
		if config["bsp_fake_lags_conditions"] == 1 then  
            bSendPacket = (ucmd:CommandNumber() % rlag) < 3 --
	    elseif config["bsp_fake_lags_conditions"] == 2 then
		    if LocalPlayer():GetVelocity():Length() > 50 then
		        bSendPacket = (ucmd:CommandNumber() % rlag) < 3
			end
		elseif config["bsp_fake_lags_conditions"] == 3 then
		    if LocalPlayer():GetVelocity():Length() < 20 then
		        bSendPacket = (ucmd:CommandNumber() % rlag) < 3
			end
		elseif config["bsp_fake_lags_conditions"] == 4 then
		    if LocalPlayer():IsOnGround() then
		        bSendPacket = (ucmd:CommandNumber() % rlag) < 3
		    end
		elseif config["bsp_fake_lags_conditions"] == 5 then
		    if !LocalPlayer():IsOnGround() then
		        bSendPacket = (ucmd:CommandNumber() % rlag) < 3
		    end
		elseif config["bsp_fake_lags_conditions"] == 6 then
		    if ucmd:KeyDown(IN_ATTACK) then
		        bSendPacket = (ucmd:CommandNumber() % rlag) < 3
		    end
		elseif config["bsp_fake_lags_conditions"] == 7 then
		    if !ucmd:KeyDown(IN_ATTACK) then
		        bSendPacket = (ucmd:CommandNumber() % rlag) < 3
		    end
		end	
	else
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
		        bSendPacket = (ucmd:CommandNumber() % rlag) < 3
		    end
		end
	end
    end
    if config["antihit_fd"] then
        if input.IsKeyDown(config.keybinds["antihit_fd_key"]) then
		    bSendPacket = (ucmd:CommandNumber() % 32) < 3
			ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 4));
		    if LocalPlayer():KeyDown(IN_DUCK) then ucmd:RemoveKey(IN_DUCK) end
		end
    end
	if config["aim_silent"] then
		if(!realAng) then realAng = ucmd:GetViewAngles() end
		realAng = realAng + Angle(ucmd:GetMouseY() * .023, ucmd:GetMouseX() * -.023, 0)
		realAng.x = math.NormalizeAngle(realAng.x)
		realAng.p = math.Clamp(realAng.p, -89, 89)
		if ucmd:CommandNumber() == 0 then ucmd:SetViewAngles(realAng) return end
	else
		if ucmd:CommandNumber() == 0 then return end
	end
	if config["misc_scrollattack"] then
	ScrollAttack(ucmd)
	end
	
	if config["misc_fastswitch"] then
	FastSwitch(ucmd)
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
		            ForceDuck(ucmd)
				end
		    end
	    end
	end
    if config["misc_airduck"] then
	if config["misc_airduckmetod"] == 1 then
		if LocalPlayer():Alive() then
			if !LocalPlayer():IsOnGround() then 
			AirDuck(ucmd)
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
							pred = v:GetVelocity() * tarFrames - LocalPlayer():GetVelocity() * plyFrames
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
							
							if config["aim_nospread"] then 
							FinAngle = RemoveSpread(ucmd, FinAngle)
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

							angDiff = math.abs(math.NormalizeAngle(angDiff))

							if angDiff < config["aim_fov"] then

								InFOV = true 
							
							end
							if config["aim_psilent"] then
							    if AimP && InFOV then
							        if not world_click then return end 
                                    if not ucmd:GetInWorldClicker() then 
                                        ucmd:SetInWorldClicker(true)
                                        ucmd:SetWorldClickerAngles(FinAngle:Forward())
                                    end
							    end
							end
                            if AimP && InFOV && AutofireWallCheck(v) && config["aim_autofire"] then
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
							if AimP && InFOV && AutofireWallCheck(v) && config["autoslow"] then
							AutoSlow(ucmd)
							end
							if AimP && InFOV && AutofireWallCheck(v) && config["autocrouch"] then
							AutoCrouch(ucmd)
							end
                            if config["aim_autoreload"] then
							    if IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():Clip1() == 0 then
							        ucmd:SetButtons(bit.bor(ucmd:GetButtons(), 8192))
								end
							end
							if config["killaura_crits"] then
							    if AimP && KillAuraP && InFOV && AutofireWallCheck(v) then
								    if LocalPlayer():GetActiveWeapon():GetClass() == "mc_weapon_sword_diamond" then
									    if math.Round((LocalPlayer():GetPos() - v:GetPos()):Length()) <= 150 then
										if !input.IsKeyDown(KEY_SPACE) then
                                            CritJump(ucmd)
									    end
										end
								    end
							    end
							end
							if AimP && InFOV && AutofireWallCheck(v) && config["killaura_magnet"] && KillAuraP then
							    if math.Round((LocalPlayer():GetPos() - v:GetPos()):Length()) <= 150 then
							        if !LocalPlayer():KeyDown(8) then
							            MoveForward(ucmd)
							        end
								elseif math.Round((LocalPlayer():GetPos() - v:GetPos()):Length()) <= 45 then
							        if !LocalPlayer():KeyDown(16) then
							            MoveBack(ucmd)
							        end
							    end
							end
							if AimP && InFOV then
								if config["aim_smoothing"] && (IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():GetClass() != "weapon_crossbow" ) then
									playerCenter = newPlayerCenter
									PlayerHealth = NewPlayerHealth
									PlayerDistance = NewPlayerDistance
									ucmd:SetViewAngles(Smoothing(FinAngle))
									if config["aim_silent"] then
										FixMovement(ucmd, realAng)
									end
								else
									playerCenter = newPlayerCenter
									PlayerHealth = NewPlayerHealth
									PlayerDistance = NewPlayerDistance
									ucmd:SetViewAngles(FinAngle)
									if config["aim_silent"] then
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
end)


--==========NoSpread 

--===================================
--=================================== Misc
--===================================


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
            surface.SetFont("56")
            local h = surface.GetTextSize(tostring(d.num))
            surface.SetTextColor(0, 0, 0, 255 * d.life)
            surface.SetTextPos(f - h / 2, g)
            surface.DrawText(tostring(d.num))
            surface.SetFont("45")
            surface.SetTextColor(255, 45 - d.num, 45 - d.num, 255 * d.life)
            surface.SetTextPos(f - h / 2, g)
            surface.DrawText(tostring(d.num))
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
--Show Family Shared
if config["misc_familyshared"]  then
for _,v in pairs(player.GetHumans())do
    http.Fetch("https://api.steampowered.com/IPlayerService/IsPlayingSharedGame/v0001/?key=5DCF81C641ACAE4B5E5332A5E04B5FCD&format=json&steamid="..v:SteamID64().."&appid_playing=4000",function(a)
        local showfake=util.JSONToTable(a)["response"]["lender_steamid"]
        if showfake=="0"then return end
        print(v:Nick().."\nReal: https://steamcommunity.com/profiles/"..showfake.."\nFake: https://steamcommunity.com/profiles/"..v:SteamID64())
    end)
end
end

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
--Undo Spam
if config["misc_doundo"] then
timer.Simple(0, function() 
RunConsoleCommand("undo")
end)
end
--Act spammer
if config["antihit_act"]  then
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
    end
end
end)
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

--=================================== Rainbow Physgun

AddHook("Think", RandomString(), function()
	if !ss then
		if config["misc_rainbow"] then
			local col = HSVToColor( ( CurTime() * config["misc_rainbow_speed"] ) % 360, 1, 1 )
			if LocalPlayer():Alive() && IsValid(LocalPlayer():GetActiveWeapon()) && LocalPlayer():GetActiveWeapon():GetClass() == "weapon_physgun" then
				LocalPlayer():SetWeaponColor( Color(col.r, col.g, col.b):ToVector() )
			end
		end
		if config["misc_rainbowply"] then
		local col = HSVToColor( ( CurTime() * config["misc_rainbow_speed"] ) % 360, 1, 1 )
		if LocalPlayer():Alive() then
		LocalPlayer():SetPlayerColor(Vector(col.r/255,col.g/255,col.b/255))
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


--==================== Injection Welcome Message Thing
print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n")
MsgC(Color(255, 235, 200), "PenisDeda" .. penisversion .. "loaded! \n")

notification.AddLegacy("Loaded PenisDeda " .. penisversion .."  | " .. os.date("%I:%M %p"), NOTIFY_HINT, 5)

for k, v in ipairs(files) do
	if string.lower(v) == "default.json" then
		LoadDefault()
	end
end
