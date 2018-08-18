/datum/admin_secret_item/investigation/attack_logs
	name = "Attack Logs"
	var/list/filter_bays_per_client

/datum/admin_secret_item/investigation/attack_logs/New()
	..()
	filter_bays_per_client = list()

/datum/admin_secret_item/investigation/attack_logs/execute(var/mob/user)
	. = ..()
	if(!.)
		return
	var/dat = list()
	dat += "<a href='?src=\ref[src]'>Refresh</a> | "
	dat += get_filter_bay_html(user)
	dat += " | <a href='?src=\ref[src];reset=1'>Reset</a>"
	dat += "<HR>"
	dat += "<table border='1' style='width:100%;border-collapse:collapse;'>"
	dat += "<tr><th style='text-align:left;'>Time</th><th style='text-align:left;'>Attacker</th><th style='text-align:left;'>Intent</th><th style='text-align:left;'>Victim</th></tr>"

	for(var/log in attack_log_repository.attack_logs_)
		var/datum/attack_log/al = log
		if(filter_bay_log(user, al))
			continue

		dat += "<tr><td>[al.station_time]</td>"

		if(al.attacker)
			dat += "<td>[al.attacker.key_name(check_if_offline = FALSE)] <a HREF='?_src_=holder;adminplayeropts=[al.attacker.ref]'>PP</a></td>"
		else
			dat += "<td></td>"

		dat += "<td>[al.intent]</td>"

		if(al.victim)
			dat += "<td>[al.victim.key_name(check_if_offline = FALSE)] <a HREF='?_src_=holder;adminplayeropts=[al.victim.ref]'>PP</a></td>"
		else
			dat += "<td></td>"

		dat += "</tr>"
		dat += "<tr><td colspan=4>[al.message]"
		if(al.location)
			dat += " <a HREF='?_src_=holder;adminplayerobservecoodjump=1;X=[al.location.x];Y=[al.location.y];Z=[al.location.z]'>JMP</a>"
		dat += "</td></tr>"
	dat += "</table>"

	var/datum/browser/popup = new(user, "admin_attack_logs", "Attack Logs", 800, 400)
	popup.set_content(jointext(dat, null))
	popup.open()

/datum/admin_secret_item/investigation/attack_logs/Topic(href, href_list)
	. = ..()
	if(.)
		return
	if(href_list["refresh"])
		. = 1
	if(href_list["reset"])
		reset_user_filter_bays(usr)
		. = 1
	if(.)
		execute(usr)

/datum/admin_secret_item/investigation/attack_logs/proc/get_user_filter_bays(var/mob/user)
	if(!user.client)
		return list()

	. = filter_bays_per_client[user.client]
	if(!.)
		. = list()
		for(var/af_type in subtypesof(/attack_filter_bay))
			var/attack_filter_bay/af = af_type
			if(initial(af.category) == af_type)
				continue
			. += new af_type(src)
		filter_bays_per_client[user.client] = .

/datum/admin_secret_item/investigation/attack_logs/proc/get_filter_bay_html(user)
	. = list()
	for(var/filter_bay in get_user_filter_bays(user))
		var/attack_filter_bay/af = filter_bay
		. += af.get_html()
	. = jointext(.," | ")

/datum/admin_secret_item/investigation/attack_logs/proc/filter_bay_log(user, var/datum/attack_log/al)
	for(var/filter_bay in get_user_filter_bays(user))
		var/attack_filter_bay/af = filter_bay
		if(af.filter_bay_attack(al))
			return TRUE
	return FALSE

/datum/admin_secret_item/investigation/attack_logs/proc/reset_user_filter_bays(user)
	for(var/filter_bay in get_user_filter_bays(user))
		var/attack_filter_bay/af = filter_bay
		af.reset()

/attack_filter_bay
	var/category = /attack_filter_bay
	var/datum/admin_secret_item/investigation/attack_logs/holder

/attack_filter_bay/New(var/holder)
	..()
	src.holder = holder

/attack_filter_bay/Topic(href, href_list)
	if(..())
		return TRUE
	if(OnTopic(href_list))
		holder.execute(usr)
		return TRUE

/attack_filter_bay/proc/get_html()
	return

/attack_filter_bay/proc/reset()
	return

/attack_filter_bay/proc/filter_bay_attack(var/datum/attack_log/al)
	return FALSE

/attack_filter_bay/proc/OnTopic(href_list)
	return FALSE

/*
* filter_bay logs with one or more missing clients
*/
/attack_filter_bay/no_client
	var/filter_bay_missing_clients = TRUE

/attack_filter_bay/no_client/get_html()
	. = list()
	. += "Must have clients: "
	if(filter_bay_missing_clients)
		. += "<span class='linkOn'>Yes</span><a href='?src=\ref[src];no=1'>No</a>"
	else
		. += "<a href='?src=\ref[src];yes=1'>Yes</a><span class='linkOn'>No</span>"
	. = jointext(.,null)

/attack_filter_bay/no_client/OnTopic(href_list)
	if(href_list["yes"] && !filter_bay_missing_clients)
		filter_bay_missing_clients = TRUE
		return TRUE
	if(href_list["no"] && filter_bay_missing_clients)
		filter_bay_missing_clients = FALSE
		return TRUE

/attack_filter_bay/no_client/reset()
	filter_bay_missing_clients = initial(filter_bay_missing_clients)

/attack_filter_bay/no_client/filter_bay_attack(var/datum/attack_log/al)
	if(!filter_bay_missing_clients)
		return FALSE
	if(al.attacker && al.attacker.client.ckey == NO_CLIENT_CKEY)
		return TRUE
	if(al.victim && al.victim.client.ckey == NO_CLIENT_CKEY)
		return TRUE
	return FALSE

/*
	Either subject must be the selected client
*/
/attack_filter_bay/must_be_given_ckey
	var/ckey_filter_bay
	var/check_attacker = TRUE
	var/check_victim = TRUE
	var/description = "Either ckey is"

/attack_filter_bay/must_be_given_ckey/reset()
	ckey_filter_bay = null

/attack_filter_bay/must_be_given_ckey/get_html()
	return "[description]: <a href='?src=\ref[src];select_ckey=1'>[ckey_filter_bay ? ckey_filter_bay : "*ANY*"]</a>"

/attack_filter_bay/must_be_given_ckey/OnTopic(href_list)
	if(!href_list["select_ckey"])
		return
	var/ckey = input("Select ckey to filter_bay on","Select ckey", ckey_filter_bay) as null|anything in get_ckeys()
	if(ckey)
		if(ckey == "*ANY*")
			ckey_filter_bay = null
		else
			ckey_filter_bay = ckey
		return TRUE

/attack_filter_bay/must_be_given_ckey/proc/get_ckeys()
	. = list()
	for(var/log in attack_log_repository.attack_logs_)
		var/datum/attack_log/al = log
		if(check_attacker && al.attacker && al.attacker.client.ckey != NO_CLIENT_CKEY)
			. |= al.attacker.client.ckey
		if(check_victim && al.victim && al.victim.client.ckey != NO_CLIENT_CKEY)
			. |= al.victim.client.ckey
	. = sortList(.)
	. += "*ANY*"

/attack_filter_bay/must_be_given_ckey/filter_bay_attack(var/datum/attack_log/al)
	if(!ckey_filter_bay)
		return FALSE
	if(check_attacker && al.attacker && al.attacker.client.ckey == ckey_filter_bay)
		return FALSE
	if(check_victim && al.victim && al.victim.client.ckey == ckey_filter_bay)
		return FALSE
	return TRUE

/*
	Attacker must be the selected client
*/
/attack_filter_bay/must_be_given_ckey/attacker
	description = "Attacker ckey is"
	check_victim = FALSE

/attack_filter_bay/must_be_given_ckey/attacker/filter_bay_attack(al)
	return ..(al, TRUE, FALSE)

/*
	Victim must be the selected client
*/
/attack_filter_bay/must_be_given_ckey/victim
	description = "Victim ckey is"
	check_attacker = FALSE

/attack_filter_bay/must_be_given_ckey/victim/filter_bay_attack(al)
	return ..(al, FALSE, TRUE)
