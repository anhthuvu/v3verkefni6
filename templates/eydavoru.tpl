{% extends "eydabase.html" %}
{% block title %} Verkefni5 {% endblock %}
{% block refresh %}
	<meta http-equiv="refresh"content="3; url={{ url_for('karfa')}}"/>
{% endblock %}
{% block content %}
  <h1> Vörur í körfu hefur verið eytt</h1>
  <i> Bíddu eftir 3 sek! </i>
{% endblock %}