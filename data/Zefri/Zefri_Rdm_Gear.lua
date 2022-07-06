function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','FullAcc','Odin')
    state.HybridMode:options('Normal','DT')
	state.WeaponskillMode:options('Match','Proc')
	state.AutoBuffMode:options('Off','Auto','AutoMelee','FullMeleeBuff')
	state.CastingMode:options('Normal','Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal','PDT','MDT','DTHippo')
    state.PhysicalDefenseMode:options('PDT','NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Sequence','Naegling','DualWeapons','DualClubs','DualEn')
	
	gear.MND_jse_back = {name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','"Fast Cast"+10','MND+10',}}
	gear.INT_jse_back = {name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	gear.TP_jse_back = {name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.WSD_jse_back = {name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}}
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` input /ja "Accession" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind !backspace input /ja "Spontaneity" <t>')
	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind != input /ja "Penury" <me>')
	send_command('bind @= input /ja "Parsimony" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @pause gs c toggle AutoBuffMode')
	
	select_default_macro_book()
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +3"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	
	sets.precast.FC = {
		head="CArmine Mask +1",
		body="Viti. Tabard +3",ring1="Kishar Ring",ring2="Weather. Ring +1",
		back=gear.MND_jse_back}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Sacro Bulwark"})
       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",
		head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Brutal Earring",ear2="Telos Earring",
		body="Viti. Tabard +3",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
		back=gear.MND_jse_back,waist="Grunfeld Rope",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}
		
	sets.precast.WS.Proc = 	{}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	
	sets.precast.WS['Chant Du Cygne'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt",})
		
	sets.precast.WS['Evisceration'] = sets.precast.WS['Chant Du Cygne']

	sets.precast.WS['Savage Blade'] = {ammo="Regal Gem",
		head="Viti. Chapeau +3",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Regal Earring",
		body="Viti. Tabard +3",hands="Jhakri Cuffs +2",ring1="Metamor. Ring +1",ring2="Petrov Ring",
		back=gear.MND_jse_back,waist="Sailfi Belt +1",legs="Malignance Tights",feet="Carmine Greaves +1"}
		
	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Malignance Earring",ear2="Regal Earring",
		body=gear.merlinic_nuke_body,hands="Jhakri Cuffs +2",ring1="Freke Ring",ring2="Archon Ring",
		back=gear.MND_jse_back,waist="Sacro Cord",legs=gear.merlinic_nuke_legs,feet=gear.merlinic_nuke_feet}
		
	sets.precast.WS['Seraph Blade'] = {}
		
	sets.precast.WS['Aeolian Edge'] = {}

	-- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {head="Ea Hat",neck="Mizu. Kubikazari",body="Ea Houppelande",hands="Amalric Gages +1",legs="Ea Slops",ring2="Mujin Band"}
	sets.RecoverBurst = {head="Ea Hat",neck="Mizu. Kubikazari",body="Seidr Cotehardie",hands="Amalric Gages +1",legs="Ea Slops",ring2="Mujin Band"}
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {} --main="Marin Staff +1"
	sets.element.Ice = {} --main="Ngqoqwanb"
	sets.element.Earth = {} --neck="Quanpur Necklace"

	sets.midcast.FastRecast = {
		head="CArmine Mask +1",
		body="Viti. Tabard +3",ring1="Kishar Ring",ring2="Weather. Ring +1",
		back=gear.MND_jse_back}

    sets.midcast.Cure = {main="Daybreak",sub="Ammurapi Shield",
				head="Vanya Hood",neck="Incanter's Torque",
				body="Viti. Tabard +3",hands="Viti. Gloves +3",ring1="Ephedra Ring",ring2="Ephedra Ring",
				back=gear.MND_jse_back,waist="Witful Belt",legs="Atrophy Tights +1",feet="Vanya Clogs"}
		
    sets.midcast.LightWeatherCure = {main="Daybreak",sub="Ammurapi Shield",
				head="Vanya Hood",neck="Incanter's Torque",
				body="Viti. Tabard +3",hands="Viti. Gloves +3",ring1="Ephedra Ring",ring2="Ephedra Ring",
				back=gear.MND_jse_back,waist="Witful Belt",legs="Atrophy Tights +1",feet="Vanya Clogs"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Daybreak",sub="Ammurapi Shield",
				head="Vanya Hood",neck="Incanter's Torque",
				body="Viti. Tabard +3",hands="Viti. Gloves +3",ring1="Ephedra Ring",ring2="Ephedra Ring",
				back=gear.MND_jse_back,waist="Witful Belt",legs="Atrophy Tights +1",feet="Vanya Clogs"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Malison Medallion",
		ring1="Ephedra Ring",ring2="Ephedra Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {}) --main="Oranyan",sub="Clemency Grip"
		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}

	sets.midcast['Enhancing Magic'] = {
		main="Pukulatmuj +1",sub="Ammurapi Shield",
--		main="Pukulatmuj +1",sub="Pukulatmuj",
		head="Befouled Crown",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
		body="Viti. Tabard +3",hands="Viti. Gloves +3",
		back="Ghostfyre Cape",waist="Olympus Sash",legs="Atrophy Tights +1",feet="Leth. Houseaux +1"}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = {
		head="Leth. Chappel +1",
		body="Lethargy Sayon +1",hands="Atrophy Gloves +2",
		legs="Leth. Fuseau +1",feet="Leth. Houseaux +1"}
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	
	sets.midcast.Haste= set_combine(sets.midcast.FastRecast, {
		main="Pukulatmuj +1",sub="Ammurapi Shield",
		body="Viti. Tabard +3",hands="Atrophy Gloves +2",
		waist="Embla Sash",back="Ghostfyre Cape",feet="Leth. Houseaux +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast.FastRecast, {}) 
	sets.midcast.BarElement = sets.midcast.Haste 
	sets.midcast.Stoneskin = set_combine(sets.midcast.FastRecast, {neck = "Stone Gorget",waist="Siegel Sash"}) 
	sets.midcast.Phalanx = {main="Sakpata's Sword",body = gear.taeon_FC_body, hands = gear.taeon_phalanx_hands, legs = gear.taeon_phalanx_legs, feet = gear.taeon_phalanx_feet}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast.Refresh = set_combine(sets.midcast.Haste, {head="Amalric Coif +1",body="Atrophy Tabard +2",legs="Leth. Fuseau +1"})  
    sets.midcast.Flurry = sets.midcast.Haste   
    sets.midcast.Firestorm = sets.midcast.Haste
    sets.midcast.Hailstorm = sets.midcast.Haste
    sets.midcast.Windstorm = sets.midcast.Haste
    sets.midcast.Sandstorm = sets.midcast.Haste
    sets.midcast.Thunderstorm = sets.midcast.Haste
    sets.midcast.Rainstorm = sets.midcast.Haste
    sets.midcast.Aurorastorm = sets.midcast.Haste
    sets.midcast.Voidstorm = sets.midcast.Haste
	sets.midcast["Gain-Mnd"] = set_combine(sets.midcast.Haste, {hands="Viti. Gloves +3"})
	sets.midcast["Gain-Str"] = sets.midcast["Gain-Mnd"]
	sets.midcast["Gain-Dex"] = sets.midcast["Gain-Mnd"]
	sets.midcast["Gain-Vit"] = sets.midcast["Gain-Mnd"]
	sets.midcast["Gain-Agi"] = sets.midcast["Gain-Mnd"]
	sets.midcast["Gain-Int"] = sets.midcast["Gain-Mnd"]
	sets.midcast["Gain-Chr"] = sets.midcast["Gain-Mnd"]
    sets.midcast["Haste II"] = sets.midcast.Haste
    sets.midcast["Flurry II"] = sets.midcast.Haste
    sets.midcast['Shock Spikes'] = sets.midcast.Haste
    sets.midcast['Ice Spikes'] = sets.midcast.Haste
    sets.midcast['Blaze Spikes'] = sets.midcast.Haste
    sets.midcast['Refresh II'] = sets.midcast.Refresh
    sets.midcast['Refresh III'] = sets.midcast.Refresh
    sets.midcast['Regen II'] = sets.midcast.Haste
	
	sets.midcast['Enfeebling Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Viti. Chapeau +3",neck="Duelist's Torque",ear1="Snotra Earring",ear2="Regal Earring",
		body="Atrophy Tabard +2",hands="Leth. Gantherots +1",ring1="Kishar Ring",ring2="Metamor. Ring +1",
		back=gear.MND_jse_back,waist="Rumination Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Viti. Chapeau +3",neck="Duelist's Torque",ear1="Snotra Earring",ear2="Regal Earring",
		body="Atrophy Tabard +2",hands="Leth. Gantherots +1",ring1="Weather. Ring +1",ring2="Metamor. Ring +1",
		back=gear.MND_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet="Vitiation Boots +3"}
		
	sets.midcast['Enfeebling Magic'].FullAcc = {main="Bunzi's Rod",sub="Ammurapi Shield",Range="Ullr",
		head="Viti. Chapeau +3",neck="Duelist's Torque",ear1="Snotra Earring",ear2="Regal Earring",
		body="Atrophy Tabard +2",hands="Leth. Gantherots +1",ring1="Weather. Ring +1",ring2="Metamor. Ring +1",
		back="Aurist's Cape +1",waist="Acuity Belt +1",legs="Chironic Hose",feet="Vitiation Boots +3"}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {main="Bunzi's Rod",back=gear.INT_jse_back,waist="Acuity Belt +1"})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {main="Bunzi's Rod",back=gear.INT_jse_back,waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast['Distract II'] = set_combine(sets.midcast['Enfeebling Magic'].FullAcc, {})
	sets.midcast['Distract II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].FullAcc, {})
	sets.midcast['Frazzle II'] = set_combine(sets.midcast['Enfeebling Magic'].FullAcc, {})
	sets.midcast['Frazzle II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].FullAcc, {})
	
	sets.midcast['Distract III'] = set_combine(sets.midcast.MndEnfeebles, {neck="Incanter's Torque",ear2="Vor Earring"})
	sets.midcast['Distract III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {neck="Incanter's Torque",ear2="Vor Earring"})
	sets.midcast['Frazzle III'] = set_combine(sets.midcast.MndEnfeebles, {neck="Incanter's Torque",ear2="Vor Earring"})
	sets.midcast['Frazzle III'].Resistant = set_combine(sets.midcast.MndEnfeebles.Resistant, {neck="Incanter's Torque",ear2="Vor Earring"})
	
	sets.midcast.Silence = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.Silence.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})	
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], {})
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], {})

	sets.midcast['Slow II'] = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast['Slow II'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
    sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +1",ring1="Freke Ring",ring2="Metamor. Ring +1",
        back=gear.INT_jse_back,waist=gear.ElementalObi,legs=gear.merlinic_nuke_legs,feet="Vitiation Boots +3"}
		
    sets.midcast['Elemental Magic'].Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +1",ring1="Freke Ring",ring2="Metamor. Ring +1",
        back=gear.INT_jse_back,waist=gear.ElementalObi,legs=gear.merlinic_nuke_legs,feet="Vitiation Boots +3"}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +1",ring1="Freke Ring",ring2="Metamor. Ring +1",
        back=gear.INT_jse_back,waist=gear.ElementalObi,legs=gear.merlinic_nuke_legs,feet="Vitiation Boots +3"}

    sets.midcast['Elemental Magic'].Proc = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +1",ring1="Freke Ring",ring2="Metamor. Ring +1",
        back=gear.INT_jse_back,waist=gear.ElementalObi,legs=gear.merlinic_nuke_legs,feet="Vitiation Boots +3"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Malignance Earring",hands="Amalric Gages +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Malignance Earring",hands="Amalric Gages +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Malignance Earring",hands="Amalric Gages +1"})
		
	sets.midcast.Impact = {main="Bunzi's Rod",sub="Ammurapi Shield",range="Ullr",
		head=empty,neck="Duelist's Torque",ear1="Snotra Earring",ear2="Malignance Earring",
		body="Twilight Cloak",hands="Amalric Gages +1",ring1="Kishar Ring",ring2="Metamor. Ring +1",
		back="Aurist's Cape +1",waist="Acuity Belt +1",legs=gear.merlinic_nuke_legs,feet="Vitiation Boots +3"}

	sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",range="Ullr",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Atrophy Tabard +2",hands="Amalric Gages +1",ring1="Kishar Ring",ring2="Metamor. Ring +1",
        back="Aurist's Cape +1",waist="Acuity Belt +1",legs=gear.merlinic_nuke_legs,feet="Vitiation Boots +3"}

    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",range="Ullr",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Atrophy Tabard +2",hands="Amalric Gages +1",ring1="Archon Ring",ring2="Evanescence Ring",
        back="Aurist's Cape +1",waist="Fucho-no-obi",legs=gear.merlinic_nuke_legs,feet=gear.merlinic_nuke_feet}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Rubicundity",sub="Ammurapi Shield",range="Ullr",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Atrophy Tabard +2",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Evanescence Ring",
        back="Aurist's Cape +1",waist="Fucho-no-obi",legs=gear.merlinic_nuke_legs,feet="Vitiation Boots +3"}
		
	sets.midcast.Stun.Resistant = {main="Rubicundity",sub="Ammurapi Shield",range="Ullr",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body="Atrophy Tabard +2",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Evanescence Ring",
        back="Aurist's Cape +1",waist="Fucho-no-obi",legs=gear.merlinic_nuke_legs,feet="Vitiation Boots +3"}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}
	

	-- Idle sets
	sets.idle = {main="Daybreak",sub="Sacro Bulwark",ammo="Homiliary",
		head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Sanare Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back=gear.MND_jse_back,waist="Witful Belt",legs=gear.merlinic_refresh_legs,feet=gear.merlinic_refresh_feet}
		
	sets.idle.PDT = {main="Daybreak",sub="Sacro Bulwark",ammo="Homiliary",
		head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Shamash Robe",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.MND_jse_back,waist="Witful Belt",legs=gear.merlinic_refresh_legs,feet=gear.merlinic_refresh_feet}
		
	sets.idle.MDT = {main="Daybreak",sub="Sacro Bulwark",ammo="Homiliary",
		head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Shamash Robe",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.MND_jse_back,waist="Witful Belt",legs=gear.merlinic_refresh_legs,feet=gear.merlinic_refresh_feet}
		
	sets.idle.Weak = {main="Daybreak",sub="Sacro Bulwark",ammo="Homiliary",
		head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Shamash Robe",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.MND_jse_back,waist="Witful Belt",legs=gear.merlinic_refresh_legs,feet=gear.merlinic_refresh_feet}
	
	sets.idle.DTHippo = set_combine(sets.idle.PDT, {})
	
	-- Defense sets
	sets.defense.PDT = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.MND_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.MND_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.defense.MEVA = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.MND_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.idle.TPEat = set_combine(sets.idle, {})

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	-- Weapons sets
	sets.weapons.Sequence = {} --main="Sequence",sub="Ammurapi Shield"
	sets.weapons.Naegling = {main="Naegling",sub="Ammurapi Shield"}
	sets.weapons.DualEn = {main="Qutrub Knife",sub="Esikuva"}
	sets.weapons.DualClubs = {} --main="Naegling",sub="Fettering Blade"
	sets.weapons.DualWeapons = {main="Naegling",sub="Sakpata's Sword"} --main="Almace",sub="Sequence"

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
--	sets.engaged = {ammo="Ginsen",
--		head="Aya. Zucchetto +2",neck="Asperity Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back="Bleating Mantle",waist="Windbuffet Belt +1",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Petrov Ring",
		back=gear.TP_jse_back,waist="Grunfeld Rope",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.Acc = {}

	sets.engaged.FullAcc = {}

	sets.engaged.DT = {}

	sets.engaged.Acc.DT = {}

	sets.engaged.FullAcc.DT = {}

	sets.engaged.DW = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Telos Earring",ear2="Eabani Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Petrov Ring",
		back=gear.TP_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

	sets.engaged.DW.Acc = {}

	sets.engaged.DW.FullAcc = {}

	sets.engaged.DW.DT = {}

	sets.engaged.DW.Acc.DT = {}

	sets.engaged.DW.FullAcc.DT = {}

		
	sets.engaged.DW.Odin = {main="Qutrub Knife",sub="Esikuva", range="Ullr",
		head="Carmine Mask +1",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Eabani Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Metamor. Ring +1",ring2="Ayanmo Ring",
		back=gear.TP_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

end

function user_job_buff_change(buff, gain)
	if buff:startswith('Addendum: ') or buff:endswith(' Arts') then
		style_lock = true
	end
end

function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
set_macro_page(1, 8)
set_style(7) 
end

autows_list = {['Naegling']='Savage Blade',['DualWeapons']='Savage Blade'}