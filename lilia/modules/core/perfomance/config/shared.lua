﻿------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[ Timers to be removed on the client ]]
PerfomanceCore.TimersToRemove = {"HostnameThink", "CheckHookTimes", "HintSystem_OpeningMenu", "HintSystem_Annoy1", "HintSystem_Annoy2"}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[ Hooks to be removed ]]
PerfomanceCore.RemovableHooks = {
    ["StartChat"] = {"StartChatIndicator",},
    ["FinishChat"] = {"EndChatIndicator",},
    ["PostPlayerDraw"] = {"DarkRP_ChatIndicator",},
    ["CreateClientsideRagdoll"] = {"DarkRP_ChatIndicator",},
    ["player_disconnect"] = {"DarkRP_ChatIndicator",},
    ["PostDrawEffects"] = {"RenderWidgets", "RenderHalos",},
    ["PlayerTick"] = {"TickWidgets",},
    ["OnEntityCreated"] = {"WidgetInit",},
    ["PlayerInitialSpawn"] = {"PlayerAuthSpawn"},
    ["LoadGModSave"] = {"LoadGModSave",},
    ["GUIMousePressed"] = {"SuperDOFMouseDown",},
    ["GUIMouseReleased"] = {"SuperDOFMouseUp",},
    ["PreventScreenClicks"] = {"SuperDOFPreventClicks",},
    ["Think"] = {"DOFThink", "CheckSchedules"},
    ["NeedsDepthPass"] = {"NeedsDepthPass_Bokeh",},
    ["RenderScene"] = {"RenderSuperDoF", "RenderStereoscopy"},
    ["PreRender"] = {"PreRenderFrameBlend"},
    ["PostRender"] = {"RenderFrameBlend"},
    ["RenderScreenspaceEffects"] = {"RenderBokeh"},
}

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[ Console Commands to be run on the client ]]
PerfomanceCore.StartupConsoleCommands = {
    ["ai_serverragdolls"] = "1",
    ["threadpool_affinity"] = "8",
    ["gmod_physiterations"] = "2",
    ["net_maxpacketdrop"] = "5000",
    ["net_chokeloop"] = "0",
    ["net_splitpacket_maxrate"] = "1048576",
    ["net_compresspackets_minsize"] = "1024",
    ["net_maxfragments"] = "1260",
    ["net_maxfilesize"] = "16",
    ["net_maxcleartime"] = "4",
    ["snd_mix_async"] = "0",
    ["snd_async_fullyasync"] = "0",
    ["snd_async_minsize"] = "262144",
    ["cl_lagcompensation"] = "1",
    ["cl_smoothtime"] = "0.01",
    ["cl_localnetworkbackdoor"] = "0",
    ["cl_cmdrate"] = "30",
    ["cl_updaterate"] = "40",
    ["cl_forcepreload"] = "0",
    ["cl_resend"] = "11",
    ["cl_jiggle_bone_framerate_cutoff"] = "4",
    ["cl_timeout"] = "3000",
    ["cl_threaded_bone_setup"] = "1",
    ["mat_managedtextures"] = "1",
    ["r_threaded_renderables"] = "1",
    ["r_threaded_particles"] = "1",
    ["r_queued_ropes"] = "1",
    ["r_queued_decals"] = "1",
    ["r_queued_post_processing"] = "1",
    ["cl_threaded_client_leaf_system"] = "1",
    ["cl_detaildist"] = "1",
    ["r_threaded_client_shadow_manager"] = "1",
    ["r_drawmodeldecals"] = "0",
    ["r_shadows"] = "0",
    ["r_radiosity"] = "4",
    ["ai_expression_optimization"] = "1",
    ["filesystem_max_stdio_read"] = "64",
    ["fast_fogvolume"] = "0",
    ["filesystem_unbuffered_io"] = "1",
    ["ragdoll_sleepaftertime"] = "40.0f",
    ["studio_queue_mode"] = "1",
    ["gmod_mcore_test"] = "1",
    ["cl_playerspraydisable"] = "1",
    ["mat_queue_mode"] = "2",
    ["fps_max"] = "0",
    ["fov_desired"] = "100",
    ["mat_specular"] = "0",
    ["r_lod"] = "-1",
    ["cl_drawworldtooltips"] = "0",
    ["lia_cheapblur"] = "1",
    ["rope_smooth"] = "0",
    ["Rope_wind_dist"] = "0",
    ["Rope_shake"] = "0",
    ["violence_ablood"] = "1",
    ["r_fastzreject"] = "1",
    ["Cl_ejectbrass"] = "0",
    ["Muzzleflash_light"] = "0",
    ["cl_wpn_sway_interp"] = "0",
    ["in_usekeyboardsampletime"] = "0",
    ["r_rootlod"] = "2",
    ["r_entityclips"] = "1",
    ["r_norefresh"] = "1",
    ["mat_vsync"] = "0",
    ["mat_trilinear"] = "0",
    ["lod_TransitionDist"] = "-1",
    ["mat_forcemanagedtextureintohardware"] = "0",
    ["cl_smooth"] = "0",
    ["cl_pred_optimize"] = "2",
}
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------