--[ esx_civmenu - powered by: https://szymczakovv.pl ]--
-- Nazwa: esx_civmenu
-- Autor: szymczakovv#1937
-- Data: 16/03/2021
-- Wersja: 3.0

ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
local katb = false
local kata = false
local katc = false
local jestb = 'nil'
local jestzdrowie = nil
local jestoc = nil
function getIdentity(license)
	local identifier = license
	local result = MySQL.Sync.fetchAll("SELECT firstname, lastname, dateofbirth, phone_number, job, job_grade, job_callsing FROM users WHERE identifier = @identifier", {['@identifier'] = identifier})
	if result[1] ~= nil then
		local identity = result[1]
		local badge = json.decode(identity.job_id)

		return {
			firstname = identity['firstname'],
			lastname = identity['lastname'],
			dateofbirth = identity['dateofbirth'],
			phone_number = identity['phone_number'],
			job = identity['job'],
			job_grade = identity['job_grade'],
			account_number = identity['account_number'],
			job_callsing = identity['job_callsing']

                        
		}
	else
		return nil
	end
end

function getlicenseA(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local result = MySQL.Sync.fetchAll("SELECT * FROM user_licenses WHERE type = @type and owner = @owner",
    {
      ['@owner']   = xPlayer.identifier,
      ['@type'] = 'drive_bike'

    })
	if result[1] ~= nil then
        jesta = '~h~~g~A ~s~'
	else
		jesta = '~h~~r~A ~s~'
	end
end

function getlicenseB(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local result = MySQL.Sync.fetchAll("SELECT * FROM user_licenses WHERE type = @type and owner = @owner",
    {
      ['@owner']   = xPlayer.identifier,
      ['@type'] = 'drive'

    })
	if result[1] ~= nil then
        jestb = '~h~~g~B ~s~'
	else
		jestb = '~h~~r~B ~s~'
	end
end

function getlicenseC(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local result = MySQL.Sync.fetchAll("SELECT * FROM user_licenses WHERE type = @type and owner = @owner",
    {
      ['@owner']   = xPlayer.identifier,
      ['@type'] = 'drive_truck'

    })
	if result[1] ~= nil then 
        jestc = '~h~~g~C~n~ ~s~'
	else
		jestc = '~h~~r~C ~n~~s~'
	end
end

function getlicenseW(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
    local result = MySQL.Sync.fetchAll("SELECT * FROM user_licenses WHERE type = @type and owner = @owner and label = @label",
    {
		['@type'] = 'weapon',
		['@owner']   = xPlayer.identifier,
		['@label'] = 'Licencja Broń',
    })
	if result[1] ~= nil then
        jestw = '~g~Tak~n~ ~s~'
	else
		jestw = '~r~Nie~n~ ~s~'
	end
end


function getlicenseZdrowie(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

local result = MySQL.Sync.fetchAll("SELECT * FROM user_licenses WHERE type = @type and owner = @owner",
    {
      ['@owner']   = xPlayer.identifier,
	  ['@type'] = 'ems_insurance',

    })


	if result[1] ~= nil then

ubeznw = true
jestzdrowie = '~g~NW~s~'
	else
		jestzdrowie = '~r~NW~s~'
	end
end

function GetCharacterName(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier',
	{
	['@identifier'] = xPlayer.identifier
	})
	return result[1].firstname .. ' ' .. result[1].lastname
end

function getlicenseOC(source)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

local result = MySQL.Sync.fetchAll("SELECT * FROM user_licenses WHERE type = @type and owner = @owner",
    {
      ['@owner']   = xPlayer.identifier,
      ['@type'] = 'oc_insurance'

    })


if result[1] ~= nil then
	ubezoc = true
	jestoc = '~g~OC~s~'
	else
		jestoc = '~r~OC~s~'
	end
end


RegisterServerEvent('dowod')
AddEventHandler('dowod', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	local lickaB = getlicenseB(_source)
	local lickaA = getlicenseA(_source)
	local lickaC = getlicenseC(_source)
	local lickaW = getlicenseW(_source)
	local lickaZdrowie = getlicenseZdrowie(_source)
	local lickaOC = getlicenseOC(_source)
	local name = getIdentity(xPlayer.identifier)
	
	if name.firstname == nil then
		name.firstname = 'X'
	elseif name.lastname == nil then
		name.lastname = 'X'
	elseif name.dateofbirth == nil then
		name.dateofbirth = 'X'
	end

	TriggerClientEvent('esx:dowod_mariuszek', -1,_source,  name.firstname..' '..name.lastname, 'Data urodzin: ~y~' ..name.dateofbirth, '~s~Licencja: '..jestw.. 'Prawo Jazdy: '..jesta..' '..jestb..' '..jestc.. 'Ubezp: ' ..jestzdrowie.. ' ' ..jestoc) 
	TriggerClientEvent("pokazujedowod", -1, _source, name.firstname .. " ".. name.lastname)
end)


RegisterServerEvent('wizytowka')
AddEventHandler('wizytowka', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)	
	local name = getIdentity(xPlayer.identifier)
		if name.phone_number == nil then 
			name.phone_number = "XXXXXX" 
		end
		
	TriggerClientEvent('esx:dowod_mariuszek', -1,_source, name.firstname.. ' ' ..name.lastname, ' Praca: ~y~'..xPlayer.job.label, 'Numer Telefonu: ~y~'..name.phone_number)
	TriggerClientEvent("pokazujewiz", -1, _source, name.firstname .. " - ".. name.phone_number)
end)

RegisterServerEvent('odznaka')
AddEventHandler('odznaka', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local name = getIdentity(xPlayer.identifier)
	local imie = name.firstname .. ' ' .. name.lastname
	local job = xPlayer.job
	local stopien = job.grade_label

	local message = 'Pokazuje odznakę policjanta:  [' .. sing .. '] '  .. imie .. ' - ' .. stopien ..' '
	local czy_wazna
	local sing = name.job_callsing
	if sing == nil then
	      sing = "X"
	end
	if job.name == "police" then
		czy_wazna = "~g~Tak"
	else
		job.grade_label = "~r~Brak informacji"
		czy_wazna = "~r~Nie"
	end

	TriggerClientEvent('esx:dowod_mariuszek', -1,_source, '~w~'..name.firstname..' '..name.lastname,'Stopień: ~b~'..stopien, '\n~r~['.. sing .. ']', '~w~~s~\nOdznaka jest ważna: '..czy_wazna)
	TriggerClientEvent('esx_dowod:sendProximityMessage', -1, _source, _source, message)
end)

