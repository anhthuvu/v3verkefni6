{% extends "eydabase.html" %}
{% block title %} Verkefni5 {% endblock %}
{% block refresh %}
	<meta http-equiv="refresh"content="3;URL={{ url_for('index')}}"/>
{% endblock %}
{% block content %}
  <h1> Körfu hefur verið eytt</h1>
  <i> Bíddu eftir 3 sek! </i>
{% endblock %}