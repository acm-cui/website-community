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
        {%- assign has_hm_awards =  site.data.awards['honourable_mentions'][conference.year] | size -%}
        {%- assign has_bp_awards =  site.data.awards['best_papers'][conference.year] | size -%}
        <div class="d-flex flex-column w-100 conference-year">
          {%- if has_hm_awards > 0 or has_bp_awards > 0 or site.data.statistics.years contains conference.year -%}
          <a href="#conference-{{ conference.year }}" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="conference-{{ conference-year}}" class="d-flex flex-row justify-content-start flex-fill p-md-4 p-3  streched-link text-decoration-none text-black">
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
          <div class="collapse conference-expanded" id="conference-{{ conference.year }}">
            <div class="p-md-4 p-3">
              <div class="d-flex align-items-start">
                <div class="nav flex-column nav-pills me-3" id="conference-{{ conference.year }}-tab" role="tablist" aria-orientation="vertical">
                  <button class="nav-link active" id="conference-{{ conference.year }}-about-tab" data-bs-toggle="pill" data-bs-target="#conference-{{ conference.year }}-about" type="button" role="tab" aria-controls="conference-{{ conference.year }}-about" aria-selected="true">
                    About
                  </button>
                  {%- if has_hm_awards > 0 or has_bp_awards > 0 -%}
                    <button class="nav-link mt-2" id="conference-{{ conference.year }}-awards-tab" data-bs-toggle="pill" data-bs-target="#conference-{{ conference.year }}-awards" type="button" role="tab" aria-controls="conference-{{ conference.year }}-awards" aria-selected="false">
                      Awards
                    </button>
                  {%- endif -%}
                  {%- if site.data.statistics.years contains conference.year -%}
                  <button class="nav-link mt-2" id="conference-{{ conference.year }}-statistics-tab" data-bs-toggle="pill" data-bs-target="#conference-{{ conference.year }}-statistics" type="button" role="tab" aria-controls="conference-{{ conference.year }}-statistics" aria-selected="false">
                    Statistics
                  </button>
                  {%- endif -%}
                </div>
                <div class="tab-content ms-3" id="conference-{{ conference.year }}-tabContent">
                  <div class="tab-pane fade show active" id="conference-{{ conference.year }}-about" role="tabpanel" aria-labelledby="conference-{{ conference.year }}-about-tab" tabindex="0">
                    <p>
                      {{ conference.listdetails.preamble }}
                      {%- capture nowunix %}{{ 'now' | date: '%s' }}{% endcapture -%}
                      {%- capture conferenceunix %}{{ conference.dates.end | date: '%s' }}{% endcapture -%}
                      {%- if nowunix > conferenceunix -%}
                        {%- if conference.covid19virtual -%}
                        {{ conference.name }} was held as a virtual event due to the COVID-19 pandemic. The conference was held on {% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}.
                        {%- else -%}
                        {{ conference.name }} was held in {{ conference.location }}, on {% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}.
                        {%- endif -%}
                      {%- else -%}
                        {{ conference.name }} will be held in {{ conference.location }}, {% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}.
                      {%- endif -%}
                    </p>
                    {%- if site.data.statistics.years contains conference.year -%}
                      <p>
                        {{ site.data.statistics.registrations[conference.year].total }} people registered for the conference
                        {%- if conference.covid19virtual -%}
                          .
                        {%- else -%}
                          {%- if site.data.statistics.registrations[conference.year].virtual > 0 -%},
                            {{ site.data.statistics.registrations[conference.year].virtual }} of whom for virtual attendance and {{ site.data.statistics.registrations[conference.year].total | minus: site.data.statistics.registrations[conference.year].virtual }} in-person attendance.
                          {%- else -%}
                            .
                          {%- endif -%} 
                        {%- endif -%}
                        {%- assign totalpubs = 0 -%}
                        {%- assign totaltracks = 0 -%}
                        {%- for track in site.data.statistics.tracks -%}
                          {%- if track.data[conference.year] -%}
                            {%- assign totalpubs = totalpubs | plus: track.data[conference.year].acceptances -%}
                            {%- assign totaltracks = totaltracks | plus: 1 -%}
                          {%- endif -%}
                        {%- endfor %}
                        In total, there were {{ totalpubs }} publications at {{ conference.name }}, consisting of 
                        {% for track in site.data.statistics.tracks -%}
                          {%- if track.data[conference.year] -%}
                            {%- if totaltracks > 2 %}{%- unless forloop.first %}, {% endunless %}{% endif %}{% if forloop.index == totaltracks %} and {% endif %}{{ track.data[conference.year].acceptances }} {{ track.lang }}
                          {%- endif -%}
                        {%- endfor %}.
                        {%- if conference.urls.proceedings and conference.listdetails.proceedings.isacmdl %}
                          The {{ conference.name }} proceedings were published in the <a href="{{ conference.urls.proceedings }}" title="View the proceedings of {{ conference.name }} in the ACM Digital Library" target="_blank">ACM Digital Library</a>.
                        {%- endif -%}
                      </p>
                    {%- endif -%}
                    {%- if conference.sponsors -%}
                      <p>
                        The CUI community is grateful to 
                        {% for sponsor in conference.sponsors -%}
                          {% unless forloop.first %}{% unless forloop.last %}, {% else %}, and {% endunless %}{% endunless %}<a href="{{ sponsor.link }}" title="Visit the {{ sponsor.name }} website" target="_blank">{{ sponsor.name }}</a>
                        {%- endfor %} for their generous support towards {{ conference.name }}.
                      </p>
                    {%- endif -%}
                    <p>
                      {%- if conference.urls.website -%}
                        Visit the 
                        <a href="{{ conference.urls.website }}" title="Visit the {{ conference.name }} website" target="_blank">conference website</a> for more information about {{ conference.name }}.
                      {%- endif -%}
                    </p>
                  </div>
                  {%- if has_hm_awards > 0 or has_bp_awards > 0 -%}
                  <div class="tab-pane fade" id="conference-{{ conference.year }}-awards" role="tabpanel" aria-labelledby="conference-{{ conference.year }}-awards-tab" tabindex="0">
                    Awards
                  </div>
                  {%- endif -%}
                  {%- if site.data.statistics.years contains conference.year -%}
                    <div class="tab-pane fade" id="conference-{{ conference.year }}-statistics" role="tabpanel" aria-labelledby="conference-{{ conference.year }}-statistics-tab" tabindex="0">
                      Statistics
                    </div>
                  {%- endif -%}
                </div>
              </div>
            </div>
          </div>
          {%- elsif conference.urls.website -%}
          <a href="{{ conference.urls.website }}" class="d-flex flex-row justify-content-start flex-fill p-md-4 p-3  streched-link text-decoration-none text-black" title="Visit the {{ conference.name }} website" target="_blank">
            <div class="flex-shrink-0 align-self-start">
              {%- assign image_url = "/assets/img/conferences/" | append: conference.logo -%}
              <img src="{{ image_url | relative_url }}?{{ cache }}" class="rounded shadow" style="width: 75px" alt="{{ conference.name }} logo">
            </div>
            <div class="flex-grow-1 flex-fill ps-md-2 ms-4 small">
              <h3 class="m-0 mt-lg-2 pt-1">{{ conference.name }}</h3>
              <p class="mb-0 mt-1 d-lg-block d-none">{{ conference.location }} &bull; {% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}</p>
              <p class="mb-0 mt-1 d-lg-none d-block">{{ conference.location }}<br>{% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}</p>
            </div>
            <i class="bi bi-box-arrow-up-right conference-chevron"></i>
          </a>
          {%- else -%}
          <div class="d-flex flex-row justify-content-start flex-fill p-md-4 p-3  streched-link text-decoration-none text-black">
            <div class="flex-shrink-0 align-self-start">
              {%- assign image_url = "/assets/img/conferences/" | append: conference.logo -%}
              <img src="{{ image_url | relative_url }}?{{ cache }}" class="rounded shadow" style="width: 75px" alt="{{ conference.name }} logo">
            </div>
            <div class="flex-grow-1 flex-fill ps-md-2 ms-4 small">
              <h3 class="m-0 mt-lg-2 pt-1">{{ conference.name }}</h3>
              <p class="mb-0 mt-1 d-lg-block d-none">{{ conference.location }} &bull; {% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}</p>
              <p class="mb-0 mt-1 d-lg-none d-block">{{ conference.location }}<br>{% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}</p>
            </div>
          </div>
          {%- endif -%}
        </div>
      {% endfor %}
  </div>
</section>
{%- include sidebar.html -%}