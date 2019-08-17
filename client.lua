ESX                  = nil

Citizen.CreateThread(function()
    while ESX == nil do
      TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
      Citizen.Wait(0)
    end
end)


local Casinos = {
  {name="Casino", x=872.95, y=-929.67, z=25.27},
}	


Citizen.CreateThread(function()
  while true do
    Wait(0)
        if CasinoZone() then
            DisplayHelpText("Wciśnij ~INPUT_PICKUP~ aby zagrać w ~r~ruletkę")
        
            if IsControlJustPressed(1, 38) then
                LoadPage()
            end
        end
        
        if IsControlJustPressed(1, 322) then
        ClosePage()
        end
	end
end)

function LoadPage()
    SetNuiFocus(true, true)
    ESX.TriggerServerCallback('loginhud2:checkcash', function(cash)
        saldo = cash
       
        SendNUIMessage({ type = 'openGeneral', 
            nazwa = GetPlayerName(),
            cash = saldo})
    end)
end

function SendSaldo()
    ESX.TriggerServerCallback('loginhud2:checkcash', function(cash)
        saldo   = cash
       
        SendNUIMessage({ type = 'setCash', 
            cash = saldo})
    end)
end

function ClosePage()
    SetNuiFocus(false, false)
    SendNUIMessage({type = 'closeAll'})
end

RegisterNUICallback('NUIFocusOff', function()
    ClosePage()
end)

RegisterNUICallback('NUIRestart', function()
    ClosePage()
    Citizen.Wait(1)
    LoadPage()
end)


RegisterNUICallback('win', function(data)
    ESX.ShowNotification('~g~Wygrałeś ~w~'..data.amount..'$')
    TriggerServerEvent('loginhud2:payout', data.amount)
    SendSaldo()
end)

RegisterNUICallback('lose', function(data)
    ESX.ShowNotification('~r~Przegrałeś ~w~'..data.amount..'$')
    TriggerServerEvent('loginhud2:remcash', data.amount)
    SendSaldo()
end)

function CasinoZone()
	local player = GetPlayerPed(-1)
	local playerloc = GetEntityCoords(player, 0)
	
	for _, search in pairs(Casinos) do
		local distance = GetDistanceBetweenCoords(search.x, search.y, search.z, playerloc['x'], playerloc['y'], playerloc['z'], true)
		
		if distance <= 3 then
			return true
		end
	end
end

function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end
