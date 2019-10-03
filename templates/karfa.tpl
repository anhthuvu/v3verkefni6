{% extends "base.html" %}
{% block title %} Verkefni5 {% endblock %}
{% block content %}
	{% if tom %}
		<h1> Karfan er tóm </h1>
	{% else %}
		<h1> Vörur í körfu </h1>
		<h3><a href="/eyda"> EYÐA KÖRFU! </a></h3>
		<table>
			<tr>
				<th colspan="2">Smelltu á vöru til að eyða úr körfunni</th>
			</tr>
			<tr>
				<td><strong> Vara </strong></td>
				<td><strong> Verð </strong></td>
			</tr>
		{% for item in karfa %}
			<tr>
				<td><a href="/eydavoru/{{ item[0] }}">{{ item[1] }}</a></td>
				<td><i>{{ item[2] }}</i></td>
			</tr>
		{% endfor %}
			<tr>
				<td><strong> Samtal </strong></td>
				<td><strong> {{ summa }} </strong></td>
			</tr>
		</table>
	{% endif %}
	<form method='post' action='result' accept-charset="utf-8">
		<h3>Viðskiptavinur</h3>
		<label>Nafn:
			<input type="text" name='nafn' required>
		</label>
		<label>Tölvupóstfang:
			<input type="email" name='email' required>
		</label>
		<label>Símanúmer:
			<input type="text" name='simi' required pattern="^(\354 )?\d{3}[ -]?\d{4}$" title="Eingöngu 7 tölustafir">
		</label>
		<input type="hidden" name="samtals" value="{{ summa }}">
		<input type='submit' class="button" value="Kaupa vörur">
		<!--input type='reset' value='Hreinsa'-->
	</form>
	<a href="/">Heimasíða</a>
{% endblock %}