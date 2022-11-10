---
label: Workshops
description: Current and past workshops organised by members of the Conversational User Interfaces community.

menus:
  main:
    title: Workshops
    weight: 3
---

# Workshops

Members and friends of the Conversational User Interfaces community organise satellite workshops, often located at events outside of the CUI conference series.

<ol class="list-unstyled timeline mt-lg-4 mt-3 me-3 pb-3">

{%- for year in site.data.workshops -%}

  <li class="my-5">

    <span class="d-inline-block float-end timeline-notch rounded-start mt-3"></span>

    <span class="d-block float-end fw-bolder timeline-label me-2">{{ year.year }}</span>

    <ol class="list-unstyled pt-5 pe-5">

    {%- for workshop in year.workshops -%}

      <li class="my-lg-5 my-4">
        
        <p class="mb-1">
          {%- if workshop.url -%}
          <a href="{{ workshop.url }}" title="Visit the website for the workshop '{{ workshop.name }}'" target="_blank">{{ workshop.name }}</a><br><span class="small">{{ workshop.location }}</span>
          {%- else -%}
          <strong>{{ workshop.name }}</strong><br><span class="small">{{ workshop.location }}</span>.
          {%- endif -%}
        </p>

        <p>{{ workshop.description }}</p>
      </li>
  
    {%- endfor -%}

    </ol>
  
  </li>

{%- endfor -%}

</ol>
