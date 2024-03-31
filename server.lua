ESX = exports["es_extended"]:getSharedObject()

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

RegisterServerEvent('hw_mining:getItem')
AddEventHandler('hw_mining:getItem', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local randomItem = Config.Items[math.random(1, #Config.Items)]
    if math.random(0, 100) <= Config.ChanceToGetItem then
        xPlayer.addInventoryItem(randomItem, 2)
        if Config.Debug then
            print('^0[^1DEBUG^0] ^5Player: ^3' .. xPlayer.getIdentifier() .. ' ^5collected the following item(s): ^3' .. randomItem)
        end
        SendDiscordLog("Received Item", "Player " .. xPlayer.getIdentifier() .. " collected " .. randomItem .. ".")
    end
end)

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