---
title: Conferences
description: Conferences in the Conversational User Interfaces series.

lastmod: 
  type: data
  file: conferences.yml

menus:
  main:
    title: Conferences
    weight: 2
    identifier: conferences
  conferences:
    title: All conferences
    weight: 1
    identifier: conferences
---

The following conferences are part of the ACM Conversational User Interfaces series. Each conference is run by a dedicated group of volunteers, with oversight and support provided by the Steering Committee.

<div class="container mt-4">
  <div class="row row-cols-xl-2 row-cols-1 ">
    {% for conference in site.data.conferences %}
    <div class="col d-flex mb-4">
      <a href="{{ conference.url }}" title="{{ conference.title }}" target="_blank" class="streched-link text-decoration-none text-black">
        <div class="d-flex">
          <div class="flex-shrink-0">
            {%- assign image_url = "/assets/img/conferences/" | append: conference.logo -%}
            <img src="{{ image_url | relative_url }}?{{ cache }}" class="rounded shadow" style="width: 100px" alt="{{ conference.name }} logo">
          </div>
          <div class="flex-grow-1 ms-4 pt-2">
            <h3>{{ conference.name }}</h3>
            {{ conference.location }}<br>
            {%- include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}
          </div>
        </div>
      </a>
    </div>
    {% endfor %}
  </div>
</div>