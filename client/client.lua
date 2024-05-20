local VORPcore = exports.vorp_core:GetCore()

RegisterNetEvent('vorp:initCharacter')
AddEventHandler('vorp:initCharacter', function()
  setInitalData()
end)

RegisterNetEvent('vorp:updateUi', function()
  setInitalData()
end)

function setInitalData()
  VORPcore.RpcCall('myHUD:getPlayerData', function(playerData)
    updateData(playerData)
  end)
end

function updateData(playerData)
  SendNUIMessage({
    action = 'updateData',
    money = playerData.money,
    gold = playerData.gold,
    rol = playerData.rol,
    id = playerData.id,

    cfgMoney = Config.Setup.money,
    cfgGold = Config.Setup.gold,
    cfgRol = Config.Setup.rol,
    cfgID = Config.Setup.id,
    cfgName = Config.Setup.name,
    cfgDesc = Config.Setup.desc,
    cfgLogo = Config.Setup.logo,
  })
end

-- Commands

RegisterCommand(Config.Setup.commands.toggle, function()
  SendNUIMessage({
    action = 'toggleHUD',
  })
end, false)

TriggerEvent("chat:addSuggestion", "/toggleHUD", "shows or hides the HUD")

-- DevMode

function Debug(...)
  if Config.DevMode then
      print(...)
  end
end

if Config.DevMode then
  RegisterCommand(Config.Setup.commands.dev, function()
    setInitalData()
    Debug('HUD has been updated')
  end, false)
end