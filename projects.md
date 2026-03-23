---
layout: default
title: Projects
description: Research and software projects
permalink: /projects/
---

# Projects

<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
  {% assign projs = site.projects | sort: 'title' %}
  {% if projs and projs.size > 0 %}
    {% for project in projs %}
    <div class="col">
      <div class="card h-100 hover-shadow">
        <a href="{{ project.url | relative_url }}" class="text-decoration-none text-dark">
          {% if project.image %}
          <img src="{{ project.image | relative_url }}" class="card-img-top" alt="{{ project.title }}" style="object-fit: cover; height: 200px;">
          {% else %}
          <div class="card-img-top bg-secondary d-flex align-items-center justify-content-center" style="height: 200px;">
            <i class="fas fa-image fa-3x text-white-50"></i>
          </div>
          {% endif %}
          <div class="card-body">
            <h5 class="card-title">{{ project.title | default: project.slug }}</h5>
            <p class="card-text">{{ project.description }}</p>
          </div>
        </a>
      </div>
    </div>
    {% endfor %}
  {% else %}
    <div class="col-12">
      <p>No projects published yet.</p>
    </div>
  {% endif %}
</div>
