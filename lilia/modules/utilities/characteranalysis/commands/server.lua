﻿local MODULE = MODULE
lia.command.add("auditmoney", {
    privilege = "Check Player Status",
    superAdminOnly = true,
    onRun = function(client)
        lia.db.query("SELECT _name, _money, _lastJoinTime, _steamID FROM lia_characters ORDER BY _money DESC LIMIT 50", function(data)
            net.Start("liaAuditPanel")
            net.WriteTable(data)
            net.Send(client)
        end)
    end
})

lia.command.add("report", {
    privilege = "Check Player Status",
    syntax = "<steamID64>",
    superAdminOnly = true,
    onRun = function(client, arguments) netstream.Start(client, "liaReport", MODULE:GenerateReport(arguments[1])) end
})
