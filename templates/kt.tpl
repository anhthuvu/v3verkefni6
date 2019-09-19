{% extends "base.html" %}
{% block title %} {{ frett[1] }} {% endblock %}
{% block content %}
     <div>
        <h2>Þversumma</h2>
        Þversumma kennitölunnar <b>{{ kt }}</b> er <b>{{ summa }}</b>
        <p><a href="/a">Verkefni 4A</a></p>
     </div>
{% endblock content %}

