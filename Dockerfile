FROM nodered/node-red-docker
USER root

ADD https://deb.nodesource.com/setup_9.x setup_9.x
RUN bash setup_9.x && rm setup_9.x

#update and accept all prompts
RUN apt-get update -y \
      && apt-get dist-upgrade -y \
      && apt-get install -y libavahi-compat-libdnssd-dev nodejs \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*
RUN npm install \
  https://github.com/halkeye/node-red-contrib-plex.git \
  node-red-contrib-bigtimer \
  node-red-contrib-eventsource \
  node-red-contrib-geofence \
  node-red-contrib-google-action \
  node-red-contrib-google-action-dialogflow \
  node-red-contrib-google-home-notify \
  node-red-contrib-harmony \
  node-red-contrib-home-assistant \
  node-red-contrib-ifttt \
  node-red-contrib-mqtt-broker \
  node-red-contrib-owntracks \
  node-red-contrib-scenes \
  node-red-contrib-stoptimer \
  node-red-contrib-sunevents \
  node-red-contrib-tick \
  node-red-contrib-time-range-switch \
  node-red-dashboard \
  node-red-node-discovery \
  node-red-node-google \
  node-red-node-ping \
  node-red-node-pushbullet \
  node-red-node-redis \
  node-red-node-smooth \
  node-red-node-twilio \
  --save
USER 1001
