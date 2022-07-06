-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant', 'Fodder')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.HybridMode:options('Normal','DT')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','DualWeapons','DualLeadenRanged','DualAeolian','None')
	state.CompensatorMode:options('Always','300','1000','Never')

    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Chrono Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Hauksbok Bullet"
    options.ammo_warning_limit = 15
	rangedautowstp = 1250

	gear.tp_ranger_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	gear.snapshot_jse_back = {name="Camulus's Mantle",augments={'"Snapshot"+10',}}
	gear.tp_jse_back = {name="Camulus's Mantle",augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}}
	gear.ranger_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {name="Camulus's Mantle",augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}

    -- Additional local binds
    send_command('bind !` input /ra <t>')
	send_command('bind !^` gs c cycle ElementalMode')
	send_command('bind ^` gs c elemental quickdraw')
	send_command('bind ^@!` gs c cycle CastingMode')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')
	send_command('bind @pause roller roll')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {
--	body="Chasseur's Frac +1"
	}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
    sets.precast.FoldDoubleBust = {} --hands="Lanun Gants +1"

    sets.precast.CorsairRoll = {--main="Rostam",range="Compensator",
        head="Lanun Tricorne",neck="Regal Necklace",ear2="Sanare Earring",
        body="Lanun Frac +3",hands="Chasseur's Gants +1",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back=gear.snapshot_jse_back,legs="Desultor Tassets",feet="Malignance Boots"}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {}) --legs="Chas. Culottes +1"
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {}) --feet="Chass. Bottes +1"
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne +1"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants +1"})
    
    sets.precast.CorsairShot = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Petrov Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.precast.CorsairShot.Damage = {ammo=gear.QDbullet,
        head=gear.herculean_nuke_head,neck="Sanctity Necklace",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga. +1",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Yemaya Belt",legs=gear.herculean_mwsd_legs,feet="Lanun Bottes +3"}
	
    sets.precast.CorsairShot.Proc = {ammo=gear.RAbullet,
    	head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
        head="Malignance Chapeau",neck="Sanctity Necklace",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Metamor. Ring +1",ring2="Kishar Ring",
        back=gear.magic_wsd_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {
--	feet="Chass. Bottes +1"
	})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
		
	sets.Self_Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Carmine Mask +1",neck="Orunmila's Torque",
        body=gear.taeon_FC_body,hands="Leyline Gloves",ring1="Weather. Ring +1",
        feet="Carmine Greaves +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

    sets.precast.RA = {ammo=gear.RAbullet,
		head=gear.taeon_snap_head,
		body="Oshosi Vest",hands="Carmine Fin. Ga. +1",
		back=gear.snapshot_jse_back,waist="Yemaya Belt",legs="Oshosi Trousers",feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Dingir Ring",
        waist="Fotia Belt",legs=gear.herculean_rawsd_legs,feet="Lanun Bottes +3"}
		
    sets.precast.WS.Acc = {
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Dingir Ring",
        waist="Fotia Belt",legs=gear.herculean_rawsd_legs,feet="Lanun Bottes +3"}
		
    sets.precast.WS.Proc = {
		head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Dingir Ring",
        waist="Fotia Belt",legs=gear.herculean_rawsd_legs,feet="Lanun Bottes +3"}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {})

	sets.precast.WS['Evisceration'] = {}
		
	sets.precast.WS['Evisceration'].Acc = {}

	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
		head="Adhemar Bonnet +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Rufescent Ring",
        back=gear.magic_wsd_jse_back,waist="Grunfeld Rope",legs=gear.herculean_rawsd_legs,feet="Lanun Bottes +3"}

    sets.precast.WS['Savage Blade'].Acc = {ammo=gear.WSbullet,
		head="Adhemar Bonnet +1",neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Rufescent Ring",
        back=gear.magic_wsd_jse_back,waist="Grunfeld Rope",legs="Meg. Chausses +2",feet="Lanun Bottes +3"}
	
    sets.precast.WS['Last Stand'] = {ammo=gear.WSbullet,
		head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Dingir Ring",
		back=gear.magic_wsd_jse_back,waist="Fotia Belt",legs=gear.herculean_rawsd_legs,feet="Lanun Bottes +3"}

    sets.precast.WS['Last Stand'].Acc = {ammo=gear.WSbullet,
        head="Meghanada Visor +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.wsd_ranger_jse_back,waist="Fotia Belt",legs=gear.herculean_rawsd_legs,feet="Lanun Bottes +3"}
		
    sets.precast.WS['Detonator'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Detonator'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Slug Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Slug Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Numbing Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Numbing Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Sniper Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Sniper Shot'].Acc = sets.precast.WS['Last Stand'].Acc
    sets.precast.WS['Split Shot'] = sets.precast.WS['Last Stand']
    sets.precast.WS['Split Shot'].Acc = sets.precast.WS['Last Stand'].Acc
	
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
        head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga. +1",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Svelt. Gouriz +1",legs=gear.herculean_mwsd_legs,feet="Lanun Bottes +3"}
		
    sets.precast.WS['Leaden Salute'].Acc = {ammo=gear.MAbullet,
        head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga. +1",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Svelt. Gouriz +1",legs=gear.herculean_mwsd_legs,feet="Lanun Bottes +3"}

    sets.precast.WS['Aeolian Edge'] = {ammo=gear.QDbullet,
        head=gear.herculean_nuke_head,neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga. +1",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Svelt. Gouriz +1",legs=gear.herculean_mwsd_legs,feet="Lanun Bottes +3"}
		
    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
        head=gear.herculean_nuke_head,neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga. +1",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Svelt. Gouriz +1",legs=gear.herculean_mwsd_legs,feet="Lanun Bottes +3"}

    sets.precast.WS['Wildfire'].Acc = {ammo=gear.MAbullet,
        head=gear.herculean_nuke_head,neck="Sanctity Necklace",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Carmine Fin. Ga. +1",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Svelt. Gouriz +1",legs=gear.herculean_mwsd_legs,feet="Lanun Bottes +3"}
		
    sets.precast.WS['Hot Shot'] = sets.precast.WS['Wildfire']
    sets.precast.WS['Hot Shot'].Acc = sets.precast.WS['Wildfire'].Acc
		
		--Because omen skillchains.
    sets.precast.WS['Burning Blade'] = {}


	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Carmine Mask +1",neck="Orunmila's Torque",
        body=gear.taeon_FC_body,hands="Leyline Gloves",ring1="Weather. Ring +1",
        feet="Carmine Greaves +1"}
        
    -- Specific spells

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {ammo=gear.RAbullet,
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.buff['Triple Shot'] = {
--		body="Chasseur's Frac +1"
	}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
	sets.BulletPouch = {waist="Chr. Bul. Pouch"}

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.idle.PDT = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.idle.Refresh = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
    
    -- Defense sets
    sets.defense.PDT = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back=gear.tp_ranger_jse_back,legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back=gear.tp_ranger_jse_back,legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.defense.MEVA = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back=gear.tp_ranger_jse_back,legs="Malignance Tights",feet="Malignance Boots"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.DWMax = {}

	-- Weapons sets
	sets.weapons.Default = {main="Naegling",sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Demers. Degen +1",range="Anarchy +2"}
--	sets.weapons.DualLeadenRanged = {main="Naegling",sub="Demers. Degen +1",range="Anarchy +1"}
	sets.weapons.DualLeadenRanged = {main="Naegling",sub="Tauret",range="Fomalhaut"}
	sets.weapons.DualAeolian = {main="Tauret",sub="Demers. Degen +1",range="Fomalhaut"}
	
    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Samnuha Tights",feet="Carmine Greaves +1"}
    
    sets.engaged.Acc = {
		head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Samnuha Tights",feet="Carmine Greaves +1"}
		
    sets.engaged.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Brutal Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
    
    sets.engaged.Acc.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Brutal Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.engaged.DW = {
		head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.tp_ranger_jse_back,waist="Reiki Yotai",legs="Samnuha Tights",feet="Carmine Greaves +1"}
    
    sets.engaged.DW.Acc = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Brutal Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
        back=gear.tp_ranger_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.engaged.DW.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Brutal Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
    
    sets.engaged.DW.Acc.DT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Brutal Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Petrov Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
end

function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
        set_macro_page(1, 11)
		set_style(13) 
end

autows_list = {['Default']='Last Stand',['DualWeapons']='Savage Blade',['DualLeadenRanged']='Leaden Salute',['DualAeolian']='Aeolian Edge'}