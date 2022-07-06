-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','PDT')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('Trishula','Naegling')
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	
	gear.TP_jse_back = { name="Brigantia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Pet: Damage taken -5%',}}
	gear.WS_jse_back = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10',}}
	gear.WSDMG_jse_back = { name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    select_default_macro_book()
	
	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /pet "Restoring Breath" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind @f7 gs c toggle AutoJumpMode')
	send_command('bind @` gs c cycle SkillchainMode')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Angon = {ammo="Angon", hands="Ptero. Fin. G. +3"} --
	sets.precast.JA.Jump = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Ptero. Mail +3",hands="Vis. Fng. Gaunt. +3",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Ioskeha Belt +1",legs="Ptero. Brais +3",feet="Ostro Greaves"}
	sets.precast.JA['Ancient Circle'] = {legs="Vishap Brais +3"} --
	sets.precast.JA['High Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Ptero. Mail +3",hands="Vis. Fng. Gaunt. +3",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Ioskeha Belt +1",legs="Ptero. Brais +3",feet="Ostro Greaves"}
	sets.precast.JA['Soul Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Vishap Mail +1",hands="Acro Gauntlets",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Ioskeha Belt +1",legs="Ptero. Brais +3",feet="Ostro Greaves"}
	sets.precast.JA['Spirit Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Ptero. Mail +3",hands="Vis. Fng. Gaunt. +3",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Ioskeha Belt +1",legs="Ptero. Brais +3",feet="Pelt. Schyn. +1"}
	sets.precast.JA['Super Jump'] = {}
	sets.precast.JA['Spirit Link'] = {head="Vishap Armet +1", hands="Pel. Vambraces +1", ear1="Pratik Earring"} --
	sets.precast.JA['Call Wyvern'] = {body="Ptero. Mail +3"} --
	sets.precast.JA['Deep Breathing'] = {head="Ptero. Armet +3"} --
	sets.precast.JA['Spirit Surge'] = {body="Ptero. Mail +3"} --
	sets.precast.JA['Steady Wing'] = {legs="Vishap Brais +3",back="Updraft Mantle",feet="Ptero. Greaves"}
	
	-- Breath sets
	sets.precast.JA['Restoring Breath'] = {head="Ptero. Armet +3",legs="Vishap Brais +3",back="Brigantia's Mantle"}
	sets.precast.JA['Smiting Breath'] = {head="Ptero. Armet +3",back="Brigantia's Mantle"}
	sets.HealingBreath = {head="Ptero. Armet +3",legs="Vishap Brais +3",back="Updraft Mantle",feet="Ptero. Greaves"}
	sets.SmitingBreath = {head="Ptero. Armet +3",back="Brigantia's Mantle"}

	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Orunmila's Torque",
		body=gear.taeon_FC_body,hands="Leyline Gloves",ring1="Weather. Ring +1",
		feet="Carmine Greaves +1"}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Orunmila's Torque",
		body=gear.taeon_FC_body,hands="Leyline Gloves",ring1="Weather. Ring +1",
		feet="Carmine Greaves +1"}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head="Vishap Armet +1"})
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {ammo="Knobkierrie",
		head="Ptero. Armet +3",neck="Dgn. Collar +2",ear1="Moonshade Earring",ear2="Sherida Earring",
		body="Ptero. Mail +3",hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.WS_jse_back,waist="Fotia Belt",legs="Sulev. Cuisses +2",feet="Lustra. Leggings +1"}
		
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Stardiver'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Stardiver'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Drakesbane'].SomeAcc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Drakesbane'].Fodder = set_combine(sets.precast.WS.Fodder, {})

	-- WSDMG sets
	
	sets.precast.WS['Sonic Thrust'] = {ammo="Knobkierrie",
		head="Ptero. Armet +3",neck="Dgn. Collar +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Ptero. Mail +3",hands="Ptero. Fin. G. +3",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.WSDMG_jse_back,waist="Sailfi Belt +1",legs="Vishap Brais +3",feet="Sulev. Leggings +2"}
		
	sets.precast.WS['Sonic Thrust'].SomeAcc = set_combine(sets.precast.WS['Sonic Thrust'], {})
	sets.precast.WS['Sonic Thrust'].Acc = set_combine(sets.precast.WS['Sonic Thrust'], {})
	sets.precast.WS['Sonic Thrust'].Fodder = set_combine(sets.precast.WS['Sonic Thrust'], {})
	
	sets.precast.WS["Camlann's Torment"] = set_combine(sets.precast.WS['Sonic Thrust'], {ear1="Ishvara Earring"})
	sets.precast.WS["Camlann's Torment"].SomeAcc = set_combine(sets.precast.WS["Camlann's Torment"], {})
	sets.precast.WS["Camlann's Torment"].Acc = set_combine(sets.precast.WS["Camlann's Torment"], {})
	sets.precast.WS["Camlann's Torment"].Fodder = set_combine(sets.precast.WS["Camlann's Torment"], {})
	
	sets.precast.WS["Impulse Drive"] = set_combine(sets.precast.WS['Sonic Thrust'], {})
	sets.precast.WS["Impulse Drive"].SomeAcc = set_combine(sets.precast.WS["Impulse Drive"], {})
	sets.precast.WS["Impulse Drive"].Acc = set_combine(sets.precast.WS["Impulse Drivet"], {})
	sets.precast.WS["Impulse Drive"].Fodder = set_combine(sets.precast.WS["Impulse Drive"], {})

	sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS['Sonic Thrust'], {})
	sets.precast.WS["Savage Blade"].SomeAcc = set_combine(sets.precast.WS["Savage Blade"], {})
	sets.precast.WS["Savage Blade"].Acc = set_combine(sets.precast.WS["Savage Blade"], {})
	sets.precast.WS["Savage Blade"].Fodder = set_combine(sets.precast.WS["Savage Blade"], {})
	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {ammo="Ginsen",
		head="Hjarrandi Helm",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",hands="Acro Gauntlets",ring1="Defending Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
		
	sets.idle.Refresh = {ammo="Ginsen",
		head="Hjarrandi Helm",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",hands="Acro Gauntlets",ring1="Defending Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Ioskeha Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.idle.Weak = set_combine(sets.idle, {})
		
	sets.idle.Reraise = set_combine(sets.idle, {})
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Hjarrandi Helm",neck="Loricate Torque +1",ear1="Sanare Earring",
		body="Hjarrandi Breast.",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {})

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
		head="Hjarrandi Helm",neck="Loricate Torque +1",ear1="Sanare Earring",
		body="Hjarrandi Breast.",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Hjarrandi Helm",neck="Loricate Torque +1",ear1="Sanare Earring",
		body="Hjarrandi Breast.",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		legs="Sulev. Cuisses +2",feet="Sulev. Leggings +2"}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.Reraise = {} --head="Twilight Helm",body="Twilight Mail"
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {} --ear2="Ethereal Earring"
    sets.passive.Twilight = {} --head="Twilight Helm", body="Twilight Mail"
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Trishula = {main="Trishula",sub="Utu Grip"}
	sets.weapons.Naegling = {main="Naegling",sub=""}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
	sets.AccDayMaxTPWSEars = {}
	sets.DayMaxTPWSEars = {}
	sets.AccDayWSEars = {}
	sets.DayWSEars = {}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",hands="Acro Gauntlets",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Ioskeha Belt +1",legs="Ptero. Brais +3",feet="Flam. Gambieras +2"}
    sets.engaged.SomeAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",hands="Acro Gauntlets",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Ioskeha Belt +1",legs="Ptero. Brais +3",feet="Flam. Gambieras +2"}
	sets.engaged.Acc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",hands="Acro Gauntlets",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Ioskeha Belt +1",legs="Ptero. Brais +3",feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",hands="Acro Gauntlets",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Ioskeha Belt +1",legs="Ptero. Brais +3",feet="Flam. Gambieras +2"}
    sets.engaged.Fodder = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",hands="Acro Gauntlets",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Ioskeha Belt +1",legs="Ptero. Brais +3",feet="Flam. Gambieras +2"}

    sets.engaged.AM = {}
    sets.engaged.AM.SomeAcc = {}
	sets.engaged.AM.Acc = {}
    sets.engaged.AM.FullAcc = {}
    sets.engaged.AM.Fodder = {}
	
    sets.engaged.PDT = {ammo="Ginsen",
		head="Hjarrandi Helm",neck="Dgn. Collar +2",ear1="Telos Earring",ear2="Sherida Earring",
		body="Hjarrandi Breast.",hands="Ptero. Fin. G. +3",ring1="Defending Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Ioskeha Belt +1",legs="Ptero. Brais +3",feet="Flam. Gambieras +2"}
    sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
    sets.engaged.FullAcc.PDT = {}
    sets.engaged.Fodder.PDT = {}
	
    sets.engaged.AM.PDT = {}
    sets.engaged.AM.SomeAcc.PDT = {}
	sets.engaged.AM.Acc.PDT = {}
    sets.engaged.AM.FullAcc.PDT = {}
    sets.engaged.AM.Fodder.PDT = {}
		
	--[[ Melee sets for in Adoulin, which has an extra 2% Haste from Ionis.
	
    sets.engaged.Adoulin = {}
    sets.engaged.Adoulin.SomeAcc = {}
	sets.engaged.Adoulin.Acc = {}
    sets.engaged.Adoulin.FullAcc = {}
    sets.engaged.Adoulin.Fodder = {}

    sets.engaged.Adoulin.AM = {}
    sets.engaged.Adoulin.AM.SomeAcc = {}
	sets.engaged.Adoulin.AM.Acc = {}
    sets.engaged.Adoulin.AM.FullAcc = {}
    sets.engaged.Adoulin.AM.Fodder = {}
	
    sets.engaged.Adoulin.PDT = {}
    sets.engaged.Adoulin.SomeAcc.PDT = {}
	sets.engaged.Adoulin.Acc.PDT = {}
    sets.engaged.Adoulin.FullAcc.PDT = {}
    sets.engaged.Adoulin.Fodder.PDT = {}
	
    sets.engaged.Adoulin.AM.PDT = {}
    sets.engaged.Adoulin.AM.SomeAcc.PDT = {}
	sets.engaged.Adoulin.AM.Acc.PDT = {}
    sets.engaged.Adoulin.AM.FullAcc.PDT = {}
    sets.engaged.Adoulin.AM.Fodder.PDT = {}
	]]

end

function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 16)
	set_style(1)
end

autows_list = {['Trishula']='Stardiver',['Naegling']='Savage Blade'}