{% extends "base.html" %}
{% block title %} Verkefni5 {% endblock %}
{% block content %}
    <h2>Nánari upplýsingar bensínstöðvar</h2>
    {% for upplysingar in gogn %}            
        {% if upplysingar['key'] == key %}
            <h3>Söluaðili: {{ upplysingar['company'] }}</h3>
            <h3>Staður: {{ upplysingar['name'] }}</h3>
            <h3>Verð á 1. lítra af Bensíni, 95 oktan: {{ upplysingar['bensin95'] }}</h3>
            <h3>Verð á 1. lítra af Bensíni, 95 oktan með afslátt: {{ upplysingar['bensin95_discount'] }}</h3>
            <h3>Verð á 1. lítra af Dísel olíu: {{ upplysingar['diesel'] }}</h3>
            <h3>Verð á 1. lítra af Dísel olíu með afslátt: {{ upplysingar['diesel_discount'] }}</h3>
            <div class='mminfo'>
                <h3><ul>Staðsetning bensínstöðvar</ul></h3>
                <li>Breiddargráða: {{ upplysingar['geo']['lat'] }}</li>
                <li>Lengdargráða: {{ upplysingar['geo']['lon'] }} </li>
                <a href="http://www.google.com/maps/place/{{ upplysingar['geo']['lat'] }},{{ upplysingar['geo']['lon'] }}"><li>Staðsetning á Google korti</li></a>
            </div>
        {% endif %}
    {% endfor %}
    
    <a href="/">Heimasíða</a>
{% endblock %}