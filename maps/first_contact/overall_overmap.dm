/obj/effect/overmap/ship/CCV_comet
	name = "Civilian Vessel"
	desc = "A Civilian vessel with a traditional cargo-hauler design."

	icon = 'maps/first_contact/freighter.dmi'
	icon_state = "ship"
	fore_dir = WEST

	map_bounds = list(102,160,154,117)

/obj/effect/overmap/ship/CCV_star
	name = "Civilian Vessel"
	desc = "A Civilian vessel with a traditional cargo-hauler design."

	icon = 'maps/first_contact/freighter.dmi'
	icon_state = "ship"
	fore_dir = WEST

	map_bounds = list(102,160,154,117) //Aah standardised designs.

/obj/effect/overmap/ship/CCV_sbs
	name = "CCV Slow But Steady"
	desc = "A cargo freighter with a safer, isolated design."

	icon = 'maps/first_contact/slowbutsteady.dmi'
	icon_state = "ship"
	fore_dir = WEST

	map_bounds = list(7,49,73,27)

/obj/effect/overmap/ship/unsc_corvette
	name = "UNSC Thorin"
	desc = "A standard contruction-model corvette."

	icon = 'maps/first_contact/corvette.dmi'
	icon_state = "ship"
	fore_dir = WEST

	map_bounds = list(2,76,76,26)


/obj/machinery/overmap_weapon_console/deck_gun_control/local/comet
	deck_gun_area = /area/om_ships/comet

/obj/machinery/overmap_weapon_console/deck_gun_control/local/missile_control/comet
	deck_gun_area = /area/om_ships/comet/cometrockets


