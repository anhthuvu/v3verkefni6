{% extends "base.html" %}
{% block title %} Verkefni6 {% endblock %}
{% block content %}
	<table>
		<caption>Allar Bensínstöðvar fyrirtækisins</caption>
		<tbody>
			<tr>
				<td><strong> Fyrirtæki </strong></td>
				<td><strong> Staður </strong></td>
			</tr>
	{% for upplysingar in gogn %}			
		{% if upplysingar['company'] == company %}
			<tr>
			{% for key in listkey %}
				{% if upplysingar['key'] == key %}
					<td><a href='/moreinfo/{{ key }}'>{{ upplysingar['company'] }}</a></td>
				{% endif %}
			{% endfor %}
				<td><i>{{ upplysingar['name'] }}</i></td>
			</tr>			
		{% endif %}
	{% endfor %}
		</tbody>
	</table>
	<h3> Fjöldi stöðva: {{ fjoldi}} </h3>
	<a href="/">Heimasíða</a>
{% endblock %}