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
    <h2 class="fw-semibold mb-2 m-0 p-0">{{ page.title | escape }}</h2>
    <p>
      The annual ACM Conversational User Interfaces conference is held in locations across the world, bringing together researchers and practitioners to explore and discuss the state-of-the-art in conversational technologies. Each conference is run by a dedicated group of volunteers, with oversight and support provided by the <a href="{{ "/sc/" | relative_url }}">CUI Steering Committee</a>.
    </p>
  </article>
  <div class="flex-grow-1 d-inline-flex flex-column text-start justify-content-center align-items-center mx-auto accordion accordion-flush conference-list w-100" id="conferenceList">
      {% for conference in site.data.conferences %}
        {%- assign has_hm_awards =  site.data.awards['honourable_mentions'][conference.year] | size -%}
        {%- assign has_bp_awards =  site.data.awards['best_papers'][conference.year] | size -%}
        <div class="d-flex flex-column w-100 accordion-item conference-year">
          {%- if has_hm_awards > 0 or has_bp_awards > 0 or site.data.statistics.years contains conference.year -%}
          <a href="#conference-{{ conference.year }}" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="conference-{{ conference-year}}" class="d-flex flex-row justify-content-start flex-fill p-md-4 p-3  streched-link text-decoration-none text-black">
            <div class="flex-shrink-0 align-self-start">
              {%- assign image_url = "/assets/img/conferences/" | append: conference.logo -%}
              <img src="{{ image_url | relative_url }}?{{ cache }}" class="rounded shadow" style="width: 50px" alt="{{ conference.name }} logo">
            </div>
            <div class="flex-grow-1 flex-fill ps-md-2 ms-4 small">
              <h3 class="m-0 pt-1 fw-semibold">{{ conference.name }}</h3>
              <p class="mb-0 mt-1">{{ conference.location }} </p>
            </div>
            <i class="bi bi-chevron-compact-right conference-chevron"></i>
          </a>
          <div class="accordion-collapse collapse conference-expanded" id="conference-{{ conference.year }}" data-bs-parent="#conferenceList">
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
                <div class="tab-content overflow-x-auto flex-grow-1 ms-3" id="conference-{{ conference.year }}-tabContent">
                  <div class="tab-pane fade show active" id="conference-{{ conference.year }}-about" role="tabpanel" aria-labelledby="conference-{{ conference.year }}-about-tab" tabindex="0">
                    <p>
                      {{ conference.listdetails.preamble }}
                      {%- capture nowunix %}{{ 'now' | date: '%s' }}{% endcapture -%}
                      {%- capture conferenceunix %}{{ conference.dates.end | date: '%s' }}{% endcapture -%}
                      {%- if nowunix > conferenceunix -%}
                        {%- if conference.covid19virtual -%}
                        {{ conference.name }} was held as a virtual event due to the COVID-19 pandemic. The conference was held on {% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}.
                        {%- else -%}
                        {{ conference.name }} was held in {{ conference.location }} on {% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}.
                        {%- endif -%}
                      {%- else -%}
                        {{ conference.name }} will be held in {{ conference.location }} on {% include daterange.html startdate=conference.dates.start enddate=conference.dates.end -%}.
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
                          {% unless forloop.first %}{% unless forloop.last %}, {% else %}{% if forloop.length > 2 %},{% endif %} and {% endunless %}{% endunless %}<a href="{{ sponsor.link }}" title="Visit the {{ sponsor.name }} website" target="_blank">{{ sponsor.name }}</a>
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
                    <h4 class="fw-medium">Best Paper awards</h4>
                    <ul>
                      {%- assign data = site.data.awards.best_papers[conference.year] | sort: "title" -%}
                      {%- for award in data -%}
                        <li><a href="{{ award.dl }}" title="View '{{ award.title | escape }}' in the ACM Digital Library">{{ award.title }}</a><br>{{ award.authors }}</li>
                      {%- endfor -%}
                    </ul>
                    <h4 class="fw-medium">Honourable Mention awards</h4>
                    <ul>
                      {%- assign data = site.data.awards.honourable_mentions[conference.year] | sort: "title" -%}
                      {%- for award in data -%}
                        <li><a href="{{ award.dl }}" title="View '{{ award.title | escape }}' in the ACM Digital Library">{{ award.title }}</a><br>{{ award.authors }}</li>
                      {%- endfor -%}
                    </ul>
                    {%- if site.data.awards.outstanding_service[conference.year] -%}
                      <h4 class="fw-medium">Outstanding Service award</h4>
                      {%- assign data = site.data.awards.outstanding_service[conference.year] | sort: "recipient" -%}
                      {%- for award in data -%}
                        <strong>{{ award.recipient }}</strong> ({{ award.role }})<br>{{ award.explanation }}</li>
                      {%- endfor -%}
                    {%- endif -%}
                  </div>
                  {%- endif -%}
                  {%- if site.data.statistics.years contains conference.year -%}
                    <div class="tab-pane fade w-100" id="conference-{{ conference.year }}-statistics" role="tabpanel" aria-labelledby="conference-{{ conference.year }}-statistics-tab" tabindex="0">
                      <h4 class="fw-medium">Registration statistics</h4>
                      <p>
                        We record <em>registrations</em> and not attendance as attendance can be difficult to accurately count. Registrations do typically include "comped" registrations—such as those given to student volunteers and keynotes—as well as registrations in return for sponsorship of the conference.
                        {% if site.data.statistics.registrations[conference.year].footnote_id -%}
                          {%- assign footnote_id = site.data.statistics.registrations[conference.year].footnote_id | minus: 1 -%}
                          {%- assign footnote_length = site.data.statistics.registrations_footnotes[footnote_id] | size -%}
                          {%- assign footnote_offset = footnote_length | minus: 1 -%}
                          For {{ conference.name }}, {{ site.data.statistics.registrations_footnotes[footnote_id] | slice: 0, 1 | downcase }}{{ site.data.statistics.registrations_footnotes[footnote_id] | slice: 1, footnote_offset }}
                        {%- endif -%}
                      </p>
                      <table class="w-100 mb-2 text-center">
                        <thead>
                          <tr class="fw-medium border-bottom">
                            <td>Virtual</td>
                            <td>In-person</td>
                            <td>Total</td>
                          </tr>
                        </thead>
                        <tbody>
                          <tr class="border-top">
                            <td>{{ site.data.statistics.registrations[conference.year].virtual }} registrations</td>
                            <td>{{ site.data.statistics.registrations[conference.year].total | minus: site.data.statistics.registrations[conference.year].virtual }} registrations</td>
                            <td>{{ site.data.statistics.registrations[conference.year].total }}  registrations</td>
                          </tr>
                        </tbody>
                      </table>

                      <h4 class="pt-4 fw-medium">Programme statistics</h4>
                      <p>Numbers exclude submissions which were incomplete at the submission deadline but do include those which were desk rejected without entering the peer review process.</p>
                      <table class="w-100 mb-2 text-center">
                        <thead>
                          <tr class="fw-medium border-bottom">
                            <td>Track</td>
                            <td>Submissions</td>
                            <td>Acceptances</td>
                            <td>Acceptance Rate</td>
                          </tr>
                        </thead>
                        <tbody>
                          {%- for track in site.data.statistics.tracks -%}
                            {%- if track["data"][conference.year]["submissions"] > 0 -%}
                              <tr class="border-top">
                                <td>{{ track["title"] }}</td>
                                <td>{{ track["data"][conference.year]["submissions"] }}</td>
                                <td>{{ track["data"][conference.year]["acceptances"] }}</td>
                                {%- assign submissions_float = track["data"][conference.year]["submissions"] | times: 1.0 -%}
                                <td>{{ track["data"][conference.year]["acceptances"] | divided_by: submissions_float | times: 100 | round: 1 }}%</td>
                              </tr>
                            {%- endif -%}
                          {%- endfor -%}
                        </tbody>
                      </table>
                      <p class="pt-4">
                        You can also compare and download registration and programme statistics <a href="{{ "/conference/statistics/" | relative_url }}" title="CUI Conference Statistics">across different years</a>.
                      </p>
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
              <img src="{{ image_url | relative_url }}?{{ cache }}" class="rounded shadow" style="width: 50px" alt="{{ conference.name }} logo">
            </div>
            <div class="flex-grow-1 flex-fill ps-md-2 ms-4 small">
              <h3 class="m-0 pt-1 fw-semibold">{{ conference.name }}</h3>
              <p class="mb-0 mt-1">{{ conference.location }} </p>
            </div>
            <i class="bi bi-box-arrow-up-right conference-chevron"></i>
          </a>
          {%- else -%}
          <div class="d-flex flex-row justify-content-start flex-fill p-md-4 p-3  streched-link text-decoration-none text-black">
            <div class="flex-shrink-0 align-self-start">
              {%- assign image_url = "/assets/img/conferences/" | append: conference.logo -%}
              <img src="{{ image_url | relative_url }}?{{ cache }}" class="rounded shadow" style="width: 50px" alt="{{ conference.name }} logo">
            </div>
            <div class="flex-grow-1 flex-fill ps-md-2 ms-4 small">
              <h3 class="m-0 pt-1 fw-semibold">{{ conference.name }}</h3>
              <p class="mb-0 mt-1">{{ conference.location }} </p>
            </div>
          </div>
          {%- endif -%}
        </div>
      {% endfor %}
  </div>
</section>
{%- include sidebar.html -%}