Config = {}

-------------------
-------UTILS-------
-------------------
Config.Debug = true -- Enable/Disable debug | It kinda spams console so be aware if you have a busy server
Config.checkForUpdates = true -- Recommended to leave as 'true'
Config.Webhook = "https://discord.com/api/webhooks/1223833417481715844/NxYyA41pkfmEsl6yfyBofAE391oigVX3v064j9QDE2cKCPtw5LaSQaGfQkbjIx76QxJL" -- Webhook for discord logging
Config.MiningCooldown = 1 -- Cooldown in seconds
Config.MaxMiningDistance = 1 -- Max mining distance

-------------------
-------PRICE-------
-------------------
Config.Prices = { -- Prices for the items that can be sold | Make sure items are also added to Config.Items
    ['steel'] = {45, 55},
    ['iron'] = {65, 75},
    ['copper'] = {50, 60},
    ['gold'] = {70, 95},
    ['emerald'] = {145, 170},
    ['coal'] = {30, 40},
}

------------------
-------SHOP-------
------------------
Config.ShopLocation = vector3(2948.41, 2741.81, 43.58) -- Location for buying equipment for mining
Config.ShopItems = { -- Add or remove items needed for the shop
    ['water'] = {price = 150},
    ['bread'] = {price = 150},
    ['pickaxe'] = {price = 1000},
}

------------------
---ITEMS / SELL---
------------------
Config.Sell = vector3(-97.12, -1013.8, 26.3) -- Location for selling mined items
Config.ChanceToGetItem = 40 -- If below '35' script will not work propperly, ill fix this is one of the upcomming updates | Default value = '40'
Config.Items = {
    'steel',
    'iron',
    'copper',
    'emerald',
    'gold',
    'coal',
}

-------------------
-------OBJECT------
-------------------
Config.Objects = { -- Object for mining | I recommend leaving it as pickaxe :)
    ['pickaxe'] = 'prop_tool_pickaxe',
}

-----------------------
-------LOCATIONS-------
-----------------------
Config.MiningPositions = { -- All the mining positions can be added here
    {coords = vector3(2992.77, 2750.64, 42.78), heading = 209.29},
    {coords = vector3(2983.03, 2750.9, 42.02), heading = 214.08},
    {coords = vector3(2976.74, 2740.94, 43.63), heading = 246.21},
    {coords = vector3(3004.53, 2766.6, 42.32), heading = 269.78},
    {coords = vector3(2992.86, 2801.41, 42.51), heading = 311.08},
    {coords = vector3(2983.94, 2820.81, 44.63), heading = 307.45},
    {coords = vector3(3004.11, 2772.28, 41.59), heading = 270.15}, 
    {coords = vector3(2930.95, 2758.85, 44.20), heading = 180.72},
    {coords = vector3(2923.61, 2769.84, 44.06), heading = 131.54},
    {coords = vector3(2912.04, 2778.56, 44.06), heading = 132.05},
    {coords = vector3(2913.06, 2795.49, 43.76), heading = 72.26}, 
    {coords = vector3(2953.78, 2852.62, 47.73), heading = 357.46}, 
    {coords = vector3(2965.68, 2848.29, 46.73), heading = 350.42}, 
    {coords = vector3(2973.37, 2838.18, 45.06), heading = 283.34}, 
    {coords = vector3(2984.84, 2707.97, 54.36), heading = 241.55}, 
    {coords = vector3(2968.76, 2694.54, 54.06), heading = 206.56},
    {coords = vector3(2955.42, 2692.93, 54.76), heading = 157.28},
    {coords = vector3(2945.21, 2701.13, 54.70), heading = 135.38},
    {coords = vector3(2935.2, 2714.53, 53.30), heading = 119.77},
    {coords = vector3(2925.65, 2724.15, 53.3), heading = 120.08},
    {coords = vector3(2918.1, 2740.45, 53.27), heading = 136.27},
}    




--------------------------------------------------------------
-------TO CHANGE LANGUAGES, UNCOMMENT STRING SECTION----------
--------------------------------------------------------------

-- EN
Strings = {
    ['press_mine'] = '~y~Press ~INPUT_CONTEXT~ to mine.',
    ['mining_info'] = '~y~Press ~INPUT_ATTACK~ to chop, ~INPUT_FRONTEND_RRIGHT~ to stop.',
    ['you_sold'] = '~g~You sold %sx %s for %s',
    ['e_sell'] = '~y~Press ~INPUT_CONTEXT~ to sell all your mined items.',
    ['someone_close'] = '~r~There is a player too close to you!',
    ['need_pickaxe'] = '~r~You need a pickaxe to mine.',
    ['open_shop'] = 'Press ~INPUT_CONTEXT~ to open the shop.',
    ['wait_mining'] = '~r~You have to wait before mining!',
    ['zone'] = '~r~You are not in a valid mining area.',
    ['buy_a'] = '~y~You purchased a ',
    ['not_enough'] = '~r~You dont have enough money.',
    ['no_items'] = '~r~You dont have any items to sell.',
    ['mining'] = 'Mining',
    ['sell_mine'] = 'Sell mined items'
}

-- NL
-- Strings = {
--     ['press_mine'] = '~y~Druk op ~INPUT_CONTEXT~ om te mijnen.',
--     ['mining_info'] = '~y~Druk op ~INPUT_ATTACK~ om te hakken, ~INPUT_FRONTEND_RRIGHT~ om te stoppen.',
--     ['you_sold'] = '~g~Je hebt %sx %s verkocht voor %s',
--     ['e_sell'] = '~y~Druk op ~INPUT_CONTEXT~ om al je gemijnde items te verkopen.',
--     ['someone_close'] = '~r~Er is een speler te dicht bij jou!',
--     ['need_pickaxe'] = '~r~You need a pickaxe to mine.',
--     ['open_shop'] = 'Press ~INPUT_CONTEXT~ to open the shop.',
--     ['wait_mining'] = '~r~You have to wait before mining!',
--     ['zone'] = '~r~You are not in a valid mining area.',
--     ['buy_a'] = '~y~You purchased a ',
--     ['not_enough'] = '~r~You dont have enough money.',
--     ['no_items'] = '~r~You dont have any items to sell.',
--     ['mining'] = 'Mining',
--     ['sell_mine'] = 'Verkoop gemijnde items'
-- }

-- FR
-- Strings = {
--     ['press_mine'] = '~y~Appuyez sur ~INPUT_CONTEXT~ pour miner.',
--     ['mining_info'] = '~y~Appuyez sur ~INPUT_ATTACK~ pour couper, ~INPUT_FRONTEND_RRIGHT~ pour arrêter.',
--     ['you_sold'] = '~g~Vous avez vendu %sx %s pour %s',
--     ['e_sell'] = '~y~Appuyez sur ~INPUT_CONTEXT~ pour vendre tous vos articles minés.',
--     ['need_pickaxe'] = '~r~You need a pickaxe to mine.',
--     ['open_shop'] = 'Press ~INPUT_CONTEXT~ to open the shop.',
--     ['someone_close'] = '~r~Il y a un joueur trop près de vous !',
--     ['wait_mining'] = '~r~You have to wait before mining!',
--     ['zone'] = '~r~You are not in a valid mining area.',
--     ['buy_a'] = '~y~You purchased a ',
--     ['not_enough'] = '~r~You dont have enough money.',
--     ['no_items'] = '~r~You dont have any items to sell.',
--     ['mining'] = 'Minage',
--     ['sell_mine'] = 'Vendre les articles minés'
-- }

-- DE
-- Strings = {
--     ['press_mine'] = '~y~Drücken Sie ~INPUT_CONTEXT~, um zu minen.',
--     ['mining_info'] = '~y~Drücken Sie ~INPUT_ATTACK~, um zu hacken, ~INPUT_FRONTEND_RRIGHT~, um anzuhalten.',
--     ['you_sold'] = '~g~Sie haben %sx %s für %s verkauft',
--     ['e_sell'] = '~y~Drücken Sie ~INPUT_CONTEXT~, um alle Ihre abgebauten Artikel zu verkaufen.',
--     ['someone_close'] = '~r~Ein Spieler ist zu nah bei Ihnen!',
--     ['need_pickaxe'] = '~r~You need a pickaxe to mine.',
--     ['open_shop'] = 'Press ~INPUT_CONTEXT~ to open the shop.',
--     ['wait_mining'] = '~r~You have to wait before mining!',
--     ['zone'] = '~r~You are not in a valid mining area.',
--     ['buy_a'] = '~y~You purchased a ',
--     ['not_enough'] = '~r~You dont have enough money.',
--     ['no_items'] = '~r~You dont have any items to sell.',
--     ['mining'] = 'Bergbau',
--     ['sell_mine'] = 'Abgebaute Artikel verkaufen'
-- }

