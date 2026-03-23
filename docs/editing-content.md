# Editing Content Guide

This guide explains how to modify existing content on the website, focusing on editing publications, projects, and other pages. The website uses Markdown files for content and YAML for configuration and metadata.

## 1. Modifying Markdown Files

Most content is stored in Markdown files `.md` within specific collections. To update content, you'll need to locate the relevant file and edit it.

### Common Files and Directories to Edit
* **`_publications/`**: Contains Markdown files for all your publications. 
    * Edit files here to fix typos in existing publications or update their links.
* **`_projects/`**: Contains Markdown files for your projects.
    * Edit files here to update project descriptions, change images, or modify project categories.
* **Root Pages**: Files like `index.md` (Homepage), `about.md`, or `contact.md` in the root directory.
    * Edit these to change the introductory text, your bio, or contact information.
* **`_data/`**: While not Markdown, this folder contains YAML files like `cv.yml` or `skills.yml`.
    * Edit these to update the data displayed on the CV or Skills section.

### How to Edit
1. Open the file in a text editor or your code editor (like VS Code).
2. Locate the content you want to change. The content is usually located below the frontmatter section.
3. Make your modifications using standard Markdown syntax.
4. Save the file.

## 2. Understanding Frontmatter vs. Content

Markdown files usually consist of two main parts: the **YAML frontmatter** at the top, and the **body content** below it.

### YAML Frontmatter (Metadata)
The frontmatter is used by Jekyll to understand metadata about the page. It's located at the very top of the file, enclosed by triple dashes `---`.

**Example:**
```yaml
---
layout: project
title: My Awesome Project
description: A description of an awesome project.
importance: 1
category: work
---
```

*   **Do's**: Edit the values after the colons (e.g., change `My Awesome Project` to `My New Project`). You can update titles, categories, dates, or boolean flags (like adding a `github` link).
*   **Don'ts**: Do not remove the triple dashes `---` or change the keys (the words before the colons, like `layout:` or `title:`) unless you know what you are doing, as this might break the page rendering.

### Body Content (Text)
The body content is everything below the second set of triple dashes `---`. This is the actual text that will be displayed on the page.

*   You can use **Markdown** here for formatting (e.g., `# Header`, `**bold**`, `*italic*`, `[link](url)`).
*   You can also use **HTML** if you need more complex layouts or styling that Markdown doesn't support.

## 3. Previewing Changes Locally

Before committing and pushing your changes to the live website, it is highly recommended to preview them locally to ensure everything looks correct.

### Using Docker Compose (Recommended)
This is the easiest method as it guarantees the environment matches the production setup.

1.  Open your terminal and navigate to the project directory.
2.  Run the following command to start the local server:
    ```bash
    docker compose up
    ```
    *(If it's your first time or you've made major changes to the Gemfile, run `docker compose up --build`)*
3.  Open your web browser and go to `http://localhost:8080`.
4.  You can now see your changes. The site will automatically reload as you save changes to your Markdown or YAML files.
5.  To stop the server, press `Ctrl+C` in the terminal.

### Verifying Your Changes
While previewing locally, check the following:
*   **Typographical Errors:** Are there any typos in the text you modified?
*   **Formatting:** Do the headers, lists, and bold text render correctly?
*   **Links:** Click any links you updated to ensure they lead to the correct destination.
*   **Images:** If you updated image paths, make sure the images load properly.