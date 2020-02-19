#define UNUSABLE_QUALITY 0.7
#define SHODDY_QUALITY 0.8
#define POOR_QUALITY 0.9
#define NORMAL_QUALITY 1
#define GOOD_QUALITY 1.05
#define FINE_QUALITY 1.1
#define SUPERIOR_QUALITY 1.2
#define EXCEPTIONAL_QUALITY 1.3
#define MASTERFUL_QUALITY 1.4
#define ARTIFACT_QUALITY 1.4



///This Componenet handles adding quality to items
/datum/component/quality
	dupe_mode = COMPONENT_DUPE_UNIQUE_PASSARGS

	var/list/quality_levels = list(UNUSABLE_QUALITY,SHODDY_QUALITY,POOR_QUALITY,NORMAL_QUALITY,GOOD_QUALITY,FINE_QUALITY,SUPERIOR_QUALITY,EXCEPTIONAL_QUALITY,MASTERFUL_QUALITY,ARTIFACT_QUALITY )
	var/quality_level
	var/old_name

	var/obj/item/parent_item

	var/mob/living/carbon/human/creator
	var/datum/mind/creator_mind

///_Creator - mob that is the owner of the item, _skill - skill that the quality should be based off of, modifier- flat bonus towards quality.
/datum/component/quality/Initialize(mob/living/carbon/human/_creator,datum/skill/_skill)
	if(!isitem(parent) || !_creator)
		return COMPONENT_INCOMPATIBLE
	creator = _creator
	var/list/quality_bracket = creator.mind.get_skill_modifier(_skill, SKILL_QUALITY_MODIFIER)
	creator_mind =  creator?.mind
	parent_item = parent
	old_name = parent_item.name
	generate_quality(quality_bracket)
	apply_quality()

///Generates quality based off of skill level of the given skill
/datum/component/quality/proc/generate_quality(quality_bracket)
	quality_level = quality_levels[pickweight(quality_bracket)]
	message_admins(quality_level)
	return quality_level

///Applies quality to the item
/datum/component/quality/proc/apply_quality()
	var/quality = quality_levels[quality_level+1] //lists start with 1
	parent_item.force *= quality
	parent_item.throwforce *= quality
	parent_item.max_integrity += quality
	if(istype(parent_item,/obj/item/twohanded))
		var/obj/item/twohanded/twohanded_item = parent_item
		twohanded_item.force_unwielded *= quality // we dont know if it posses that var but it is still essential
		twohanded_item.force_wielded *= quality
	var/armor_qual = (quality - 1)*20
	parent_item.armor.modifyRating(armor_qual,armor_qual,armor_qual,armor_qual,armor_qual,armor_qual,armor_qual,armor_qual,armor_qual,armor_qual) // modifies all armor ratings
	parent_item.name = generate_name(old_name)

/datum/component/quality/proc/generate_name(var/oldname)
	switch(quality_level)
		if(0)
			return "Unusable [oldname]"
		if(1)
			return "Shoddy [oldname]"
		if(2)
			return "Poor [oldname]"
		if(3)
			return "Normal [oldname]"
		if(4)
			return "Well-done [oldname]"
		if(5)
			return "Finely-crafted [oldname]"
		if(6)
			return "Superior [oldname]"
		if(7)
			return "Exceptional [oldname]"
		if(8)
			return "Masterful [oldname]"
		if(9)
			return "Legendary [oldname]"
