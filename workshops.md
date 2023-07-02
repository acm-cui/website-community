---
title: Workshops
description: Current and past workshops organised by members of the Conversational User Interfaces community.

lastmod:
  type: data
  file: workshops.yml

menus:
  main:
    title: Workshops
    weight: 3
---

The ACM Conversational User Interfaces community organises satellite workshops co-located at other conferences as a way of building friendships and strengthening collaboration between communities.

<ol class="list-unstyled timeline mt-lg-4 mt-3 me-3 pb-3">
	{%- assign last_year = 'none' -%}
	{%- for workshop in site.data.workshops -%}
		{%- if workshop.dates -%}
			{%- assign year = workshop.dates.start | date: "%Y" -%}
		{%- elsif workshop.date -%}
			{%- assign year = workshop.date | date: "%Y" -%}
		{%- endif -%}
		{%- unless last_year == year -%}
			{%- assign last_year = year -%}
			{%- unless forloop.first -%}
					</ol>
				</li>
			{%- endunless -%}
			<li class="my-3">
				<span class="d-inline-block float-end timeline-notch rounded-start mt-3"></span>
				<span class="d-block float-end fw-bolder timeline-label me-2">{{ year }}</span>
				<ol class="list-unstyled pt-5 pe-5">
		{% endunless -%}
		<li class="my-lg-4 my-3">
			{%- if workshop.url -%}
				<a href="{{ workshop.url }}" title="Visit the website for the workshop '{{ workshop.title }}'" target="_blank">{{ workshop.title }}</a><br>
			{%- else -%}
				<strong>{{ workshop.title }}</strong><br>
			{%- endif -%}
			{%- capture nowunix %}{{ 'now' | date: '%s' }}{% endcapture -%}
			{%- capture workshopunix %}{{ workshop.date | date: '%s' }}{% endcapture -%}
			{%- if workshop.dates -%}
				<span class="small">{%- if nowunix > workshopunix -%}A workshop previously held at{% else %}A workshop due to be held at{% endif %} {{ workshop.conference }} on {% include daterange.html startdate=workshop.dates.start enddate=workshop.dates.end -%}</span>
			{%- elsif workshop.date -%}
				<span class="small">{%- if nowunix > workshopunix -%}A workshop previously held at{% else %}A workshop due to be held at{% endif %} {{ workshop.conference }} on {% include date.html date=workshop.date -%}</span>
			{%- else -%}
				<span class="small">{%- if nowunix > workshopunix -%}A workshop previously held at{% else %}A workshop due to be held at{% endif %} {{ workshop.conference }}</span>
			{%- endif -%}
		  </li>
	{%- endfor -%}
</ol>
