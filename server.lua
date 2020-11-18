ESX = nil

TriggerEvent('esx:getSharedObject', function(obj)
    ESX = obj
end)

RegisterServerEvent('esx_clip:remove')
AddEventHandler('esx_clip:remove', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    xPlayer.removeInventoryItem('clip', 1)
end)

RegisterServerEvent('esx_clip:trigger_on_reload')
AddEventHandler('esx_clip:trigger_on_reload', function()
      local xPlayer = ESX.GetPlayerFromId(source)
      local clip = xPlayer.getInventoryItem('clip')

      if clip and clip.count ~= 0 then
        TriggerClientEvent('esx_clip:clipcli', source)
        TriggerClientEvent('esx_clip:reload', source)
      end
end)

ESX.RegisterUsableItem('clip', function(source)
    TriggerClientEvent('esx_clip:clipcli', source)
end)