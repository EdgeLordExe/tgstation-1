/obj/machinery/plumbing/flux/flux_collector
	name = "flux collector"
	desc = "Collects waste material from nearby machinery and puts it into plumbing network."

	icon_state = "flux_collector"
	icon = 'icons/obj/plumbing/plumbers.dmi'
	density = FALSE
	var/max_drain = 5

/obj/machinery/plumbing/flux/flux_collector/Initialize(mapload, bolt)
	. = ..()
	AddComponent(/datum/component/plumbing/simple_supply, bolt)

/obj/machinery/plumbing/flux/flux_collector/process()
	var/list/process_list = list()
	for(var/obj/machinery/mach in range(3,src))
		if(mach.flux_gen <= 0)
			continue
		process_list += mach

	for(var/M in process_list)
		var/obj/machinery/mach = M

		var/amt = mach.remove_flux(max_drain/length(process_list))
		reagents.add_reagent(/datum/reagent/flux,amt)

