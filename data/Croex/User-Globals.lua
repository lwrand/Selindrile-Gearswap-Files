send_command('bind !@^c gs c cycle CraftingMode') --Turns auto-ws mode on and off.
send_command('bind !@^v gs c cycle CraftQuality') --Turns auto-ws mode on and off.

function set_lockstyle_custom(styleid)
	add_to_chat(217, 'Style '..styleid..' is ON!')
    send_command('wait 4; input /lockstyleset ' .. styleid)
end

sets.precast.FC.Trust =  {
	body="Yoran Unity Shirt"
}
