---
title: CUI Steering Committee
description: The ACM Conversational User Interfaces Steering Committee are responsibile for the overall organisation of the CUI conference and workshop series.

lastmod: page

redirect_from:
  - /about/
  - /about/constitution/
  - /about/members/
  - /about/sc/
  - /sc/members/
  - /sc/committee/
  - /sc/constitution/
  - /steering-committee/

menus:
  main:
    title: Steering Committee
    weight: 1
#    identifier: sc
#  sc:
#    title: Committee Members
#    weight: 0
---

The ACM Conversational User Interfaces Steering Committee is responsibile for the overall organisation of the annual ACM CUI conference and workshop series.

The constitution for the ACM Conversational User Interfaces conference sets out the organisation and procedures that govern the conference and workshop series, as well as the overarching series steeering committee. Download the [constitution]({{ '/assets/pdf/cui-conference-constitution.pdf' | relative_url }} "International Conference on Conversational User Interfaces Constitution"), which was approved and last updated on 19th April 2024.

The following people are the current _Officers_ and _Members_ of the steering committee. Officers are elected by the community and undertake a specific role on the committee, while members are invited to serve on the committee on the basis of their expertise and community participation.

## Officers

<ul class="list-unstyled">
	{% for member in site.data.steering-committee.officers %}
		<li class="d-flex flex-md-row flex-column my-5">
			<div class="flex-shrink-0">
				<img src="{{ member.photo | relative_url }}" class="profile-photo mr-md-3 mb-md-0 mb-3 rounded-circle shadow" alt="A photo of {{ member.name }}" title="{{ member.name }}">
			</div>
			<div class="flex-grow-1 ms-md-3">
				{% if member.url %}
					<h4 class="mt-0 mb-1"><a href="{{ member.url }}" title="Go to {{ member.name }}'s website" target="_blank">{{ member.name }}</a></h4>
				{% else %}
					<h4 class="mt-0 mb-1">{{ member.name }}</h4>
				{% endif %}
				<ul class="list-unstyled mb-2">
					{% for role in member.roles %}
						<li>
							<strong>{{ role["role"] }}</strong> <small>({{ role["term"] }})</small>
						</li>
					{% endfor %}
				</ul>
				{{- member.bio -}}
			</div>
		</li>
	{% endfor %}
</ul>

## Members

<ul class="list-unstyled">
	{% for member in site.data.steering-committee.members %}
		<li class="d-flex flex-md-row flex-column my-5">
			<div class="flex-shrink-0">
				<img src="{{ member.photo | relative_url }}" class="profile-photo mr-md-3 mb-md-0 mb-3 rounded-circle shadow" alt="A photo of {{ member.name }}" title="{{ member.name }}">
			</div>
			<div class="flex-grow-1 ms-md-3">
				{% if member.url %}
					<h4 class="mt-0 mb-1"><a href="{{ member.url }}" title="Go to {{ member.name }}'s website" target="_blank">{{ member.name }}</a></h4>
				{% else %}
					<h4 class="mt-0 mb-1">{{ member.name }}</h4>
				{% endif %}
				<p>
					<strong>Member since {{ member.invited }}</strong>
				</p>
				{{- member.bio -}}
			</div>
		</li>
	{% else %}
		<em>There are no invited memebers on the CUI Steering Committee at the moment.</em>
	{% endfor %}
</ul>
