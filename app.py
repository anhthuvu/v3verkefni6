from flask import Flask, render_template, session, request, redirect, url_for, json
import json, urllib
from math import inf
from datetime import datetime
from requests import get
with urllib.request.urlopen("https://apis.is/petrol") as url:
    data = json.loads(url.read().decode())

def find_lowest_prices(data):
    lowest_petrol_price = [min(data['results'], key=lambda x: x['bensin95']), min(data['results'], key=lambda x: x[
        'bensin95_discount'] if x['bensin95_discount'] is not None else inf)]
    lowest_diesel_price = [min(data['results'], key=lambda x: x['diesel']), min(data['results'],
                           key=lambda x: x['diesel_discount'] if x['diesel_discount'] is not None else inf)]

    lowest_petrol_price = lowest_petrol_price[0] if lowest_petrol_price[0]['bensin95'] <= lowest_petrol_price[1]['bensin95_discount'] else lowest_petrol_price[1]
    lowest_diesel_price = lowest_diesel_price[0] if lowest_diesel_price[0]['diesel'] <= lowest_diesel_price[1]['diesel_discount'] else lowest_diesel_price[1]

    return lowest_petrol_price, lowest_diesel_price

def format_time(data):
    return datetime.strptime(data, '%Y-%m-%dT%H:%M:%S.%f').strftime('%d/%m/%Y Klukkan %H:%M')

app = Flask(__name__)
app.jinja_env.filters['format_time'] = format_time

listcompany = []
for upplysingar in data['results']:
	if upplysingar['company'] not in listcompany:
		listcompany.append(upplysingar ['company'])

@app.route('/')
def index():	
	data = json.loads(get('https://apis.is/petrol').content)
	return render_template('index.tpl', listcompany=listcompany, data=data, lowestPrices=find_lowest_prices(data))

@app.route('/company/<company>')
def comp(company=None):
	listkey = []
	fjoldi = 0
	gogn = data['results']
	for upplysingar in gogn:
		listkey.append(upplysingar['key'])
		if upplysingar['company'] == company:
			fjoldi += 1
	return render_template('company.tpl', fjoldi=fjoldi, gogn=gogn, company=company, listkey=listkey)

@app.route('/moreinfo/<key>')
def stad(key):
	data = json.loads(get('https://apis.is/petrol').content)
	gogn = data['results']
	for upplysingar in gogn:
		if upplysingar['key'] == key:
			return render_template('stadur.tpl', gogn=gogn, data=data, key=key)

@app.errorhandler(404)
def error404(error):
	return render_template('error404.tpl'), 404

@app.errorhandler(405)
def error404(error):
	return render_template('error405.tpl'), 405

if __name__ == "__main__":
	app.run(debug=True)