# Crunchyroll Sync
A template to synchronize content from Crunchyroll to a SSH endpoint.

# Configuration
## Repository
1. Configure a Actions variable called `SHOWS` and enter your crunchyroll url's just like in the `.shows.example` file.
2. Configure Actions secrets called `CRUNCHYROLL_USERNAME` `CRUNCHYROLL_PASSWORD` with your account information.
3. Done! The action will run automatially or can be ran manually.

## Local (DevContainer)
1. Copy `.devcontainer/.env.example` to `.devcontainer/.env` and configure it with your account information.
2. Copy the `.shows.example` file to `.shows`, enter your crunchyroll url's just like in the `.shows.example` file.
3. Done! You can now use the `run.sh` script.
