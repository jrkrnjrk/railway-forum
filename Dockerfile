FROM discourse/discourse:latest

ENV RAILS_ENV=production
ENV UNICORN_PORT=3000

RUN mkdir -p /shared

# Copy Discourse nginx config and remove the default site
RUN cp /var/www/discourse/config/nginx.sample.conf /etc/nginx/conf.d/discourse.conf \
 && rm -f /etc/nginx/sites-enabled/default \
 && mkdir -p /var/nginx/cache

EXPOSE 80
