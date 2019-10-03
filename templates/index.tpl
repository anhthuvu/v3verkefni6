{% extends "base.html" %}
{% block title %} Verkefni5 {% endblock %}
{% block content %}
	<h1> Vörulistinn </h1>
	<section class="col-3">
	{% for item in vorur %}
		<div class="block">
	    	<h2>{{ item[1] }} </h2>
	    	<img class="mynd" src="/static/mynd{{ item[0] }}.jpg"> 
	    	<h2>Verð: <a href="/add/{{ item[0] }}">{{ item[2] }}</a></h2>
    	</div>
	{% endfor %}
	</section>
  	<a href="/">Heimasíða</a>
{% endblock %}