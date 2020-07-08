/obj/machinery/plumbing/flux/flux_sheetifier
	name = "flux compressor"
	desc = "Compresses flux into flux sheets that can be later processed into useful items."

	icon_state = "flux_collector"
	icon = 'icons/obj/plumbing/plumbers.dmi'
	density = FALSE
	buffer = 200


/obj/machinery/plumbing/flux/flux_sheetifier/Initialize(mapload, bolt)
	. = ..()
	AddComponent(/datum/component/plumbing/simple_demand, bolt)
	//generate()

/obj/machinery/plumbing/flux/flux_sheetifier/process()
	if(reagents.has_reagent(/datum/reagent/flux,buffer))
		new /obj/item/stack/sheet/mineral/flux(drop_location())
		reagents.remove_reagent(/datum/reagent/flux,buffer)
	//addtimer(CALLBACK(src, .proc/generate), 30 SECONDS)
