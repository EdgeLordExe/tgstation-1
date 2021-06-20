/obj/item/clothing/under/gambeson
	name = "dwarven gambeson"
	desc = "It's a masterfully crafted suit of gambeson, fits perfectly as if you were born in it."
	icon = 'icons/obj/dwarven.dmi'
	worn_icon = 'icons/mob/clothing/under/misc.dmi'
	icon_state = "gambeson"
	can_adjust = FALSE
	armor = list(MELEE = 10, BULLET = 0, LASER = 5,ENERGY = 5, BOMB = 25, BIO = 0, RAD = 0, FIRE = 15, ACID = 0, WOUND = 5)

/obj/item/dwarven
	name = "dwarven base item"
	desc = "FUCKY WUCKY EOEOEOE."
	icon = 'icons/obj/dwarven.dmi'

	material_flags = MATERIAL_ADD_PREFIX | MATERIAL_GREYSCALE | MATERIAL_AFFECT_STATISTICS
	custom_materials = list(/datum/material/iron = 12000)  //Defaults to an Iron Mace.

/obj/item/dwarven/warpick
	name = "dwarven warpick"
	desc = "Tool used to break stone and crack bones through solid armor."
	force = 15
	throwforce = 10
	armour_penetration = 50
	tool_behaviour = TOOL_MINING
	toolspeed = 1.05 //slightly slower than normal pick
	w_class = WEIGHT_CLASS_NORMAL
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	usesound = list('sound/effects/picaxe1.ogg', 'sound/effects/picaxe2.ogg', 'sound/effects/picaxe3.ogg')
	attack_verb_continuous = list("hits", "pierces", "slices", "attacks")
	attack_verb_simple = list("hit", "pierce", "slice", "attack")

/obj/item/dwarven/waraxe
	name = "dwarven waraxe"
	desc = "Perfect for cutting off limbs, this weapons will devastate unarmored opponents."
	force = 15
	throwforce = 10
	w_class = WEIGHT_CLASS_NORMAL
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_BELT | ITEM_SLOT_BACK
	sharpness = SHARP_EDGED
	wound_bonus = 5
	bare_wound_bonus = 20
	hitsound = 'sound/weapons/bladeslice.ogg'
	attack_verb_continuous = list("hits", "dices", "slices", "attacks")
	attack_verb_simple = list("hit", "dices", "slice", "attack")

/obj/item/dwarven/waraxe/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/butchering, 100, 80, 0 , hitsound) //axes are not known for being precision butchering tools
