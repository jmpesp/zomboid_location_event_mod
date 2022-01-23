function percent_encode(str)
    -- reference https://github.com/stuartpb/tvtropes-lua/blob/master/urlencode.lua
    --
    -- Percent-encode all non-unreserved characters
    -- as per RFC 3986, Section 2.3
    -- (except for space, which gets plus-encoded)
    --
    str = string.gsub (str, "([^%w%-%.%_%~ ])",
        function (c) return string.format ("%%%02X", string.byte(c)) end)
    str = string.gsub(str, " ", "+")
    return str
end

-- print('"' .. percent_encode("test post") .. '"')
assert(percent_encode("test") == "test")
assert(percent_encode("test post") == "test+post")
assert(percent_encode("Jean-Luc Picard") == "Jean-Luc+Picard")

local function send_player_location()
    --print("send_player_location top")
    local players = getOnlinePlayers()
    --print("number of players = " .. players:size())
    for i=0,players:size()-1 do
        local player = players:get(i)
        local url = string.format(
            "http://127.0.0.1:12345/player?forename=%s&surname=%s&username=%s&x=%f&y=%f&z=%f",
            percent_encode(player:getDescriptor():getForename()),
            percent_encode(player:getDescriptor():getSurname()),
            percent_encode(player:getUsername()),
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

if Events then
    Events.EveryOneMinute.Add(send_player_location)
end

