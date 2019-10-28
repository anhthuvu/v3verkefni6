{% extends "base.html" %}
{% block title %} Verkefni6 {% endblock %}
{% block content %}
	<section class="col-2">
	{% for company in listcompany %}
		<div class="block">
	    	<h2>{{ company }} </h2>
	    	<a href="/company/{{ company }}"><img class="mynd" src="/static/{{ company }}.png"></a>
    	</div>
	{% endfor %}
	</section>
	<section class="mminfo">
		<h2> Besta verðið </h2>		
		{% if lowestPrices.0.bensin95_discount == None %}
            <h4>Bensín: {{ lowestPrices.0.bensin95 }} krónur hjá {{ lowestPrices.0.company }}</h4>
        {% elif lowestPrices.0.bensin95 <= lowestPrices.0.bensin95_discount %}
            <h4>Bensín: {{ lowestPrices.0.bensin95 }} krónur hjá {{ lowestPrices.0.company }}</h4>
        {% else %}
            <h4>Bensín: {{ lowestPrices.0.bensin95_discount }} krónur hjá {{ lowestPrices.0.company }}</h4>
        {% endif %}
        {% if lowestPrices.1.diesel_discount == None %}
            <h4>Díesel: {{ lowestPrices.1.diesel }} krónur hjá {{ lowestPrices.1.company }}</h4>
        {% elif lowestPrices.1.diesel <=  lowestPrices.1.diesel_discount %}
            <h4>Díesel: {{ lowestPrices.1.diesel }} krónur hjá {{ lowestPrices.1.company }}</h4>
        {% else %}
            <h4>Díesel: {{ lowestPrices.1.diesel_discount }} krónur hjá {{ lowestPrices.1.company }}</h4>
        {% endif %}
        <p> Síðast uppfært: {{ data.timestampPriceCheck|format_time }}</p>
	</section>
  	<a href="/">Heimasíða</a>
{% endblock %}