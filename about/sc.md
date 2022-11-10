---
label: Steering Committee
description: The Conversational User Interfaces Steering Committee are responsibile for the overall organisation of the CUI conference and workshop series.

redirect_from:
  - /sc/
  - /sc/members/
  - /about/members/

menus:
  about:
    title: Steering Committee
    weight: 1
---

# Steering Committee

The Conversational User Interfaces Steering Committee is responsibile for the overall organisation of the CUI conference and workshop series. The following people are current members of the Conversational User Interfaces Steering Committee.

<ul class="list-unstyled">
	{% for member in site.data.steering-committee %}
  <li class="d-flex my-5">
    <div class="flex-shrink-0">
      <img src="{{ member.photo | relative_url }}" class="profile-photo mr-3 rounded-circle shadow" alt="A photo of {{ member.name }}" title="{{ member.name }}">
    </div>
    <div class="flex-grow-1 ms-3">
			{% if member.url %}
			<h5 class="mt-0 mb-1"><a href="{{ member.url }}" title="Go to {{ member.name }}'s website" target="_blank">{{ member.name }}</a></h5>
			<p><strong>{{ member.role }}</strong></p>
			{% else %}
			<h5 class="mt-0 mb-1">{{ member.name }}</h5>
			<p><strong>{{ member.role }}</strong></p>
			{% endif %}
			{{ member.bio }}
    </div>
  </li>
	{% endfor %}
 </ul>
