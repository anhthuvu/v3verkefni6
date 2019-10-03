{% extends "base.html" %}
{% block content %}
    <h3>{{ self.title }}</h3>
    <table>
        <tr>
            <td>Nafn: </td><td>{{ name }}</td>
        </tr>
        <tr>
            <td>Tölvupóstfang: </td><td>{{ email }}</td>
        </tr>
        <tr>
            <td>Símarnúmer: </td><td>{{ phone }}</td>
        </tr>
        <tr>
            <td>Heildarverð: </td><td>{{ price }}</td>
        </tr>
        <tr>
            <td><a href="/karfa" class="button">Aftur í körfu</a></td>
            <td><a href="/logout" class="button">Útskráning</a></td>
        </tr>
    </table>
{% endblock %}
