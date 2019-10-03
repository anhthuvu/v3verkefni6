from flask import Flask, render_template, session, request, redirect, url_for
app = Flask(__name__)
app.config['SECRET_KEY'] = "hcy148"
SESSION_TYPE = 'redis'
app.config.from_object(__name__)

vorur = [
	[0, "Sa Sa", 520],
	[1, "Zha Zha", 1314],
	[2, "Xu Xu", 520],
	[3, "Rong Rong", 999],
	[4, "Ke Ke", 9420],
	[5, "Juan Juan", 8084]
	]

@app.route('/')
def index():
	return render_template('index.tpl', vorur=vorur)

@app.route('/add/<int:id>')
def add(id):
	karfa = []
	fjoldi = 0
	if "karfa" in session:
		karfa = session['karfa']
		karfa.append(vorur[id])
		session['karfa'] = karfa
		fjoldi = len(karfa)
	else:
		karfa.append(vorur[id])
		session['karfa'] = karfa
		fjoldi = len(karfa)
	return render_template('index.tpl', vorur=vorur, fjoldi=fjoldi)

@app.route('/karfa')
def karfa():
	karfa = []
	summa = 0
	if "karfa" in session:
		karfa = session['karfa']
		fjoldi = len(karfa)
		for x in karfa:
			summa += int(x[2])
		return render_template('karfa.tpl', karfa=karfa, tom=False, fjoldi=fjoldi, summa=summa)
	else:
		return render_template('karfa.tpl', karfa=karfa, tom=True)

@app.route('/eydavoru/<int:id>')
def eydavoru(id):
	karfa = []
	index = 0
	karfa = session['karfa']
	for x in range(len(karfa)):
		if karfa[x][0] == id:
			index = x
	karfa.remove(karfa[index])
	session['karfa'] = karfa
	return render_template('eydavoru.tpl')

@app.route('/eyda')
def eyda():
	session.pop('karfa', None)
	return render_template('eyda.tpl')

@app.route('/result', methods = ['POST'])
def result():
	if request.method == 'POST':
		kwargs = {
			'name': request.form['nafn'],
			'email': request.form['email'],
			'phone': request.form['simi'],
			'price': request.form['samtals']
		}
		return render_template('result.tpl', **kwargs)

@app.route('/logout', methods = ['GET', 'POST'])
def logout():
	session.pop('karfa', None)
	return redirect(url_for('index'))

@app.errorhandler(404)
def error404(error):
	return render_template('error404.tpl'), 404

@app.errorhandler(405)
def error404(error):
	return render_template('error405.tpl'), 405

if __name__ == "__main__":
	app.run(debug=True)