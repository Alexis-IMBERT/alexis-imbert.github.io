---
# -------------------------------------------------------------
# PUBLICATION FRONTMATTER SCHEMA
# -------------------------------------------------------------
# Required Fields
title: "Publication Title"
date: YYYY-MM-DD
authors:
  - "Author One"
  - "Author Two"
venue: "Conference or Journal Name"

# Resource Links (All Optional, but recommended)
pdf: "/assets/pdf/publication_name.pdf"     # Path to local PDF or external URL
hal: "https://hal.science/..."              # HAL archive URL
doi: "10.XXXX/..."                          # DOI string or URL
bibtex: |                                   # Full BibTeX citation block
  @inproceedings{...,
    title={...},
    author={...},
    ...
  }

# Optional Resources (Stories 3.5+)
slides: "/assets/pdf/slides.pdf"            # Link to presentation slides
video: "https://youtube.com/..."            # Link to video recording
code: "https://github.com/..."              # Link to repository
# -------------------------------------------------------------
---

Provide the abstract or publication details here. This content is optional and will be rendered in the `content` block of the publication layout.
