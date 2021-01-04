--[ esx_civmenu - powered by: https://szymczakovv.pl ]--
-- Nazwa: esx_civmenu
-- Autor: szymczakovv#1937
-- Data: 05/01/2021
-- Wersja: 2.1

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local katb = false
local kata = false
local katc = false
local jestb = 'nil'
local jestzdrowie = nil
local jestoc = nil
function getIdentity(source)
	local identifier = GetPlayerIdentifiers(source)[1]
	local result = MySQL.Sync.fetchAll("SELECT * FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]

		return {
			identifier = identity['identifier'],
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			name = identity['name'],
			dateofbirth = identity['dateofbirth'],
			sex = identity['sex'],
			height = identity['height'],
			phone_number = identity['phone_number'],
			job = identity['job'],
			job_grade = identity['job_grade'],
			job_callsing = identity['job_callsing']

                        
		}
	else
		return nil
	end
end

function getlicenseA(source)
	local identifier = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT * FROM user_licenses WHERE type = @type and owner = @owner",
    {
      ['@owner']   = identifier,
      ['@type'] = 'drive_bike'

    })
	if result[1] ~= nil then
        jesta = '~h~~g~A ~s~'
	else
		jesta = '~h~~r~A ~s~'
	end
end

function getlicenseB(source)
	local identifier = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT * FROM user_licenses WHERE type = @type and owner = @owner",
    {
      ['@owner']   = identifier,
      ['@type'] = 'drive'

    })
	if result[1] ~= nil then
        jestb = '~h~~g~B ~s~'
	else
		jestb = '~h~~r~B ~s~'
	end
end

function getlicenseC(source)
	local identifier = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT * FROM user_licenses WHERE type = @type and owner = @owner",
    {
      ['@owner']   = identifier,
      ['@type'] = 'drive_truck'

    })
	if result[1] ~= nil then 
        jestc = '~h~~g~C~n~ ~s~'
	else
		jestc = '~h~~r~C ~n~~s~'
	end
end

function getlicenseW(source)
	local identifier = GetPlayerIdentifiers(source)[1]
    local result = MySQL.Sync.fetchAll("SELECT * FROM user_licenses WHERE type = @type and owner = @owner",
    {
      ['@owner']   = identifier,
      ['@type'] = 'weapon'

    })
	if result[1] ~= nil then
        jestw = '~g~Tak~n~ ~s~'
	else
		jestw = '~r~Nie~n~ ~s~'
	end
end

function getlicenseZdrowie(source)
	local identifier = GetPlayerIdentifiers(source)[1]

local result = MySQL.Sync.fetchAll("SELECT * FROM user_licenses WHERE type = @type and owner = @owner",
    {
      ['@owner']   = identifier,
	  ['@type'] = 'ems_insurance',

    })


	if result[1] ~= nil then

ubeznw = true
jestzdrowie = '~g~Tak~s~'
	else
		jestzdrowie = '~r~Nie~s~'
	end
end

function getlicenseOC(source)
	local identifier = GetPlayerIdentifiers(source)[1]

local result = MySQL.Sync.fetchAll("SELECT * FROM user_licenses WHERE type = @type and owner = @owner",
    {
      ['@owner']   = identifier,
      ['@type'] = 'oc_insurance'

    })


	if result[1] ~= nil then

ubezoc = true
jestoc = '~g~Tak~s~'
	else
		jestoc = '~r~Nie~s~'
	end
end

RegisterNetEvent('esx_civmenu:dowod')
AddEventHandler('esx_civmenu:dowod', function()
  dowod()
end)

RegisterNetEvent('esx_civmenu:wizytowka')
AddEventHandler('esx_civmenu:wizytowka', function()
  wizytowka()
end)

RegisterNetEvent('esx_civmenu:ubezpieczenie')
AddEventHandler('esx_civmenu:ubezpieczenie', function()
  ubezpieczenie()
end)

RegisterNetEvent('esx_civmenu:ubezpieczenielspd')
AddEventHandler('esx_civmenu:ubezpieczenielspd', function()
  lspdubezpieczenia()
end)

RegisterNetEvent('esx_civmenu:lspd')
AddEventHandler('esx_civmenu:lspd', function()
  lspd()
end)

RegisterNetEvent('esx_civmenu:mecano')
AddEventHandler('esx_civmenu:mecano', function()
  mecano()
end)

RegisterNetEvent('esx_civmenu:ems')
AddEventHandler('esx_civmenu:ems', function()
  ems()
end)

RegisterNetEvent('esx_civmenu:lssd')
AddEventHandler('esx_civmenu:lssd', function()
	lssd()
end)

function dowod()
    local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

    local lickaB = getlicenseB(source)
    local lickaA = getlicenseA(source)
    local lickaC = getlicenseC(source)
	local lickaW = getlicenseW(source)

	local name = getIdentity(source)

	TriggerClientEvent('esx:dowod_pokazdowod', -1,_source,  name.firstname..' '..name.lastname, 'Data urodzin: ~y~' ..name.dateofbirth, '~s~Licencja Na Bron: '..jestw.. 'Prawo Jazdy Kat: '..jesta..' '..jestb..' '..jestc) 
	TriggerClientEvent("pokazujedowod", -1, _source, name.firstname .. " ".. name.lastname, table.concat(args, " "))
end

function wizytowka()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
		
		
	 local name = getIdentity(source)
		
		
		
	TriggerClientEvent('esx:dowod_wiz', -1,_source, name.firstname..' '..name.lastname, 'Numer Telefonu: ~y~'..name.phone_number, '')
	TriggerClientEvent("pokazujewiz", -1, _source, name.firstname .. " - ".. name.phone_number, table.concat(args, " "))
end

function ubezpieczenie()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	local lickaZdrowie = getlicenseZdrowie(source)
	local lickaOC = getlicenseOC(source)
	local name = getIdentity(source)
	TriggerClientEvent('esx:dowod_Notify', -1,_source, 'Karta ubezpieczeń', name.firstname..' '..name.lastname,  'Obezpieczenie OC: ' ..jestoc .. '~n~ Ubezpieczenie NW: ' ..jestzdrowie)
end

function lspdubezpieczenia()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local name = getIdentity(source)
	local dane = name.firstname .. ' ' .. name.lastname .. '\n~r~[' .. name.job_callsing .. '~r~]'
	local imie = name.firstname .. ' ' .. name.lastname
	local lickaZdrowie = getlicenseZdrowie(source)
	local lickaOC = getlicenseOC(source)
	local message = 'Pokazuje ubezpiecznie służbowe:  [' .. name.job_callsing .. '] '  .. imie .. ''
	TriggerClientEvent('esx_dowod:sendProximityMessage', -1, _source, _source, message)
	TriggerClientEvent('esx:dowod_Notify', -1,_source, 'Karta ubezpieczenia służbowego',  dane .. ' ', 'Obezpieczenie OC: ~g~Tak~s~\nUbezpieczenie NW: ~g~Tak~s~')
end

function lspd()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local name = getIdentity(source)
	local imie = name.firstname .. ' ' .. name.lastname
	local job = xPlayer.job
	local stopien = job.grade_label
	local sing = name.job_callsing
	local message = 'Pokazuje odznakę policjanta:  [' .. sing .. '] '  .. imie .. ' - ' .. stopien ..' '
	local czy_wazna
	if job.name == "police" then
		czy_wazna = "~g~Tak"
	else
		job.grade_label = "~r~Brak informacji"
		czy_wazna = "~r~Nie"
	end
	TriggerClientEvent('esx:dowod_mariuszek', -1,_source, '~w~'..name.firstname..' '..name.lastname,'Stopień: ~b~'..stopien.. '\n~r~['.. sing .. ']', '~n~~s~Odznaka jest ważna: '..czy_wazna)
	TriggerClientEvent('esx_dowod:sendProximityMessage', -1, _source, _source, message)
end

function mecano()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local name = getIdentity(source)
	local imie = name.firstname .. ' ' .. name.lastname
	local job = xPlayer.job
	local stopien = job.grade_label
	local message = 'Pokazuje Plakietkę LSCS ' .. imie .. ' '.. stopien
	local czy_wazna
	if job.name == "mecano" then
		czy_wazna = "~g~Tak"
	else
		job.grade_label = "~r~Brak informacji"
		czy_wazna = "~r~Nie"
	end
	TriggerClientEvent('esx:dowod_mariuszek', -1,_source, '~h~'..name.firstname..' '..name.lastname,'Plakietka ~o~LSCS','Stopień: ~b~'..job.grade_label..'~n~~s~Plakietka jest ważna: '..czy_wazna)
	TriggerClientEvent('esx_dowod:sendProximityMessage', -1, _source, _source, message)
end

function lssd()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local name = getIdentity(source)
	local imie = name.firstname .. ' ' .. name.lastname
	local job = xPlayer.job
	local stopien = job.grade_label
	local message = 'Pokazuje Odznakę LSSD ' .. imie .. ' '.. stopien
	local czy_wazna
	if job.name == "sheriff" then
		czy_wazna = "~g~Tak"
	else
		job.grade_label = "~r~Brak informacji"
		czy_wazna = "~r~Nie"
	end
	TriggerClientEvent('esx:dowod_mariuszek', -1,_source,  'Odznaka Sheriff'..name.firstname..' '..name.lastname,'Stopień: ~b~'..stopien.. ' ~r~['..name.job_callsing.. ']', '~n~~s~Odznaka jest ważna: '..czy_wazna)
	TriggerClientEvent('esx_dowod:sendProximityMessage', -1, _source, _source, message)
end

function ems()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local name = getIdentity(source)
	local imie = name.firstname .. ' ' .. name.lastname
	local job = xPlayer.job
	local stopien = job.grade_label
	local message = 'Pokazuje Legitymację EMS ' .. imie .. ' '.. stopien
	local czy_wazna
	if job.name == "ambulance" then
		czy_wazna = "~g~Tak"
	else
		job.grade_label = "~r~Brak informacji"
		czy_wazna = "~r~Nie"
	end
	TriggerClientEvent('esx:dowod_mariuszek', -1,_source, '~h~'..name.firstname..' '..name.lastname,'Legitymacja ~p~EMS','~w~Stopień: ~b~'..job.grade_label..'~n~~s~Legitymacja jest ważna: '..czy_wazna)
	TriggerClientEvent('esx_dowod:sendProximityMessage', -1, _source, _source, message)
end
