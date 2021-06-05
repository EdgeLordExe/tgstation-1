/datum/team/dwarven_empire
	name = "Dwarven Empire"
	show_roundend_report = FALSE
	var/list/players_spawned = new

/datum/antagonist/lava_dwarf
	name = "Lava Dwarf"
	job_rank = ROLE_LAVALAND
	show_in_antagpanel = FALSE
	show_to_ghosts = TRUE
	prevent_roundtype_conversion = FALSE
	antagpanel_category = "Lava Dwarves"
	var/datum/team/dwarven_empire/empire

/datum/antagonist/lava_dwarf/create_team(datum/team/team)
	if(team)
		dwarven_empire = team
		objectives |= dwarven_empire.objectives
	else
		dwarven_empire = new

/datum/antagonist/lava_dwarf/get_empire()
	return dwarven_empire

