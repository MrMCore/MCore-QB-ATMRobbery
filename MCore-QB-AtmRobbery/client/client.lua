------------MCORE----------------

local QBCore = exports['qb-core']:GetCoreObject()

local CurrentCops = 0 

local atmtargets = {
    `prop_atm_02`,
    `prop_atm_03`,
    `prop_atm_01`,
    `prop_fleeca_atm`,
}


exports['qb-target']:AddTargetModel(atmtargets, {
    options = {
        { 
            event = "MCORE:startrobatm",
            icon = "fas fa-circle",
            label = "Hack ATM", 
        },
    },
    distance = 2.0
})


exports['qb-target']:AddCircleZone("crypto", vector3(1272.31, -1710.97, 55.56), 0.8, { 
name = "crypto", 
debugPoly = true,
}, {
    options = {
			{
            	type = "client",
            	event = "MCORE:crypto",
				icon = "fas fa-arrow",
				label = "Insert Hardrive",
                item = "hardrive"
			},
		},
		distance = 2.5
})


RegisterNetEvent('police:SetCopCount', function(amount)
    CurrentCops = amount
end)

--- Start ATM Hack

RegisterNetEvent("MCORE:startrobatm", function()
    local ped = PlayerPedId()
    QBCore.Functions.TriggerCallback("MCORE:GetCooldown", function(undercd)
		if not undercd then
            if CurrentCops >= Config.RequiredPolice then
            QBCore.Functions.TriggerCallback('MCORE:getHackerDevice', function(hackerdevice)
                    if hackerdevice then
            TriggerServerEvent('QBCore:Server:RemoveItem', "laptop", 1)
            TriggerServerEvent('qb-storerobbery:server:callCops')
            TriggerEvent('inventory:client:ItemBox', QBCore.Shared.Items["laptop"], "remove", 1)
            QBCore.Functions.Notify("Removed Laptop", "success" , 5000)
            QBCore.Functions.Notify("Connecting to Database", "success" , 5000)
            QBCore.Functions.Progressbar("atmhack", "Hacking ATM", 10000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
      animDict = "anim@gangops@facility@servers@",
        anim = "hotwire",
        flags = 49,
    }, {}, {}, function() -- Done
        ClearPedTasks(ped)
    end)
    Citizen.Wait(10400)
   TriggerEvent("utk_fingerprint:Start", 1, 4, 2, function(outcome, reason)
        if outcome == true then -- reason will be nil if outcome is true
                       print("Succeed")
                       TriggerServerEvent('MCORE:rewarditem')
                       QBCore.Functions.Notify("Hacked", "success" , 5000)
                                        --TriggerServerEvent("MCORE:PoliceAlert")
        elseif outcome == false then
         QBCore.Functions.Notify("You failed!", "error" , 5000)
         print("Failed. Reason: "..reason)
        end
    end)
    TriggerServerEvent("MCORE:CooldownServer", true)
    end
end)
else
    QBCore.Functions.Notify("Not Enough Police Online", "error" , 5000)
end
else
    TriggerServerEvent("MCORE:CooldownNotify")
  end
    end)
       end)

       ---crypto

       RegisterNetEvent("MCORE:crypto", function()
        local ped = PlayerPedId()
                QBCore.Functions.TriggerCallback("MCORE:GetCooldown", function(undercd)
            if not undercd then
                QBCore.Functions.TriggerCallback('MCORE:getHardrive', function(hackerdevice)
            if hackerdevice then
                QBCore.Functions.Notify("Connecting to Cryto Market", "success" , 5000)
                QBCore.Functions.Progressbar("atmhack", "Connect Hardrive", 10000, false, true, {
                    disableMovement = true,
                    disableCarMovement = true,
                    disableMouse = false,
                    disableCombat = true,
                }, {
                animDict = "missheist_jewel@hacking",
                    anim = "hack_loop",
                    flags = 49,
                }, {}, {}, function() -- Done
            ClearPedTasks(ped)
        end)

        Citizen.Wait(10400)

       TriggerEvent("utk_fingerprint:Start", 1, 1, 1, function(outcome, reason)
            if outcome == true then -- reason will be nil if outcome is true
                           print("Succeed")
                           QBCore.Functions.Notify("Hacked", "success" , 5000)
                           TriggerServerEvent('qb-phone:server:sendNewMail', {
                            sender = "Crypto.com",
                            subject = "System Activity",
                            message = "Our systems indicate incoming coins crypto will be deposited in to your wallet shortly"
                        })
                        TriggerServerEvent('qb-phone:server:sendNewMail', {
                            sender = "Crpto.Com",
                            subject = "System Activity",
                            message = "Crypto has been deposited in to your wallet"
                        })
                        TriggerServerEvent("MCORE:crypto")
           elseif outcome == false then
             QBCore.Functions.Notify("You failed!", "error" , 5000)
             print("Failed. Reason: "..reason)
            end
        end)
        TriggerServerEvent("MCORE:CooldownServer", true)
        end
    end)
        else
            TriggerServerEvent("MCORE:CooldownNotify")
          end
            end)
               end)









    
