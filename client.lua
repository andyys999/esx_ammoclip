ESX          = nil
ReloadKey = 45

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
  end
  
  while true do
		Citizen.Wait(0)
    
    if IsControlJustReleased(1, ReloadKey) then
      ESX.ShowNotification("")
      DisablePlayerFiring(GetPlayerPed(-1), true)

      TriggerServerEvent('esx_clip:trigger_on_reload')
    end  
  end
end)

RegisterNetEvent('esx_clip:clipcli')
AddEventHandler('esx_clip:clipcli', function()
  ped = GetPlayerPed(-1)
  if IsPedArmed(ped, 4) then
    hash=GetSelectedPedWeapon(ped)
    if hash~=nil then
      TriggerServerEvent('esx_clip:remove')

      local maxWeaponAmmo = GetMaxAmmoInClip(ped, hash, 1)

      SetPedAmmo(GetPlayerPed(-1), hash, maxWeaponAmmo)
      ESX.ShowNotification("")
    else
      ESX.ShowNotification("You doesn't have any weapon in your hand.")
    end
  else
    ESX.ShowNotification("")
  end
end)

RegisterNetEvent('esx_clip:reload')
AddEventHandler('esx_clip:reload', function()
  MakePedReload(GetPlayerPed(-1))
end)