local function OnPlayerConnecting(name, setKickReason, deferrals)
    local player = source
    local playerName = GetPlayerName(source)
    if Config.EnableDiscordJoinNotifications then
        PerformHttpRequest(Config.JoinNotificationWebhook, function(err, text, headers) end, 'POST', json.encode({username = 'Join Notification (ESX)', content = "" .. playerName .. " has joined the server"}), { ['Content-Type'] = 'application/json' })
    end
end

AddEventHandler("playerConnecting", OnPlayerConnecting)

AddEventHandler('playerDropped', function(reason)
    local playerName = GetPlayerName(source)
    if Config.EnableDiscordLeaveNotifications then
        PerformHttpRequest(Config.LeaveNotificationWebhook, function(err, text, headers) end, 'POST', json.encode({username = 'Leave Notification (ESX)', content = "" .. playerName .. " has left the server for reason: " .. reason}), { ['Content-Type'] = 'application/json' })
    end
end) 