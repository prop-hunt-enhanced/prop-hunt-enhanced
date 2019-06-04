PHE.RESULT = false

local function UPDATE_SET_RESULT(result)
	PHE.RESULT = result
end

local function UPDATE_GET_RESULT()
	return PHE.RESULT
end

local function UPDATE_DO_FETCH()
	http.Fetch(
		GAMEMODE.UPDATEURL,
		function(body,len,head,code)
			if tonumber(code) >= 300 then
				return false
			elseif body == "" then
				return false
			else
				UPDATE_SET_RESULT(body)
				return body
			end
		end,
		function(err) print("[!PH: Enhanced Update] Error retreiving update. Reason: "..err) end
	)
end

function PHE:CheckUpdate(bool)
	local result = ""
	local httpcode = 0
	
	result = UPDATE_DO_FETCH() or UPDATE_GET_RESULT() or PHE.RESULT or false
	
	if (!result || result == "") then
		print("[!PH: Enhanced Update] Unknown Error retreiving update.")
		return false,false,false
	end
	
	printVerbose("[*PH: Enhanced Update] Incoming update result data:\n ===\n"..tostring(result).."\n ===\n")
	local data = util.JSONToTable(result)
	
	local ver = tonumber(data.version)
	local rev = data.revision
	local log = data.notice
	
	local text
	if tonumber(GAMEMODE._VERSION) > ver then
		text = "[!PH: Enhanced Update] New version of "..ver.." is available. To update, please procceed to this link: \n --> https://prophunt.wolvindra.net/?go=download \n --> Changelog: "..log
		MsgC(Color(0,160,230), text.."\n")
	elseif string.lower(GAMEMODE.REVISION) != rev then
		text = "[!PH: Enhanced Update] New Revision of "..rev.." is available. To update, please procceed with this revision, visit this link: \n --> https://prophunt.wolvindra.net/?go=download&rev="..rev.." \n --> Changelog: "..log
		MsgC(Color(0,160,230), text.."\n")
	elseif tonumber(GAMEMODE._VERSION) == ver && string.lower(GAMEMODE.REVISION) == rev then
		text = "[*PH: Enhanced Update] Your gamemode is up to date. (Version "..ver.." - Revision "..string.upper(rev)..")"
		MsgC(Color(0,200,40), text.."\n")
	end
	
	if bool then
		return ver,rev,log
	end
end

local function CheckUpdate()
	print("[PH: Enhanced] - Retreiving Update Info... Please Wait!")
	UPDATE_DO_FETCH()

	timer.Simple(4, function()
		print( "~[ Prop Hunt : Enhanced Update & Info ]~" )
	
		local version,rev,changelog = PHE:CheckUpdate(true)
		
		if (!version || !rev || !changelog) then
			MsgC(Color(230,20,20), "[!!] Error Retreiving updates info")
			return
		end
		
		MsgC(Color(181,230,30),"[+] Current Version : "..version.."\n")
		MsgC(Color(175,245,15),"[+] Current Revision: "..rev.."\n")
		MsgC(Color(247,211,13),"[!] See ChangeLog   : "..changelog.."\n\n")
	end)
end

concommand.Add("ph_check_update", CheckUpdate ,nil, "Force Check Update Prop Hunt: Enhanced.")

local cooldown	= 86400
hook.Add("Initialize", "PHE.CheckUpdateInit", function()

	local nextUpdate = cookie.GetNumber("nextUpdate",0)
	local time		 = os.time()
	
	if time < nextUpdate then
		print("[PH: Enhanced] - Update has been checked. Will Re-check the update on "..os.date("%Y/%m/%d - %H:%M:%S",nextUpdate))
	else	
		print("[PH: Enhanced] - Initialize for Checking Update...")
		UPDATE_DO_FETCH()
		print("[PH: Enhanced] - Retreiving Update Info...")
		cookie.Set("nextUpdate", time + cooldown)
		
		timer.Simple(5, function()
			PHE:CheckUpdate(false)
			print("[PH: Enhanced] - Update has been checked. Your next update notice will be displayed on "..os.date("%Y/%m/%d - %H:%M:%S",nextUpdate))
		end)
	end
	
end)