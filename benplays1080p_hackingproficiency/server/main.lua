local QBCore = exports['qb-core']:GetCoreObject()

local ItemList = {
    ["trainingdongle"] = "trainingdongle"
}

RegisterServerEvent('benplays1080p_hackingproficiency:server:checkequipment')
AddEventHandler('benplays1080p_hackingproficiency:server:checkequipment', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local trainingdongle = Player.Functions.GetItemByName('trainingdongle')

    if Player.PlayerData.items ~= nil then 
        for k, v in pairs(Player.PlayerData.items) do 
            if trainingdongle ~= nil then
                if ItemList[Player.PlayerData.items[k].name] ~= nil then 
                    if Player.PlayerData.items[k].name == "trainingdongle" and Player.PlayerData.items[k].amount >= 1 then 
						Player.Functions.RemoveItem("trainingdongle", 1, false)
						TriggerClientEvent('inventory:client:ItemBox', source, QBCore.Shared.Items['trainingdongle'], "remove")
					    TriggerClientEvent("benplays1080p_hackingproficiency:client:StartHacking", src)
                        break
                    else
                        TriggerClientEvent('QBCore:Notify', src, "You dont seem to have the required equipment", 'error')
                        break
                    end
                end
            else
                TriggerClientEvent('QBCore:Notify', src, "You dont seem to have the required equipment", 'error')
                break

            end
        end
    end
end)

RegisterServerEvent('benplays1080p_hackingproficiency:server:RewardPlayer')
AddEventHandler('benplays1080p_hackingproficiency:server:RewardPlayer', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
	
	TriggerClientEvent('QBCore:Notify', src, "You successfully completed the training hack", 'success')
end)

RegisterServerEvent('benplays1080p_hackingproficiency:server:FailPlayer')
AddEventHandler('benplays1080p_hackingproficiency:server:FailPlayer', function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)

	TriggerClientEvent('QBCore:Notify', src, "You failed to complete the training hack", 'success')
end)