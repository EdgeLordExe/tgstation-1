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
	generate()

/obj/machinery/plumbing/flux/flux_sheetifier/proc/generate()
	if(reagents.has_reagent(/datum/reagent/flux,buffer))
		new /obj/item/stack/sheet/mineral/flux(drop_location())
		reagents.remove_reagent(/datum/reagent/flux,buffer)
	addtimer(CALLBACK(src, .proc/generate), 30 SECONDS)


/obj/machinery/plumbing/flux/stop_and_go/flux_condenser
	name = "flux collector"
	desc = "Condenses raw flux into tar-like substance that takes much less space."

	icon_state = "flux_collector"
	icon = 'icons/obj/plumbing/plumbers.dmi'
	density = FALSE

/obj/machinery/plumbing/flux/stop_and_go/flux_condenser/process()
	if(reagents.has_reagent(/datum/reagent/flux,buffer))

		reagents.remove_reagent(/datum/reagent/flux,buffer)
		reagents.add_reagent(/datum/reagent/condensed_flux,1)
		emptying = 	TRUE

	return ..()

/obj/machinery/plumbing/flux/stop_and_go/flux_hydrolizer
	name = "flux hydrolizer"
	desc = "Hydrolizes flux into flux-hydrate. Passively uses hydrogen from the air surrounding it."

	icon_state = "flux_collector"
	icon = 'icons/obj/plumbing/plumbers.dmi'
	density = FALSE

/obj/machinery/plumbing/flux/stop_and_go/flux_hydrolizer/process_atmos()
	if(reagents.has_reagent(/datum/reagent/flux,buffer))
		var/datum/gas_mixture/env = L.return_air() //get air from the turf
		var/datum/gas_mixture/removed = env.remove(0.1 * env.total_moles())
		removed.assert_gases(/datum/gas/hydrogen)
		removed.gases[/datum/gas/hydrogen][MOLES] -= 3
		env.merge(removed) //put back the new gases in the turf
		air_update_turf()
		reagents.remove_reagent(/datum/reagent/flux,buffer)
		reagents.add_reagent(/datum/reagent/condensed_flux,1)
		emptying = TRUE
