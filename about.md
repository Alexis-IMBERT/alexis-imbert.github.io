---
layout: default
title: About / CV
permalink: /about/
description: "Academic background and professional experiences of Alexis Imbert, PhD student at INSA Rouen Normandie."
---

# About / CV

[📄 Download CV (PDF)]({{ '/assets/CV_Alexis_IMBERT.pdf' | relative_url }}){: .btn .btn-primary download="CV_Alexis_IMBERT.pdf"}

## Academic Background

<section class="cv-timeline">
  <article class="cv-item">
    <h3 class="cv-item-title">PhD in Computer Science</h3>
    <div class="cv-item-meta">Expected 2024 - 2027 &bull; INSA Rouen Normandie / LITIS Lab</div>
    <p class="cv-item-desc">Research focus: Graph Neural Networks, Machine Learning, and applications in Neuroscience.</p>
  </article>

  <article class="cv-item">
    <h3 class="cv-item-title">Master of Science in Data Science / Computer Science</h3>
    <div class="cv-item-meta">2022 - 2024 &bull; INSA Rouen Normandie</div>
    <p class="cv-item-desc">Focus on machine learning, deep learning, and intelligent systems.</p>
  </article>

  <article class="cv-item">
    <h3 class="cv-item-title">Bachelor of Science in Computer Science</h3>
    <div class="cv-item-meta">2019 - 2022 &bull; University / INSA</div>
    <p class="cv-item-desc">Extensive coursework in mathematics, algorithms, and software engineering.</p>
  </article>
</section>

## Professional Experience

<section class="cv-timeline">
  <article class="cv-item">
    <h3 class="cv-item-title">PhD Researcher</h3>
    <div class="cv-item-meta">Oct 2024 - Present &bull; LITIS Laboratory, INSA Rouen Normandie</div>
    <div class="cv-item-desc">
      <ul>
        <li>Conducting research on Graph Neural Networks (GNNs).</li>
        <li>Applying deep learning models to neurodegenerative disease diagnosis.</li>
      </ul>
    </div>
  </article>

  <article class="cv-item">
    <h3 class="cv-item-title">Research Intern</h3>
    <div class="cv-item-meta">Apr 2024 - Sep 2024 &bull; LITIS Laboratory</div>
    <div class="cv-item-desc">
      <ul>
        <li>Investigated state-of-the-art machine learning approaches for brain imaging data.</li>
        <li>Developed proof-of-concept pipelines for graph-based inference.</li>
      </ul>
    </div>
  </article>

  <article class="cv-item">
    <h3 class="cv-item-title">Software Engineering Intern</h3>
    <div class="cv-item-meta">Jun 2023 - Aug 2023 &bull; Tech Company</div>
    <div class="cv-item-desc">
      <ul>
        <li>Developed and maintained data processing workflows.</li>
        <li>Collaborated with senior engineers on scalable database architectures.</li>
      </ul>
    </div>
  </article>
</section>

## Technical Skills

<div class="skills-section">
{% for category in site.data.skills.categories %}
  <div class="skill-category">
    <h3>{{ category.name }}</h3>
    <ul>
    {% for item in category.items %}
      <li>{{ item }}</li>
    {% endfor %}
    </ul>
  </div>
{% endfor %}
</div>

## External Profiles

Find me on:
{% include external-profiles.html %}
