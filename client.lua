ESX = exports["es_extended"]:getSharedObject()

local mining = false

-----------------------
------MAIN THREAD------
-----------------------
Citizen.CreateThread(function()
    while ESX.GetPlayerData().job == nil do Wait(0) end
    for k, v in pairs(Config.MiningPositions) do
        addBlip(v.coords, 85, 5, Strings['mining'])
    end
    addBlip(Config.Sell, 207, 2, Strings['sell_mine'])
    Citizen.CreateThread(function()
        while true do
            local sleep = 250
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), Config.Sell, true) <= 3.0 then
                sleep = 0
                helpText(Strings['e_sell'])
                if IsControlJustReleased(0, 38) then
                    TriggerServerEvent('hw_mining:sell')
                    if Config.Debug then
                        print('^0[^1DEBUG^0] ^5Succesfully ^2sold ^5items at ^3selling location!^0')
                    end
                end
            end
            Wait(sleep)
        end
    end)
    while true do
        local closeTo = 0
        for k, v in pairs(Config.MiningPositions) do
            if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), v.coords, true) <= 2.5 then
                closeTo = v
                break
            end
        end
        if type(closeTo) == 'table' then
            while GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), closeTo.coords, true) <= 2.5 do
                Wait(0)
                helpText(Strings['press_mine'])
                if IsControlJustReleased(0, 38) then
                    ESX.TriggerServerCallback('hw_mining:checkForPickaxe', function(hasPickaxe)
                        if Config.Debug then
                            print('^0[^1DEBUG^0] ^5Checking for ^3pickaxe..^0')
                        end
                        if hasPickaxe then
                            local player, distance = ESX.Game.GetClosestPlayer()
                            if distance == -1 or distance >= 4.0 then
                                mining = true
                                SetEntityCoords(PlayerPedId(), closeTo.coords)
                                SetEntityHeading(PlayerPedId(), closeTo.heading)
                                FreezeEntityPosition(PlayerPedId(), true)
                
                                local model = loadModel(GetHashKey(Config.Objects['pickaxe']))
                                local axe = CreateObject(model, GetEntityCoords(PlayerPedId()), true, false, false)
                                AttachEntityToEntity(axe, PlayerPedId(), GetPedBoneIndex(PlayerPedId(), 57005), 0.09, 0.03, -0.02, -78.0, 13.0, 28.0, false, true, true, true, 0, true)
                
                                while mining do
                                    Wait(0)
                                    SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'))
                                    helpText(Strings['mining_info'])
                                    DisableControlAction(0, 24, true)
                                    if IsDisabledControlJustReleased(0, 24) then
                                        local dict = loadDict('melee@hatchet@streamed_core')
                                        TaskPlayAnim(PlayerPedId(), dict, 'plyr_rear_takedown_b', 8.0, -8.0, -1, 2, 0, false, false, false)
                                        local timer = GetGameTimer() + 800
                                        while GetGameTimer() <= timer do Wait(0) DisableControlAction(0, 24, true) end
                                        ClearPedTasks(PlayerPedId())
                                        TriggerServerEvent('hw_mining:getItem')
                                        if Config.Debug then
                                            print('^0[^1DEBUG^0] ^5Received mined item into ^2inventory^0')
                                        end
                                    elseif IsControlJustReleased(0, 194) then
                                        break
                                    end
                                end
                                mining = false
                                DeleteObject(axe)
                                FreezeEntityPosition(PlayerPedId(), false)
                            else
                                ESX.ShowNotification(Strings['someone_close'])
                                if Config.Debug then
                                    print('^0[^1DEBUG^0] ^5There are players nearby youre spot!^0')
                                end
                            end
                        else
                            ESX.ShowNotification(Strings['need_pickaxe'])
                            if Config.Debug then
                                print('^0[^1DEBUG^0] ^5Missing item: ^3"pickaxe" ^5to mine!^0')
                            end
                        end
                    end)
                end
            end
        end
        Wait(250)
    end
end)

-----------------------
------SHOP THREAD------
-----------------------
Citizen.CreateThread(function()
    while true do
        local waitTime = 500 

        local playerCoords = GetEntityCoords(PlayerPedId())
        local distanceToShop = #(playerCoords - Config.ShopLocation) 

        if distanceToShop < 5 then
            helpText(Strings['open_shop'])

            if IsControlJustReleased(0, 38) then 
                openShopMenu()
                if Config.Debug then
                    print('^0[^1DEBUG^0] ^5Retreived event: ^3"OpenMiningShop" ^5for player!^0')
                end  
            end
            
            waitTime = 0 
        end

        Citizen.Wait(waitTime)
    end
end)

---------------------
------SHOP BLIP------
---------------------
Citizen.CreateThread(function()
    local shopBlip = AddBlipForCoord(Config.ShopLocation.x, Config.ShopLocation.y, Config.ShopLocation.z)
    SetBlipSprite(shopBlip, 52) 
    SetBlipDisplay(shopBlip, 4) 
    SetBlipScale(shopBlip, 0.8) 
    SetBlipColour(shopBlip, 2) 
    SetBlipAsShortRange(shopBlip, true)

    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName("Mining Shop")
    EndTextCommandSetBlipName(shopBlip)
end)

---------------------
------OPEN SHOP------
---------------------
function openShopMenu()
    local elements = {}
    for item, data in pairs(Config.ShopItems) do
        table.insert(elements, {label = item .. " - $" .. data.price, value = item})
    end

    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'shop_menu',
        {
            title = 'Shop',
            align = 'top-left',
            elements = elements,
        },
        function(data, menu)
            TriggerServerEvent('hw_mining:buyItem', data.current.value)
            if Config.Debug then
                print('^0[^1DEBUG^0] ^5Succesfully ^2bought ^5item(s) at ^3mining shop!^0')
            end 
        end,
        function(data, menu)
            menu.close()
        end
    )
end

-----------------
------MODEL------
-----------------
loadModel = function(model)
    while not HasModelLoaded(model) do Wait(0) RequestModel(model) end
    return model
end

---------------------
------ANIMATION------
---------------------
loadDict = function(dict, anim)
    while not HasAnimDictLoaded(dict) do Wait(0) RequestAnimDict(dict) end
    return dict
end

------------------
------HELPER------
------------------
helpText = function(msg)
    BeginTextCommandDisplayHelp('STRING')
    AddTextComponentSubstringPlayerName(msg)
    EndTextCommandDisplayHelp(0, false, true, -1)
end

-----------------------
------CREATE BLIP------
-----------------------
addBlip = function(coords, sprite, colour, text)
    local blip = AddBlipForCoord(coords)
    SetBlipSprite(blip, sprite)
    SetBlipColour(blip, colour)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(text)
    EndTextCommandSetBlipName(blip)
end