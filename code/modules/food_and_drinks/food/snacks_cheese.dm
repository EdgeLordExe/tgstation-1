/obj/item/reagent_containers/food/snacks/store/cheesewheel
	name = "synth-cheese"
	desc = "Blandese piece of cheese in the galaxy"
	icon_state = "cheesewheel"
	slice_path = /obj/item/reagent_containers/food/snacks/cheesewedge
	slices_num = 5
	list_reagents = list(/datum/reagent/consumable/sugar = 30) //bad for your health
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("bland" = 1)
	foodtype = DAIRY
	value = FOOD_JUNK

/obj/item/reagent_containers/food/snacks/royalcheese
	name = "royal cheese"
	desc = "Ascend the throne. Consume the wheel. Feel the POWER."
	icon_state = "royalcheese"
	list_reagents = list(/datum/reagent/consumable/nutriment = 15, /datum/reagent/consumable/nutriment/vitamin = 5, /datum/reagent/gold = 20, /datum/reagent/toxin/mutagen = 5)
	w_class = WEIGHT_CLASS_BULKY
	tastes = list("cheese" = 4, "royalty" = 1)
	foodtype = DAIRY

/obj/item/reagent_containers/food/snacks/cheesewedge
	name = "synth-cheese wedge"
	desc = "Blandese piece of cheese in the galaxy. The cheese wheel it was cut from can't have gone far."
	icon_state = "cheesewedge"
	filling_color = "#c4b565"
	list_reagents = list(/datum/reagent/consumable/sugar = 7)
	tastes = list("bland" = 1)
	foodtype = DAIRY
	value = FOOD_WORTHLESS

/obj/item/reagent_containers/food/snacks/store/cheesewheel/cheddar
	name = "cheddar cheese"
	desc = "Classic cheese, quite basic."
	icon_state = "cheesewheel"
	slice_path = /obj/item/reagent_containers/food/snacks/cheesewedge/cheddar
	list_reagents = list(/datum/reagent/consumable/nutriment = 15, /datum/reagent/consumable/nutriment/vitamin = 5)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("cheddar" = 1)
	value = FOOD_FAST

/obj/item/reagent_containers/food/snacks/cheesewedge/cheddar
	name = "cheddar cheese wedge"
	desc = "Classic cheese, quite basic. Think of all the ways you can eat it!"
	icon_state = "cheesewedge"
	filling_color = "#ffd900"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1)
	tastes = list("cheddar" = 1)
	foodtype = DAIRY
	value = FOOD_JUNK
