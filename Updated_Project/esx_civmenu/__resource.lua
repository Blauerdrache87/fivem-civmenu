--[ esx_civmenu - powered by: https://szymczakovv.pl ]--
-- Nazwa: esx_civmenu
-- Autor: szymczakovv#1937
-- Data: 05/01/2021
-- Wersja: 2.1

fx_version "bodacious"
games {"gta5"}

client_script 'client.lua'

server_scripts {

  '@mysql-async/lib/MySQL.lua',
  'server.lua'

}