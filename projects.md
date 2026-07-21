---
layout: default
title: Projects
description: Research and software projects
permalink: /projects/
---
{% assign projects_page_data = site.data.pages.projects_page %}

# {{ projects_page_data.heading | default: 'Projects' }}

<div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-4">
  {% assign projs = site.projects | sort: 'title' %}
  {% if projs and projs.size > 0 %}
    {% for project in projs %}
    {% include project-card.html project=project %}
    {% endfor %}
  {% else %}
    <div class="col-12">
      <p>{{ projects_page_data.empty_message | default: 'No projects published yet.' }}</p>
    </div>
  {% endif %}
</div>
