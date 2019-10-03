<a href="/karfa"><img class="karfa" src="/static/wagen.svg"></a>Smelltu á körfuna til að sjá valdar vörur
{% if 'karfa' in session: %}
	<span>(Fjöldi vara: {{ fjoldi }})</span>
{% else %}
	<span>(Fjöldi vara: 0)</span>
{% endif %}