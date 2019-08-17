ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterServerEvent('loginhud2:payout')
AddEventHandler('loginhud2:payout', function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.addMoney(tonumber(amount))
end)

RegisterServerEvent('loginhud2:remcash')
AddEventHandler('loginhud2:remcash', function(amount)
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeMoney(tonumber(amount))
end)

ESX.RegisterServerCallback('loginhud2:checkcash', function(source, cb)

    local xPlayer    = ESX.GetPlayerFromId(source)
    local money = xPlayer.getMoney() + 0.0
  cb(money)
  
  end)