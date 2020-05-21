/datum/chemical_reaction/cheese
	required_container = /obj/item/reagent_containers/glass/cheese_mold
	var/result_cheese

/datum/chemical_reaction/cheese/on_reaction(datum/reagents/holder, created_volume)
	. = ..()
	var/obj/item/reagent_containers/glass/cheese_mold/CM = holder.my_atom
	CM.add_cheese(result_cheese)

/datum/chemical_reaction/cheese/synth_cheese
	required_reagents = list(/datum/reagent/consumable/milk = 40, /datum/reagent/consumable/enzyme = 5)
	result_cheese = /obj/item/reagent_containers/food/snacks/store/cheesewheel

/datum/chemical_reaction/cheese/cheddar
	required_reagents = list(/datum/reagent/consumable/milk = 40, /datum/reagent/consumable/sodiumchloride = 5,/datum/reagent/consumable/sugar = 5)
	result_cheese = /obj/item/reagent_containers/food/snacks/store/cheesewheel/cheddar
