local QBCore = exports['qb-core']:GetCoreObject()
local PlayerData = {}
local washingmoney = false


Text3D = function(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end

Citizen.CreateThread(function()
    while true do
        local inRange = false

			local PlayerPed = PlayerPedId()
			local PlayerPos = GetEntityCoords(PlayerPed)
			local MainHackingArea = vector3(1135.92, -989.49, 46.11)
			local distance = #(PlayerPos - MainHackingArea))
			
			if distance < 15 then
				inRange = true

			if inRange then
			
			exports['qb-target']:AddBoxZone("HackingDenTargetComputer", vector3(441.7989, -982.0529, 30.67834), 0.45, 0.35, {
			name = "HackingDenTargetComputer",
			heading = 11.0,
			debugPoly = true,
			minZ = 30.77834,
			maxZ = 30.87834,
			}, {
				options = {
					{
						type = "server",
						event = "benplays1080p_hackingproficiency:server:checkequipment",
						icon = "fa-laptop-code",
						label = "Start Hacking",
						job = "hacker",
					},
				},
				distance = 2.5
			})
			
			
			exports['qb-target']:AddBoxZone("HackingDenTargetComputer", vector3(441.7989, -982.0529, 30.67834), 0.45, 0.35, {
			name = "HackingDenTargetComputer",
			heading = 11.0,
			debugPoly = true,
			minZ = 30.77834,
			maxZ = 30.87834,
			}, {
				options = {
					{
						type = "server",
						event = "benplays1080p_hackingproficiency:server:checkequipment",
						icon = "fa-laptop-code",
						label = "Start Hacking",
						job = "hacker",
					},
				},
				distance = 2.5
			})
			
			
			exports['qb-target']:AddBoxZone("HackingDenTargetComputer", vector3(441.7989, -982.0529, 30.67834), 0.45, 0.35, {
			name = "HackingDenTargetComputer",
			heading = 11.0,
			debugPoly = true,
			minZ = 30.77834,
			maxZ = 30.87834,
			}, {
				options = {
					{
						type = "server",
						event = "benplays1080p_hackingproficiency:server:checkequipment",
						icon = "fa-laptop-code",
						label = "Start Hacking",
						job = "hacker",
					},
				},
				distance = 2.5
			})
			
			
			break



			--	if distance < 8 then
				--	Text3D(1135.92, -989.49, 46.11, "[G] Start Hacking")
	 --               Text3D(1135.92, -989.49, 46.11, '<FONT FACE="Fira Sans">~g~[G]~w~ Wash Money')
		--			DrawMarker(31, 1135.92, -989.49, 45.14, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 0, true)
	--				if IsControlJustPressed(0, 47) then
		--			TriggerServerEvent("benplays1080p_hackingproficiency:server:checkequipment")
          --      end
            --end
            
        --end

        if not inRange then
            Citizen.Wait(2000)
        end
        Citizen.Wait(3)
    end
end)

RegisterNetEvent('benplays1080p_hackingproficiency:client:StartHacking')
AddEventHandler('benplays1080p_hackingproficiency:client:StartHacking', function(source)
    QBCore.Functions.Progressbar("starting_hack", "Plugging in Dongle...", 5000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
	animDict = "missbigscore2aswitch",
    anim = "switch_mic_car_fra_laptop_hacker",
    flags = 16,
	}, {}, {}, function() -- Done
    --
	exports["memorygame"]:thermiteminigame(8, 3, 5, 10,
                    function() -- success
                        TriggerServerEvent("benplays1080p_hackingproficiency:server:RewardPlayer")
                        print("success")
						StopAnimTask(PlayerPedId(), "missbigscore2aswitch", "switch_mic_car_fra_laptop_hacker", 1.0)
                    end,
                    function() -- failure
						TriggerServerEvent("benplays1080p_hackingproficiency:server:FailPlayer")
                        print("failure")
						StopAnimTask(PlayerPedId(), "missbigscore2aswitch", "switch_mic_car_fra_laptop_hacker", 1.0)
                    end)

    end, function() -- Cancel
    StopAnimTask(PlayerPedId(), "missbigscore2aswitch", "switch_mic_car_fra_laptop_hacker", 1.0)
    QBCore.Functions.Notify("Canceled..", "error")
end)
end)


