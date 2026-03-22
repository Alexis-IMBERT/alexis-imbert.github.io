---
layout: default
title: Publications
description: Publications and preprints
permalink: /publications/
---

# Publications

{% assign pubs = site.publications | sort: 'year' | reverse %}
{% if pubs and pubs.size > 0 %}
<ul>
  {% for pub in pubs %}
  <li>
    <a href="{{ pub.url | relative_url }}">{{ pub.title | default: pub.slug }}</a>
    {% if pub.year %} ({{ pub.year }}){% endif %}
  </li>
  {% endfor %}
</ul>
{% else %}
<p>No publications published yet.</p>
{% endif %}
