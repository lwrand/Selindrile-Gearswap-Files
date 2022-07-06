include('organizer-lib')

--Place for settings and custom functions to work across one characters, all jobs.
latency = .75

--If this is set to true it will prevent you from casting shadows when you have more up than that spell would generate.
conserveshadows = false

--Display related settings.
state.DisplayMode = M(true, 'Display Mode') --Set this to false if you don't want to display modes at the bottom of your screen.
--Uncomment the settings below and change the values to edit the display's look.
--displayx = 3
--displayy = 1062
--displayfont = 'Arial'
--displaysize = 12
--displaybold = true
--displaybg = 0
--displaystroke = 2
--displaytransparancy = 192
--state.DisplayColors = {
    -- h='\\cs(255, 0, 0)', -- Red for active booleans and non-default modals
    -- w='\\cs(255,255,255)', -- White for labels and default modals
    -- n='\\cs(192,192,192)', -- White for labels and default modals
    -- s='\\cs(96,96,96)' -- Gray for inactive booleans
--}

--Options for automation.
state.ReEquip 		  		= M(true, 'ReEquip Mode')		 --Set this to false if you don't want to equip your current Weapon set when you aren't wearing any weapons.
state.AutoArts 		  		= M(true, 'AutoArts') 		 --Set this to false if you don't want to automatically try to keep up Solace/Arts.
state.AutoLockstyle	 	    = M(true, 'AutoLockstyle Mode') --Set this to false if you don't want gearswap to automatically lockstyle on load and weapon change.
state.CancelStoneskin 		= M(true, 'Cancel Stone Skin') --Set this to false if you don't want to automatically cancel stoneskin when you're slept.
state.SkipProcWeapons 		= M(true, 'Skip Proc Weapons') --Set this to false if you want to display weapon sets fulltime rather than just Aby/Voidwatch.
state.NotifyBuffs	  		= M(false, 'Notify Buffs') 	 --Set this to true if you want to notify your party when you recieve a specific buff/debuff. (List Below)

--[[Binds you may want to change.
	Bind special characters.
	@ = Windows Key
	% = Works only when text bar not up.
	$ = Works only when text bar is up.
	^ = Control Key
	! = Alt Key
	~ = Shift Key
	# = Apps Key
]]

send_command('bind !@^f7 gs c toggle AutoWSMode') --Turns auto-ws mode on and off.
send_command('bind !^f7 gs c toggle AutoFoodMode') --Turns auto-ws mode on and off.
send_command('bind f7 gs c cycle Weapons') --Cycle through weapons sets.
--send_command('bind @f8 gs c toggle AutoNukeMode') --Turns auto-nuke mode on and off.
--send_command('bind ^f8 gs c toggle AutoStunMode') --Turns auto-stun mode off and on.
send_command('bind !f8 gs c toggle AutoDefenseMode') --Turns auto-defense mode off and on.
send_command('bind ^@!f8 gs c toggle AutoTrustMode') --Summons trusts automatically.
--send_command('bind @pause gs c toggle AutoBuffMode') --Automatically keeps certain buffs up, job-dependant.
send_command('bind @scrolllock gs c cycle Passive') --Changes offense settings such as accuracy.
send_command('bind f9 gs c cycle OffenseMode') --Changes offense settings such as accuracy.
send_command('bind ^f9 gs c cycle HybridMode') --Changes defense settings for melee such as PDT.
send_command('bind @f9 gs c cycle RangedMode') --Changes ranged offense settings such as accuracy.
send_command('bind !f9 gs c cycle WeaponskillMode') --Changes weaponskill offense settings such as accuracy.
send_command('bind f10 gs c set DefenseMode Physical') --Turns your physical defense set on.
send_command('bind ^f10 gs c cycle PhysicalDefenseMode') --Changes your physical defense set.
send_command('bind !f10 gs c toggle Kiting') --Keeps your kiting gear on..
send_command('bind f11 gs c set DefenseMode Magical') --Turns your magical defense set on.
send_command('bind ^f11 gs c cycle MagicalDefenseMode') --Changes your magical defense set.
send_command('bind @f11 gs c cycle CastingMode') --Changes your castingmode options such as magic accuracy.
send_command('bind !f11 gs c cycle ExtraMeleeMode') --Adds another set layered on top of your engaged set.
send_command('bind ^f12 gs c cycle ResistDefenseMode') --Changes your resist defense set.
send_command('bind f12 gs c set DefenseMode Resist') --Turns your resist defense set on.
send_command('bind @f12 gs c cycle IdleMode') --Changes your idle mode options such as refresh.
send_command('bind !f12 gs c reset DefenseMode') --Turns your defensive mode off.
send_command('bind ^@!f12 gs reload') --Reloads gearswap.
send_command('bind pause gs c update user') --Runs a quick check to make sure you have the right gear on and checks variables.
send_command('bind ^@!pause gs org') --Runs organizer.
send_command('bind ^@!backspace gs c buffup') --Buffup macro because buffs are love.
--send_command('bind ^r gs c weapons Default') --Requips weapons and gear.
send_command('bind ^z gs c toggle Capacity') --Keeps capacity mantle on and uses capacity rings.
send_command('bind ^y gs c toggle AutoCleanupMode') --Uses certain items and tries to clean up inventory.
send_command('bind ^t gs c cycle treasuremode') --Toggles hitting htings with your treasure hunter set.
send_command('bind !t input /target <bt>') --Targets the battle target.
send_command('bind ^o fillmode') --Lets you see through walls.
send_command('bind @m gs c mount Omega')

NotifyBuffs = S{'doom','petrification'}

bayld_items = {'Tlalpoloani','Macoquetza','Camatlatia','Icoyoca','Tlamini','Suijingiri Kanemitsu',
'Zoquittihuitz','Quauhpilli Helm','Chocaliztli Mask','Xux Hat','Quauhpilli Gloves','Xux Trousers',
'Chocaliztli Boots','Maochinoli','Xiutleato','Hatxiik','Kuakuakait','Azukinagamitsu','Atetepeyorg',
'Kaquljaan','Ajjub Bow','Baqil Staff','Ixtab','Tamaxchi','Otomi Helm','Otomi Gloves','Kaabnax Hat',
'Kaabnax Trousers','Ejekamal Mask','Ejekamal Boots','Quiahuiz Helm','Quiahuiz Trousers','Uk\'uxkaj Cap'}

--[[ List of all Bayld Items.
bayld_items = {'Tlalpoloani','Macoquetza','Camatlatia','Icoyoca','Tlamini','Suijingiri Kanemitsu','Zoquittihuitz',
'Quauhpilli Helm','Chocaliztli Mask','Xux Hat','Quauhpilli Gloves','Xux Trousers','Chocaliztli Boots','Maochinoli',
'Hatxiik','Kuakuakait','Azukinagamitsu','Atetepeyorg','Kaquljaan','Ajjub Bow','Baqil Staff','Ixtab','Otomi Helm',
'Otomi Gloves','Kaabnax Hat','Kaabnax Trousers','Ejekamal Mask','Ejekamal Boots','Quiahuiz Helm','Quiahuiz Trousers',
'Uk\'uxkaj Cap'}
]]


require('chat')
require('lists')
require('coroutine')
require('queues')
require('logger')
require('tables')
require('sets')
require('strings')

--send_command('bind !a gs c autosc')

   ---- AUTO DIG ----

state.autoassist  	  = M(false, 'autoassist')
send_command('bind !a gs c autoassist')
mainpg="Zefri"


function assistcheck(cmdParams)
if state.autoassist.value==true then
--	if player.status == 'Mount'  then
		send_command('input /dig ')
		add_to_chat(204, "*-*-*-*-*-*-*-*-* [ DIG  ] *-*-*-*-*-*-*-*-*")
--	end
coroutine.schedule(assistcheck, 5)
end
end


function handle_aa()

	if state.autoassist.value==true then
		state.autoassist  	  = M(false, 'Autoassist')
		add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ DIG OFF ]->->->->->->->->->")
	else
		state.autoassist  	  = M(true, 'Autoassist')
		assistcheck()
		add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ DIG ON ]->->->->->->->->->")
	end

end

   ----- REACT LIGHT ----

windower.register_event(
    "incoming text",
    function(original, modified, mode)
	local spell_recasts = windower.ffxi.get_spell_recasts()
			if original:contains("Light") then
--				if not buffactive['Dark Arts'] and not buffactive['Addendum: Black'] then
--					send_command('input /ja "Dark Arts"  <me>')
--				elseif not buffactive['Addendum: Black'] then
--					send_command('input /ja "Addendum: Black"  <me>')
--				elseif spell_recasts[853] < spell_latency then
--					send_command('input /ma "Thunder VI"  <bt>')
--				elseif spell_recasts[849] < spell_latency then
--					send_command('input /ma "Fire VI"  <bt>')
--				elseif spell_recasts[851] < spell_latency then
--					send_command('input /ma "Aero VI"  <bt>')
--				elseif spell_recasts[168] < spell_latency then
--					send_command('input /ma "Thunder V"  <bt>')
--				elseif spell_recasts[148] < spell_latency then
--					send_command('input /ma "Fire V"  <bt>')
--				elseif spell_recasts[158] < spell_latency then
--					send_command('input /ma "Aero V"  <bt>')
--				end
			elseif original:contains("Tachi") and original:contains("Ayame") then
				coroutine.schedule(assistws, 3)
--				coroutine.schedule(assistws, 6)
			elseif original:contains("Just Desserts") then
--				send_command('input /ma "Stun"  <bt>')
            end
		if state.supertankmode.value==true then
		if original:contains(player.target.name) and (original:contains("uses") or original:contains("cast")) then
			add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ react ]->->->->->->->->->")
			supertankmode()
        end
		end

    end
)

function assistws(cmdParams)
		send_command('input /ws "Trueflight"  <t>')
end


function user_self_command(commandArgs, eventArgs)
    if commandArgs[1]:lower() == 'autoassist' then
        handle_aa(commandArgs)
        eventArgs.handled = true
	elseif commandArgs[1]:lower() == 'autosc' then
        handle_ws(commandArgs)
        eventArgs.handled = true
	end
end

 -----  SUPER TANK MODE ----
state.supertankmode  	  = M(false, 'supertankmode')
STreact= 1

function supertankmode()
if state.supertankmode.value==true and STreact== 1 then	
	coroutine.close(enab2)
		local abil_recasts = windower.ffxi.get_ability_recasts()
		local spell_recasts = windower.ffxi.get_spell_recasts()
	STreact = 0
			add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ reacting ]->->->->->->->->->")
	if not (state.Buff['Vallation'] or state.Buff['Valiance']) then
		if abil_recasts[113] < latency then
			windower.chat.input('/ja "Valiance" <me>')
		elseif abil_recasts[23] < latency then
			windower.chat.input('/ja "Vallation" <me>')
		end
	elseif abil_recasts[59] < latency then
			windower.chat.input('/ja "Pflug" <me>')
	elseif abil_recasts[120] < latency then
			windower.chat.input('/ja "Battuta" <me>')
	elseif abil_recasts[118] < latency then
			windower.chat.input('/ja "One for All" <me>')
	elseif abil_recasts[85] < latency then
		windower.chat.input('/ja "Souleater" <me>')
	elseif abil_recasts[88] < latency then
		windower.chat.input('/ja "Weapon Bash" <t>')
	elseif abil_recasts[86] < latency then
		windower.chat.input('/ja "Arcane Circle" <me>')
	elseif spell_recasts[252] < spell_latency and not silent_check_silence() then
		windower.chat.input('/ma "Stun" <t>')
	end
enab1 = coroutine.schedule(enablereact, 6)
enab2 = coroutine.schedule(enablereact2, 23)
end
end

function enablereact(cmdParams)
			add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ enable1 ]->->->->->->->->->")
STreact = 1
end

function enablereact2(cmdParams)
			add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ enable2 ]->->->->->->->->->")
STreact = 1
supertankmode()
end
