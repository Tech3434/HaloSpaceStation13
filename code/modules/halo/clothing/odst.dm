#define ODST_OVERRIDE 'code/modules/halo/clothing/odst.dmi'
#define ITEM_INHAND 'code/modules/halo/clothing/odst_items.dmi'

/obj/item/clothing/under/unsc/odst_jumpsuit
	name = "ODST jumpsuit"
	desc = "standard issue ODST jumpsuits, padded to provide a slight edge."
	icon = ITEM_INHAND
	icon_override = ODST_OVERRIDE
	item_state = "Jumpsuit"
	icon_state = "Jumpsuit"
	worn_state = "ODST Jumpsuit"
	item_icons = list(
		slot_l_hand_str = null,
		slot_r_hand_str = null,
		)

/obj/item/clothing/head/helmet/odst
	name = "ODST Helmet"
	desc = "Standard issue short-EVA capable helmet issued to ODST forces"
	icon = ITEM_INHAND
	icon_override = ODST_OVERRIDE
	item_state = "Odst Helmet"
	icon_state = "Helmet"
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL|AIRTIGHT
	body_parts_covered = HEAD|FACE
	flags_inv = HIDEMASK|HIDEEARS|HIDEEYES|BLOCKHAIR
	cold_protection = HEAD
	heat_protection = HEAD
	min_cold_protection_temperature = SPACE_HELMET_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = FIRE_HELMET_MAX_HEAT_PROTECTION_TEMPERATURE
	armor = list(melee = 60, bullet = 35, laser = 25,energy = 25, bomb = 25, bio = 0, rad = 5)
	item_icons = list(
		slot_l_hand_str = null,
		slot_r_hand_str = null,
		)

	action_button_name = "Toggle Helmet Light"
	light_overlay = "helmet_light"
	brightness_on = 4
	on = 0

	action_button_name = "Toggle Helmet Light"
	icon_state = "Odst Helmet Transparent"


	armor_thickness = 20




/obj/item/clothing/suit/armor/special/odst
	name = "ODST Armour"
	desc = "Lightweight, durable armour issued to Orbital Drop Shock Troopers for increased survivability in the field."
	icon = ITEM_INHAND
	icon_state = "Odst Armour"
	icon_override = ODST_OVERRIDE
	blood_overlay_type = "armor"
	armor = list(melee = 55, bullet = 45, laser = 55, energy = 45, bomb = 60, bio = 30, rad = 25)
	//specials = list(/datum/armourspecials/internal_air_tank/human) This line is disabled untill a dev can fix the internals code for it.
	item_flags = STOPPRESSUREDAMAGE|THICKMATERIAL
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	heat_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	min_cold_protection_temperature = SPACE_SUIT_MIN_COLD_PROTECTION_TEMPERATURE
	max_heat_protection_temperature = FIRESUIT_MAX_HEAT_PROTECTION_TEMPERATURE
	item_icons = list(
		slot_l_hand_str = null,
		slot_r_hand_str = null,
		)
	armor_thickness = 20


//Defines for armour subtypes//

/obj/effect/odst_armour_set
	var/obj/helmet = /obj/item/clothing/head/helmet/odst
	var/obj/armour = /obj/item/clothing/suit/armor/special/odst

/obj/effect/odst_armour_set/New()
	.=..()
	new helmet(src.loc)
	new armour(src.loc)

/obj/effect/odst_armour_set/Initialize()
	.=..()
	return INITIALIZE_HINT_QDEL

/obj/effect/odst_armour_set/cqb
	helmet = /obj/item/clothing/head/helmet/odst/cqb
	armour = /obj/item/clothing/suit/armor/special/odst/cqb

/obj/item/clothing/suit/armor/special/odst/cqb
	name = "ODST CQB Armour"

	icon_state = "Odst Armour CQB"

/obj/item/clothing/head/helmet/odst/cqb
	name = "ODST CQB Helmet"

	item_state = "Odst Helmet CQB"
	icon_state = "Helmet CQB"

/obj/effect/odst_armour_set/sharpshooter
	helmet = /obj/item/clothing/head/helmet/odst/sharpshooter
	armour = /obj/item/clothing/suit/armor/special/odst/sharpshooter

/obj/item/clothing/suit/armor/special/odst/sharpshooter
	name = "ODST Sharpshooter Armour"

	icon_state = "Odst Armour Sharpshooter"

/obj/item/clothing/head/helmet/odst/sharpshooter
	name = "ODST Sharpshooter Helmet"

	item_state = "Odst Helmet Sharpshooter"
	icon_state = "Helmet Sharpshooter"

/obj/effect/odst_armour_set/medic
	helmet = /obj/item/clothing/head/helmet/odst/medic
	armour = /obj/item/clothing/suit/armor/special/odst/medic

/obj/item/clothing/suit/armor/special/odst/medic
	name = "ODST Medic Armour"

	icon_state = "Odst Armour Medic"

/obj/item/clothing/head/helmet/odst/medic
	name = "ODST Medic Helmet"

	item_state = "Odst Helmet Medic"
	icon_state = "Helmet Medic"

/obj/effect/odst_armour_set/engineer
	helmet = /obj/item/clothing/head/helmet/odst/engineer
	armour = /obj/item/clothing/suit/armor/special/odst/engineer

/obj/item/clothing/head/helmet/odst/engineer
	name = "ODST Engineer Helmet"

	item_state = "Odst Helmet Engineer"
	icon_state = "Helmet Engineer"

/obj/item/clothing/suit/armor/special/odst/engineer
	name = "ODST Engineer Armour"

	icon_state = "Odst Armour Engineer"

/obj/effect/odst_armour_set/squadleader
	helmet = /obj/item/clothing/head/helmet/odst/squadleader
	armour = /obj/item/clothing/suit/armor/special/odst/squadleader

/obj/item/clothing/head/helmet/odst/squadleader
	name = "ODST Squad Leader Helmet"

	item_state = "Odst Helmet Squad Leader"
	icon_state = "Helmet Squad Leader"

/obj/item/clothing/suit/armor/special/odst/squadleader
	name = "ODST Squad Leader Armour"

	icon_state = "Odst Armor Squad Leader"

/obj/item/clothing/head/helmet/odst/donator/flaksim
	name = "Kashada's ODST Helmet"

	item_state = "Odst Helmet Flaksim"
	icon_state = "Odst Helmet Flaksim"

/obj/item/clothing/suit/armor/special/odst/donator/flaksim
	name = "Kashada's ODST Armour"

	icon_state = "Odst Armor Flaksim"

/obj/item/clothing/head/helmet/odst/donator/spartan
	name = "ODST Medic Helmet"

	item_state = "Odst Helmet Spartan"
	icon_state = "Odst Helmet Spartan"

/obj/item/clothing/suit/armor/special/odst/donator/spartan
	name = "ODST Squad Leader Armour"

	icon_state = "Odst Armor Spartan"

/obj/effect/random_ODST_set/New()
	.=..()
	var/obj/armour_set = pick(list(/obj/effect/odst_armour_set/medic,/obj/effect/odst_armour_set/sharpshooter,/obj/effect/odst_armour_set/cqb,/obj/effect/odst_armour_set,/obj/effect/odst_armour_set/engineer))
	new armour_set(src.loc)

/obj/effect/random_ODST_set/Initialize()
	.=..()
	return INITIALIZE_HINT_QDEL

/obj/item/clothing/accessory/storage/odst
	name = "Tactical Webbing"
	icon_state = "Tactical Webbing"

/obj/item/weapon/storage/backpack/odst/regular
	icon = ITEM_INHAND
	icon_override = ODST_OVERRIDE
	name = "Odst Backpack"
	item_state = "odst_b"
	icon_state = "odst_ba"


/obj/item/weapon/storage/backpack/odst/cqb
	icon = ITEM_INHAND
	icon_override = ODST_OVERRIDE
	name = "Odst Backpack CQB"
	item_state = "odst_c"
	icon_state = "odst_ca"


/obj/item/weapon/storage/backpack/odst/medic
	icon = ITEM_INHAND
	icon_override = ODST_OVERRIDE
	name = "Odst Backpack Medic"
	item_state = "odst_m"
	icon_state = "odst_ma"


/obj/item/weapon/storage/backpack/odst/sharpshooter
	icon = ITEM_INHAND
	icon_override = ODST_OVERRIDE
	name = "Odst Backpack Sharpshooter"
	item_state = "odst_s"
	icon_state = "odst_sa"


/obj/item/weapon/storage/backpack/odst/engineer
	icon = ITEM_INHAND
	icon_override = ODST_OVERRIDE
	name = "Odst Backpack Engineer"
	item_state = "odst_e"
	icon_state = "odst_ea"


/obj/item/weapon/storage/backpack/odst/squadlead
	icon = ITEM_INHAND
	icon_override = ODST_OVERRIDE
	name = "Odst Backpack Squad Leader"
	item_state = "odst_sl"
	icon_state = "odst_sla"

/obj/item/weapon/storage/backpack/odst/donator/flaksim
	icon = ITEM_INHAND
	icon_override = ODST_OVERRIDE
	name = "Kashada's Backpack"
	item_state = "Odst Flaksim Backpack"
	icon_state = "Odst Flaksim Backpack"

/obj/item/weapon/storage/backpack/odst/donator/spartan
	icon = ITEM_INHAND
	icon_override = ODST_OVERRIDE
	name = "Spartan's Backpack"
	item_state = "Odst Spartan Backpack"
	icon_state = "Odst Spartan Backpack"

#undef ODST_OVERRIDE
#undef ITEM_INHAND
