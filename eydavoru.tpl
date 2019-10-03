{% extends "base.html" %}
{% block title %} Verkefni5 {% endblock %}
{% block refresh %}
	<meta http-equiv="refresh" content="1;URL={{ url_for('karfa')}}">
{% endblock %}
{% block content %}
  <h1> Vöru í körfu hefur verið eytt</h1>
{% endblock %}