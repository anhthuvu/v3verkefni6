from flask import Flask, render_template
app = Flask(__name__)

frettir = [
	["0", "Schumacher í „leynilegri meðferð“ í París", "Þýski ökuþórinn Michael Schumacher er sagður hafa verið lagður inn á Pompidou-sjúkrahúsið í París í dag. Franska blaðið Le Parisien segist hafa heimildir fyrir því að Schumacher eigi að gangast undir stofnfrumumeðferð hjá franska skurðlækninum Philippe Menasche. Schumacher hefur ekki sést opinberlega eftir að hann slasaðist alvarlega á höfði í skíðaslysi í frönsku ölpunum fyrir fimm árum. ""(thuvu0512@gmail.com)"],
	["1", "Katrín og Pence hittast í Keflavík", "Mike Pence, varaforseti Bandaríkjanna, er í heimsókn á Íslandi í dag. Gríðarleg öryggisgæsla er í Reykjavík og á Keflavíkurflugvelli vegna heimsóknarinnar. Pence hefur hitt bæði Guðna Th. Jóhannesson, forseta Íslands, og Guðlaug Þór Þórðarson utanríkisráðherra í Höfða í dag. Dagur B. Eggertsson borgarstjóri sýndi Pence svo húsið. Pence fundar í kvöld á Keflavíkurflugvelli, meðal annars með Guðlaugi Þór og Katrínu Jakobsdóttur forsætisráðherra. (thuvu0512@gmail.com)"],
	["2", "Þægilegur sigur á Moldóvu", "Íslenska karlalandsliðið í fótbolta vann 3-0 sigur Moldóvu í undankeppni EM 2020 á Laugardalsvelli í dag. Sigurinn skaut Íslandi á topp riðils síns en Tyrkir og Frakkar geta farið upp fyrir strákana okkar með sigri í sínum leikjum í kvöld. (thuvu0512@gmail.com)"]
	]

@app.route('/')
def index():
	print(type(frettir))
	return render_template("index.tpl", frettir=frettir)

@app.route('/frett/<int:id>')
def frett(id):
    return render_template('frett.tpl', frett=frettir[id], nr=id)

@app.errorhandler(404)
def error404(error):
	return '<h1>ERRORRRRRRRRRRRRRR</h1>', 404

if __name__ == "__main__":
	app.run(debug=True)