---
layout: default
title: "Alexis Imbert - PhD Student in GNN & Neuroscience"
description: "Academic portfolio showcasing research, publications, and projects. PhD student at INSA Rouen Normandie focused on Graph Neural Networks and Neuroscience."
permalink: /
author:
  name: "Alexis Imbert"
  email: "contact@alexis-imbert.com"
og_type: website
twitter_card: summary_large_image
---
{% assign home_data = site.data.pages.home %}

# Welcome to My Academic Portfolio

<p><a class="btn btn-primary" href="{{ home_data.cv_download.href | default: '/assets/CV_Alexis_IMBERT.pdf' | relative_url }}" download="{{ home_data.cv_download.filename | default: 'CV_Alexis_IMBERT.pdf' }}">{{ home_data.cv_download.label | default: '📄 Download CV (PDF)' }}</a></p>

{% for paragraph in home_data.intro %}
{{ paragraph }}

{% endfor %}

## Research Interests

{% for interest in home_data.research_interests %}
- **{{ interest.title }}** - {{ interest.description }}
{% endfor %}

## Quick Navigation

Explore my work through these sections:

{% for link in home_data.quick_navigation %}
- **{{ link.icon }} [{{ link.label }}]({{ link.href }})** - {{ link.description }}
{% endfor %}

---

## Let's Connect

{{ home_data.connect.text | default: 'Interested in collaboration or have questions about my research?' }}

📧 [{{ home_data.connect.email_label | default: 'Contact me via email' }}](mailto:{{ site.email | default: site.author.email }})

Or find me on:
{% include external-profiles.html %}
