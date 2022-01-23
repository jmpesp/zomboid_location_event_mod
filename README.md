Hook into EveryOneMinute and push the name, username, and location of all
online players to a web server.

On the Zomboid server:

1. Copy the `zlem` directory into ~/Zomboid/mods/
2. Edit ~/Zomboid/Server/servertest.ini's `Mods` var and add `zlem`

The lua mod will call:

    127.0.0.1 - - [22/Jan/2022 23:15:54] "GET /player?forename=Charles&surname=Helm&username=jwm&x=10922.657227&y=9939.801758&z=0.000000 HTTP/1.1" 200 -

    [2022-01-22 23:15:54,984] WARNING in main: response {
      "path": "player",
      "headers": {
        "User-Agent": "Java/15.0.1",
        "Host": "127.0.0.1:12345",
        "Accept": "text/html, image/gif, image/jpeg, *; q=.2, */*; q=.2",
        "Connection": "keep-alive"
      },
      "args": {
        "forename": "Charles",
        "surname": "Helm",
        "username": "jwm",
        "x": "10922.560547",
        "y": "9939.908203",
        "z": "0.000000"
      },
      "form": {},
      "raw_data": "b''"
    }

poster.png is https://openclipart.org/image/400px/327849

