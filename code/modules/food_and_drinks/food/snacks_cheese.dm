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
	list_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/vitamin = 5 ,/datum/reagent/medicine/morphine = 5)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("cheddar" = 1)
	value = FOOD_FAST

/obj/item/reagent_containers/food/snacks/cheesewedge/cheddar
	name = "cheddar cheese wedge"
	desc = "Classic cheese, quite basic. Think of all the ways you can eat it!"
	icon_state = "cheesewedge"
	filling_color = "#ffd900"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1 , /datum/reagent/medicine/morphine = 1)
	tastes = list("cheddar" = 1)
	foodtype = DAIRY
	value = FOOD_JUNK

/obj/item/reagent_containers/food/snacks/store/cheesewheel/gouda
	name = "gouda cheese"
	desc = "Gouda cheese, famous half-soft cheese originating from holland."
	icon_state = "cheesewheel"
	slice_path = /obj/item/reagent_containers/food/snacks/cheesewedge/gouda
	list_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/vitamin = 5,/datum/reagent/medicine/omnizine = 5)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("gouda" = 1)
	value = FOOD_FAST

/obj/item/reagent_containers/food/snacks/cheesewedge/gouda
	name = "gouda cheese wedge"
	desc = "Gouda cheese, famous half-soft cheese originating from holland. Think of all the ways you can eat it!"
	icon_state = "cheesewedge"
	filling_color = "#ff8800"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1 ,/datum/reagent/medicine/omnizine = 1)
	tastes = list("gouda" = 1)
	foodtype = DAIRY
	value = FOOD_JUNK

/obj/item/reagent_containers/food/snacks/store/cheesewheel/mozarella
	name = "mozarella cheese"
	desc = "Mozarella cheese, possibly the most common cheese that is, doesn't mean it isn't tasty!"
	icon_state = "cheesewheel"
	slice_path = /obj/item/reagent_containers/food/snacks/cheesewedge/mozarella
	list_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/vitamin = 5,/datum/reagent/water = 5)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("mozarella" = 1)
	value = FOOD_FAST

/obj/item/reagent_containers/food/snacks/cheesewedge/mozarella
	name = "mozarella cheese wedge"
	desc = "Mozarella cheese, possibly the most common cheese that is, doesn't mean it isn't tasty! Think of all the ways you can eat it!"
	icon_state = "cheesewedge"
	filling_color = "#ff8800"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1 ,/datum/reagent/water = 1)
	tastes = list("mozarella" = 1)
	foodtype = DAIRY
	value = FOOD_JUNK

/obj/item/reagent_containers/food/snacks/store/cheesewheel/feta
	name = "feta cheese"
	desc = "feta cheese, famous greek cheese that spread all over the world, you cannot quite replicate the famous greek flavour, but it will do."
	icon_state = "cheesewheel"
	slice_path = /obj/item/reagent_containers/food/snacks/cheesewedge/feta
	list_reagents = list(/datum/reagent/consumable/nutriment = 10, /datum/reagent/consumable/nutriment/vitamin = 5,/datum/reagent/water = 5)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("mozarella" = 1)
	value = FOOD_FAST

/obj/item/reagent_containers/food/snacks/cheesewedge/feta
	name = "feta cheese wedge"
	desc = "feta cheese, famous greek cheese that spread all over the world, you cannot quite replicate the famous greek flavour, but it will do. Think of all the ways you can eat it!"
	icon_state = "cheesewedge"
	filling_color = "#ff8800"
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/consumable/nutriment/vitamin = 1 ,/datum/reagent/water = 1)
	tastes = list("feta?" = 1)
	foodtype = DAIRY
	value = FOOD_JUNK
