function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','PDT')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
	state.Weapons:options('Liberator','Apocalypse','Lycurgos')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}
	state.DrainSwapWeaponMode = M{'Always','Never','300','1000'}

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @pause gs c toggle AutoBuffMode')
	
	gear.TP_jse_back = { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.sTP_jse_back = { name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.WSDMG_jse_back = { name="Ankou's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	gear.FC_jse_back = { name="Ankou's Mantle", augments={'"Fast Cast"+10',}}

	autowstp = 1750
	
	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Diabolic Eye'] = {}
	sets.precast.JA['Arcane Circle'] = {}
	sets.precast.JA['Souleater'] = {}
	sets.precast.JA['Weapon Bash'] = {}
	sets.precast.JA['Nether Void'] = {}
	sets.precast.JA['Blood Weapon'] = {body="Fall. Cuirass +3"}
	sets.precast.JA['Dark Seal'] = {}
	sets.precast.JA['Last Resort'] = {back=gear.WSDMG_jse_back,feet="Fallen's Sollerets"}
                   
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
                   
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}
           
	sets.precast.Step = {}
	
	sets.precast.Flourish1 = {}
		   
	-- Fast cast sets for spells

	sets.precast.FC = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Orunmila's Torque",ear2="Malignance Earring",
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Weather. Ring +1",ring2="Kishar Ring",
		back=gear.FC_jse_back,legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
		
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Sapience Orb",
		head="Carmine Mask +1",neck="Orunmila's Torque",ear2="Malignance Earring",
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Weather. Ring +1",ring2="Kishar Ring",
		back=gear.FC_jse_back,legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}
                   
	-- Specific spells
	
    sets.midcast['Elemental Magic'] = {ammo="Dosis Tathlum",
        head="Carmine Mask +1",neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Malignance Earring",
        body="Sacro Breastplate",hands="Fall. Fin. Gaunt. +3",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
        waist=gear.ElementalObi,legs="Fall. Flanchard +3",feet="Odyssean Greaves"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {
		ammo="Pemphredo Tathlum",
		ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Fall. Cuirass +3"})
 
	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Carm. Scale Mail",hands="Fall. Fin. Gaunt. +3",ring1="Evanescence Ring",ring2="Kishar Ring",
		back="Niht Mantle",legs="Fall. Flanchard +3",feet="Ratri Sollerets"}
           
	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Ignominy Cuirass +3",hands="Leyline Gloves",ring1="Weather. Ring +1",ring2="Metamor. Ring +1",
		back=gear.FC_jse_back,legs="Ig. Flanchard +3",feet="Flam. Gambieras +2"}
		   
	sets.midcast['Dread Spikes'] = set_combine(sets.midcast['Dark Magic'], {ammo="Staunch Tathlum +1",
	head="Ratri Sallet",neck="Loricate Torque +1",
	body="Heathen's Cuirass",hands="Ratri Gadlings",ring1="Defending Ring",ring2="Gelatinous Ring +1",
	back=gear.FC_jse_back,legs="Sulev. Cuisses +2",feet="Ratri Sollerets"})
	
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {hands="Pavor Gauntlets",back="Chuparrosa Mantle"})
	sets.midcast['Absorb-TP'] = set_combine(sets.midcast.Absorb, {hands="Heath. Gauntlets"})
           
	sets.midcast.Stun = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Digni. Earring",ear2="Malignance Earring",
		body="Carm. Scale Mail",hands="Fall. Fin. Gaunt. +3",ring1="Metamor. Ring +1",ring2="Archon Ring",
		back="Niht Mantle",legs="Fall. Flanchard +3",feet="Flam. Gambieras +2"}
                   
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {head="Pixie Hairpin +1",hands="Fall. Fin. Gaunt. +3",ring1="Evanescence Ring",ring2="Archon Ring",back="Niht Mantle",waist="Austerity Belt +1"})
	
	sets.DrainWeapon = {} --main="Misanthropy",sub="Alber Strap"
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty,body="Twilight Cloak"})
	
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
						                   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
		head="Ratri Sallet",neck="Abyssal Beads +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Ignominy Cuirass +3",hands="Ratri Gadlings",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.WSDMG_jse_back,waist="Sailfi Belt +1",legs="Fall. Flanchard +3",feet="Ratri Sollerets"}
--{ammo="Knobkierrie",
--		head="Flam. Zucchetto +2",neck="Fotia Gorget",ear1="Lugra Earring +1",ear2="Moonshade Earring",
--		body=gear.valorous_wsd_body,hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Niqmaddu Ring",
--		back="Ankou's Mantle",waist="Fotia Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}

	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {neck="Combatant's Torque"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.	
    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Catastrophe'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Catastrophe'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Catastrophe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Catastrophe'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Torcleaver'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Torcleaver'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Torcleaver'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Torcleaver'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Torcleaver'].Fodder = set_combine(sets.precast.WS.Fodder, {})

    sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})
    sets.precast.WS['Entropy'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Entropy'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Entropy'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Entropy'].Fodder = set_combine(sets.precast.WS.Fodder, {})
	
    sets.precast.WS['Insurgency'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})
    sets.precast.WS['Insurgency'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Insurgency'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Insurgency'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Insurgency'].Fodder = set_combine(sets.precast.WS.Fodder, {})
     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Resolution'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Resolution'].Fodder = set_combine(sets.precast.WS.Fodder, {})     
	
    sets.precast.WS['Infernal Scythe'] = set_combine(sets.precast.WS, {ammo="Knobkierrie",
		head="Pixie Hairpin +1",neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Malignance Earring",
		body="Fall. Cuirass +3",hands="Fall. Fin. Gaunt. +3",ring1="Archon Ring",ring2="Shiva Ring +1",
		back=gear.WSDMG_jse_back,waist="Sailfi Belt +1",legs="Fall. Flanchard +3",feet="Ratri Sollerets"})
    sets.precast.WS['Infernal Scythe'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Infernal Scythe'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Infernal Scythe'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Infernal Scythe'].Fodder = set_combine(sets.precast.WS.Fodder, {})  

    sets.precast.WS['Fell Cleave'] = set_combine(sets.precast.WS, {neck="Fotia Gorget",waist="Fotia Belt"})	
           
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Thrud Earring",}
	sets.AccMaxTP = {ear1="Ishvara Earring",ear2="Thrud Earring",}
	sets.AccDayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Thrud Earring",}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Thrud Earring",}
	sets.AccDayWSEars = {}
	sets.DayWSEars = {}
     
            -- Idle sets
           
    sets.idle = {ammo="Ginsen",
		head="Hjarrandi Helm",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",hands="Acro Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Ig. Flanchard +3",feet="Flam. Gambieras +2"}
		
    sets.idle.PDT = {ammo="Ginsen",
		head="Hjarrandi Helm",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Ig. Flanchard +3",feet="Flam. Gambieras +2"}

	sets.idle.Weak = set_combine(sets.idle, {}) --head="Twilight Helm",body="Twilight Mail"
		
	sets.idle.Reraise = set_combine(sets.idle, {}) --head="Twilight Helm",body="Twilight Mail"
           
    -- Defense sets
	sets.defense.PDT = {ammo="Ginsen",
		head="Hjarrandi Helm",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Ig. Flanchard +3",feet="Flam. Gambieras +2"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {}) --head="Twilight Helm",body="Twilight Mail"

	sets.defense.MDT = {ammo="Ginsen",
		head="Hjarrandi Helm",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Ig. Flanchard +3",feet="Flam. Gambieras +2"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {}) --head="Twilight Helm",body="Twilight Mail"
		
	sets.defense.MEVA = {ammo="Ginsen",
		head="Hjarrandi Helm",neck="Loricate Torque +1",ear1="Brutal Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Ig. Flanchard +3",feet="Flam. Gambieras +2"}
     
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.passive.Reraise = {} --head="Twilight Helm",body="Twilight Mail"
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff['Dark Seal'] = {head="Fall. Burgeonet +3"}
	sets.buff['Nether Void'] = {legs="Heath. Flanchard +1"}
     
	-- Engaged sets
	sets.engaged = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Hjarrandi Breastplate",hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Ig. Flanchard +3",feet="Flam. Gambieras +2"}
    sets.engaged.SomeAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Hjarrandi Breastplate",hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Ig. Flanchard +3",feet="Flam. Gambieras +2"}
	sets.engaged.Acc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Hjarrandi Breastplate",hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Ig. Flanchard +3",feet="Flam. Gambieras +2"}
    sets.engaged.FullAcc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Hjarrandi Breastplate",hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Ig. Flanchard +3",feet="Flam. Gambieras +2"}
    sets.engaged.Fodder = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Hjarrandi Breastplate",hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Ig. Flanchard +3",feet="Flam. Gambieras +2"}
	sets.engaged.PDT = {ammo="Ginsen",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
	sets.engaged.SomeAcc.PDT = {ammo="Ginsen",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Digni. Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
--Example sets:
--[[
    sets.engaged.Adoulin = {}
	sets.engaged.SomeAcc.Adoulin = {}
	sets.engaged.Acc.Adoulin = {}
	sets.engaged.FullAcc.Adoulin = {}
	sets.engaged.Fodder.Adoulin = {}
	
	sets.engaged.PDT = {}
	sets.engaged.SomeAcc.PDT = {}
	sets.engaged.Acc.PDT = {}
	sets.engaged.FullAcc.PDT = {}
	sets.engaged.Fodder.PDT = {}
	
	sets.engaged.PDT.Adoulin = {}
	sets.engaged.SomeAcc.PDT.Adoulin = {}
	sets.engaged.Acc.PDT.Adoulin = {}
	sets.engaged.FullAcc.PDT.Adoulin = {}
	sets.engaged.Fodder.PDT.Adoulin = {}
	
	sets.engaged.MDT = {}
	sets.engaged.SomeAcc.MDT = {}
	sets.engaged.Acc.MDT = {}
	sets.engaged.FullAcc.MDT = {}
	sets.engaged.Fodder.MDT = {}
	
	sets.engaged.MDT.Adoulin = {}
	sets.engaged.SomeAcc.MDT.Adoulin = {}
	sets.engaged.Acc.MDT.Adoulin = {}
	sets.engaged.FullAcc.MDT.Adoulin = {}
	sets.engaged.Fodder.MDT.Adoulin = {}
	
            -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
            -- sets if more refined versions aren't defined.
            -- If you create a set with both offense and defense modes, the offense mode should be first.
            -- EG: sets.engaged.Dagger.Accuracy.Evasion
]]--
-- Liberator melee sets
    sets.engaged.Liberator = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Hjarrandi Breastplate",hands="Sulev. Gauntlets +2",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Ig. Flanchard +3",feet="Flam. Gambieras +2"}
	sets.engaged.Liberator.SomeAcc = {ammo="Ginsen",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Digni. Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
	sets.engaged.Liberator.Acc = {}
	sets.engaged.Liberator.FullAcc = {}
	sets.engaged.Liberator.Fodder = {}
	
    -- sets.engaged.Liberator.Adoulin = {}
	-- sets.engaged.Liberator.SomeAcc.Adoulin = {}
	-- sets.engaged.Liberator.Acc.Adoulin = {}
	-- sets.engaged.Liberator.FullAcc.Adoulin = {}
	-- sets.engaged.Liberator.Fodder.Adoulin = {}
	
    sets.engaged.Liberator.AM = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Abyssal Beads +2",ear1="Dedition Earring",ear2="Telos Earring",
		body="Hjarrandi Breastplate",hands="Acro Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.sTP_jse_back,waist="Sailfi Belt +1",legs=gear.odyssean_stp_legs,feet=gear.valorous_stp_feet}
	sets.engaged.Liberator.SomeAcc.AM = {ammo="Ginsen",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Digni. Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
	sets.engaged.Liberator.Acc.AM = {}
	sets.engaged.Liberator.FullAcc.AM = {}
	sets.engaged.Liberator.Fodder.AM = {}
	
    -- sets.engaged.Liberator.Adoulin.AM = {}
	-- sets.engaged.Liberator.SomeAcc.Adoulin.AM = {}
	-- sets.engaged.Liberator.Acc.Adoulin.AM = {}
	-- sets.engaged.Liberator.FullAcc.Adoulin.AM = {}
	-- sets.engaged.Liberator.Fodder.Adoulin.AM = {}

	sets.engaged.Liberator.PDT = {ammo="Ginsen",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
	sets.engaged.Liberator.SomeAcc.PDT = {ammo="Ginsen",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Digni. Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
	sets.engaged.Liberator.Acc.PDT = {}
	sets.engaged.Liberator.FullAcc.PDT = {}
	sets.engaged.Liberator.Fodder.PDT = {}
	
	-- sets.engaged.Liberator.PDT.Adoulin = {}
	-- sets.engaged.Liberator.SomeAcc.PDT.Adoulin = {}
	-- sets.engaged.Liberator.Acc.PDT.Adoulin = {}
	-- sets.engaged.Liberator.FullAcc.PDT.Adoulin = {}
	-- sets.engaged.Liberator.Fodder.PDT.Adoulin = {}
	
	sets.engaged.Liberator.PDT.AM = {ammo="Ginsen",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Dedition Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Hetairoi Ring",ring2="Niqmaddu Ring",
		back=gear.sTP_jse_back,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
	sets.engaged.Liberator.SomeAcc.PDT.AM = {}
	sets.engaged.Liberator.Acc.PDT.AM = {}
	sets.engaged.Liberator.FullAcc.PDT.AM = {}
	sets.engaged.Liberator.Fodder.PDT.AM = {}
	
	-- sets.engaged.Liberator.PDT.Adoulin.AM = {}
	-- sets.engaged.Liberator.SomeAcc.PDT.Adoulin.AM = {}
	-- sets.engaged.Liberator.Acc.PDT.Adoulin.AM = {}
	-- sets.engaged.Liberator.FullAcc.PDT.Adoulin.AM = {}
	-- sets.engaged.Liberator.Fodder.PDT.Adoulin.AM = {}
	
	sets.engaged.Liberator.MDT = {ammo="Ginsen",
		head="Hjarrandi Helm",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",hands="Sulev. Gauntlets +2",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.TP_jse_back,waist="Sailfi Belt +1",legs="Ig. Flanchard +3",feet="Flam. Gambieras +2"}
	sets.engaged.Liberator.SomeAcc.MDT = {}
	sets.engaged.Liberator.Acc.MDT = {}
	sets.engaged.Liberator.FullAcc.MDT = {}
	sets.engaged.Liberator.Fodder.MDT = {}
	
	-- sets.engaged.Liberator.MDT.Adoulin = {}
	-- sets.engaged.Liberator.SomeAcc.MDT.Adoulin = {}
	-- sets.engaged.Liberator.Acc.MDT.Adoulin = {}
	-- sets.engaged.Liberator.FullAcc.MDT.Adoulin = {}
	-- sets.engaged.Liberator.Fodder.MDT.Adoulin = {}
	
	sets.engaged.Liberator.MDT.AM = {ammo="Ginsen",
		head="Hjarrandi Helm",neck="Abyssal Beads +2",ear1="Dedition Earring",ear2="Telos Earring",
		body="Hjarrandi Breast.",hands="Acro Gauntlets",ring1="Defending Ring",ring2="Gelatinous Ring +1",
		back=gear.sTP_jse_back,waist="Sailfi Belt +1",legs=gear.odyssean_stp_legs,feet=gear.valorous_stp_feet}
	sets.engaged.Liberator.SomeAcc.MDT.AM = {}
	sets.engaged.Liberator.Acc.MDT.AM = {}
	sets.engaged.Liberator.FullAcc.MDT.AM = {}
	sets.engaged.Liberator.Fodder.MDT.AM = {}
	
	-- sets.engaged.Liberator.MDT.Adoulin.AM = {}
	-- sets.engaged.Liberator.SomeAcc.MDT.Adoulin.AM = {}
	-- sets.engaged.Liberator.Acc.MDT.Adoulin.AM = {}
	-- sets.engaged.Liberator.FullAcc.MDT.Adoulin.AM = {}
	-- sets.engaged.Liberator.Fodder.MDT.Adoulin.AM = {}

	--Extra Special Sets
	
	sets.buff.Souleater = {}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Liberator = {main="Liberator",sub="Utu Grip"}
	sets.weapons.Apocalypse = {main="Apocalypse",sub="Utu Grip"}
	sets.weapons.Lycurgos = {main="Lycurgos",sub="Utu Grip"}
	
    end

function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
        set_macro_page(5, 15)
		set_style(12) 
end

autows_list = {['Liberator']='Cross Reaper',['Apocalypse']='Catastrophe',['Lycurgos']='Upheaval'}