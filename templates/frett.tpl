{% extends "base.html" %}
{% block title %} {{ frett[1] }} {% endblock %}
{% block content %}
     <div>
        <div>
            <h1>{{ frett[1] }}</h1>
            <img src='/static/m{{ nr }}.jpeg'/>
        </div>
        <div>
            <p>{{ frett[2] }}</p>
            <p><a href="/b">Fréttasíða</a></p>
        </div>
     </div>
{% endblock content %}
