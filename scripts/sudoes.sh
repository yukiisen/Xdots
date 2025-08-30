mkdir /run/user/1000/
chown -R yuki:yuki /run/user/1000/
sv down postgresql17
sv down redis
