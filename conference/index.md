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
        <div class="d-flex flex-row justify-content-start align-items-start flex-fill">
          <div class="flex-shrink-0 align-self-start">
            {%- assign image_url = "/assets/img/conferences/" | append: conference.logo -%}
            <a href="{{ conference.urls.website }}" title="{{ conference.title }}" target="_blank">
              <img src="{{ image_url | relative_url }}?{{ cache }}" class="rounded shadow" style="width: 75px" alt="{{ conference.name }} logo">
            </a>
          </div>
          <div class="flex-grow-1 flex-fill ps-md-2 ms-4 small">
            <h3 class="m-0">{{ conference.name }}</h3>
            <p class="mb-0 mt-1 d-lg-block d-none">{{ conference.location }} &bull; {% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}</p>
            <p class="mb-0 mt-1 d-lg-none d-block">{{ conference.location }}<br>{% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}</p>
            <div class="d-flex flex-wrap mt-md-2 mt-1 mb-0 small" style="line-height: 150%">
              {%- if conference.urls.website -%}
              <a href="{{ conference.urls.website }}" title="View the {{ conference.name }} website" target="_blank" class="flex-grow-0 badge rounded-pill text-bg-primary text-decoration-none mx-1 my-1 px-2 py-1">&nbsp;<i class="bi bi-link-45deg"></i>&nbsp; Website&nbsp;</a>
              {%- endif -%}
              {%- if conference.urls.programme -%}
              <a href="{{ conference.urls.programme }}" title="View the {{ conference.name }} programme" target="_blank" class="flex-grow-0 badge rounded-pill text-bg-secondary text-decoration-none mx-1 my-1 px-2 py-1">&nbsp;<i class="bi bi-easel3"></i>&nbsp; Programme&nbsp;</a>
              {%- endif -%}
              {%- if conference.urls.proceedings -%}
              <a href="{{ conference.urls.proceedings }}" title="View the proceedings of {{ conference.name }} in the ACM Digital Library" target="_blank" class="flex-grow-0 badge rounded-pill text-bg-secondary text-decoration-none mx-1 my-1 px-2 py-1">&nbsp;<i class="bi bi-book-half"></i>&nbsp; Proceedings&nbsp;</a>
              {%- endif -%}
              {%- assign has_hm_awards =  site.data.awards['honourable_mentions'][conference.year] | size -%}
              {%- assign has_bp_awards =  site.data.awards['best_papers'][conference.year] | size -%}
              {%- if has_hm_awards > 0 or has_bp_awards > 0 -%}
              {%- assign conference_name_uri_escaped =  conference.name| uri_escape -%}
              <a href="{{ "/conference/awards/#" | append: conference_name_uri_escaped | relative_url }}" title="View a list of awards given at the {{ conference.name }}" target="_blank" class="flex-grow-0 badge rounded-pill text-bg-secondary text-decoration-none mx-1 my-1 px-2 p-1">
                &nbsp;<i class="bi bi-award-fill"></i>&nbsp; Awards&nbsp;
              </a>
              {%- endif -%}
              {%- if site.data.statistics.years contains conference.year -%}
              <a href="{{ "/conference/statistics/" | relative_url }}" title="View statistics from {{ conference.name }}" target="_blank" class="flex-grow-0 badge rounded-pill text-bg-secondary text-decoration-none mx-1 my-1 px-2 p-1">
                &nbsp;<i class="bi bi-calculator-fill"></i>&nbsp; Statistics&nbsp;
              </a>
              {%- endif -%}
            </div>
          </div>
        </div>
      </div>
      {% endfor %}
  </div>
</section>
{%- include sidebar.html -%}