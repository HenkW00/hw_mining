fx_version 'cerulean'
game 'gta5'

author 'HenkW'
description 'Advanced mining script for ESX'
version '0.1.0' 

client_scripts {
	'config.lua',
    'client.lua',
}

server_scripts {
    '@mysql-async/lib/MySQL.lua',
    'config.lua',
	'server.lua',
    'version.lua',
}