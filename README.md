# aria2-bt-tracker

Auto update aria2 bt-tracker from [ngosang/trackerslist](https://github.com/ngosang/trackerslist).
Thanks [asmoker/btrackers-postman](https://github.com/asmoker/btrackers-postman).

## Usage

Use [wahyd4/aria2-ui](https://github.com/wahyd4/aria2-ariang-docker) for aria2, and use docker-compose link theirs.

This is a sample `docker-compose.yml`:

```
version: '2'

services:
  aria2:
    image: wahyd4/aria2-ui
    ports:
      - "8000:80"
      - "443:443"
      - "6800:6800"
    volumes:
      - /data:/data:rw
    environment:
      - DOMAIN=:80
      # - SSL=true
      - RPC_SECRET=HelloWorld
      - ARIA2_USER=admin
      - ARIA2_PWD=12345606
      - ENABLE_AUTH=true
    restart: always
  bt-tracker:
    container_name: bt-tracker
    image: aria2-bt-tracker
    environment:
      - ARIA2_URL=http://aria2:6800/jsonrpc
      - ARIA2_TOKEN=HelloWorld
      - TRACKER_URL=https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt
    links:
      - aria2:aria2
    logging:
      driver: "json-file"
      options:
        max-size: "1m"
    restart: always
```

## Build own image

```
docker build -t aria2-bt-tracker .
```

## Support Docker env

- ARIA2_URL for aria2 jsonrpc url
- ARIA2_TOKEN for aria2 token
- TRACKER_URL for tracker url, default is [trackers_best](https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt)
