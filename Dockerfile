FROM node:10
USER root

#update and accept all prompts
RUN apt-get update -y \
      && apt-get dist-upgrade -y \
      && apt-get install -y libavahi-compat-libdnssd-dev libzmq3-dev \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*

# User data directory, contains flows, config and nodes.
RUN mkdir /data && chown -R 1000:1000 /data
# User configuration directory volume
VOLUME ["/data"]
EXPOSE 1880

USER node

# package.json contains Node-RED NPM module and node dependencies
WORKDIR /home/node
RUN curl https://raw.githubusercontent.com/node-red/node-red-docker/master/package.json > package.json
RUN npm install

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json

RUN npm install \
  node-red-contrib-bigtimer \
  node-red-contrib-eventsource \
  node-red-contrib-flatten \
  node-red-contrib-geofence \
  node-red-contrib-google-action \
  node-red-contrib-google-action-dialogflow \
  node-red-contrib-google-home-notify \
  node-red-contrib-google-home-notify \
  node-red-contrib-graphite \
  node-red-contrib-home-assistant-websocket \
  node-red-contrib-ifttt \
  node-red-contrib-influxdb \
  node-red-contrib-mqtt-broker \
  node-red-contrib-plex-ws \
  node-red-contrib-scenes \
  node-red-contrib-stoptimer \
  node-red-contrib-sunevents \
  node-red-contrib-tick \
  node-red-contrib-time-range-switch \
  node-red-dashboard \
  node-red-node-forecastio \
  node-red-node-google \
  node-red-node-mysql \
  node-red-node-ping \
  node-red-node-pushbullet \
  node-red-node-redis \
  node-red-node-smooth \
  node-red-node-twilio \
  node-red-node-weather-underground \
  node-red-node-wol \
  --save

CMD ["npm", "start", "--", "--userDir", "/data"]
