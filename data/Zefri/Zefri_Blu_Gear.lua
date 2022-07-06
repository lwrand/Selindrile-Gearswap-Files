function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Fodder','Normal','Acc','FullAcc')
	state.HybridMode:options('Normal','DT')
    state.WeaponskillMode:options('Match','Normal','Acc','FullAcc','Fodder')
    state.CastingMode:options('Normal','SIRD','Resistant','FullMacc','Fodder','Proc')
    state.IdleMode:options('Normal','Sphere','PDT','DTHippo')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Melee','Almace','Magic','None'
--	,'MagicWeapons','MeleeClubs','MaccWeapons','HybridWeapons'
)

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','MP','SuppaBrutal','DWEarrings','DWMax'}

--	gear.da_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}
--	gear.stp_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
--	gear.crit_jse_back = {name="Rosmerta's Cape",augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}}
--	gear.wsd_jse_back = {name="Rosmerta's Cape",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
--	gear.nuke_jse_back = {name="Rosmerta's Cape",augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}

	autows = 'Savage Blade'

	-- Additional local binds
	send_command('bind ^` input /ja "Chain Affinity" <me>')
	send_command('bind @` input /ja "Efflux" <me>')
	send_command('bind !` input /ja "Burst Affinity" <me>')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	send_command('bind ^backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Mighty Guard" <me>')
	send_command('bind !backspace input /ja "Unbridled Learning" <me>;wait 1;input /ja "Diffusion" <me>;wait 2;input /ma "Carcharian Verve" <me>')
	send_command('bind @backspace input /ja "Convergence" <me>')
	send_command('bind @f10 gs c toggle LearningMode')
	send_command('bind ^@!` gs c cycle MagicBurstMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !@^f7 gs c toggle AutoWSMode')
	send_command('bind !r gs c weapons None;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons Almace;gs c update')
	send_command('bind !q gs c weapons HybridWeapons;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	sets.buff['Burst Affinity'] = {} --feet="Hashi. Basmak +1"
	sets.buff['Chain Affinity'] = {} --feet="Assim. Charuqs +2"
	sets.buff.Convergence = {} --head="Luh. Keffiyeh +1"
	sets.buff.Diffusion = {feet="Luhlaza Charuqs"} 
	sets.buff.Enchainment = {}
	sets.buff.Efflux = {} --back=gear.da_jse_back,legs="Hashishin Tayt +1"
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.HPDown = {}
		
	sets.HPCure = {}

	-- Precast Sets

	-- Precast sets to enhance JAs
	sets.precast.JA['Azure Lore'] = {} --hands="Luh. Bazubands +1"


	-- Waltz set (chr and vit)
    sets.precast.Waltz = {}
	
	sets.Self_Waltz = {}

	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.precast.Step = {}

	sets.precast.Flourish1 = {}

	-- Fast cast sets for spells

	sets.precast.FC = {
		head="Carmine Mask +1",neck="Orunmila's Torque",
		body=gear.taeon_FC_body,hands="Leyline Gloves",ring1="Kishar Ring",ring2="Weather. Ring +1",
		waist="Witful Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})

	sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, {})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Ginsen",
				  head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
                  body="Adhemar Jacket +1",hands=gear.adhemar_melee_hand,ring1="Epona's Ring",ring2="Hetairoi Ring",
				  waist="Fotia Belt",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.precast.WS.Acc = {ammo="Ginsen",
				  head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
                  body="Adhemar Jacket +1",hands=gear.adhemar_melee_hand,ring1="Epona's Ring",ring2="Hetairoi Ring",
				  waist="Fotia Belt",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.precast.WS.FullAcc = {ammo="Ginsen",
				  head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
                  body="Adhemar Jacket +1",hands=gear.adhemar_melee_hand,ring1="Epona's Ring",ring2="Hetairoi Ring",
				  waist="Fotia Belt",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.precast.WS.DT = {ammo="Ginsen",
				  head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Brutal Earring",
                  body="Adhemar Jacket +1",hands=gear.adhemar_melee_hand,ring1="Epona's Ring",ring2="Hetairoi Ring",
				  waist="Fotia Belt",legs="Samnuha Tights",feet="Carmine Greaves +1"}

	sets.precast.WS.Fodder = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Requiescat'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Requiescat'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Requiescat'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Requiescat'].Fodder = set_combine(sets.precast.WS['Requiescat'], {})

	sets.precast.WS['Realmrazer'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Realmrazer'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Realmrazer'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Realmrazer'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Realmrazer'].Fodder = set_combine(sets.precast.WS['Realmrazer'], {})

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Chant du Cygne'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Chant du Cygne'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Chant du Cygne'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Chant du Cygne'].Fodder = set_combine(sets.precast.WS['Chant du Cygne'], {})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
	ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=gear.adhemar_melee_hand,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Carmine Greaves +1",
    neck="Fotia Gorget",
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Moonshade Earring",
    left_ring="Epona's Ring",
    right_ring="Ilabrat Ring",
	})
	sets.precast.WS['Savage Blade'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Savage Blade'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Savage Blade'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Savage Blade'].Fodder = set_combine(sets.precast.WS['Savage Blade'], {})

	sets.precast.WS['Vorpal Blade'] = sets.precast.WS['Chant du Cygne']
	sets.precast.WS['Vorpal Blade'].Acc = sets.precast.WS['Chant du Cygne'].Acc
	sets.precast.WS['Vorpal Blade'].FullAcc = sets.precast.WS['Chant du Cygne'].FullAcc
	sets.precast.WS['Vorpal Blade'].DT = sets.precast.WS['Chant du Cygne'].DT
	sets.precast.WS['Vorpal Blade'].Fodder = sets.precast.WS['Chant du Cygne'].Fodder

	sets.precast.WS['Expiacion'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Expiacion'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Expiacion'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Expiacion'].DT = set_combine(sets.precast.WS.DT, {})
	sets.precast.WS['Expiacion'].Fodder = set_combine(sets.precast.WS['Expiacion'], {})

	sets.precast.WS['Sanguine Blade'] = {}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {})

	sets.precast.WS['Flash Nova'] = {}
					 
	sets.precast.WS['Sanguine Blade'].DT = set_combine(sets.precast.WS.DT, {})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Telos Earring",ear2="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring",ear2="Brutal Earring"}

	-- Midcast Sets
	sets.midcast.FastRecast = {
		head="Carmine Mask +1",neck="Orunmila's Torque",
		body=gear.taeon_FC_body,hands="Leyline Gloves",ring1="Kishar Ring",ring2="Weather. Ring +1",
		waist="Witful Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}

	sets.midcast['Blue Magic'] = {}

	-- Physical Spells --

	sets.midcast['Blue Magic'].Physical = {}

	sets.midcast['Blue Magic'].Physical.Resistant = {}

	sets.midcast['Blue Magic'].Physical.Fodder = {}

	sets.midcast['Blue Magic'].PhysicalAcc = {}

	sets.midcast['Blue Magic'].PhysicalAcc.Resistant = set_combine(sets.midcast['Blue Magic'].PhysicalAcc, {})
	sets.midcast['Blue Magic'].PhysicalAcc.Fodder = sets.midcast['Blue Magic'].Fodder

	sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalStr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalStr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalDex.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalDex.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalVit.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalVit.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalAgi.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalInt.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalInt.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalMnd.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalChr.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalChr.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, {})
	sets.midcast['Blue Magic'].PhysicalHP.Resistant = set_combine(sets.midcast['Blue Magic'].Physical.Resistant, {})
	sets.midcast['Blue Magic'].PhysicalHP.Fodder = set_combine(sets.midcast['Blue Magic'].Physical.Fodder, {})

	-- Magical Spells --

	sets.midcast['Blue Magic'].Magical = {ammo="Pemphredo Tathlum",
		neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Cohort Cloak +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Metamor. Ring +1",
		back= "Aurist's Cape +1",waist="Acuity Belt +1",legs="Gyve Trousers",feet=gear.herculean_nuke_feet}
		 
	sets.midcast['Blue Magic'].Magical.SIRD = {ammo="Pemphredo Tathlum",
		neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Cohort Cloak +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Metamor. Ring +1",
		back= "Aurist's Cape +1",waist="Acuity Belt +1",legs="Gyve Trousers",feet=gear.herculean_nuke_feet}
		 
	sets.midcast['Blue Magic'].Subduction = {ammo="Pemphredo Tathlum",
		neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Cohort Cloak +1",hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Metamor. Ring +1",
		back= "Aurist's Cape +1",waist="Acuity Belt +1",legs="Gyve Trousers",feet=gear.herculean_nuke_feet}
					 
	sets.midcast['Blue Magic'].Magical.Proc = {ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",neck="Erra Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Kishar Ring",
		back= "Aurist's Cape +1",waist="Acuity Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
					 
	sets.midcast['Blue Magic'].Magical.Resistant = set_combine(sets.midcast['Blue Magic'].Magical,
		{})

	sets.midcast['Blue Magic'].Magical.Fodder = {}

	sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical, {})
	sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, {})

	sets.midcast['Blue Magic'].MagicAccuracy = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Crep. Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Leyline Gloves",ring1="Metamor. Ring +1",ring2="Weather. Ring +1",
		back= "Aurist's Cape +1",waist="Acuity Belt +1",legs="Aya. Cosciales +2",feet="Malignance Boots"}
		
	sets.midcast['Blue Magic'].Magical.FullMacc = sets.midcast['Blue Magic'].MagicAccuracy
	sets.midcast['Blue Magic'].Subduction.FullMacc = sets.midcast['Blue Magic'].MagicAccuracy

	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",neck="Erra Pendant",ear1="Crep. Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Weather. Ring +1",
		back= "Aurist's Cape +1",waist="Acuity Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.midcast['Dark Magic'] = sets.midcast['Blue Magic'].MagicAccuracy

	sets.midcast['Enhancing Magic'] = {}
		
	sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{})

	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck = "Stone Gorget",
--	legs="Haven Hose",
	waist="Siegel Sash"})

	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	sets.midcast['Divine Magic'] = {}

	sets.midcast['Elemental Magic'] = {}

	sets.midcast['Elemental Magic'].Resistant = {}

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic'].Resistant

	sets.element.Dark = {head="Pixie Hairpin +1",ring2="Archon Ring"}
	sets.element.Light = {ring2="Weather. Ring +1"}

	sets.midcast.Cure = {}
		
	sets.midcast.UnlockedCure = {}

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {})

	-- Breath Spells --

	sets.midcast['Blue Magic'].Breath = {}

	-- Physical Added Effect Spells most notably "Stun" spells --

	sets.midcast['Blue Magic'].Stun = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Crep. Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Weather. Ring +1",
		back= "Aurist's Cape +1",waist="Acuity Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.midcast['Blue Magic'].Stun.Resistant = {ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",neck="Erra Pendant",ear1="Crep. Earring",ear2="Digni. Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Weather. Ring +1",
		back= "Aurist's Cape +1",waist="Acuity Belt +1",legs="Malignance Tights",feet="Malignance Boots"}

	sets.midcast['Blue Magic'].Stun.Fodder = sets.midcast['Blue Magic'].Stun

	-- Other Specific Spells --

	sets.midcast['Blue Magic'].UnlockedAoEHealing = {}
					
	sets.midcast['Blue Magic'].AoEHealing = {}

	sets.midcast['Blue Magic'].Healing = {}
		
	sets.midcast['Blue Magic'].UnlockedHealing = {}

	sets.midcast['Blue Magic'].SkillBasedBuff = {}

	sets.midcast['Blue Magic'].Buff = {}

	sets.midcast['Blue Magic']['Battery Charge'] = set_combine(sets.midcast['Blue Magic'].Buff, {head="Amalric Coif +1",waist="Gishdubar Sash"})

	sets.midcast['Blue Magic']['Carcharian Verve'] = set_combine(sets.midcast['Blue Magic'].Buff, {})

	-- Sets to return to when not performing an action.

	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {}
	sets.DayIdle = {}
	sets.NightIdle = {}

	-- Gear for learning spells: +skill and AF hands.
	sets.Learning = {hands="Magus Bazubands"}

	-- Resting sets
	sets.resting = {ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=gear.adhemar_melee_hand,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Carmine Greaves +1",
    neck="Sanctity Necklace",
    waist="Grunfeld Rope",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Hetairoi Ring",
	}

	-- Idle sets
	sets.idle = {ammo="Ginsen",
    head="Malignance Chapeau",
    body="Jhakri Robe +2",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Loricate Torque +1",
    left_ear="Odnowa Earring +1",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
	}

	sets.idle.Sphere = set_combine(sets.idle, {})

	sets.idle.PDT = {ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=gear.adhemar_melee_hand,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Carmine Greaves +1",
    neck="Sanctity Necklace",
    waist="Grunfeld Rope",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Hetairoi Ring",
	}

	sets.idle.DTHippo = set_combine(sets.idle.PDT, {legs="Carmine Cuisses +1"})
	
	-- Defense sets
	sets.defense.PDT = {ammo="Ginsen",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Brutal Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
			    legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.MDT = {ammo="Ginsen",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Brutal Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
			    legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MEVA = {ammo="Ginsen",
			    head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Brutal Earring",
			    body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
			    legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.NukeLock = sets.midcast['Blue Magic'].Magical

	sets.Kiting = {legs="Carmine Cuisses +1"}

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
    sets.MP = {}
    sets.MP_Knockback = {}
	sets.SuppaBrutal = {}
	sets.DWEarrings = {}
	sets.DWMax = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Melee = {main="Naegling",sub="Sakpata's Sword"}
--	sets.weapons.Tizbron = {main="Tizona",sub="Thibron"}
--	sets.weapons.MeleeClubs = {main="Nehushtan",sub="Nehushtan"}
	sets.weapons.Almace = {main="Naegling",sub="Bunzi's Rod"}
	sets.weapons.Magic = {main="Sakpata's Sword",sub="Bunzi's Rod"}
--	sets.weapons.Kaja = {main="Naegling",sub="Almace"}
--	sets.weapons.MagicWeapons = {main="Nibiru Cudgel",sub="Nibiru Cudgel"}
--	sets.weapons.MaccWeapons = {main="Iris",sub="Iris"}
--	sets.weapons.HybridWeapons = {main="Vampirism",sub="Vampirism"}

	-- Engaged sets

	sets.engaged = {ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Adhemar Jacket +1",
    hands=gear.adhemar_melee_hand,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Carmine Greaves +1",
    neck="Sanctity Necklace",
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Hetairoi Ring",}

	sets.engaged.AM = {}


	sets.engaged.Acc = {}

	sets.engaged.Acc.AM = {}

	sets.engaged.FullAcc = {}

	sets.engaged.FullAcc.AM = {}

	sets.engaged.Fodder = {}

	sets.engaged.Fodder.AM = {}

	sets.engaged.DT = {ammo="Ginsen",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Sanctity Necklace",
    waist="Sailfi Belt +1",
    left_ear="Brutal Earring",
    right_ear="Telos Earring",
    left_ring="Epona's Ring",
    right_ring="Hetairoi Ring",}

	sets.engaged.DT.AM = {}

	sets.engaged.Acc.DT = {}
				
	sets.engaged.Acc.DT.AM = {}

	sets.engaged.FullAcc.DT = {}

	sets.engaged.Fodder.DT = {}

	sets.engaged.Fodder.DT.AM = {}

	sets.Self_Healing = {legs="Gyve Trousers",waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	sets.MagicBurst = {body="Samnuha Coat",hands="Amalric Gages +1"}
	sets.Phalanx_Received = {}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
		set_macro_page(1, 7)
end

autows_list = {
	['Melee']='Savage Blade',['Magic']='Savage Blade',['Almace']='Savage Blade',
--	['MeleeClubs']='Realmrazer',['HybridWeapons']='Sanguine Blade',['Naegbron']='Savage Blade',['Naegmace']='Savage Blade'
     }