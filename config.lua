Config = {}

-------------------
-------UTILS-------
-------------------
Config.Debug = false
Config.checkForUpdates = true
Config.Webhook = "https://discord.com/api/webhooks/1224011727998419096/feWWd1yKUTEkMv648yn9rSxmrkZMbsPL0VaG5-8gK_7Mj4EszkIvyinJAXTE3GcbCqOz"

-------------------
-------PRICE-------
-------------------
Config.Prices = {
    ['steel'] = {45, 55},
    ['iron'] = {65, 75},
    ['copper'] = {50, 60},
    ['gold'] = {70, 95},
    ['emerald'] = {145, 170},
    ['stone'] = {20, 30},
    ['coal'] = {30, 40},
}

------------------
-------SHOP-------
------------------
Config.ShopLocation = vector3(2948.41, 2741.81, 43.58)
Config.ShopItems = {
    ['water'] = {price = 150},
    ['bread'] = {price = 150},
    ['pickaxe'] = {price = 1000}
}

------------------
---ITEMS / SELL---
------------------
Config.Sell = vector3(-97.12, -1013.8, 26.3)
Config.ChanceToGetItem = 22
Config.Items = {
    'steel',
    'iron',
    'copper',
    'emerald',
    'gold',
    'stone',
    'coal',
}

-------------------
-------OBJECT------
-------------------
Config.Objects = {
    ['pickaxe'] = 'prop_tool_pickaxe',
}

-----------------------
-------LOCATIONS-------
-----------------------
Config.MiningPositions = {
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
--     ['mining'] = 'Mining',
--     ['sell_mine'] = 'Verkoop gemijnde items'
-- }

-- FR
-- Strings = {
--     ['press_mine'] = '~y~Appuyez sur ~INPUT_CONTEXT~ pour miner.',
--     ['mining_info'] = '~y~Appuyez sur ~INPUT_ATTACK~ pour couper, ~INPUT_FRONTEND_RRIGHT~ pour arrêter.',
--     ['you_sold'] = '~g~Vous avez vendu %sx %s pour %s',
--     ['e_sell'] = '~y~Appuyez sur ~INPUT_CONTEXT~ pour vendre tous vos articles minés.',
--     ['someone_close'] = '~r~Il y a un joueur trop près de vous !',
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
--     ['mining'] = 'Bergbau',
--     ['sell_mine'] = 'Abgebaute Artikel verkaufen'
-- }

