{% extends "base.html" %}
{% block title %} Verkefni4 {% endblock %}
{% block content %}
  <h2> Verkefni 4A </h2>
  {% for item in kennitala %}
    <p>{{ item[0] }} <a href="/sida/{{ item[1] }}">{{ item[1] }}</a></p>
  {% endfor %}
  <a href="/">Heimasíða</a>
{% endblock %}