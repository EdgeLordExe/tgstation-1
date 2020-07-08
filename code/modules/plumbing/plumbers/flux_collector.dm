/obj/machinery/plumbing/flux/flux_collector
	name = "flux collector"
	desc = "Collects waste material from nearby machinery and puts it into plumbing network."

	icon_state = "flux_collector"
	icon = 'icons/obj/plumbing/plumbers.dmi'
	density = FALSE


/obj/machinery/plumbing/flux/flux_collector/Initialize(mapload, bolt)
	. = ..()
	AddComponent(/datum/component/plumbing/simple_supply, bolt)

/obj/machinery/plumbing/flux/flux_collector/process()
	for(var/obj/machinery/mach in spiral_range(3,src))
		var/amt = mach.remove_flux(10)
		reagents.add_reagent(/datum/reagent/flux,amt)

