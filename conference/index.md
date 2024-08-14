---
title: Conference
description: The annual ACM SIGCHI Conversational User Interfaces series.

layout: default

lastmod: 
  type: data
  file: conferences.yml

menus:
  main:
    title: Conference
    weight: 2
---

<section>
  <article class="flex-grow-1 p-md-4 p-3">
    <h2 class="fw-bold mb-2 m-0 p-0">{{ page.title | escape }}</h2>
    <p>
      The annual ACM Conversational User Interfaces conference is held in locations across the world, bringing together researchers and practitioners to explore and discuss the state-of-the-art in conversational technologies. Each conference is run by a dedicated group of volunteers, with oversight and support provided by the <a href="{{ "/sc/" | relative_url }}">CUI Steering Committee</a>.
    </p>
    <p>
    The CUI comuninity also maintains records regarding the <a href="{{ "/conference/statistics/" | relative_url }}" title="CUI Conference Statistics">annual conference programme and registrations for each year</a>.
    </p>
  </article>
  <div class="flex-grow-1 d-inline-flex flex-column text-start justify-content-center align-items-center mx-auto conference-list w-100">
      {% for conference in site.data.conferences %}
      <div class="d-flex flex-column p-md-4 p-3 w-100 conference-year">
        <a href="#conference-{{ conference.year }}" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="conference-{{ conference-year}}" class="d-flex flex-row justify-content-start  flex-fill overflow-hidden streched-link text-decoration-none text-black">
          <div class="flex-shrink-0 align-self-start">
            {%- assign image_url = "/assets/img/conferences/" | append: conference.logo -%}
            <img src="{{ image_url | relative_url }}?{{ cache }}" class="rounded shadow" style="width: 75px" alt="{{ conference.name }} logo">
          </div>
          <div class="flex-grow-1 flex-fill ps-md-2 ms-4 small">
            <h3 class="m-0 mt-lg-2 pt-1">{{ conference.name }}</h3>
            <p class="mb-0 mt-1 d-lg-block d-none">{{ conference.location }} &bull; {% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}</p>
            <p class="mb-0 mt-1 d-lg-none d-block">{{ conference.location }}<br>{% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}</p>
          </div>
          <i class="bi bi-chevron-compact-right conference-chevron"></i>
        </a>
      </div>
      <div class="collapse" id="conference-{{ conference.year }}">
      </div>
      {% endfor %}
  </div>
</section>
{%- include sidebar.html -%}