/obj/item/reagent_containers/glass/cheese_mold
	name = "Cheese mold"
	desc = "A mold for cheese making"
	icon_state = "cheese_mold"
	volume = 60
	var/cheese_inside = FALSE

/obj/item/reagent_containers/glass/cheese_mold/update_icon_state()
	. = ..()
	if(cheese_inside)
		icon_state = "[initial(icon_state)]_full"
	else
		icon_state = initial(icon_state)

/obj/item/reagent_containers/glass/cheese_mold/attack_self(mob/user)
	if(cheese_inside)
		drop_cheese()
		return
	. = ..()

/obj/item/reagent_containers/glass/cheese_mold/afterattack(obj/target, mob/user, proximity)
	if(cheese_inside)
		drop_cheese()
		return
	. = ..()

/obj/item/reagent_containers/glass/cheese_mold/attack(mob/M, mob/user, obj/target)
	if(cheese_inside)
		drop_cheese()
		return
	. = ..()

/obj/item/reagent_containers/glass/cheese_mold/proc/add_cheese(obj/item/reagent_containers/food/snacks/store/cheesewheel/CW)
	cheese_inside = CW
	volume = 0
	update_icon_state()

/obj/item/reagent_containers/glass/cheese_mold/proc/drop_cheese()
	new cheese_inside(drop_location())
	volume = initial(volume)
	cheese_inside = FALSE
	update_icon_state()
