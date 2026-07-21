---
layout: default
title: Publications
description: Publications and preprints
permalink: /publications/
---
{% assign publications_page_data = site.data.pages.publications_page %}

# {{ publications_page_data.heading | default: 'Publications' }}

{% assign pubs = site.publications | sort: 'date' | reverse %}
{% if pubs and pubs.size > 0 %}
<ul class="publications-list">
  {% for pub in pubs %}
  {% include publication-item.html publication=pub %}
  {% endfor %}
</ul>
{% else %}
<p>{{ publications_page_data.empty_message | default: 'No publications published yet.' }}</p>
{% endif %}
