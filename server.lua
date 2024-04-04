ESX = exports["es_extended"]:getSharedObject()

local miningCooldowns = {}

---------------
------LOG------
---------------
function SendDiscordLog(title, username, color)
    local discordWebhook = Config.Webhook
    local timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    
    local embeds = {
        {
            ["title"] = title,
            ["description"] = username,  
            ["type"] = "rich",
            ["color"] = color or 65280,
            ["timestamp"] = timestamp,
            ["footer"] = {
                ["text"] = "HW Scripts | Mining",
            },
        }
    }
    PerformHttpRequest(discordWebhook, function(err, text, headers) end, 'POST', json.encode({username = 'HW Development', embeds = embeds}), { ['Content-Type'] = 'application/json' })
end

--------------
---GET ITEM---
--------------
RegisterServerEvent('hw_mining:getItem')
AddEventHandler('hw_mining:getItem', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local playerCoords = xPlayer.getCoords()
    local currentTime = os.time()
    local playerId = tostring(_source)

    if miningCooldowns[playerId] and currentTime - miningCooldowns[playerId] < Config.MiningCooldown then
        if Config.Debug then
            print('^1[hw_mining]^0: Player ' .. xPlayer.getIdentifier() .. ' attempted to mine too quickly.')
        end
        TriggerClientEvent('esx:showNotification', _source, Strings['wait_mining'])
        return
    end

    local pickaxeCount = xPlayer.getInventoryItem('pickaxe').count
    if pickaxeCount <= 0 then
        TriggerClientEvent('esx:showNotification', _source, Strings['need_pickaxe'])
        return
    end

    local validMiningSpot = false
    for _, spot in pairs(Config.MiningPositions) do
        local dx = playerCoords.x - spot.coords.x
        local dy = playerCoords.y - spot.coords.y
        local dz = playerCoords.z - spot.coords.z
        local distance = math.sqrt(dx*dx + dy*dy + dz*dz)
        
        if distance < Config.MaxMiningDistance then
            validMiningSpot = true
            break
        end
    end

    if not validMiningSpot then
        if Config.Debug then
            print('^1[hw_mining]^0: Player ' .. xPlayer.getIdentifier() .. ' attempted to mine outside of designated spots.')
        end
        TriggerClientEvent('esx:showNotification', _source, Strings['zone'])
        return
    end

    local randomItem = Config.Items[math.random(1, #Config.Items)]
    if math.random(0, 100) <= Config.ChanceToGetItem then
        xPlayer.addInventoryItem(randomItem, math.random(1, 5))
        if Config.Debug then
            print('^0[^1DEBUG^0] ^5Player: ^3' .. xPlayer.getIdentifier() .. ' ^5collected the following item(s): ^3' .. randomItem)
        end
        SendDiscordLog("Received Item", "Player " .. xPlayer.getIdentifier() .. " collected " .. randomItem .. ".")

        miningCooldowns[playerId] = currentTime
    end
end)

---------------
------SELL-----
---------------
RegisterServerEvent('hw_mining:sell')
AddEventHandler('hw_mining:sell', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    for k, v in pairs(Config.Prices) do
        local item = xPlayer.getInventoryItem(k)
        if item.count > 0 then
            local reward = 0
            for i = 1, item.count do
                reward = reward + math.random(v[1], v[2])
            end
            xPlayer.addMoney(reward)
            if Config.Debug then
                print('^0[^1DEBUG^0] ^5Player: ^3' .. xPlayer.getIdentifier() .. ' ^5sold items from mining. Given amount: ^3$ ' .. reward)
            end
            TriggerClientEvent('esx:showNotification', xPlayer.source, (Strings['you_sold']):format(item.count, ESX.GetItemLabel(k), reward))
            xPlayer.removeInventoryItem(k, item.count)
            if Config.Debug then
                print('^0[^1DEBUG^0] ^5Removed the following item from player inventory: ^3' .. ESX.GetItemLabel(k))
            end
            SendDiscordLog("Selling Item", "Player " .. xPlayer.getIdentifier() .. " sold " .. item.count .. "x " .. ESX.GetItemLabel(k) .. ".", 65280)
        end
    end
end)

---------------
------BUY------
---------------
RegisterServerEvent('hw_mining:buyItem')
AddEventHandler('hw_mining:buyItem', function(item)
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = Config.ShopItems[item].price

    if xPlayer.getMoney() >= price then
        xPlayer.removeMoney(price)
        xPlayer.addInventoryItem(item, 1)
        TriggerClientEvent('esx:showNotification', source, Strings['buy_a'] .. item)
    else
        TriggerClientEvent('esx:showNotification', source, Strings['not_enough'])
    end
end)

-------------------------
------PICKAXE CHECK------
-------------------------
ESX.RegisterServerCallback('hw_mining:checkForPickaxe', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    local pickaxe = xPlayer.getInventoryItem('pickaxe').count

    if pickaxe > 0 then
        cb(true)
    else
        cb(false)
    end
end)