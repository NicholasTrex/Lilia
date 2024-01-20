﻿lia.log.addType("charCreate", function(client, ...)
    local arg = {...}
    return Format("%s created the character #%s(%s)", client:steamName(), arg[1]:getID(), arg[1]:getName())
end)

lia.log.addType("charLoad", function(client, ...)
    local arg = {...}
    return Format("%s loaded the character #%s(%s)", client:steamName(), arg[1], arg[2])
end)

lia.log.addType("charDelete", function(client, ...)
    local arg = {...}
    return Format("%s(%s) deleted character (%s)", IsValid(client) and client:steamName() or "COMMAND", IsValid(client) and client:SteamID() or "", arg[1])
end)