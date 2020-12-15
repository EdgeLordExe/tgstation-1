/datum/antagonist/exile_thief
	name = "Exiled Thief"
	roundend_category = "Exiled Thief"
	antagpanel_category = "Exiled Thief"
	antag_moodlet = /datum/mood_event/exile_thief
	job_rank = ROLE_EXILE_THIEF
	antag_hud_type = ANTAG_HUD_HERETIC
	antag_hud_name = "heretic"

	var/list/secrets_uncovered = list(EXILE_SECRET_CAT = FALSE, EXILE_SECRET_WOUNDS = FALSE, EXILE_SECRET_BROKEN_WEAPON = FALSE, EXILE_SECRET_MEDITATION = FALSE , EXILE_SECRET_KILLED_HUNTER = FALSE , EXILE_SECRET_KILLED_BOSS = FALSE, EXILE_SECRET_MAIMING = FALSE)
	var/lore_level = 1
	var/wound_level = 1
	var/trace_level = 0
	var/stagnation_level = 0

/datum/antagonist/exile_thief/greet()
	. = ..()
	//owner.current.playsound_local(get_turf(owner.current), 'sound/ambience/antag/ecult_op.ogg', 100, FALSE, pressure_affected = FALSE)//subject to change
	to_chat(owner, "<span class='boldannounce'>You are an Exiled Thief!</span><br>\
	Many days ago you stole <B> seven lives </B> from a powerful otherwordly know. <br>\
	Your goal is to survive the round alive, be it by killing ever more powerful members of <B> Eclipsus </B> <br>\
	and defeating your <B>Foe</B> or by escaping on the shuttle undetected. <br>\
	<B>YOU DO NOT GET MURDERBONE LICESNSE</B>, you are only allowed to kill people trying to capture you, be it security or eclipsus. <B>Otherwise standard escalation applies.</B>")

/datum/antagonist/exile_thief/proc/increase_lore(number as num)
	lore_level = min(lore_level + number , 6)

/datum/antagonist/exile_thief/proc/increase_wound(number as num)
	wound_level = min(wound_level + number, 7)

	if(wound_level == 7)

/datum/antagonist/exile_thief/proc/increase_trace(number as num)
	trace_level = min(trace_level + number, 5)

/datum/antagonist/exile_thief/proc/increase_stagnation(number as num)
	stagnation_level = min(stagnation_level + number, 10)

	if(stagnation_level == 10)
		stagnation_level = 0
		increase_trace(1)

/datum/antagonist/exile_thief/proc/uncover_secret(secret)
	if(secrets_uncovered[secret])
		return FALSE
	secrets_uncovered[secret] = TRUE
	increase_lore(1)

	if(prob(25))
		increase_trace(1)
