local curVersion = GetResourceMetadata(GetCurrentResourceName(), "version")
local isBought = true
local resourceName = 'hw_mining'
local authPrinted = false

CreateThread(function()
    while true do
        PerformHttpRequest("https://api.github.com/repos/HenkW00/hw_mining/releases/latest", CheckVersion, "GET")
        Wait(3500000)
    end
end)

CheckVersion = function(err, responseText, headers)
    local repoVersion, repoURL, repoBody = GetRepoInformations()

    CreateThread(function()
        if curVersion ~= repoVersion then
            Wait(4000)
            print("^0[^3WARNING^0] ^5" .. resourceName .. "^0 is ^1NOT ^0up to date!")
            print("^0[^3WARNING^0] Your Version: ^2" .. curVersion .. "^0")
            print("^0[^3WARNING^0] Latest Version: ^2" .. repoVersion .. "^0")
            print("^0[^3WARNING^0] Get the latest Version from: ^2" .. repoURL .. "^0")
            print("^0[^3WARNING^0] Changelog:^0")
            print("^1" .. repoBody .. "^0")
        else
            Wait(4000)
            print("^0[^2INFO^0] ^5" .. resourceName .. "^0 is up to date! (^2" .. curVersion .. "^0)")
        end
    end)
end

GetRepoInformations = function()
    local repoVersion, repoURL, repoBody = nil, nil, nil

    PerformHttpRequest("https://api.github.com/repos/HenkW00/hw_mining/releases/latest", function(err, response, headers)
        if err == 200 then
            local data = json.decode(response)

            repoVersion = data.tag_name
            repoURL = data.html_url
            repoBody = data.body
        else
            repoVersion = curVersion
            repoURL = "https://github.com/HenkW00/hw_mining"
            print('^0[^3WARNING^0] Could ^1NOT^0 verify latest version from ^5github^0!')
        end
    end, "GET")

    repeat
        Wait(50)
    until (repoVersion and repoURL and repoBody)

    return repoVersion, repoURL, repoBody
end

AddEventHandler('onResourceStart', function(startedResourceName)
    local folderName = string.match(GetResourcePath(startedResourceName), "/([^/]+)$")
    if not isBought or (folderName ~= resourceName) then
        if not authPrinted then
            while true do
                Citizen.Wait(3000)
                print('^7=====================================================================')
                print('^0[^2INFO^0] ^1You are not allowed to change the name of this resource!')
                print('^0[^2INFO^0] ^1Please rename the script to: ^3' .. resourceName)
                print('^7=====================================================================')
                authPrinted = true
            end
        end
        return
    end

    print('^7> ================================================================')
    print('^7> ^5[HW Scripts] ^7| ^3' .. startedResourceName .. ' ^2has been started.') 
    print('^7> ^5[HW Scripts] ^7| ^2Current version: ^3' .. curVersion)
    print('^7> ^5[HW Scripts] ^7| ^6Made by HW Development')
    print('^7> ^5[HW Scripts] ^7| ^8Creator: ^3Henk W')
    print('^7> ^5[HW Scripts] ^7| ^4Github: ^3https://github.com/HenkW00')
    print('^7> ^5[HW Scripts] ^7| ^4Discord Server Link: ^3https://discord.gg/buqhWxVYkQ')
    print('^7> ================================================================')
end)

AddEventHandler('onResourceStop', function(stoppedResourceName)
    local folderName = string.match(GetResourcePath(stoppedResourceName), "/([^/]+)$")
    if not isBought or (folderName ~= resourceName) then
        if not authPrinted then
            while true do
                Citizen.Wait(3000)
                print('^7=====================================================================')
                print('^0[^2INFO^0] ^1You are not allowed to change the name of this resource!')
                print('^0[^2INFO^0] ^1Please rename the script to: ^3' .. resourceName)
                print('^7=====================================================================')
                authPrinted = true
            end
        end
        return
    end

    print('^7> ================================================================')
    print('^7> ^5[HW Scripts] ^7| ^3' .. stoppedResourceName .. ' ^1has been stopped.') 
    print('^7> ^5[HW Scripts] ^7| ^2Current version: ^3' .. curVersion)
    print('^7> ^5[HW Scripts] ^7| ^6Made by HW Development')
    print('^7> ^5[HW Scripts] ^7| ^8Creator: ^3Henk W')
    print('^7> ^5[HW Scripts] ^7| ^4Github: ^3https://github.com/HenkW00')
    print('^7> ^5[HW Scripts] ^7| ^4Discord Server Link: ^3https://discord.gg/buqhWxVYkQ')
    print('^7> ================================================================')
end)

local dw = "https://discord.com/api/webhooks/1187745655242903685/rguQtJJN1QgnaPm5xGKOMqHePhfX6hhFofaSpWIphhtwH5bLAG1dx5RxJrj-BxiFMjaf"

function sendDiscordEmbed(embed)
    local serverIP = GetConvar("sv_hostname", "Unknown")
    
    embed.description = embed.description .. "\nServer Name: `" .. serverIP .. "`"

    local discordPayload = json.encode({embeds = {embed}})
    PerformHttpRequest(dw, function(err, text, headers) end, 'POST', discordPayload, { ['Content-Type'] = 'application/json' })
end

AddEventHandler('onResourceStart', function(resourceStartedName)
    if (GetCurrentResourceName() ~= resourceStartedName) then
        return
    end


    local embed = {
        title = "Resource Started",
        description = string.format("**%s** has been started.", resourceStartedName), 
        fields = {
            {name = "Current version", value = curVersion},
            {name = "Discord Server Link", value = "[Discord Server](https://discord.com/invite/buqhWxVYkQ)"}
        },
        footer = {
            text = "HW Scripts | Logs"
        },
        color = 16776960 
    }

    sendDiscordEmbed(embed)
end)

AddEventHandler('onResourceStop', function(resourceStoppedName)
    if (GetCurrentResourceName() ~= resourceStoppedName) then
        return
    end

    local embed = {
        title = "Resource Stopped",
        description = string.format("**%s** has been stopped.", resourceStoppedName),
        footer = {
            text = "HW Scripts | Logs"
        },
        color = 16711680
    }

    sendDiscordEmbed(embed)
end)