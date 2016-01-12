FROM maza/maza-core-daemon
MAINTAINER      Rob Nelson <guruvan@maza.club>
# IMAGE         maza/mazachain
# base: mazaclub/coind-base & phusion/baseimage

EXPOSE          3000

RUN             apt-get update \
                 && apt-get install -y nodejs npm \
                 && test -e /usr/bin/node || ln -s /usr/bin/nodejs /usr/bin/node
RUN             cd / \
                 && git clone https://github.com/mazaclub/mazachain mazachain \
                 && cd mazachain \
                 && git checkout mazachain-maza \
                 && npm install \
                 && mkdir /app \
                 && mv ./* /app \
                 && mv ./.??* /app \
                 && mv /app/etc/service/mazachain /etc/service/mazachain \
                 && chmod +x /etc/service/mazachain/run \
                 && mv /app/app/start.sh /app/start.sh \
                 && chmod +x /app/start.sh \
                 && chown -R coin.coin /app \
                 && apt-get autoremove -y \
                 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

