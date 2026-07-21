---
layout: default
title: Contact
description: Contact Alexis Imbert
permalink: /contact/
---
{% assign contact_data = site.data.pages.contact %}

# Contact Information

{{ contact_data.intro | default: 'Thank you for your interest. If you want to reach out for research discussions, project collaborations, or other academic and professional opportunities, please use the link below to send me an email.' }}

<div class="contact-cta my-5">
  <a href="mailto:{{ site.email | default: site.author.email }}" class="btn btn-primary btn-lg" aria-label="{{ contact_data.cta_aria_label | default: 'Send an email to Alexis' }}">
    <i class="fas fa-envelope"></i> {{ contact_data.cta_label | default: 'Email Alexis' }}
  </a>
</div>

***
*Note: {{ contact_data.privacy_note | default: 'This link will open your default email client. No forms or tracking are used here to respect your privacy.' }}*
