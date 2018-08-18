#define MONGOOSE_BASE_PASSENGER_OFFSETS list("1" = list(0,13),"2" = list(0,13),"4" = list(-10,13),"8" = list(10,13))

/obj/vehicles/mongoose
	name = "M274 Ultra-Light All-Terrain Vehicle"
	desc = "Also known as the \"Mongoose\""

	icon = 'code/modules/halo/vehicles/mongoose.dmi'
	icon_state = "base"

	bound_height = 32
	bound_width = 32

	comp_prof = /datum/component_profile/mongoose

	vehicle_move_delay = 1

	occupants = list(1,0)
	exposed_positions = list("driver" = 10,"passenger" = 25)

	sprite_offsets = list("1" = list(0,3),"2" = list(0,3),"4" = list(0,3),"8" = list(0,3))

	vehicle_size = 16

/obj/vehicles/mongoose/update_object_sprites()
	. = ..()
	var/list/passengers = get_occupants_in_position("passenger")
	var/list/offsets_to_use = sprite_offsets["[dir]"]
	var/list/passenger_offset = MONGOOSE_BASE_PASSENGER_OFFSETS["[dir]"]
	if(isnull(passengers) || passengers.len == 0 || isnull(offsets_to_use))
		return
	for(var/mob/passenger in passengers)
		var/image/pass_img = image(passenger)
		pass_img.pixel_x = offsets_to_use[1] + passenger_offset[1]
		pass_img.pixel_y = offsets_to_use[2] + passenger_offset[2]
		if(dir == SOUTH)
			underlays += pass_img
		else
			overlays += pass_img

#undef MONGOOSE_BASE_PASSENGER_OFFSETS
//Mongoose component profile define//
/obj/item/vehicle_component/health_manager/mongoose
	resistances = list("brute"=30,"burn"=25,"emp"=15)

/datum/component_profile/mongoose
	vital_components = newlist(/obj/item/vehicle_component/health_manager/mongoose)
	cargo_capacity = 4 //Can hold, at max, a single normal
