MAINTAINER      Rob Nelson <guruvan@maza.club>

EXPOSE          3000

RUN             apt-get update \
                 && apt-get install -y nodejs npm \
                 && test -e /usr/bin/node || ln -s /usr/bin/nodejs /usr/bin/nodeCOPY            . /
RUN             cd / \
                 && git clone https://github.com/mazaclub/mazachain mazachain \
                 && cd mazachain \
                 && git checkout mazachain \
                 && npm install \
                 && mv ./* /app \
                 && mv ./.??* /app \
                 && mv /app/etc/service/mazachain /etc/service/mazachain \
                 && mv /app/app/start.sh /app/start.sh \
                 && chown -R coin.coin /app \
                 && apt-get autoremove -y \
                 && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

