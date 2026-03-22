---
layout: default
title: Projects
description: Research and software projects
permalink: /projects/
---

# Projects

{% assign projs = site.projects | sort: 'title' %}
{% if projs and projs.size > 0 %}
<ul>
  {% for project in projs %}
  <li>
    <a href="{{ project.url | relative_url }}">{{ project.title | default: project.slug }}</a>
  </li>
  {% endfor %}
</ul>
{% else %}
<p>No projects published yet.</p>
{% endif %}
