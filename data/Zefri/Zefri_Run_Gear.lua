function user_job_setup()

	state.OffenseMode:options('Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.HybridMode:options('Tank','Normal','DTLite','Resist')
	state.WeaponskillMode:options('Match','Normal','SomeAcc','Acc','HighAcc','FullAcc')
	state.CastingMode:options('Normal','SIRD','Resistant')
	state.PhysicalDefenseMode:options('PDT_HP' , 'PDT')
	state.MagicalDefenseMode:options('MDT','MDT_HP','BDT','BDT_HP')
	state.ResistDefenseMode:options('MEVA','MEVA_HP','Death','Charm','DTCharm')
	state.IdleMode:options('Tank','Normal','KiteTank','Sphere')
	state.Weapons:options('Epeolatry','Lionheart','Default')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	gear.STP_jse_back = { name="Ogma's cape", augments = { 'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Phys. dmg. taken-10%', } }
	gear.enmity_jse_back = { name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Parrying rate+5%',}}
	gear.DWSD_jse_back = { name = "Ogma's Cape", augments = { 'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%', } }
	gear.SWSD_jse_back = { name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',} }
	gear.FC_jse_back = { name = "Ogma's Cape", augments = { 'HP+60','Eva.+20 /Mag. Eva.+20','"Fast Cast"+10','Phys. dmg. taken-10%', } }
	
	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode; gs c toggle AutoBuffMode')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	
	select_default_macro_book()
end

function init_gear_sets()

    sets.Enmity = {
--		ammo = "Sapience Orb",
		head = "Halitus Helm",
		neck = "Futhark Torque +2",
		ear1 = "Friomisi Earring",
		ear2 = "Cryptic Earring",
		body = "Emet Harness +1",
		hands = "Kurys Gloves",
		ring1 = "Provocare Ring",
		ring2 = "Petrov Ring",
		back = gear.enmity_jse_back,
--		waist = "Goading belt",
		legs = "Nyame Flanchard",
		feet = "Rager Ledel. +1"}
		 
    sets.Enmity.SIRD = {
		ammo = "Staunch Tathlum +1",
		head = gear.taeon_SIRD_head,
		neck = "Moonbeam Necklace",
		ear1 = "Friomisi Earring",
		ear2 = "Cryptic Earring",
		body = gear.taeon_SIRD_body,
		hands = "Rawhide Gloves",
		ring1 = "Provocare Ring",
		ring2 = "Petrov Ring",
		back = gear.enmity_jse_back,
		waist = "Rumination Sash",
		legs = "Carmine Cuisses +1",
		feet = gear.taeon_phalanx_feet}

    sets.Enmity.DT = {
--		ammo = "Sapience Orb",
		head = "Halitus Helm",
		neck = "Futhark Torque +2",
		ear1 = "Friomisi Earring",
		ear2 = "Cryptic Earring",
		body = "Emet Harness +1",
		hands = "Kurys Gloves",
		ring1 = "Provocare Ring",
		ring2 = "Petrov Ring",
		back = gear.enmity_jse_back,
--		waist = "Goading belt",
		legs = "Nyame Flanchard",
		feet = "Rager Ledel. +1"}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist's coat +3",legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist Bottes +1"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Fu. Bandeau +3"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist Mitons"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +3"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's coat +3", legs="Futhark Trousers +1"})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist Bottes +1"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Fu. Bandeau +3"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist Mitons"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +1"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +3"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {
		ammo = "Pemphredo Tathlum",
--		head = "",
		neck = "Sanctity Necklace",
		ear1 = "Friomisi Earring",
		ear2 = "Crematio Earring",
		body = "Samnuha Coat",
		hands = "Leyline Gloves",
		ring1 = "Shiva Ring +1",
		ring2 = "Shiva Ring +1",
		back = "Evasionist's Cape",
		waist = "Acuity Belt +1",
--		legs = "Shned. Tights +1",
--		feet = gear.herculean_nuke_feet
}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']

	-- Gear for specific elemental nukes.
	sets.element.Dark = {head="Pixie Hairpin +1",ring1="Archon Ring"}

	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {head="Erilaz Galea +1",neck="Incanter's Torque",legs="Rune. Trousers +3"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {
		ammo = "Sapience Orb",
		head = "Rune. Bandeau +1",
		neck = "Orunmila's Torque",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = gear.taeon_FC_body,
		hands = "Leyline Gloves",
		ring1 = "Kishar Ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.FC_jse_back,
		waist = "Ioskeha Belt +1",
		legs = "Aya. Cosciales +2",
		feet = "Carmine Greaves +1"}
			
	sets.precast.FC.DT = {
		ammo = "Sapience Orb",
		head = "Rune. Bandeau +1",
		neck = "Orunmila's Torque",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = gear.taeon_FC_body,
		hands = "Leyline Gloves",
		ring1 = "Kishar Ring",
		ring2 = "Weather. Ring +1",
		back = gear.FC_jse_back,
		waist = "Ioskeha Belt +1",
		legs = "Aya. Cosciales +2",
		feet = "Carmine Greaves +1"}
			
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash", legs="Futhark Trousers +1"})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {
		ammo = "Seeth. Bomblet +1",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Adhemar Jacket +1",
		hands = "Futhark Mitons +3",
		ring1 = "Niqmaddu Ring",
		ring2 = "Regal Ring",
		back = gear.SWSD_jse_back,
		waist = "Fotia Belt",
		legs = "Meg. Chausses +2",
		feet = "Lustra. Leggings +1"}
		
	sets.precast.WS.SomeAcc = {
		ammo = "Seeth. Bomblet +1",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Adhemar Jacket +1",
		hands = "Futhark Mitons +3",
		ring1 = "Niqmaddu Ring",
		ring2 = "Regal Ring",
		back = gear.SWSD_jse_back,
		waist = "Fotia Belt",
		legs = "Meg. Chausses +2",
		feet = "Lustra. Leggings +1"}
		
	sets.precast.WS.Acc = {
		ammo = "Seeth. Bomblet +1",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Adhemar Jacket +1",
		hands = "Futhark Mitons +3",
		ring1 = "Niqmaddu Ring",
		ring2 = "Regal Ring",
		back = gear.SWSD_jse_back,
		waist = "Fotia Belt",
		legs = "Meg. Chausses +2",
		feet = "Lustra. Leggings +1"}
		
	sets.precast.WS.HighAcc = {
		ammo = "Seeth. Bomblet +1",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Adhemar Jacket +1",
		hands = "Futhark Mitons +3",
		ring1 = "Niqmaddu Ring",
		ring2 = "Regal Ring",
		back = gear.SWSD_jse_back,
		waist = "Fotia Belt",
		legs = "Meg. Chausses +2",
		feet = "Lustra. Leggings +1"}
		
	sets.precast.WS.FullAcc = {
		ammo = "Seeth. Bomblet +1",
		head = "Adhemar Bonnet +1",
		neck = "Fotia Gorget",
		ear1 = "Moonshade Earring",
		ear2 = "Sherida Earring",
		body = "Adhemar Jacket +1",
		hands = "Futhark Mitons +3",
		ring1 = "Niqmaddu Ring",
		ring2 = "Regal Ring",
		back = gear.SWSD_jse_back,
		waist = "Fotia Belt",
		legs = "Meg. Chausses +2",
		feet = "Lustra. Leggings +1"}

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})
    sets.precast.WS['Resolution'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Resolution'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{
		ammo="Knobkierrie",
		head ="Lustratio Cap +1",
		neck="Caro Necklace",
		ear1="Moonshade earring",
		ear2="Sherida Earring",
		body = "Adhemar Jacket +1",
		hands="Meghanada Gloves +2",
		ring1 = "Ilabrat Ring",
		ring2="Niqmaddu Ring",
		back=gear.DWSD_jse_back,
		waist="Grunfeld Rope",
		legs="Lustr. Subligar +1",
		feet="Lustra. Leggings +1"})
		
    sets.precast.WS['Dimidiation'].SomeAcc = set_combine(sets.precast.WS['Dimidiation'],{neck = "Fotia Gorget", waist = "Fotia Belt"})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Dimidiation'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Dimidiation'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
	sets.precast.WS['Ground Strike'].HighAcc = set_combine(sets.precast.WS.HighAcc,{})
	sets.precast.WS['Ground Strike'].FullAcc = set_combine(sets.precast.WS.FullAcc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {
		ammo = "Sapience Orb",
		head = "Rune. Bandeau +1",
		neck = "Orunmila's Torque",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = gear.taeon_FC_body,
		hands = "Leyline Gloves",
		ring1 = "Kishar Ring",
		ring2 = "Weather. Ring +1",
		back = gear.FC_jse_back,
		waist = "Ioskeha Belt +1",
		legs = "Aya. Cosciales +2",
		feet = "Carmine Greaves +1"}
			
	sets.midcast.FastRecast.DT = {
		ammo = "Sapience Orb",
		head = "Rune. Bandeau +1",
		neck = "Orunmila's Torque",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = gear.taeon_FC_body,
		hands = "Leyline Gloves",
		ring1 = "Kishar Ring",
		ring2 = "Weather. Ring +1",
		back = gear.FC_jse_back,
		waist = "Ioskeha Belt +1",
		legs = "Aya. Cosciales +2",
		feet = "Carmine Greaves +1"}
		
	sets.midcast.FastRecast.SIRD = {}

	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast,{
		ammo = "Sapience Orb",
		head = "Erilaz Galea +1",
		neck = "Incanter's Torque",
		ear1 = "Andoaa Earring",
		ear2 = "Mimir Earring",
		body = "Manasa Chasuble",
		hands = "Runeist Mitons",
		ring1 = "Defending Ring",
		ring2 = "Gelatinous Ring +1",
		back = "Merciful cape",
		waist = "Olympus sash",
		legs = "Carmine Cuisses +1",
		feet = "Turms Leggings +1"})

	sets.midcast['Enhancing Magic'].SIRD = set_combine(sets.midcast.FastRecast.SIRD,{})
	
    sets.midcast['Phalanx'] = set_combine(sets.midcast['Enhancing Magic'],{
		head = "Fu. Bandeau +3",
		body = gear.taeon_FC_body,
		hands = gear.taeon_phalanx_hands,
		legs = gear.taeon_phalanx_legs,
		feet = gear.taeon_phalanx_feet})	
	
	sets.Phalanx_Received = sets.midcast['Phalanx']
	
	sets.midcast['Phalanx'].SIRD = set_combine(sets.midcast.FastRecast.SIRD,{head = "Fu. Bandeau +3",
		body = gear.taeon_FC_body,
		hands = gear.taeon_phalanx_hands,
		legs = gear.taeon_phalanx_legs,
		feet = gear.taeon_phalanx_feet})	
	
    sets.midcast['Regen'] = set_combine(sets.Enmity.SIRD,{head="Rune. Bandeau +1",legs = "Futhark Trousers +1", hands = "Regal Gauntlets"}) 
	sets.midcast['Refresh'] = set_combine(sets.Enmity.SIRD,{head="Erilaz Galea +1",legs = "Futhark Trousers +1", hands = "Regal Gauntlets"})  
    sets.midcast.Stoneskin = set_combine(sets.Enmity.SIRD, {
	neck = "Stone Gorget",
--	legs="Haven Hose",
	waist="Siegel Sash"
	})
	sets.midcast.Blink = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Aquaveil = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Flash.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Foil = set_combine(sets.Enmity.SIRD, {hands = "Regal Gauntlets"}) 
	sets.midcast.Foil.DT = set_combine(sets.Enmity.DT, {hands = "Regal Gauntlets"}) 
	sets.midcast.Crusade = set_combine(sets.Enmity.SIRD, {hands = "Regal Gauntlets"}) 
	sets.midcast.Crusade.DT = set_combine(sets.Enmity.SIRD, {hands = "Regal Gauntlets"})
	sets.midcast.Poisonga = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Poisonga.DT = set_combine(sets.Enmity.SIRD, {}) 
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast.Stun.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast.Jettatura = set_combine(sets.Enmity, {})
	sets.midcast.Jettatura.DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.DT, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})

    sets.midcast.Cure = {}
		
	sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {}
	
    sets.midcast.Protect = set_combine(sets.Enmity.SIRD,{hands = "Regal Gauntlets",ring2="Sheltered Ring"})  
    sets.midcast.Shell = set_combine(sets.Enmity.SIRD,{hands = "Regal Gauntlets",ring2="Sheltered Ring"})  

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {
		ammo = "Homiliary",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = "Runeist's Coat +3",
		hands = "Nyame Gauntlets",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet="Nyame Sollerets",}
		
    sets.idle.Sphere = set_combine(sets.idle,{body="Mekosu. Harness"})
			
	sets.idle.Tank = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet="Turms Leggings +1",}
		
	sets.idle.KiteTank = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Carmine Cuisses +1",
		feet="Turms Leggings +1",}

	sets.idle.Weak = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet="Turms Leggings +1",}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.Knockback = {}
    sets.MP = {
--	ear2="Ethereal Earring",waist="Engraved Belt"
	}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Epeolatry = {main="Epeolatry", sub="Utu Grip"}
	sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}
	sets.weapons.Default = {}
	
	-- Defense Sets
	
	sets.defense.PDT = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet="Turms Leggings +1",}
	sets.defense.PDT_HP = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet="Turms Leggings +1",}
		
	sets.defense.MDT = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet="Turms Leggings +1",}
	sets.defense.MDT_HP = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet="Turms Leggings +1",}
	sets.defense.MEVA = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet="Turms Leggings +1",}
	sets.defense.MEVA_HP = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet="Turms Leggings +1",}
		
	sets.defense.Death = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet="Turms Leggings +1",}

	sets.defense.DTCharm = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet="Turms Leggings +1",}
		
	sets.defense.Charm = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet="Turms Leggings +1",}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {
		ammo = "Ginsen",
		head = "Adhemar Bonnet +1",
		neck = "Anu Torque",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Adhemar Jacket +1",
		hands = gear.adhemar_melee_hand,
		ring1 = "Niqmaddu Ring",
		ring2 = "Epona's ring",
		back = gear.STP_jse_back,
		waist = "Ioskeha Belt +1",
		legs = "Samnuha Tights",
		feet = "Carmine Greaves +1"}
    sets.engaged.SomeAcc = set_combine(sets.engaged, {})
	sets.engaged.Acc = set_combine(sets.engaged, {})
	sets.engaged.HighAcc = set_combine(sets.engaged, {})
	sets.engaged.FullAcc = set_combine(sets.engaged, {})
	
    sets.engaged.Tank = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Sanare Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Nyame Flanchard",
		feet="Turms Leggings +1",}
    sets.engaged.SomeAcc.Tank = set_combine(sets.Turtle, {})
	sets.engaged.Acc.Tank = set_combine(sets.Turtle, {})
	sets.engaged.HighAcc.Tank = set_combine(sets.Turtle, {})
	sets.engaged.FullAcc.Tank = set_combine(sets.Turtle, {})

    sets.engaged.DTLite = {
		ammo = "Ginsen",
		head = "Adhemar Bonnet +1",
		neck = "Anu Torque",
		ear1 = "Brutal Earring",
		ear2 = "Sherida Earring",
		body = "Ayanmo Corazza +2",
		hands = gear.adhemar_melee_hand,
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.STP_jse_back,
		waist = "Ioskeha Belt +1",
		legs = "Samnuha Tights",
		feet = "Carmine Greaves +1"}
    sets.engaged.SomeAcc.DTLite = set_combine(sets.DTLite, {})
	sets.engaged.Acc.DTLite = set_combine(sets.DTLite, {})
	sets.engaged.HighAcc.DTLite = set_combine(sets.DTLite, {})
	sets.engaged.FullAcc.DTLite = set_combine(sets.DTLite, {})
	
	sets.engaged.Resist = {
		ammo = "Yamarang",
		head = "Nyame Helm",
		neck = "Futhark Torque +2",
		ear1 = "Hearty Earring",
		ear2 = "Odnowa Earring +1",
		body = "Nyame Mail",
		hands = "Turms Mittens +1",
		ring1 = "Defending ring",
		ring2 = "Gelatinous Ring +1",
		back = gear.enmity_jse_back,
		waist = "Engraved Belt",
		legs = "Rune. Trousers +3",
		feet="Turms Leggings +1",}
    sets.engaged.SomeAcc.Resist = sets.engaged.Resist
	sets.engaged.Acc.Resist = sets.engaged.Resist
	sets.engaged.HighAcc.Resist = sets.engaged.Resist
	sets.engaged.FullAcc.Resist = sets.engaged.Resist
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	sets.buff.Battuta = {hands="Turms Mittens +1"}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.

function set_style(sheet)
    send_command('@input ;wait 5.0;input /lockstyleset '..sheet)
end

function select_default_macro_book()
	-- Default macro set/book
set_macro_page(2, 5)
set_style(19) 

end

autows_list = {['Epeolatry']='Dimidiation',['Lionheart']='Resolution'}