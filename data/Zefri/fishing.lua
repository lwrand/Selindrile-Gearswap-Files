

windower.register_event(
    "incoming text",
    function(original, modified, mode)
			if original:contains("clamps onto your line") or original:contains("pulling at your line")  then
				coroutine.schedule(release, 1)
--				add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ rilascio ]->->->->->->->->->")
            elseif original:contains("hook!") or original:contains("angler")  then
				coroutine.schedule(catch, 3)
--				add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ abboccato ]->->->->->->->->->")
			elseif original:contains("anything") or original:contains("give up and reel") then
				coroutine.schedule(fish, 7)
--				add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ prossimo ]->->->->->->->->->")
			elseif original:contains("caught a") then
				coroutine.schedule(fish, 9)
--				add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ prossimo ]->->->->->->->->->")
			elseif original:contains("must wait") or original:contains("cannot fish") then
				coroutine.schedule(fish, 1)
--				add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ riprova ]->->->->->->->->->")
            end

    end
)

-- tirare la lenza
function fish(cmdParams)
		send_command('input /fish')
--		add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ pesco ]->->->->->->->->->")
end

-- prendere pesce
function catch(cmdParams)
		windower.send_command('keyboard_blockinput 1;setkey enter down;wait 0.2;setkey enter up;keyboard_blockinput 0')
--		add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ tirare su ]->->->->->->->->->")
end

-- rilasciare pesce (da testare)
function release(cmdParams)
		windower.send_command('keyboard_blockinput 1;setkey escape down;wait 0.2;setkey escape up;keyboard_blockinput 0')
		add_to_chat(204, "<-<-<-<-<-<-<-<-<-[ rilasciando ]->->->->->->->->->")
end