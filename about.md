---
layout: default
title: About / CV
permalink: /about/
description: "Academic background and professional experiences of Alexis Imbert, PhD student at INSA Rouen Normandie."
---
{% assign about_data = site.data.pages.about %}

# About / CV

<p><a class="btn btn-primary" href="{{ about_data.cv_download.href | default: '/assets/CV_Alexis_IMBERT.pdf' | relative_url }}" download="{{ about_data.cv_download.filename | default: 'CV_Alexis_IMBERT.pdf' }}">{{ about_data.cv_download.label | default: '📄 Download CV (PDF)' }}</a></p>

## Academic Background

<section class="cv-timeline">
  {% for entry in about_data.academic_background %}
  <article class="cv-item">
    <h3 class="cv-item-title">{{ entry.title }}</h3>
    <div class="cv-item-meta">{{ entry.meta | replace: '•', '&bull;' }}</div>
    <p class="cv-item-desc">{{ entry.description }}</p>
  </article>
  {% endfor %}
</section>

## Professional Experience

<section class="cv-timeline">
  {% for entry in about_data.professional_experience %}
  <article class="cv-item">
    <h3 class="cv-item-title">{{ entry.title }}</h3>
    <div class="cv-item-meta">{{ entry.meta | replace: '•', '&bull;' }}</div>
    <div class="cv-item-desc">
      <ul>
        {% for bullet in entry.bullets %}
        <li>{{ bullet }}</li>
        {% endfor %}
      </ul>
    </div>
  </article>
  {% endfor %}
</section>

## Technical Skills

{% assign skills_nonempty = 0 %}
{% if about_data.skills and about_data.skills.categories %}
  {% for category in about_data.skills.categories %}
    {% if category.items and category.items.size > 0 %}
      {% assign skills_nonempty = skills_nonempty | plus: 1 %}
    {% endif %}
  {% endfor %}
{% endif %}

{% if skills_nonempty > 0 %}
<h2 id="technical-skills">Technical Skills</h2>
<div class="skills-section">
{% for category in about_data.skills.categories %}
  {% if category.items and category.items.size > 0 %}
  <div class="skill-category">
    <h3>{{ category.name }}</h3>
    <ul>
    {% for item in category.items %}
      <li>{{ item }}</li>
    {% endfor %}
    </ul>
  </div>
  {% endif %}
{% endfor %}
</div>
{% endif %}

## External Profiles

Find me on:
{% include external-profiles.html %}
