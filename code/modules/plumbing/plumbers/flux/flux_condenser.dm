/obj/machinery/plumbing/flux/flux_condenser
	name = "flux collector"
	desc = "Collects waste material from nearby machinery and puts it into plumbing network."

	icon_state = "flux_collector"
	icon = 'icons/obj/plumbing/plumbers.dmi'
	density = FALSE
	var/emptying = FALSE

/obj/machinery/plumbing/flux/flux_condenser/Initialize(mapload, bolt)
	. = ..()
	AddComponent(/datum/component/plumbing/flux_condenser, bolt)

/obj/machinery/plumbing/flux/flux_condenser/process()
	if(reagents.has_reagent(/datum/reagent/flux,buffer))

		reagents.remove_reagent(/datum/reagent/flux,buffer)
		reagents.add_reagent(/datum/reagent/condensed_flux,1)
		emptying = 	TRUE

	if(!length(reagents.reagent_list))
		emptying = 	FALSE

