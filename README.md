# Alexis Imbert - Academic Portfolio

This repository hosts my academic portfolio, built using Jekyll and the [al-folio](https://github.com/alshedivat/al-folio) theme.

## Local Development with Docker (Recommended)

The easiest way to run the site locally is using Docker Compose. This ensures a consistent environment matching production without needing to install Ruby or Jekyll on your host machine.

### Prerequisites
- [Docker Desktop](https://www.docker.com/products/docker-desktop/) (or Docker Engine + Docker Compose)

### Running the Site

```bash
# Build the image and start the container
docker-compose up --build
```

The site will be available at `http://localhost:4000` with live-reload enabled. Any changes to files (Markdown, YML, etc.) will automatically trigger a rebuild and refresh the browser.

To stop the server, press `Ctrl+C`.

## Local Setup (Without Docker)

To run this site locally, ensure you have Ruby and Bundler installed, then run:

```bash
# Install dependencies
bundle install

# Build and serve the site
bundle exec jekyll serve
```

View the site at `http://localhost:4000`.