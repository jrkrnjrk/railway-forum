# Discourse ready for Railway

This package contains a Dockerfile based on the official Discourse image plus Railway configuration.

## How to deploy

1. Create a new project on Railway.
2. Add a PostgreSQL service.
3. Add a Redis service.
4. Create a new service from this Dockerfile (upload the files or push to a GitHub repo).
5. In the Discourse service:
   - Attach a Volume mounted at `/shared`
   - Set the environment variables from `.env.example` (use Railway reference variables for DB and Redis)
   - Set the start command if needed (the image has its own entrypoint)
6. Deploy. First boot takes several minutes.
7. Log in with the ADMIN_USERNAME / ADMIN_PASSWORD you set.

## Notes

- Discourse needs at least 2 GB RAM. Allocate more in Railway service settings.
- You must provide working SMTP or account creation will fail.
- Official image source: https://github.com/discourse/discourse_docker and https://hub.docker.com/r/discourse/discourse
- Full source is available at https://github.com/discourse/discourse (319 MB+). Packaging the entire source tree is not practical for a zip and is not required when using the official Docker image.

You are responsible for complying with Railway’s Acceptable Use Policy and applicable laws.
