FROM nodered/node-red-docker
USER root
RUN apt-get update -y \
      && apt-get dist-upgrade -y \
      && apt-get dist-upgrade -y \
      && apt-get install -y libavahi-compat-libdnssd-dev \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*
RUN npm install \
  node-red-contrib-bigtimer \
  node-red-contrib-chatbot \
  node-red-contrib-geofence \
  node-red-contrib-harmony \
  node-red-contrib-home-assistant \
  node-red-contrib-ifttt \
  node-red-contrib-owntracks \
  node-red-contrib-scenes \
  node-red-contrib-stoptimer \
  node-red-contrib-sunevents \
  node-red-contrib-tick \
  node-red-contrib-time-range-switch \
  https://github.com/node-red/node-red-dashboard.git \
  node-red-node-discovery \
  node-red-node-ping \
  node-red-node-pushbullet \
  node-red-node-redis \
  node-red-node-smooth \
  node-red-node-twilio \
  --save
USER 1001
