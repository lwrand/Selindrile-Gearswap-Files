
state.autoassist  	  = M(false, 'autoassist')
send_command('bind !a gs c autoassist')

windower.register_event(
    "incoming text",
    function(original, modified, mode)
	if state.autoassist.value==true then
			if original:contains("unable to buy") then
				coroutine.schedule(buy, 600)
--				add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ rilascio ]->->->->->->->->->")
            elseif original:contains("you buy the")  then
				coroutine.schedule(buy, 10)
--				add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ abboccato ]->->->->->->->->->")
            end
	end
    end
)

-- tirare la lenza
function buy(cmdParams)
		windower.send_command('bidder buy "S. Astral Detritus" 0 200000')
--		add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ pesco ]->->->->->->->->->")
end

function handle_aa()

	if state.autoassist.value==true then
		state.autoassist  	  = M(false, 'Autoassist')
		add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ ASSIST OFF ]->->->->->->->->->")
	else
		state.autoassist  	  = M(true, 'Autoassist')
		add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ ASSIST ON ]->->->->->->->->->")
	end

end

function user_self_command(commandArgs, eventArgs)
    if commandArgs[1]:lower() == 'autoassist' then
        handle_aa(commandArgs)
        eventArgs.handled = true
	end
end