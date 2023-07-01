---
description: Conferences in the Conversational User Interfaces series.

lastmod: 
  type: data
  file: conferences.yml

menus:
  main:
    title: Conferences
    weight: 2
    identifier: conferences
---

# Conferences

The following conferences are part of the ACM Conversational User Interfaces series. Each conference is run by a dedicated group of volunteers, with oversight and support provided by the Steering Committee.

<ol class="d-flex flex-wrap list-unstyled">
	{% for conference in site.data.conferences %}
		<li class="col-lg-4 col-6 p-0 my-2 text-center">
			<a href="{{ conference.url }}" title="{{ conference.title }}" target="_blank">
				{%- assign image_url = "/assets/img/conferences/" | append: conference.logo -%}
				<img src="{{ image_url | relative_url }}?{{ cache }}" class="w-75 scale-hover m-3 rounded shadow" alt="{{ conference.name }} logo">
			</a>
		</li>
	{% endfor %}
</ol>
