FROM discourse/discourse:latest

ENV RAILS_ENV=production
ENV UNICORN_PORT=3000

RUN mkdir -p /shared

# Copy Discourse nginx config, remove default site, and drop the conflicting listen
RUN cp /var/www/discourse/config/nginx.sample.conf /etc/nginx/conf.d/discourse.conf \
 && rm -f /etc/nginx/sites-enabled/default \
 && mkdir -p /var/nginx/cache \
 && sed -i '/listen 80;/d' /etc/nginx/conf.d/discourse.conf || true

EXPOSE 80
