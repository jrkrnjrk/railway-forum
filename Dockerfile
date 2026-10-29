FROM discourse/discourse:latest

ENV RAILS_ENV=production
ENV UNICORN_PORT=3000

RUN mkdir -p /shared

# Force Discourse nginx config and kill the default site
RUN cp /var/www/discourse/config/nginx.sample.conf /etc/nginx/conf.d/discourse.conf \
 && rm -f /etc/nginx/sites-enabled/default \
 && rm -f /etc/nginx/conf.d/default.conf \
 && rm -f /etc/nginx/conf.d/outlets/server/10-http.conf \
 && mkdir -p /var/nginx/cache \
 && nginx -t || true

EXPOSE 80
