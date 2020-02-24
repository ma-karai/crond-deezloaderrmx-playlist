# crond-deezloaderrmx-playlist

Should Work now, load the docker container no volumes needed. Set Quality the Server and playlists that should be updated on Friday/Saturday dont forget the quotation marks.


`ENV DEEZQUALITY FLAC`

`ENV DEEZSERVER 192.168.0.104:1732` where https://hub.docker.com/r/bocki/deezloaderrmx is running

one playlist:
`ENV DEEZPLAYLIST "https://www.deezer.com/en/playlist/5158987484"`

multiple playlists:
`ENV DEEZPLAYLIST "https://www.deezer.com/en/playlist/5158987484","https://www.deezer.com/en/playlist/1043463931" `
