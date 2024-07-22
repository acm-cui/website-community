---
title: Conferences
description: Conferences in the Conversational User Interfaces series.

lastmod: 
  type: data
  file: conferences.yml

menus:
  main:
    title: Conference
    weight: 2
---

The annual ACM Conversational User Interfaces conference is held in locations across the world, bringing together researchers and practitioners to explore and discuss the state-of-the-art in conversational technologies. Each conference is run by a dedicated group of volunteers, with oversight and support provided by the Steering Committee.

<div class="mx-auto text-center">
  <div class="d-inline-flex flex-column text-start justify-content-center align-items-center border rounded-1 shadow mx-auto conference-list">
    {% for conference in site.data.conferences %}
    <div class="d-flex flex-column p-3 border-bottom flex-grow-0 flex-shrink-1">
      <div class="d-flex flex-row">
        <div class="flex-shrink-0">
          {%- assign image_url = "/assets/img/conferences/" | append: conference.logo -%}
          <a href="{{ conference.url }}" title="{{ conference.title }}" target="_blank">
            <img src="{{ image_url | relative_url }}?{{ cache }}" class="rounded shadow" style="width: 75px" alt="{{ conference.name }} logo">
          </a>
        </div>
        <div class="flex-grow-0 ms-4 pt-1 small" style="width: 500px">
          <h3 class="mb-1">{{ conference.name }}</h3>
          {{ conference.location }} &bull; {% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}
          <div class="d-flex flex-wrap mt-1 small" style="line-height: 150%">
            {%- if conference.url -%}
            <a href="{{ conference.url }}" title="View the {{ conference.name }} website" target="_blank" class="flex-grow-0 badge rounded-pill text-bg-primary text-decoration-none mx-1 my-1 p-1">&nbsp;<i class="bi bi-link-45deg"></i> Website&nbsp;</a>
            {%- endif -%}
            {%- if conference.programme -%}
            <a href="{{ conference.programme }}" title="View the {{ conference.name }} programme" target="_blank" class="flex-grow-0 badge rounded-pill text-bg-secondary text-decoration-none mx-1 my-1 p-1">&nbsp;<i class="bi bi-easel3"></i> Programme&nbsp;</a>
            {%- endif -%}
            {%- if conference.dl -%}
            <a href="{{ conference.dl }}" title="View the proceedings of {{ conference.name }} in the ACM Digital Library" target="_blank" class="flex-grow-0 badge rounded-pill text-bg-secondary text-decoration-none mx-1 my-1 p-1">&nbsp;<i class="bi bi-book-half"></i> Proceedings&nbsp;</a>
            {%- endif -%}
            {%- assign has_hm_awards =  site.data.awards['honourable_mentions'][conference.year] | size -%}
            {%- assign has_bp_awards =  site.data.awards['best_papers'][conference.year] | size -%}
            {%- if has_hm_awards > 0 or has_bp_awards > 0 -%}
            {%- assign conference_name_uri_escaped =  conference.name| uri_escape -%}
            <a href="{{ "/conference/awards/#" | append: conference_name_uri_escaped | relative_url }}" title="View a list of awards given at the {{ conference.name }}" target="_blank" class="flex-grow-0 badge rounded-pill text-bg-secondary text-decoration-none mx-1 my-1 p-1">
              &nbsp;<i class="bi bi-award-fill"></i> Awards&nbsp;
            </a>
            {%- endif -%}
            {%- if site.data.statistics.years contains conference.year -%}
            <a href="{{ "/conference/statistics/" | relative_url }}" title="View statistics from {{ conference.name }}" target="_blank" class="flex-grow-0 badge rounded-pill text-bg-secondary text-decoration-none mx-1 my-1 p-1">
              &nbsp;<i class="bi bi-calculator-fill"></i> Statistics&nbsp;
            </a>
            {%- endif -%}
          </div>
        </div>
      </div>
    </div>
    {% endfor %}
  </div>
</div>