-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DTLite','DT')
	state.RangedMode:options('Normal','Acc','Fodder')
	state.WeaponskillMode:options('Match','Normal', 'Acc')
	state.IdleMode:options('Normal', 'PDT')
	state.Weapons:options('DualMagicWeapons','Default','MagicWeapons','DualWeapons')
	
	WeaponType =  {['Fail-Not'] = "Bow",
                   ['Fomalhaut'] = "Gun",
				   ['Ataktos'] = "Gun",
				   ['Anarchy +2'] = "Gun",
				   ['Gastraphetes'] = "Crossbow",
                   }

	DefaultAmmo = {
		['Bow']  = {['Default'] = "Eminent Arrow",
					['WS'] = "Eminent Arrow",
					['Acc'] = "Eminent Arrow",
					['Magic'] = "Eminent Arrow",
					['MagicAcc'] = "Eminent Arrow",
					['Unlimited'] = "Hauksbok Arrow",
					['MagicUnlimited'] ="Hauksbok Arrow",
					['MagicAccUnlimited'] ="Hauksbok Arrow"},
					
		['Gun']  = {['Default'] = "Chrono Bullet",
					['WS'] = "Chrono Bullet",
					['Acc'] = "Chrono Bullet",
					['Magic'] = "Orichalc. Bullet",
					['MagicAcc'] = "Orichalc. Bullet",
					['Unlimited'] = "Hauksbok Bullet",
					['MagicUnlimited'] = "Hauksbok Bullet",
					['MagicAccUnlimited'] ="Animikii Bullet"},
					
		['Crossbow'] = {['Default'] = "Quelling Bolt",
						['WS'] = "Quelling Bolt",
						['Acc'] = "Quelling Bolt",
						['Magic'] = "Quelling Bolt",
						['MagicAcc'] = "Quelling Bolt",
						['Unlimited'] = "Hauksbok Bolt",
						['MagicUnlimited'] = "Hauksbok Bolt",
						['MagicAccUnlimited'] ="Hauksbok Bolt"}
	}
	
	gear.snap_ranger_jse_back = {name="Belenus's Cape",augments={'"Snapshot"+10',}}
	gear.tp_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}}
	gear.wsd_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}}
	gear.mwsd_ranger_jse_back = {name="Belenus's Cape",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	
	    -- Additional local binds
    send_command('bind !` input /ra <t>')
	send_command('bind !backspace input /ja "Bounty Shot" <t>')
	send_command('bind @f7 gs c toggle RngHelper')
	send_command('bind @` gs c cycle SkillchainMode')	
	select_default_macro_book()

end

-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------

	
	
	-- Precast sets to enhance JAs
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.precast.JA['Bounty Shot'] = set_combine(sets.TreasureHunter, {}) --hands="Amini Glove. +1"
	sets.precast.JA['Camouflage'] = {} --body="Orion Jerkin +1"
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +3"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +2"}
	sets.precast.JA['Double Shot'] = {body="Arc. Jerkin +3",back=gear.tp_ranger_jse_back}


	-- Fast cast sets for spells

    sets.precast.FC = {
        head="Carmine Mask +1",neck="Orunmila's Torque",
        body=gear.taeon_FC_body,hands="Leyline Gloves",ring1="Weather. Ring +1",
        feet="Carmine Greaves +1"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})


	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
		head=gear.taeon_snap_head,neck="Scout's Gorget +2",
		body="Oshosi Vest",hands="Carmine Fin. Ga. +1",
		back=gear.snap_ranger_jse_back,waist="Yemaya Belt",legs="Orion Braccae +2",feet="Meg. Jam. +2"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {body="Amini Caban +1",neck="Scout's Gorget +2",waist="Yemaya Belt"})
	sets.precast.RA.Flurry2 = set_combine(sets.precast.RA, {head="Orion Beret +3",body="Amini Caban +1",neck="Scout's Gorget +2",waist="Yemaya Belt",legs="Pursuer's Pants"})


	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
		head="Orion Beret +3",neck="Scout's Gorget +2",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.wsd_ranger_jse_back,waist="Fotia Belt",legs="Arc. Braccae +3",feet=gear.herculean_wsd_feet}
        
    sets.precast.WS.Acc = {
        head="Meghanada Visor +2",neck="Scout's Gorget +2",ear1="Moonshade Earring",ear2="Enervating Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Dingir Ring",
        back=gear.wsd_ranger_jse_back,waist="Fotia Belt",legs="Arc. Braccae +3",feet="Meg. Jam. +2"}
		
	sets.precast.WS['Ruinator'] = {}

    sets.precast.WS['Wildfire'] = {
        head="",neck="Scout's Gorget +2",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Cohort Cloak +1",hands="Carmine Fin. Ga. +1",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.mwsd_ranger_jse_back,waist="Eschan Stone",legs="Arc. Braccae +3",feet=gear.herculean_nuke_feet}

    sets.precast.WS['Wildfire'].Acc = {
        head="",neck="Scout's Gorget +2",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Cohort Cloak +1",hands="Carmine Fin. Ga. +1",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.mwsd_ranger_jse_back,waist="Eschan Stone",legs="Arc. Braccae +3",feet=gear.herculean_nuke_feet}
		
    sets.precast.WS['Aeolian Edge'] = {
        head="",neck="Scout's Gorget +2",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Cohort Cloak +1",hands="Carmine Fin. Ga. +1",ring1="Ilabrat Ring",ring2="Dingir Ring",
        back=gear.mwsd_ranger_jse_back,waist="Eschan Stone",legs="Arc. Braccae +3",feet=gear.herculean_nuke_feet}
		
    sets.precast.WS['Trueflight'] = {
        head="",neck="Scout's Gorget +2",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Cohort Cloak +1",hands="Carmine Fin. Ga. +1",ring1="Weather. Ring +1",ring2="Dingir Ring",
        back=gear.mwsd_ranger_jse_back,waist="Eschan Stone",legs="Arc. Braccae +3",feet=gear.herculean_nuke_feet}

    sets.precast.WS['Trueflight'].Acc = {
        head="",neck="Scout's Gorget +2",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Cohort Cloak +1",hands="Leyline Gloves",ring1="Weather. Ring +1",ring2="Dingir Ring",
        back=gear.mwsd_ranger_jse_back,waist="Eschan Stone",legs="Arc. Braccae +3",feet=gear.herculean_nuke_feet}
		
    sets.precast.WS['Savage Blade'] = {
		head="Orion Beret +3",neck="Scout's Gorget +2",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.wsd_ranger_jse_back,waist="Sailfi Belt +1",legs="Arc. Braccae +3",feet=gear.herculean_wsd_feet}

    sets.precast.WS['Savage Blade'].Acc = {
		head="Orion Beret +3",neck="Scout's Gorget +2",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Meg. Cuirie +2",hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",
        back=gear.wsd_ranger_jse_back,waist="Sailfi Belt +1",legs="Arc. Braccae +3",feet=gear.herculean_wsd_feet}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
    sets.midcast.FastRecast = {
        head="Carmine Mask +1",neck="Orunmila's Torque",
        body=gear.taeon_FC_body,hands="Leyline Gloves",ring1="Weather. Ring +1",
        feet="Carmine Greaves +1"}
		
	-- Ranged sets

    sets.midcast.RA = {
        head="Arcadian Beret +3",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Nisroch Jerkin",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
	
    sets.midcast.RA.Acc = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Nisroch Jerkin",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.midcast.RA.Fodder = {}
		
	--These sets will overlay based on accuracy level, regardless of other options.
	sets.buff.Camouflage = {} --body="Orion Jerkin +1"
	sets.buff.Camouflage.Acc = {}
	sets.buff['Double Shot'] = {body="Arc. Jerkin +3",back=gear.tp_ranger_jse_back}
	sets.buff['Double Shot'].Acc = {body="Arc. Jerkin +3",back=gear.tp_ranger_jse_back}
	sets.buff.Barrage = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Nisroch Jerkin",hands="Orion Bracers +3",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.tp_ranger_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
	
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {}

	-- Idle sets
    sets.idle = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Mecisto. Mantle",waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
    
    -- Defense sets
    sets.defense.PDT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Mecisto. Mantle",waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Mecisto. Mantle",waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.defense.MEVA = {
        head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sanare Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
        back="Mecisto. Mantle",waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.BulletPouch = {waist="Chr. Bul. Pouch"}
	
	-- Weapons sets
	sets.weapons.DualWeapons = {main="Naegling",sub="Gleti's Knife",range="Anarchy +2"}
--	sets.weapons.DualWeapons = {main="Malevolence",sub="Malevolence",range="Gastraphetes",ammo="Quelling Bolt"}
	sets.weapons.Default = {main="Perun +1",sub="Nusku Shield",range="Fomalhaut",ammo="Chrono Bullet"}
	sets.weapons.DualMagicWeapons = {main="Malevolence",sub="Malevolence",range="Gastraphetes",ammo="Quelling Bolt"}
	sets.weapons.MagicWeapons = {main="Malevolence",sub="Nusku Shield",range="Gastraphetes",ammo="Quelling Bolt"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    -- Normal melee group
    sets.engaged = {
		 head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		 body="Adhemar Jacket +1",hands=gear.adhemar_melee_hand,ring1="Epona's Ring",ring2="Hetairoi Ring",
		 back=gear.tp_ranger_jse_back,waist="Sailfi Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"
		}
    
    sets.engaged.Acc = {
		-- head="Dampening Tam",neck="Combatant's Torque",ear1="Cessance Earring",ear2="Telos Earring",
		-- body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
		-- back=gear.tp_ranger_jse_back,waist="Olseni Belt",legs="Samnuha Tights",feet=gear.herculean_acc_feet
		}
		
    sets.engaged.DTLite = {}
    		
    sets.engaged.DT = {}

    sets.engaged.DW = {
		 head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		 body="Adhemar Jacket +1",hands=gear.adhemar_melee_hand,ring1="Epona's Ring",ring2="Hetairoi Ring",
		 back=gear.tp_ranger_jse_back,waist="Sailfi Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"
		}
    
    sets.engaged.DW.DT = {
		 head="Malignance Chapeau",neck="Loricate Torque +1",ear1="Telos Earring",ear2="Sherida Earring",
		 body="Adhemar Jacket +1",hands=gear.adhemar_melee_hand,ring1="Epona's Ring",ring2="Defending Ring",
		 back=gear.tp_ranger_jse_back,waist="Sailfi Belt +1",legs="Samnuha Tights",feet="Carmine Greaves +1"
		}
		
    sets.engaged.DW.Acc = {}
    
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
end

function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 19)
	set_style(17) 
end

autows_list = {['DualWeapons']='Savage Blade',['Default']='Last Stand',['DualMagicWeapons']='Trueflight',['MagicWeapons']='Trueflight'}