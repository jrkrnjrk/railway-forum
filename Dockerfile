FROM discourse/discourse:latest

# Railway expects the app to listen on $PORT
ENV RAILS_ENV=production
ENV UNICORN_PORT=3000

# Ensure volume mount point exists
RUN mkdir -p /shared

# Expose port
EXPOSE 3000

# The official image already has the entrypoint
