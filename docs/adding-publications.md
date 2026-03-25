# Adding Publications

This guide explains how to add new publications to the website.

## Prerequisites

Before adding a publication, ensure you have the `_publications/_TEMPLATE.md` file available in the repository.

## Step-by-Step Instructions

1. **Duplicate the Template**: Go to the `_publications/` folder and duplicate the `_TEMPLATE.md` file.
2. **Rename the File**: Rename the duplicated file to match the publication. A good naming convention is `YYYY-MM-DD-slug.md` (e.g., `2024-05-12-my-awesome-paper.md`).
3. **Fill in the Frontmatter**: Open the new file in a text editor and fill in the frontmatter fields.
4. **Add Abstract/Content**: Below the frontmatter (after the second `---`), add the abstract or a brief description of the publication.
5. **Commit and Push**: Save your changes, commit them to git, and push them to your repository to trigger a deployment.

## Quick Path (Under 10 Minutes)

Use this time-boxed checklist to stay within NFR12:

- 1 min: duplicate `_publications/_TEMPLATE.md` and rename the file.
- 4 min: fill required fields (`title`, `date`, `authors`, `venue`).
- 3 min: add optional links (`pdf`, `hal`, `doi`, `bibtex`, `slides`, `video`, `code`) if available.
- 2 min: add abstract/content and preview locally.

Total target: 10 minutes.

## Extracted Frontmatter explained

The frontmatter is the section at the top of the file enclosed by `---`.

*   `layout`: **Optional when duplicating template**. The site default for the `publications` collection is `publication`.
*   `title`: **Required**. The title of the publication.
*   `date`: **Required**. The publication date (e.g., `YYYY-MM-DD`). Used for sorting.
*   `authors`: **Required**. A list of authors.
*   `venue`: **Required**. The venue where the publication was published (e.g., venue name, journal, or "Preprint").
*   `pdf`: **Optional**. Link to the PDF file.
*   `hal`: **Optional**. Link to the HAL repository entry.
*   `doi`: **Optional**. The Digital Object Identifier link.
*   `bibtex`: **Optional**. The raw BibTeX string.
*   `code`: **Optional**. Link to the code repository.
*   `video`: **Optional**. Link to a video presentation.
*   `slides`: **Optional**. Link to presentation slides.

## Example File

```markdown
---
layout: publication
title: "An Example Publication for the Documentation"
date: 2024-10-15
authors:
  - "Alexis Imbert"
  - "Jane Doe"
venue: "Example Conference on Examples 2024"

# Optional External Links
pdf: "https://example.com/paper.pdf"
hal: "https://hal.science/hal-000000"
doi: "https://doi.org/10.1000/xyz123"
code: "https://github.com/Alexis-IMBERT/example-repo"
video: "https://youtube.com/watch?v=example"
slides: "https://example.com/slides.pdf"

# Optional Bibtex
bibtex: |
  @inproceedings{imbertExample2024,
    title={An Example Publication},
    author={Imbert, Alexis and Doe, Jane},
    booktitle={Example Conference},
    year={2024}
  }
---

This is the abstract of the example publication.
```
