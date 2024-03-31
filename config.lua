Config = {}

Config.Debug = true
Config.checkForUpdates = true
Config.Webhook = "https://discord.com/api/webhooks/1223833417481715844/NxYyA41pkfmEsl6yfyBofAE391oigVX3v064j9QDE2cKCPtw5LaSQaGfQkbjIx76QxJL"

Config.Prices = {
    ['steel'] = {40, 60},
    ['iron'] = {50, 70},
    ['copper'] = {60, 80},
    ['diamond'] = {100, 150},
    ['emerald'] = {100, 150},
}

Config.Sell = vector3(-97.12, -1013.8, 26.3)
Config.ChanceToGetItem = 30
Config.Items = {
    'steel',
    'iron',
    'copper',
    'diamond',
    'emerald',
}

Config.MiningPositions = {
    {coords = vector3(2992.77, 2750.64, 42.78), heading = 209.29},
    {coords = vector3(2983.03, 2750.9, 42.02), heading = 214.08},
    {coords = vector3(2976.74, 2740.94, 43.63), heading = 246.21},
}

Config.Objects = {
    ['pickaxe'] = 'prop_tool_pickaxe',
}

Strings = {
    ['press_mine'] = 'Press ~INPUT_CONTEXT~ to mine.',
    ['mining_info'] = 'Press ~INPUT_ATTACK~ to chop, ~INPUT_FRONTEND_RRIGHT~ to stop.',
    ['you_sold'] = 'You sold %sx %s for %s',
    ['e_sell'] = 'Press ~INPUT_CONTEXT~ to sell all your mined items.',
    ['someone_close'] = 'There is a player too close to you!',
    ['mining'] = 'Mine',
    ['sell_mine'] = 'Sell mined items'
}