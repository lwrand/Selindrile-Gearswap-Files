-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder')
    state.HybridMode:options('Normal','DT')
    state.RangedMode:options('Normal', 'Acc')
    state.WeaponskillMode:options('Match','Normal','DT','SomeAcc','Acc','FullAcc','Fodder','Proc')
	state.IdleMode:options('Normal', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Aeneas','Aeolian','Savage','ProcWeapons','Evisceration','Twashtar','Throwing','Bow')

    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWMax','Parry'}
	state.AmbushMode = M(false, 'Ambush Mode')

	gear.stp_jse_back = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}}
	gear.wsd_jse_back = { name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}}

    -- Additional local binds
    send_command('bind ^` input /ja "Flee" <me>')
    send_command('bind !` input /ra <t>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind @f10 gs c toggle AmbushMode')
	send_command('bind ^backspace input /item "Thief\'s Tools" <t>')
	send_command('bind ^q gs c weapons ProcWeapons;gs c set WeaponSkillMode proc;')
	send_command('bind !q gs c weapons SwordThrowing')
	send_command('bind !backspace input /ja "Hide" <me>')
--	send_command('bind ^r gs c weapons Default;gs c set WeaponSkillMode match') --Requips weapons and gear.
--	send_command('bind !r gs c weapons MagicWeapons')
	send_command('bind ^\\\\ input /ja "Despoil" <t>')
	send_command('bind !\\\\ input /ja "Mug" <t>')
	send_command('bind @pause gs c toggle AutoBuffMode')


    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Special sets (required by rules)
    --------------------------------------

	sets.TreasureHunter = {hands="Plunderer's Armlets +3",waist="Chaac Belt",feet="Skulk. Poulaines +1"}
    sets.Kiting = {feet="Jute Boots +1"}

	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    sets.buff['Sneak Attack'] = {}
    sets.buff['Trick Attack'] = {}--"Pill. Armlets +3"

    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.Suppa = {}
	sets.DWEarrings = {}
	sets.DWMax = {}
	sets.Parry = {}
	sets.Ambush = {body="Plunderer's Vest +3"}
	
	-- Weapons sets
	sets.weapons.Aeneas = {main="Aeneas",sub="Twashtar"}
	sets.weapons.Aeolian = {main="Malevolence",sub="Malevolence"}
	sets.weapons.Twashtar = {main="Twashtar",sub="Fusetto +2"}
	sets.weapons.Savage = {main="Naegling",sub="Gleti's Knife"}
	sets.weapons.ProcWeapons = {main="Esikuva",sub="Qutrub Knife"}
	sets.weapons.Evisceration = {main="Tauret",sub="Gleti's Knife"}
	sets.weapons.Throwing = {main="Aeneas",sub="Gleti's Knife",range="Albin Bane",ammo=empty}
	sets.weapons.Bow = {main="Aeneas",sub="Fusetto +2",range="Ullr",ammo="Chapuli Arrow"}
	
    -- Actions we want to use to tag TH.
    sets.precast.Step = {}
		
    sets.precast.JA['Violent Flourish'] = {}
		
	sets.precast.JA['Animated Flourish'] = sets.TreasureHunter
	sets.precast.JA.Provoke = sets.TreasureHunter

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Collaborator'] = {} --head="Skulker's Bonnet"
    sets.precast.JA['Accomplice'] = {} --head="Skulker's Bonnet"
    sets.precast.JA['Flee'] = {} --feet="Pillager's Poulaines +1"
    sets.precast.JA['Hide'] = {body="Pillager's Vest +3"}
    sets.precast.JA['Conspirator'] = {} --body="Skulker's Vest"
    sets.precast.JA['Steal'] = {} --hands="Pill. Armlets +1"
	sets.precast.JA['Mug'] = {}
    sets.precast.JA['Despoil'] = {feet="Skulk. Poulaines +1"} --legs="Skulker's Culottes"
    sets.precast.JA['Perfect Dodge'] = {hands="Plun. Armlets +3"}
    sets.precast.JA['Feint'] = {legs="Plun. Culottes +3"}

    sets.precast.JA['Sneak Attack'] = sets.buff['Sneak Attack']
    sets.precast.JA['Trick Attack'] = sets.buff['Trick Attack']

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}

	sets.Self_Waltz = {}
		
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}


    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Sapience Orb",
		head="Herculean Helm",neck="Orunmila's Torque",
		body=gear.taeon_FC_body,hands="Leyline Gloves",ring1="Weather. Ring +1",
		}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})


    -- Ranged snapshot gear
    sets.precast.RA = {
    	head=gear.taeon_snap_head,
		waist="Yemaya Belt",feet="Meg. Jam. +2"}


    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {    ammo="Seeth. Bomblet +1",
    head="Pill. Bonnet +3",
    body="Plunderer's Vest +3",
    hands="Meg. Gloves +2",
    legs="Plun. Culottes +3",
    feet={ name="Lustra. Leggings +1", augments={'HP+65','STR+15','DEX+15',}},
    neck="Asn. Gorget +2",
    waist="Grunfeld Rope",
    left_ear="Moonshade Earring",
    right_ear="Odr Earring",
    left_ring="Ilabrat Ring",
    right_ring="Regal Ring",
    back=gear.wsd_jse_back
	}
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Rudra's Storm"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Rudra's Storm"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Rudra's Storm"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Rudra's Storm"].Fodder = set_combine(sets.precast.WS["Rudra's Storm"], {})
    sets.precast.WS["Rudra's Storm"].DT = set_combine(sets.precast.WS["Rudra's Storm"],{})
    sets.precast.WS["Rudra's Storm"].SA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",body="Plunderer's Vest +3"})
    sets.precast.WS["Rudra's Storm"].TA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",body="Plunderer's Vest +3"})
    sets.precast.WS["Rudra's Storm"].SATA = set_combine(sets.precast.WS["Rudra's Storm"].Fodder, {ammo="Yetshila +1",body="Plunderer's Vest +3"})

    sets.precast.WS["Mandalic Stab"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Mandalic Stab"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Mandalic Stab"].Acc = set_combine(sets.precast.WS.Acc, {})	sets.precast.WS["Mandalic Stab"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.wsd_jse_back})
    sets.precast.WS["Mandalic Stab"].Fodder = set_combine(sets.precast.WS["Mandalic Stab"], {})
    sets.precast.WS["Mandalic Stab"].SA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1",body="Plunderer's Vest +3"})
    sets.precast.WS["Mandalic Stab"].TA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1",body="Plunderer's Vest +3"})
    sets.precast.WS["Mandalic Stab"].SATA = set_combine(sets.precast.WS["Mandalic Stab"].Fodder, {ammo="Yetshila +1",body="Plunderer's Vest +3"})

    sets.precast.WS["Shark Bite"] = set_combine(sets.precast.WS, {})
    sets.precast.WS["Shark Bite"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS["Shark Bite"].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS["Shark Bite"].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS["Shark Bite"].Fodder = set_combine(sets.precast.WS["Shark Bite"], {})
    sets.precast.WS["Shark Bite"].SA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1",body="Plunderer's Vest +3"})
    sets.precast.WS["Shark Bite"].TA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1",body="Plunderer's Vest +3"})
    sets.precast.WS["Shark Bite"].SATA = set_combine(sets.precast.WS["Shark Bite"].Fodder, {ammo="Yetshila +1",body="Plunderer's Vest +3"})
	
    sets.precast.WS['Evisceration'] = set_combine(sets.precast.WS, {
	ammo="Yetshila +1",
    head="Adhemar Bonnet +1",
    body="Plunderer's Vest +3",
    hands=gear.adhemar_melee_hand,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet={ name="Lustra. Leggings +1", augments={'HP+65','STR+15','DEX+15',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Odr Earring",
    left_ring="Regal Ring",
    right_ring="Ilabrat Ring",
    back=gear.wsd_jse_back})
    sets.precast.WS['Evisceration'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Evisceration'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Evisceration'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
	sets.precast.WS['Evisceration'].Fodder = set_combine(sets.precast.WS['Evisceration'], {})
    sets.precast.WS['Evisceration'].SA = set_combine(sets.precast.WS['Evisceration'].Fodder, {})
    sets.precast.WS['Evisceration'].TA = set_combine(sets.precast.WS['Evisceration'].Fodder, {})
    sets.precast.WS['Evisceration'].SATA = set_combine(sets.precast.WS['Evisceration'].Fodder, {})

    sets.precast.WS["Savage Blade"] = set_combine(sets.precast.WS, {neck="Caro Necklace",ear1="Moonshade Earring",ear2="Ishvara Earring",body="Adhemar Jacket +1",back=gear.wsd_jse_back,waist="Sailfi Belt +1"})
    sets.precast.WS["Savage Blade"].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {neck="Caro Necklace",ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
    sets.precast.WS["Savage Blade"].Acc = set_combine(sets.precast.WS.Acc, {ear1="Moonshade Earring",body="Meg. Cuirie +2",back=gear.wsd_jse_back})
	sets.precast.WS["Savage Blade"].FullAcc = set_combine(sets.precast.WS.FullAcc, {back=gear.wsd_jse_back})
    sets.precast.WS["Savage Blade"].Fodder = set_combine(sets.precast.WS["Savage Blade"],{waist="Sailfi Belt +1"})
	sets.precast.WS["Savage Blade"].DT = set_combine(sets.precast.WS["Savage Blade"],{})
    sets.precast.WS["Savage Blade"].SA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2"})
    sets.precast.WS["Savage Blade"].TA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2"})
    sets.precast.WS["Savage Blade"].SATA = set_combine(sets.precast.WS["Savage Blade"].Fodder, {ammo="Yetshila +1",body="Meg. Cuirie +2"})

    sets.precast.WS.Proc = {}

    sets.precast.WS['Last Stand'] = {}
		
    sets.precast.WS['Empyreal Arrow'] = {}
		
    sets.precast.WS['Aeolian Edge'] = {ammo="Seeth. Bomblet +1",
        head=gear.herculean_nuke_head,neck="Baetyl Pendant",ear1="Friomisi Earring",ear2="Crematio Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Metamor. Ring +1",ring2="Shiva Ring +1",
        back=gear.wsd_jse_back,waist="Chaac Belt",legs="Nyame Flanchard",feet=gear.herculean_nuke_feet}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Sherida Earring"}
	sets.AccMaxTP = {}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {ammo="Sapience Orb",
		head="Herculean Helm",neck="Orunmila's Torque",
		body=gear.taeon_FC_body,hands="Leyline Gloves",ring1="Weather. Ring +1",
		}

    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {})

	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)

    -- Ranged gear

    sets.midcast.RA = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Dingir Ring",
        waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast.RA.Acc = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Dingir Ring",
        waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}

    --------------------------------------
    -- Idle/resting/defense sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {
	ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Mekosu. Harness",
    hands="Turms Mittens +1",
    legs="Malignance Tights",
    feet="Turms Leggings +1",
    neck="Loricate Torque +1",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
	waist="Reiki Yotai",
    back=gear.stp_jse_back
	}
		
    sets.idle.Sphere = set_combine(sets.idle, {body="Mekosu. Harness"})

    sets.idle.Weak = set_combine(sets.idle, {})

	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.ExtraRegen = {hands="Turms Mittens +1"}

    -- Defense sets

    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",left_ear="Telos Earring",right_ear="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        waist="Reiki Yotai",back=gear.stp_jse_back,legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",left_ear="Telos Earring",right_ear="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        waist="Reiki Yotai",back=gear.stp_jse_back,legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Loricate Torque +1",left_ear="Telos Earring",right_ear="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        waist="Reiki Yotai",back=gear.stp_jse_back,legs="Malignance Tights",feet="Malignance Boots"}


    --------------------------------------
    -- Melee sets  
    --------------------------------------

    -- Normal melee group
    sets.engaged = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Pillager's Vest +3",
    hands=gear.adhemar_melee_hand,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Plun. Poulaines +3",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Hetairoi Ring",
    back=gear.stp_jse_back
}

    sets.engaged.SomeAcc = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Pillager's Vest +3",
    hands="Plun. Armlets +3",
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Skulk. Poulaines +1",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Hetairoi Ring",
    back=gear.stp_jse_back
}
    
	sets.engaged.Acc = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Pillager's Vest +3",
    hands=gear.adhemar_melee_hand,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Plun. Poulaines +3",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Hetairoi Ring",
    back=gear.stp_jse_back
}
		
    sets.engaged.FullAcc = {
    ammo="Ginsen",
    head="Pill. Bonnet +3",
    body="Pillager's Vest +3",
    hands=gear.adhemar_melee_hand,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Plun. Poulaines +3",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Regal Ring",
    back=gear.stp_jse_back
}

    sets.engaged.Fodder = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Pillager's Vest +3",
    hands=gear.adhemar_melee_hand,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Plun. Poulaines +3",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Hetairoi Ring",
    back=gear.stp_jse_back
}

    sets.engaged.DT = {
    ammo="Ginsen",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Asn. Gorget +2",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Gere Ring",
    back=gear.stp_jse_back
}

    sets.engaged.SomeAcc.DT = {
    ammo="Ginsen",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Plun. Armlets +3",
    legs="Malignance Tights",
    feet="Skulk. Poulaines +1",
    neck="Loricate Torque +1",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back=gear.stp_jse_back
}
		
    sets.engaged.Acc.DT = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Pillager's Vest +3",
    hands=gear.adhemar_melee_hand,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Plun. Poulaines +3",
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Hetairoi Ring",
    back=gear.stp_jse_back
}

    sets.engaged.FullAcc.DT = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Pillager's Vest +3",
    hands=gear.adhemar_melee_hand,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Plun. Poulaines +3",
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Hetairoi Ring",
    back=gear.stp_jse_back
}
		
    sets.engaged.Fodder.DT = {
    ammo="Ginsen",
    head="Adhemar Bonnet +1",
    body="Pillager's Vest +3",
    hands=gear.adhemar_melee_hand,
    legs={ name="Samnuha Tights", augments={'STR+8','DEX+9','"Dbl.Atk."+3','"Triple Atk."+2',}},
    feet="Plun. Poulaines +3",
    neck="Iskur Gorget",
    waist="Reiki Yotai",
    left_ear="Telos Earring",
    right_ear="Sherida Earring",
    left_ring="Gere Ring",
    right_ring="Hetairoi Ring",
    back=gear.stp_jse_back
}
		
end

function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
set_macro_page(1, 3)
set_style(5) 
end
	state.Weapons:options('Aeneas','Aeolian','Savage','ProcWeapons','Evisceration','Twashtar','Throwing','Bow')

autows_list = {['Aeneas']="Rudra's Storm",['Aeolian']='Aeolian Edge',['Savage']='Savage Blade',['Evisceration']='Evisceration',['Twashtar']="Rudra's Storm",['Throwing']="Rudra's Storm",['Bow']='Empyreal Arrow'}