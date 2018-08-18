//These circuits do filter_baying
/obj/item/integrated_circuit/filter_bay
	name = "filter_bay"
	desc = "You shall not pass!"
	complexity = 1
	inputs = list("input")
	outputs = list("output")
	activators = list("filter_bay")
	category = /obj/item/integrated_circuit/filter_bay

/obj/item/integrated_circuit/filter_bay/do_work()
	var/datum/integrated_io/I = inputs[1]
	set_pin_data(IC_OUTPUT, 1, may_pass(I.data) ? I.data : null)

/obj/item/integrated_circuit/filter_bay/proc/may_pass(var/input)
	return FALSE

/obj/item/integrated_circuit/filter_bay/ref
	extended_desc = "Uses heuristics and complex algoritms to match incoming data against its filter_baying parameters and occasionally produces both false positives and negatives."
	complexity = 10
	category = /obj/item/integrated_circuit/filter_bay/ref
	var/filter_bay_type

/obj/item/integrated_circuit/filter_bay/ref/may_pass(var/weakref/data)
	if(!(filter_bay_type && isweakref(data)))
		return FALSE
	var/weakref/wref = data
	return istype(wref.resolve(), filter_bay_type)

/obj/item/integrated_circuit/filter_bay/ref/mob
	name = "life filter_bay"
	desc = "Only allow refs belonging to more complex, currently or formerly, living but not necessarily biological entities through"
	complexity = 15
	icon_state = "filter_bay_mob"
	filter_bay_type = /mob/living

/obj/item/integrated_circuit/filter_bay/ref/mob/humanoid
	name = "humanoid filter_bay"
	desc = "Only allow refs belonging to humanoids (dead or alive) through"
	complexity = 25
	icon_state = "filter_bay_humanoid"
	filter_bay_type = /mob/living/carbon/human

/obj/item/integrated_circuit/filter_bay/ref/obj
	name = "object filter_bay"
	desc = "Allows most kinds of refs to pass, as long as they are not considered (once) living entities."
	icon_state = "filter_bay_obj"
	filter_bay_type = /obj

/obj/item/integrated_circuit/filter_bay/ref/obj/item
	name = "item filter_bay"
	desc = "Only allow refs belonging to minor items through, typically hand-held such."
	icon_state = "filter_bay_item"
	filter_bay_type = /obj/item

/obj/item/integrated_circuit/filter_bay/ref/obj/machinery
	name = "machinery filter_bay"
	desc = "Only allow refs belonging machinery or complex objects through, such as computers and consoles."
	complexity = 15
	icon_state = "filter_bay_machinery"
	filter_bay_type = /obj/machinery

/obj/item/integrated_circuit/filter_bay/ref/object/structure
	name = "machinery filter_bay"
	desc = "Only allow refs belonging larger objects and structures through, such as closets and beds."
	complexity = 15
	icon_state = "filter_bay_structure"
	filter_bay_type = /obj/structure

/obj/item/integrated_circuit/filter_bay/ref/custom
	name = "custom filter_bay"
	desc = "Allows custom filter_baying. Apply the circuit to the type of object to filter_bay on before assembly."
	description_info = "Application is done by click-drag-dropping the circuit unto an adjacent object that you wish to scan."
	complexity = 25
	size = 3
	icon_state = "filter_bay_custom"

/obj/item/integrated_circuit/filter_bay/ref/custom/may_pass(var/weakref/data)
	if(!filter_bay_type)
		return FALSE
	if(!isweakref(data))
		return FALSE
	var/weakref/wref = data
	return istype(wref.resolve(), filter_bay_type)

/obj/item/integrated_circuit/filter_bay/ref/custom/MouseDrop(var/atom/over_object)
	if(!CanMouseDrop(over_object))
		return

	add_fingerprint(usr)
	over_object.add_fingerprint(usr)

	filter_bay_type = over_object.type
	extended_desc = "[initial(extended_desc)] - This circuit heuristically filter_bays objects determined to be sufficiently similar to \an [over_object]."
	to_chat(usr, "<span class='notice'>You change the filter_baying parameter of \the [src] to objects similar to \the [over_object].</span>")
	return 1
