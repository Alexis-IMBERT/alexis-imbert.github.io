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

Before editing the project file, it is recommended to add any images you want to use:
- Save your images in the `assets/images/` directory (e.g., `assets/images/my-new-project-cover.jpg`).

### 3. Update Frontmatter Fields

Open your new `.md` file. At the very top, you will see a block of text surrounded by `---` (the "frontmatter"). Update these required fields:

- `title`: The name of your project.
- `description`: A short, engaging description shown on the projects list.
- `image`: The path to the cover image you added (e.g., `/assets/images/my-new-project-cover.jpg`). If you don't have one, you can leave the default placeholder.
- `technologies`: A list of the core tools used:
  ```yaml
  technologies:
    - "Python"
    - "React"
  ```
- `github_url`: (Optional) The link to the repository source code.
- `demo_url`: (Optional) The link to a live demo or presentation.

*Note: Leave the `layout: project` unchanged.*

### 4. Write the Content

Below the second `---`, you can write the full content of your project using Markdown. The template provides sections for **Overview**, **Key Features**, and **Architecture**, but you can modify these completely to fit your project.

### 5. Preview Locally

To see how your new project looks before deploying:
1. Save the file.
2. Run your local server using: `docker-compose up` (or use the running instance if already started).
3. Visit the site locally and navigate to the Projects page to confirm everything renders perfectly.

### Full Example of a Project File (`_projects/sample-game.md`)

```markdown
---
layout: project
title: "Awesome 2D Game"
description: "A fun 2D platformer game built with Python and Pygame."
image: "/assets/images/awesome-game.jpg"
technologies:
  - "Python"
  - "Pygame"
github_url: "https://github.com/Alexis-IMBERT/awesome-game"
demo_url: "https://demo.alexis-imbert.com/awesome-game"
---

# Overview

Awesome 2D Game is a fast-paced platformer with multiple levels.

## Key Features

- Fluid movement
- Custom tile engine
- 3 distinct levels
```
