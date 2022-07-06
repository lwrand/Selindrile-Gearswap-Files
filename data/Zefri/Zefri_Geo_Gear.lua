function user_job_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal','PDT')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Nehushtan','DualWeapons')

	gear.nuke_jse_back = {name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+4','"Mag.Atk.Bns."+10',}}
	gear.idle_jse_back = {name="Nantosuelta's Cape", augments={'Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	
	gear.obi_cure_back = "Lifestream Cape"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Sacro Cord"
	

	
	autoindi = "Fury"
	autogeo = "Frailty"
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^backspace input /ja "Entrust" <me>')
	send_command('bind !backspace input /ja "Life Cycle" <me>')
	send_command('bind @backspace input /ma "Sleep II" <t>')
	send_command('bind ^delete input /ma "Aspir III" <t>')
	send_command('bind @delete input /ma "Sleep" <t>')
	send_command('bind @pause gs c toggle AutoBuffMode')
	
	indi_duration = 290
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic"}
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic",back=gear.idle_jse_back}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells

	sets.precast.FC = {main="Grioavolr",range="Dunna",
			head="Nahtirah Hat",neck = "Orunmila's Torque",
			body="Anhur Robe",ring1="Kishar Ring",ring2="Weather. Ring +1",
			back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet=gear.merlinic_refresh_feet}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Daybreak",sub="Genbu's Shield"})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = {main="Grioavolr",ammo="Sapience Orb",
		head=empty,neck="Orunmila's Torque",ear2="Sanare Earring",
		body="Twilight Cloak",ring1="Kishar Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet=gear.merlinic_refresh_feet}
		
	sets.precast.FC.Dispelga = {main="Daybreak",sub="Ammurapi Shield",
		head="Nahtirah Hat",neck = "Orunmila's Torque",ear2="Sanare Earring",
		body="Anhur Robe",ring1="Kishar Ring",
		back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet=gear.merlinic_refresh_feet}
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {main="Grioavolr",ammo="Sapience Orb",
			head="Nahtirah Hat",neck = "Orunmila's Torque",
			body="Anhur Robe",ring1="Kishar Ring",ring2="Weather. Ring +1",
			back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet=gear.merlinic_refresh_feet}

	sets.midcast.Geomancy = {main="Idris",sub="Genbu's Shield",range="Dunna",
				head="Azimuth Hood",neck="Incanter's Torque",ear2="Sanare Earring",
				body="Bagua Tunic",hands="Geo. Mitaines +1",ring1="Kishar Ring",
				back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet=gear.merlinic_refresh_feet}


	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {legs="Bagua Pants +1",feet="Azimuth Gaiters +1"})
		
    sets.midcast.Cure = {main="Daybreak",sub="Genbu's Shield",
				head="Vanya Hood",neck="Incanter's Torque",ear2="Sanare Earring",
				body="Jhakri Robe +2",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Ephedra Ring",
				back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants",feet="Vanya Clogs"}
		
    sets.midcast.LightWeatherCure = {main="Daybreak",sub="Genbu's Shield",
				head="Vanya Hood",neck="Incanter's Torque",ear2="Sanare Earring",
				body="Jhakri Robe +2",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Ephedra Ring",
				back="Twilight Cape",waist="Hachirin-no-Obi",legs="Geomancy Pants",feet="Vanya Clogs"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Daybreak",sub="Genbu's Shield",
				head="Vanya Hood",neck="Incanter's Torque",ear2="Sanare Earring",
				body="Jhakri Robe +2",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Ephedra Ring",
				back="Twilight Cape",waist="Hachirin-no-Obi",legs="Geomancy Pants",feet="Vanya Clogs"}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Malison Medallion",ring1="Ephedra Ring",ring2="Ephedra Ring",})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
	
    sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +1",ring1="Freke Ring",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs=gear.merlinic_nuke_legs,feet=gear.merlinic_nuke_feet}

    sets.midcast['Elemental Magic'].Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +1",ring1="Freke Ring",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs=gear.merlinic_nuke_legs,feet=gear.merlinic_nuke_feet}
		
    sets.midcast['Elemental Magic'].Proc = {main="Daybreak",sub="Ammurapi Shield",range="Dunna",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +1",ring1="Freke Ring",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs=gear.merlinic_nuke_legs,feet="Vanya Clogs"}
		
    sets.midcast['Elemental Magic'].Fodder = {main="Daybreak",sub="Ammurapi Shield",range="Dunna",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Regal Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +1",ring1="Freke Ring",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs=gear.merlinic_nuke_legs,feet="Vanya Clogs"}

	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Malignance Earring",hands="Amalric Gages +1"})
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'].Resistant, {ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Malignance Earring",hands="Amalric Gages +1",})
	sets.midcast['Elemental Magic'].HighTierNuke.Fodder = set_combine(sets.midcast['Elemental Magic'].Fodder, {ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Malignance Earring",hands="Amalric Gages +1"})
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Kishar Ring",ring2="Metamor. Ring +1",
        back=gear.nuke_jse_back,waist="Rumination Sash",legs=gear.merlinic_nuke_legs,feet=gear.merlinic_nuke_feet}
		
    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Kishar Ring",ring2="Metamor. Ring +1",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs=gear.merlinic_nuke_legs,feet=gear.merlinic_nuke_feet}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Kishar Ring",ring2="Metamor. Ring +1",
        back=gear.nuke_jse_back,waist="Rumination Sash",legs=gear.merlinic_nuke_legs,feet=gear.merlinic_nuke_feet}
		
	sets.midcast.Stun.Resistant = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Kishar Ring",ring2="Metamor. Ring +1",
        back=gear.nuke_jse_back,waist="Rumination Sash",legs=gear.merlinic_nuke_legs,feet=gear.merlinic_nuke_feet}

		
	sets.midcast.Impact = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Twilight Cloak",hands="Amalric Gages +1",ring1="Kishar Ring",ring2="Metamor. Ring +1",
		back=gear.nuke_jse_back,waist="Rumination Sash",legs=gear.merlinic_nuke_legs,feet=gear.merlinic_nuke_feet}
		
	sets.midcast.Dispel = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body=gear.merlinic_nuke_body,hands="Jhakri Cuffs +2",ring1="Kishar Ring",ring2="Metamor. Ring +1",
		back=gear.nuke_jse_back,waist="Rumination Sash",legs=gear.merlinic_nuke_legs,feet=gear.merlinic_nuke_feet}

	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})
		
	sets.midcast['Enfeebling Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body=gear.merlinic_nuke_body,hands="Jhakri Cuffs +2",ring1="Kishar Ring",ring2="Metamor. Ring +1",
		back=gear.nuke_jse_back,waist="Rumination Sash",legs=gear.merlinic_nuke_legs,feet=gear.merlinic_nuke_feet}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body=gear.merlinic_nuke_body,hands="Jhakri Cuffs +2",ring1="Kishar Ring",ring2="Metamor. Ring +1",
		back=gear.nuke_jse_back,waist="Rumination Sash",legs=gear.merlinic_nuke_legs,feet=gear.merlinic_nuke_feet}
		
    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})
    sets.midcast.ElementalEnfeeble.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.IntEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast.MndEnfeebles.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {})
		
	sets.midcast['Enhancing Magic'] = {
		neck="Incanter's Torque",ear1="Andoaa Earring",body="Anhur Robe",
		feet="Rubeus Boots",
		waist="Olympus Sash",back="Merciful Cape"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Stone Gorget",waist="Siegel Sash"}) --,legs="Haven Hose"
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear2="Sanare Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear2="Sanare Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear2="Sanare Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear2="Sanare Earring",waist="Sekhmet Corset"})

	-- Gear for specific elemental nukes.
	sets.element.Wind = {}
	sets.element.Ice = {}
	sets.element.Earth = {}

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Daybreak",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Sanare Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs=gear.merlinic_refresh_legs,feet=gear.merlinic_refresh_feet}

	-- Idle sets

	sets.idle = {main="Daybreak",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Sanare Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs=gear.merlinic_refresh_legs,feet=gear.merlinic_refresh_feet}
		
	sets.idle.PDT = {main="Daybreak",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Sanare Earring",
		body="Shamash Robe",hands=gear.merlinic_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back=gear.idle_jse_back,waist="Witful Belt",legs=gear.merlinic_refresh_legs,feet=gear.merlinic_refresh_feet}
		
	sets.idle.TPEat = set_combine(sets.idle, {}) --neck="Chrys. Torque"

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {main="Idris",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Sanare Earring",
		body="Shamash Robe",hands="Geo. Mitaines +1",ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back=gear.idle_jse_back,waist="Isa Belt",legs=gear.merlinic_refresh_legs,feet="Bagua Sandals +1"}

	sets.idle.PDT.Pet = {main="Idris",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Sanare Earring",
		body="Shamash Robe",hands="Geo. Mitaines +1",ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back=gear.idle_jse_back,waist="Isa Belt",legs=gear.merlinic_refresh_legs,feet="Bagua Sandals +1"}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})

	sets.idle.Weak = {main="Daybreak",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Sanare Earring",
		body="Shamash Robe",hands=gear.merlinic_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs=gear.merlinic_refresh_legs,feet=gear.merlinic_refresh_feet}

	-- Defense sets
	
	sets.defense.PDT = {main="Daybreak",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Sanare Earring",
		body="Shamash Robe",hands=gear.merlinic_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs=gear.merlinic_refresh_legs,feet=gear.merlinic_refresh_feet}

	sets.defense.MDT = {main="Daybreak",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Sanare Earring",
		body="Shamash Robe",hands=gear.merlinic_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs=gear.merlinic_refresh_legs,feet=gear.merlinic_refresh_feet}
		
    sets.defense.MEVA = {main="Daybreak",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Sanare Earring",
		body="Shamash Robe",hands=gear.merlinic_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs=gear.merlinic_refresh_legs,feet=gear.merlinic_refresh_feet}
		
	sets.defense.PetPDT = sets.idle.PDT.Pet
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geomancy Sandals +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
--	sets.TPEat = {neck="Chrys. Torque"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	sets.HPDown = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {main="Idris",sub="Genbu's Shield",range="Dunna",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Sanare Earring",
		body="Shamash Robe",hands="Geo. Mitaines +1",ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back=gear.idle_jse_back,waist="Isa Belt",legs=gear.merlinic_refresh_legs,feet="Bagua Sandals +1"}
		
	sets.engaged.DW = {
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Andoaa Earring",ear2="Sanare Earring",
		body="Jhakri Robe +2",hands=gear.merlinic_refresh_hands,ring1="Gelatinous Ring +1",ring2="Defending Ring",
		back="Mecisto. Mantle",waist="Witful Belt",legs=gear.merlinic_refresh_legs,feet=gear.merlinic_refresh_feet}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {head="Ea Hat",neck="Mizu. Kubikazari",
	body="Ea Houppelande",legs="Ea Slops",
	--ring1="Mujin Band"
	}
	sets.RecoverBurst = {head="Ea Hat",neck="Mizu. Kubikazari",
	body="Seidr Cotehardie",legs="Ea Slops",
	--ring1="Mujin Band",
	}
--	sets.buff.Sublimation = {waist="Embla Sash"}
--   sets.buff.DTSublimation = {waist="Embla Sash"}

	-- Weapons sets
	sets.weapons.Nehushtan = {} --main='Nehushtan',sub='Genmei Shield'
	sets.weapons.DualWeapons = {} --main='Nehushtan',sub='Nehushtan'
end


function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 2)
	set_style(20) 
end