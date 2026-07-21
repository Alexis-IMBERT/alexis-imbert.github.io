# Adding Publications

This guide explains how to add new publications to the website.

## Prerequisites

Before adding a publication, ensure you have the `_publications/_TEMPLATE.md` file available in the repository.

## Step-by-Step Instructions

1. **Duplicate the Template**: Go to the `_publications/` folder and duplicate the `_TEMPLATE.md` file.
2. **Rename the File**: Rename the duplicated file to match the publication. A good naming convention is `YYYY-MM-DD-slug.md` (e.g., `2024-05-12-my-awesome-paper.md`).
3. **Fill in Minimal Frontmatter**: Keep only `layout`, `title`, and `date` in the Markdown file.
4. **Add Metadata in `_data/publications.yml`**: Create an entry with the same key as your file name (without `.md`) and put `authors`, `venue`, `resources`, and optional `bibtex` there.
5. **Add Abstract/Content**: Below the frontmatter (after the second `---`), add the abstract or a brief description of the publication.
6. **Commit and Push**: Save your changes, commit them to git, and push them to your repository to trigger a deployment.

## Quick Path (Under 10 Minutes)

Use this time-boxed checklist to stay within NFR12:

- 1 min: duplicate `_publications/_TEMPLATE.md` and rename the file.
- 3 min: fill minimal frontmatter (`layout`, `title`, `date`).
- 4 min: add metadata in `_data/publications.yml` (`authors`, `venue`, `resources`, `bibtex`).
- 2 min: add abstract/content and preview locally.

Total target: 10 minutes.

## Extracted Frontmatter explained

The frontmatter is the section at the top of the file enclosed by `---`.

*   `layout`: **Optional when duplicating template**. The site default for the `publications` collection is `publication`.
*   `title`: **Required**. The title of the publication.
*   `date`: **Required**. The publication date (e.g., `YYYY-MM-DD`). Used for sorting.
*   `authors`: **Required in `_data/publications.yml`**. A list of authors.
*   `venue`: **Required in `_data/publications.yml`**. The venue where the publication was published.
*   `resources`: **Optional in `_data/publications.yml`**. A list of link objects.
*   `bibtex`: **Optional in `_data/publications.yml`**. The raw BibTeX string.
*   `abstract`: **Optional**. Put it in Markdown body text, or in `_data/publications.yml` if you prefer.

Legacy fields in Markdown like `pdf`, `hal`, `doi`, `slides`, `video`, and `code` still render, but the recommended format is centralized metadata in `_data/publications.yml`.

Each resource object can use:

*   `type`: **Required**. A short identifier such as `pdf`, `hal`, `doi`, `slides`, `video`, or `code`.
*   `label`: **Required**. The button text shown to readers.
*   `href`: **Required**. The target URL.
*   `download`: **Optional**. Set to `true` for downloadable files like PDFs.
*   `new_tab`: **Optional**. Set to `true` for external links.

## Example File

```markdown
---
layout: publication
title: "An Example Publication for the Documentation"
date: 2024-10-15
---

This is the abstract of the example publication.
```

```yaml
# _data/publications.yml
example-publication-for-the-documentation:
  authors:
    - "Alexis Imbert"
    - "Jane Doe"
  venue: "Example Conference on Examples 2024"
  resources:
    - type: pdf
      label: "Download PDF"
      href: "https://example.com/paper.pdf"
      download: true
    - type: hal
      label: "HAL"
      href: "https://hal.science/hal-000000"
      new_tab: true
    - type: doi
      label: "DOI"
      href: "https://doi.org/10.1000/xyz123"
      new_tab: true
    - type: code
      label: "View Code"
      href: "https://github.com/Alexis-IMBERT/example-repo"
      new_tab: true
    - type: video
      label: "Watch Presentation"
      href: "https://youtube.com/watch?v=example"
      new_tab: true
    - type: slides
      label: "View Slides"
      href: "https://example.com/slides.pdf"
      new_tab: true
  bibtex: |
    @inproceedings{imbertExample2024,
      title={An Example Publication},
      author={Imbert, Alexis and Doe, Jane},
      booktitle={Example Conference},
      year={2024}
    }
```
