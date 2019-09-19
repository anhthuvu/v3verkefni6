{% extends "base.html" %}
{% block title %} Verkefni4 {% endblock %}
{% block content %}
  <div class="col-2">
    <section>
      <img src="/static/m3.jpeg">
    </section>
    <section class="list">
      <h2>Fréttasíða</h2>
      <ul>
        {% for item in frettir %}
          <li><a href="/frett/{{ item[0] }}">{{ item[1] }}</a></li>
        {% endfor %}
      </ul>
      <a href="/">Heimasíða</a>
    </section>
  </div>
{% endblock %}