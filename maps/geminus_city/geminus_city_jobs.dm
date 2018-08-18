
/datum/map/geminus_city
	allowed_jobs = list(/datum/job/colonist,/datum/job/innie_sympathiser,/datum/job/insurrectionist_recruiter,/datum/job/colonist_mayor,/datum/job/marine,/datum/job/marine_leader,/datum/job/police,/datum/job/cop)
	allowed_spawns = list("Colony Arrival Shuttle","UNSC Peacekeeping Ship","UNSC Peacekeeping Ship - Leader Quarters")

	default_spawn = "UNSC Peacekeeping Ship"

/datum/job/colonist
	title = "Colonist"
	total_positions = 20
	spawnpoint_override = "Colony Arrival Shuttle"
	selection_color = "#000000"
	faction_flag = COLONY
	supervisors = " the Colony Mayor"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	outfit_type = /decl/hierarchy/outfit/job/colonist
	latejoin_at_spawnpoints = FALSE
	access = list(access_janitor, access_maint_tunnels, access_research)
	alt_titles = list("Miner","Doctor","Nurse","Warehouse Worker","Construction Worker","Surgeon","Store Owner","Nightclub Owner","Secretary","Cargo Worker","Bartender","Cook","Chef","Farmer","Judge","Cargo Dock Worker","Lawyer","EMT","Paramedic","Bodyguard","Janitor")

/datum/job/innie_sympathiser
	title = "Colonist - Insurrectionist Sympathiser"
	total_positions = 5
	spawnpoint_override = "Colony Arrival Shuttle"
	selection_color = "#000000"
	faction_flag = INNIE
	supervisors = " the Colony Mayor and your local insurrection contact"

	create_record = 0
	account_allowed = 1
	generate_email = 0
	announced = FALSE
	outfit_type = /decl/hierarchy/outfit/job/colonist/innie_sympathiser

	latejoin_at_spawnpoints = FALSE
	access = list(access_janitor, access_maint_tunnels, access_research)

/datum/job/insurrectionist_recruiter
	title = "Colonist - Insurrectionist Recruiter"
	total_positions = 1
	head_position = 1
	spawnpoint_override = "Colony Arrival Shuttle"
	selection_color = "#000000"
	faction_flag = INNIE
	supervisors = " the Insurrection"

	create_record = 0
	account_allowed = 1
	generate_email = 0
	announced = FALSE
	loadout_allowed = TRUE
	outfit_type = /decl/hierarchy/outfit/job/colonist/innie_recruiter

	latejoin_at_spawnpoints = FALSE
	access = list(access_janitor, access_maint_tunnels, access_research)

/datum/job/colonist_mayor
	title = "Mayor"
	total_positions = 1
	head_position = 1
	spawnpoint_override = "Colony Arrival Shuttle"
	selection_color = "#000000"
	faction_flag = COLONY
	supervisors = " your citizens"

	create_record = 0
	account_allowed = 1
	generate_email = 0
	outfit_type = /decl/hierarchy/outfit/job/mayor

	latejoin_at_spawnpoints = FALSE
	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway)
	alt_titles = list("Governer")

/datum/job/marine
	title = "Marine"
	total_positions = 20
	selection_color = "#000000"
	faction_flag = UNSC
	supervisors = "the Marine Squad Leader"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	outfit_type = /decl/hierarchy/outfit/job/marine

	latejoin_at_spawnpoints = FALSE
	access = list(access_janitor, access_maint_tunnels, access_research)

/datum/job/marine_leader
	title = "Marine - Squad Leader"
	head_position = 1
	total_positions = 1
	selection_color = "#000000"
	faction_flag = UNSC
	supervisors = "UNSC Highcom"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	outfit_type = /decl/hierarchy/outfit/job/marine/leader

	latejoin_at_spawnpoints = FALSE
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks)

/datum/job/police
	title = "GCPD Officer"
	total_positions = 6
	spawnpoint_override = "Colony Arrival Shuttle"
	selection_color = "#000000"
	supervisors = " the Colony Mayor"
	create_record = 0
	faction_flag = COLONY
	account_allowed = 1
	announced = TRUE
	generate_email = 0
	loadout_allowed = TRUE
	outfit_type = /decl/hierarchy/outfit/job/police
	latejoin_at_spawnpoints = FALSE
	access = list(access_security, access_brig, access_maint_tunnels,
						access_external_airlocks, access_emergency_storage,
			            access_eva, access_sec_doors)
	alt_titles = list("GCPD SWAT Officer","GCPD Cadet","GCPD Detective","GCPD Forensic Scientist")

/datum/job/cop
	title = "Chief of Police"
	department = "Security"
	department_flag = SEC|COM
	total_positions = 1
	faction_flag = COLONY
	head_position = 1
	spawnpoint_override = "Colony Arrival Shuttle"
	selection_color = "#000000"
	supervisors = "the Colony Mayor"

	create_record = 0
	account_allowed = 1
	generate_email = 0

	loadout_allowed = TRUE
	outfit_type = /decl/hierarchy/outfit/job/cop

	latejoin_at_spawnpoints = FALSE
	access = list(access_security, access_eva, access_sec_doors, access_brig, access_armory,
			            access_forensics_lockers, access_morgue, access_maint_tunnels, access_all_personal_lockers,
			            access_research, access_engine, access_mining, access_medical, access_construction, access_mailsorting,
			            access_heads, access_hos, access_RC_announce, access_keycard_auth, access_gateway, access_external_airlocks)