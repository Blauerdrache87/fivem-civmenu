<img width="150" height="150" align="left" style="float: left; margin: 0 10px 0 0;" alt="Szymczakovv" src="https://i.imgur.com/42AnCgD.jpg">  

# Szymczakovv esx_evidence v2
[![Paypal Doante](https://img.shields.io/badge/paypal-donate-blue.svg)](https://www.paypal.me/oplatyprimerp)
[![Discord](https://discordapp.com/api/guilds/252317073814978561/embed.png)](https://discord.gg/wrSqK6k)

Fivem esx_civilian_menu 2.2 with Police/Sheriff Badge, Insurance, Badge for Mecano and EMS, [etc.]
Jeżeli chcesz mieć w pełni działające odznaki musisz nadać callsing np. [Yankee-01] aby to uczynić dodaj do bazy danych następujęce rzeczy;
```
ALTER TABLE `users` ADD COLUMN `job_callsing` TEXT DEFAULT '{}';
```
Potem nadaj graczu callsing przykładowo wyszukaj kogoś po nicku i wpisz Yankee-01 (Nie potrzebne jest dawanie kwadratowych nawiasów aby to wyglądało ładnie, ponieważ jest to zaimplementowanie po stronie skryptu)

Zmiany:
```
[❗ 09.01.2021 >  HOT FIX ❗]
^^ Naprawiono błędy, które występowały z pokazywaniem dokumentów.

[❗ 03.01.2021 >   Update 2.0 ❗]

[/] Od teraz pokazywanie wszelakich dokumentów nie jest zrobione pod ExecuteCommand lecz pod Event (Nie powinno się bugować jak wcześniej niektórym osobom)
[+] Dodano w głownym menu pokazywanie Twojej pracy wraz z obecnym grade'em pracy
[+] Dodano w głownym menu pokazywanie Twojego ID - Nick
[+] Dodano zakładkę "Dodatkowe" > Opcje Hudu > Wyłączenie Chatu/Włączenie | Przeładowanie postaci > Wykonywanie przeładowanie tatuaży i skina (Wrazie jakby gracz miał problem z postacią może tego użyć)
[+] Dodano policyjne ubezpieczenia polega to na tym, że pokazuje ci się ubezpieczenie służbowe z callsingiem funkcjonariusza i status ubezpieczenia jest na Tak jako NW + OC

[❗ 05.01.2021 >   Update 2.1 ❗]

[+] Dodano komednę /menuobywatela aby włączyć menu lecz dalej można robić to pod Button-Pressed
[❗ 05.01.2021 >   Naprawiono błędy, które występowały. Już działa ❗]
```

EXAMPLE SERVER.CFG:
```
ensure mapmanager
ensure chat
ensure spawnmanager
ensure sessionmanager
ensure basic-gamemode
ensure hardcap
ensure rconlog
ensure esx_civmenu
```
Jeżeli macie jakie kolwiek pytania piszcie u mnie na discord serwerze, nie na DM!

<p></p>
https://szymczakovv.pl/
<p></p>
https://twitch.tv/szymczakovv
<p></p>
https://instagram.com/szymczakovv/
<p></p>
https://steamcommunity.com/id/szymczakovv

<p></p>
https://discord.gg/wrSqK6k
