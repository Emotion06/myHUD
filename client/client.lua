local VORPcore = exports.vorp_core:GetCore()

-- Functions

local function Debug(...)
    if Config.DevMode then
        print(...)
    end
end

local function getTemperature()
    local player = PlayerPedId()
    local coords = GetEntityCoords(player)
    local temp = math.floor(GetTemperatureAtCoords(coords))
    Citizen.InvokeNative(0xB98B78C3768AF6E0, true)
    return temp
end

local function updateData(playerData)
    SendNUIMessage({
        action = 'updateData',
        money = playerData.money,
        gold = playerData.gold,
        rol = playerData.rol,
        id = playerData.id,
        temp = playerData.temp,

        cfgMoney = Config.Setup.money,
        cfgGold = Config.Setup.gold,
        cfgRol = Config.Setup.rol,
        cfgID = Config.Setup.id,
        cfgTemp = Config.Setup.temperature,
        cfgName = Config.Setup.name,
        cfgDesc = Config.Setup.desc,
        cfgLogo = Config.Setup.logo,
    })
end

local function setInitData()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(250)
            VORPcore.RpcCall('myHUD:getPlayerData', function(playerData)
                playerData.temp = getTemperature()
                updateData(playerData)
            end)
        end
    end)
end

-- Events

RegisterNetEvent('vorp:initCharacter')
AddEventHandler('vorp:initCharacter', function()
    setInitData()
end)

RegisterNetEvent('vorp:updateUi')
AddEventHandler('vorp:updateUi', function()
    setInitData()
end)

-- Commands

RegisterCommand(Config.Setup.commands.toggle, function()
    SendNUIMessage({
        action = 'toggleHUD',
    })
end, false)

TriggerEvent("chat:addSuggestion", "/" .. Config.Setup.commands.toggle, "shows or hides the HUD")

if Config.DevMode then
    RegisterCommand(Config.Setup.commands.dev, function()
        setInitData()
        Debug('HUD has been updated')
    end, false)

    TriggerEvent("chat:addSuggestion", "/" .. Config.Setup.commands.dev, "update the data of the HUD")
end
