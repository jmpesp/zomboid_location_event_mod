local function send_player_location()
    --print("send_player_location top")
    local players = getOnlinePlayers()
    --print("number of players = " .. players:size())
    for i=0,players:size()-1 do
        local player = players:get(i)
        local url = string.format(
            "http://127.0.0.1:12345/player?forename=%s&surname=%s&username=%s&x=%f&y=%f&z=%f",
            player:getDescriptor():getForename(),
            player:getDescriptor():getSurname(),
            player:getUsername(),
            player:getX(),
            player:getY(),
            player:getZ())

        --print(">" .. url)
        local stream = getUrlInputStream(url)
        stream:close()
        --print("<" .. url)
    end
    --print("send_player_location bottom")
end

Events.EveryOneMinute.Add(send_player_location)

