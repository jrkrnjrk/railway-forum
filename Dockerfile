FROM discourse/discourse:latest

ENV RAILS_ENV=production
ENV UNICORN_PORT=3000

RUN mkdir -p /shared

# Copy Discourse nginx config
RUN cp /var/www/discourse/config/nginx.sample.conf /etc/nginx/conf.d/discourse.conf \
 && mkdir -p /var/nginx/cache

# Runtime fix script that removes the conflicting listen before nginx starts
RUN echo '#!/bin/bash' > /fix-nginx.sh \
 && echo 'rm -f /etc/nginx/sites-enabled/default' >> /fix-nginx.sh \
 && echo 'rm -f /etc/nginx/conf.d/default.conf' >> /fix-nginx.sh \
 && echo 'rm -f /etc/nginx/conf.d/outlets/server/10-http.conf' >> /fix-nginx.sh \
 && echo 'sed -i "/listen 80;/d" /etc/nginx/conf.d/discourse.conf || true' >> /fix-nginx.sh \
 && echo 'exec /sbin/boot' >> /fix-nginx.sh \
 && chmod +x /fix-nginx.sh

ENTRYPOINT ["/fix-nginx.sh"]
EXPOSE 80
