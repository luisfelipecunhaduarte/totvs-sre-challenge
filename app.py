import flask

app = flask.Flask(__name__)
app.config["DEBUG"] = True


@app.route('/', methods=['GET'])
def home():
    return "<h1>SRE Challenge</h1><p>This site is a challenge API for SRE Team.</p>"

app.run()