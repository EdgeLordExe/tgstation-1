
/obj/machinery/life_support
	name = "Basic Life Support Unit"
	desc = "A bulky table with a lot of blinking lights installed and a small monitor that checks the users health."
	icon = 'icons/obj/machines/life_support.dmi'
	icon_state = "basic"
	density = TRUE
	anchored = TRUE
	mouse_drag_pointer = MOUSE_ACTIVE_POINTER
	circuit = /obj/item/circuitboard/machine/life_support
	idle_power_usage = 100
	active_power_usage = 500
	fair_market_price = 10
	payment_department = ACCOUNT_MED
	///Whos is attached to the life support.
	var/mob/living/carbon/attached
	///Maximum damage someone can have and still live while hooked up
	var/health_treshold = -200
	///Determines if this is active or not.
	var/active = TRUE

/obj/machinery/life_support/Initialize()
	. = ..()
	update_overlays()

/obj/machinery/life_support/update_overlays()
	. = ..()
	var/mutable_appearance/monitor_overlay
	if(machine_stat && (NOPOWER|BROKEN))
		monitor_overlay = mutable_appearance(icon,"nopower")
		. += monitor_overlay
		return

	if(!attached || !active)
		monitor_overlay=  mutable_appearance(icon,"noone")
		. += monitor_overlay
		return

	switch(attached.health)
		if(-INFINITY to HEALTH_THRESHOLD_DEAD)
			monitor_overlay= mutable_appearance(icon,"death")
		if(HEALTH_THRESHOLD_DEAD+1 to HEALTH_THRESHOLD_FULLCRIT)
			monitor_overlay= mutable_appearance(icon,"hardcrit")
		if(HEALTH_THRESHOLD_FULLCRIT+1 to HEALTH_THRESHOLD_CRIT)
			monitor_overlay= mutable_appearance(icon,"softcrit")
		if(1 to INFINITY)
			monitor_overlay= mutable_appearance(icon,"alive")
	. += monitor_overlay


/obj/machinery/life_support/wrench_act(mob/living/user, obj/item/I)
	. = ..()
	anchored = !anchored
	active = anchored
	return

/obj/machinery/life_support/MouseDrop(mob/living/target)
	. = ..()
	if(!ishuman(usr) || !usr.canUseTopic(src, BE_CLOSE) || !isliving(target))
		return

	if(attached)
		deactivate()
		attached = null
		update_overlays()
		update_icon()
		return

	if(!target.has_dna())
		to_chat(usr, "<span class='danger'>The drip beeps: \"warning, incompatible creature!\"</span>")
		return

	if(Adjacent(target) && usr.Adjacent(target))
		usr.visible_message("<span class='warning'>[usr] attaches [src] to [target].</span>", "<span class='notice'>You attach [src] to [target].</span>")
		add_fingerprint(usr)
		attached = target
		update_overlays()
		update_icon()
		START_PROCESSING(SSmachines, src)


/**
  * Properly gets rid of status effects from the attached
  *
  * Internal function, you really shouldn't be calling this since , unlike the name suggests it doesn't change the active var
  * , but instead gets rid of all relevant status effects from the attached.
  */
/obj/machinery/life_support/proc/deactivate()
	attached.remove_status_effect(STATUS_EFFECT_LIFE_SUPPORT, STASIS_MACHINE_EFFECT)
	attached.update_stat()
	use_power = IDLE_POWER_USE

/obj/machinery/life_support/process()
	update_overlays()
	update_icon()

	if(!attached || !active)
		return PROCESS_KILL

	if(NOPOWER || BROKEN)
		deactivate()
		return PROCESS_KILL

	if(!(get_dist(src, attached) <= 1 && isturf(attached.loc)))
		to_chat(attached, "<span class='userdanger'>The life support lines are ripped out of you!</span>")
		attached.apply_damage(15, BRUTE, pick(BODY_ZONE_R_ARM, BODY_ZONE_L_ARM))
		deactivate()
		attached = null
		update_icon()
		return PROCESS_KILL

	if(attached.health < health_treshold)
		deactivate()
		update_overlays()
		update_icon()
		return

	use_power = ACTIVE_POWER_USE
	attached.apply_status_effect(STATUS_EFFECT_LIFE_SUPPORT, STASIS_MACHINE_EFFECT)
	attached.update_stat()
	return

/obj/machinery/life_support/advanced
	name = "Advanced Life Support Unit"
	desc = "A miracle of space engineering, this machine allows you to indefinitely suspend someone in a stasis like state, but uses up massive amounts of electricity to do so."
	icon_state = "advanced"
	circuit = /obj/item/circuitboard/machine/life_support/advanced
	idle_power_usage = 250
	active_power_usage = 1000
	fair_market_price = 50
	health_treshold = -1000

/obj/machinery/life_support/mobile
	name = "Mobile Life Support Unit"
	desc = "A miracle of space engineering, allows you to suspend someone in a coma-like state, wherever you go!"
	icon_state = "mobile"
	circuit = /obj/item/circuitboard/machine/life_support/mobile
	idle_power_usage = 50
	active_power_usage = 200
	anchored = FALSE

/obj/machinery/life_support/mobile/wrench_act(mob/living/user, obj/item/I) //unewrenchable
	return
