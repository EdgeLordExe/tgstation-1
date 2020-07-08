/datum/component/plumbing/flux_condenser
	demand_connects = WEST
	supply_connects = EAST
	var/obj/machinery/plumbing/flux/flux_condenser/FC

/datum/component/plumbing/flux_condenser/Initialize(start=TRUE, _turn_connects=TRUE)
	. = ..()
	if(!istype(parent, /obj/machinery/plumbing/flux/flux_condenser))
		return COMPONENT_INCOMPATIBLE
	FC = parent

/datum/component/plumbing/flux_condenser/can_give(amount, reagent)
	. = ..()
	if(. && FC.emptying)
		return TRUE
	return FALSE
///We're overriding process and not send_request, because all process does is do the requests, so we might aswell cut out the middle man and save some code from running
/datum/component/plumbing/flux_condenser/process()
	if(FC.emptying)
		return
	. = ..()
