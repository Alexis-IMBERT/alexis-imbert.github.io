# Alexis Imbert - Academic Portfolio

This repository hosts my academic portfolio, built using Jekyll and the [al-folio](https://github.com/alshedivat/al-folio) theme.
It serves as a professional hub to display my academic background, technical skills, publications, and projects.

## Project Structure

The project relies on standard Jekyll collections and data files:

* `_publications/` - Contains markdown files for each academic publication.
* `_projects/` - Contains markdown files for each project showcase.
* `_data/` - Holds configuration data like `cv.yml` and `skills.yml` to drive dynamic UI sections.
* `_includes/` & `_layouts/` - Contains the HTML templates and layouts that structure the site visually.
* `assets/` - Contains CSS styles and images.

## Content Management

Guides for adding and managing content on the site can be found in the repository:

* **[Add a publication](_publications/_TEMPLATE.md)** - Duplicate the template, rename your file, and fill frontmatter fields.
* **[Add a project](_projects/_TEMPLATE.md)** - Duplicate the template, add image path/technologies, and write the project content.
* **[Edit existing content](docs/editing-content.md)** - Update Markdown body vs frontmatter safely and preview with Docker.

For both publications and projects, save your new file in the matching collection folder (`_publications/` or `_projects/`) and use kebab-case filenames.

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

## Deployment

The site is automatically deployed to GitHub Pages when changes are pushed to the `main` branch. 
This is handled via GitHub Actions (`.github/workflows/deploy.yml`).

To view the live site: https://alexis-imbert.github.io