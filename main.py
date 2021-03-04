from flask import Flask, jsonify, request

app = Flask(__name__, static_folder='.', static_url_path='')

@app.route("/")
def root():
    return 'Hello World!'

@app.route('/sum',methods=['POST'])
def asgher():
  data=request.get_json()

  result = data["number1"] + data["number2"]
  return jsonify({"result": result})  
  
  
  
# start listening
if __name__ == "__main__":
    app.run(debug=True, port='5000', host='0.0.0.0')
