/obj/machinery/plumbing/flux/stop_and_go
	var/emptying = FALSE

/obj/machinery/plumbing/flux/stop_and_go/Initialize(mapload, bolt)
	. = ..()
	AddComponent(/datum/component/plumbing/flux_stop_n_go, bolt)

/obj/machinery/plumbing/flux/stop_and_go/process()
	if(!length(reagents.reagent_list))
		emptying = 	FALSE
