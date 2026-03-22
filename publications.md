---
layout: default
title: Publications
description: Publications and preprints
permalink: /publications/
---

# Publications

{% assign pubs = site.publications | sort: 'date' | reverse %}
{% if pubs and pubs.size > 0 %}
<ul class="publications-list">
  {% for pub in pubs %}
  <li class="publication-item">
    <h3><a href="{{ pub.url | relative_url }}">{{ pub.title | default: pub.slug }}</a></h3>
    {% if pub.authors %}
      <div class="authors">
        {% if pub.authors.first %}
          {{ pub.authors | join: ", " }}
        {% else %}
          {{ pub.authors }}
        {% endif %}
      </div>
    {% endif %}
    {% if pub.venue %}<div class="venue"><em>{{ pub.venue }}</em></div>{% endif %}
    {% if pub.date %}<div class="date">{{ pub.date | date: "%B %d, %Y" }}</div>{% elsif pub.year %}<div class="date">{{ pub.year }}</div>{% endif %}
  </li>
  {% endfor %}
</ul>
{% else %}
<p>No publications published yet.</p>
{% endif %}
