from flask import Flask, request, render_template, make_response
from wordCounter import countWords
import StringIO

app = Flask(__name__)
app.config['ALLOWED_EXTENSIONS'] = set('csv')

@app.route("/")
def index():
    return render_template("index.html")
    
@app.route("/upload", methods=["POST"])
def upload():
    file = request.files['file']
    respDf = countWords(file.read().decode('utf-16'))
    outFile = StringIO.StringIO();
    respDf.to_csv(outFile)
    response = make_response(outFile.getvalue())
    response.headers["Content-Disposition"] = "attachment; filename=results.csv"
    return response
    
    
app.run(host="0.0.0.0",port=8080, debug=True)