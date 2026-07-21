# Content Management Guide

This guide provides instructions on how to add and manage content on the site.

## Adding a Project

To add a new project to your portfolio, follow these steps:

### 1. Create a New File

All projects are stored in the `_projects/` directory. The easiest way to create a new project is to duplicate the existing template:

1. Navigate to the `_projects/` folder.
2. Copy the `_TEMPLATE.md` file.
3. Rename the copied file to match your project. Use lowercase letters and hyphens (e.g., `my-new-project.md`).

### 2. Add Project Images

Before editing metadata, it is recommended to add any images you want to use:
- Save your images in the `assets/images/` directory (e.g., `assets/images/my-new-project-cover.jpg`).

### 3. Keep Frontmatter Minimal

Open your new `.md` file. At the very top, you will see a block of text surrounded by `---` (the "frontmatter"). Keep only:

- `title`: The name of your project.

*Note: Keep `layout: project` unchanged.*

### 4. Add Project Metadata in `_data/projects.yml`

Add a key in `_data/projects.yml` using the Markdown file name (without `.md`).

Use these metadata fields:

- `description`: Short summary shown on the projects list.
- `image`: Cover image path (for example `/assets/images/my-new-project-cover.jpg`).
- `technologies`: List of tools/technologies.
- `github_url`: Optional repository link.
- `demo_url`: Optional live demo link.

Example for `_projects/my-new-project.md`:

```yaml
my-new-project:
  description: "A short, engaging description shown on the projects list."
  image: "/assets/images/my-new-project-cover.jpg"
  technologies:
    - "Python"
    - "React"
  github_url: "https://github.com/Alexis-IMBERT/my-new-project"
  demo_url: "https://demo.alexis-imbert.com/my-new-project"
```

### 5. Write the Content

Below the second `---`, you can write the full content of your project using Markdown. The template provides sections for **Overview**, **Key Features**, and **Architecture**, but you can modify these completely to fit your project.

### 6. Preview Locally

To see how your new project looks before deploying:
1. Save the file.
2. Run your local server using: `docker-compose up` (or use the running instance if already started).
3. Visit the site locally and navigate to the Projects page to confirm everything renders perfectly.

### Full Example of a Project File (`_projects/sample-game.md`)

```markdown
---
layout: project
title: "Awesome 2D Game"
---

# Overview

Awesome 2D Game is a fast-paced platformer with multiple levels.

## Key Features

- Fluid movement
- Custom tile engine
- 3 distinct levels
```

```yaml
# _data/projects.yml
sample-game:
  description: "A fun 2D platformer game built with Python and Pygame."
  image: "/assets/images/awesome-game.jpg"
  technologies:
    - "Python"
    - "Pygame"
  github_url: "https://github.com/Alexis-IMBERT/awesome-game"
  demo_url: "https://demo.alexis-imbert.com/awesome-game"
```
