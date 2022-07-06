-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','SomeAcc','Acc','FullAcc','Fodder','Crit')
    state.HybridMode:options('Normal','Evasion','PDT')
    state.RangedMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','FullAcc','Fodder','Proc')
    state.CastingMode:options('Normal','Proc','Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Sphere')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Heishi','LowBuff','MagicWeapons','ProcDagger','ProcSword','ProcGreatSword','ProcScythe','ProcPolearm','ProcGreatKatana','ProcKatana','ProcClub','ProcStaff')
	
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None','SuppaBrutal','DWEarrings','DWMax'}
	
	gear.fc_jse_back = {name="Andartia's Mantle", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Damage taken-5%',}}
	gear.da_jse_back = {name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Damage taken-5%',}}
	gear.int_jse_back = {name="Andartia's Mantle", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}
	gear.wsdmg_jse_back = { name="Andartia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	
	send_command('bind ^` gs c cycle Stance')
    send_command('bind !` gs c cycle magicburstmode')
	send_command('bind @` gs c cycle SkillchainMode')
--	send_command('bind !r gs c set WeaponskillMode Proc;gs c set CastingMode Proc;gs c update')
--	send_command('bind ^r gs c set WeaponskillMode Normal;gs c set CastingMode Normal;gs c update')
	
	utsusemi_cancel_delay = .3
	utsusemi_ni_cancel_delay = .06

	select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    sets.Enmity = {
		-- ammo="Paeapua",
        -- head="Dampening Tam",neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Trux Earring",
        -- body="Emet Harness +1",hands="Kurys Gloves",ring1="Gere Ring",ring2="Vengeful Ring",
        -- back="Moonlight Cape",waist="Goading Belt",legs=gear.herculean_dt_legs,feet="Amm Greaves"
		}
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {} --legs="Mochizuki Hakama"
    sets.precast.JA['Futae'] = {hands="Hattori Tekko +1"} 
    sets.precast.JA['Sange'] = {} --legs="Mochizuki Chainmail"
	sets.precast.JA['Provoke'] = sets.Enmity
	sets.precast.JA['Warcry'] = sets.Enmity

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
	
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
    sets.precast.Step = {}

    sets.precast.Flourish1 = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Sapience Orb",
        head="Herculean Helm",neck="Orunmila's Torque",
        body=gear.taeon_FC_body,hands="Leyline Gloves",ring1="Weather. Ring +1",ring2="Kishar Ring",
        back=gear.fc_jse_back,feet="Malignance Boots"}
		
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {}) --neck="Magoraga Beads",body="Passion Jacket",feet="Hattori Kyahan +1"
	sets.precast.FC.Shadows = set_combine(sets.precast.FC.Utsusemi, {}) --ammo="Staunch Tathlum",ring1="Prolix Ring"

    -- Snapshot for ranged
    sets.precast.RA = {}
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Seeth. Bomblet +1",
        head="Adhemar Bonnet +1",neck="Fotia Gorget",ear1="Telos Earring",ear2="Brutal Earring",
        body="Adhemar Jacket +1",hands="Mochizuki Tekko +3",ring1="Gere Ring",ring2="Regal Ring",
        back=gear.da_jse_back,waist="Fotia Belt",legs="Samnuha Tights",feet="Herculean Boots"}
    sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {})
	sets.precast.WS.FullAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Proc = {}
	
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	
	sets.precast.WS['Blade: Ku'] = set_combine(sets.precast.WS, {ear2="Odr Earring"})
    sets.precast.WS['Blade: Ku'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Blade: Ku'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Blade: Ku'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Ku'].Fodder = set_combine(sets.precast.WS['Blade: Ku'], {})
	
    sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Blade: Jin'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Blade: Jin'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Blade: Jin'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Jin'].Fodder = set_combine(sets.precast.WS['Blade: Jin'], {})
	
	sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Blade: Hi'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Blade: Hi'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Blade: Hi'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Hi'].Fodder = set_combine(sets.precast.WS['Blade: Hi'], {})

    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {})
    sets.precast.WS['Blade: Shun'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Blade: Shun'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Blade: Shun'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Shun'].Fodder = set_combine(sets.precast.WS['Blade: Shun'], {})

    sets.precast.WS['Blade: Ten'] = set_combine(sets.precast.WS, {back=gear.wsdmg_jse_back})
    sets.precast.WS['Blade: Ten'].SomeAcc = set_combine(sets.precast.WS.SomeAcc, {})
    sets.precast.WS['Blade: Ten'].Acc = set_combine(sets.precast.WS.Acc, {})
    sets.precast.WS['Blade: Ten'].FullAcc = set_combine(sets.precast.WS.FullAcc, {})
    sets.precast.WS['Blade: Ten'].Fodder = set_combine(sets.precast.WS['Blade: Ten'], {})
	
    sets.precast.WS['Aeolian Edge'] = {}
		
    sets.precast.WS['Blade: To'] = set_combine(sets.precast.WS, {
		ammo="Seeth. Bomblet +1",
        head="Mochi. Hatsuburi +3",neck="Baetyl Pendant",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Gyve Doublet",hands="Leyline Gloves",ring1="Gere Ring",ring2="Shiva Ring +1",
        back=gear.int_jse_back,legs="Gyve Trousers",feet=gear.herculean_nuke_feet
		})
    sets.precast.WS['Blade: Chi'] = set_combine(sets.precast.WS['Blade: To'], {})
    sets.precast.WS['Blade: Teki'] = set_combine(sets.precast.WS['Blade: To'], {})	

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",}
	sets.AccMaxTP = {}
	sets.AccDayMaxTPWSEars = {}
	sets.DayMaxTPWSEars = {}
	sets.AccDayWSEars = {}
	sets.DayWSEars = {}

    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {ammo="Sapience Orb",
        head="Herculean Helm",neck="Orunmila's Torque",
        body=gear.taeon_FC_body,hands="Leyline Gloves",ring1="Weather. Ring +1",ring2="Kishar Ring",
        back=gear.fc_jse_back,feet="Malignance Boots"}

    sets.midcast.ElementalNinjutsu = {ammo="Pemphredo Tathlum",
        head="Mochi. Hatsuburi +3",neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
        body="Gyve Doublet",hands="Leyline Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.int_jse_back,legs="Gyve Trousers",feet=gear.herculean_nuke_feet}
		
	sets.midcast.ElementalNinjutsu.Proc = sets.midcast.FastRecast

    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.ElementalNinjutsu, {})
	
	sets.MagicBurst = {body="Samnuha Coat",ring1="Mujin Band",ring2="Locus Ring"}
	
	sets.element.Earth = {} --neck="Quanpur Necklace"

    sets.midcast.NinjutsuDebuff = {ammo="Dosis Tathlum",
        head="Malignance Chapeau",neck="Incanter's Torque",ear1="Telos Earring",
        body="Malignance Tabard",hands="Mochizuki Tekko +3",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.int_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

    sets.midcast.NinjutsuBuff = set_combine(sets.midcast.FastRecast, {hands="Mochizuki Tekko +3"}) --back="Mujin Mantle"
	
    sets.midcast.Utsusemi = set_combine(sets.midcast.NinjutsuBuff, {back=gear.fc_jse_back,feet="Hattori Kyahan +1"}) 

    sets.midcast.RA = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.midcast.RA.Acc = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Enervating Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Ilabrat Ring",ring2="Regal Ring",
        waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------

    -- Resting sets
    sets.resting = {}

    -- Idle sets
    sets.idle = {ammo="Yamarang",
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

    sets.idle.PDT = {ammo="Yamarang",
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.idle.Sphere = set_combine(sets.idle, {}) --body="Mekosu. Harness"
		
    sets.idle.Weak = {ammo="Yamarang",
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
    
    -- Defense sets
    sets.defense.Evasion = {ammo="Yamarang",
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.PDT = {ammo="Yamarang",
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = {ammo="Yamarang",
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.defense.MEVA = {ammo="Yamarang",
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}


    sets.Kiting = {feet="Danzo Sune-Ate"}
	sets.DuskKiting = {}
	sets.DuskIdle = {}
	sets.DayIdle = {}
	sets.NightIdle = {}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {ammo="Date Shuriken",
        head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Reiki Yotai",legs="Samnuha Tights",feet="Malignance Boots"}
    sets.engaged.SomeAcc = {ammo="Shuriken",
        head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Reiki Yotai",legs="Samnuha Tights",feet="Malignance Boots"}
    sets.engaged.Acc = {ammo="Shuriken",
        head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Reiki Yotai",legs="Samnuha Tights",feet="Malignance Boots"}
    sets.engaged.FullAcc = {ammo="Shuriken",
        head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Reiki Yotai",legs="Samnuha Tights",feet="Malignance Boots"}
    sets.engaged.Fodder = {ammo="Shuriken",
        head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Reiki Yotai",legs="Samnuha Tights",feet="Malignance Boots"}
    sets.engaged.Crit = {ammo="Shuriken",
        head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Reiki Yotai",legs="Samnuha Tights",feet="Malignance Boots"}
    sets.engaged.Evasion = {ammo="Date Shuriken",
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.SomeAcc.Evasion = {ammo="Shuriken",
        head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Reiki Yotai",legs="Samnuha Tights",feet="Malignance Boots"}
    sets.engaged.Acc.Evasion = {ammo="Shuriken",
        head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Reiki Yotai",legs="Samnuha Tights",feet="Malignance Boots"}
    sets.engaged.FullAcc.Evasion = {ammo="Shuriken",
        head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Reiki Yotai",legs="Samnuha Tights",feet="Malignance Boots"}
    sets.engaged.PDT = {ammo="Yamarang",
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.SomeAcc.PDT = {ammo="Yamarang",
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.Acc.PDT = {ammo="Yamarang",
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.FullAcc.PDT = {ammo="Yamarang",
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
	sets.engaged.Fodder.PDT = {ammo="Yamarang",
		head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Epona's Ring",ring2="Gere Ring",
		back=gear.da_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {} --body="Hattori Ningi +1"
    sets.buff.Doom = set_combine(sets.buff.Doom, {})
    sets.buff.Yonin = {} --legs="Hattori Hakama +1"
    sets.buff.Innin = {} --head="Hattori Zukin +1"
    sets.buff.Futae = {hands="Hattori Tekko +1"}
	
	
    -- Extra Melee sets.  Apply these on top of melee sets.
    sets.Knockback = {}
	sets.SuppaBrutal = {}
	sets.DWEarrings = {}
	sets.DWMax = {}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	sets.Skillchain = {}
	
	-- Weapons sets
	sets.weapons.Heishi = {main="Gokotai",sub="Kunimitsu"}
--	sets.weapons.LowBuff = {main="Hachimonji"}
	sets.weapons.LowBuff = {main="Gokotai",sub="Kunimitsu"}
	sets.weapons.ProcDagger = {main="Esikuva",sub="Debahocho"}
	sets.weapons.ProcSword = {main="Blizzard Brand",sub="Esikuva"}
	sets.weapons.ProcGreatSword = {main="Ophidian Sword",sub=empty}
	sets.weapons.ProcScythe = {main="Lost Sickle",sub=empty}
	sets.weapons.ProcPolearm = {main="Pitchfork +1",sub=empty}
	sets.weapons.ProcGreatKatana = {main="Mutsunokami",sub=empty}
	sets.weapons.ProcKatana = {main="Debahocho",sub="Esikuva"}
	sets.weapons.ProcClub = {main="Soulflayer's Wand",sub="Esikuva"}
	sets.weapons.ProcStaff = {main="Ranine Staff",sub=empty}
	sets.weapons.MagicWeapons = {main="Gokotai",sub="Tauret"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'RNG' then
        set_macro_page(1, 12)
    elseif player.sub_job == 'RDM' then
        set_macro_page(1, 12)
    else
        set_macro_page(1, 12)
    end
end

autows_list = {['Heishi']='Blade: Shun',['LowBuff']='Blade: Ku'}