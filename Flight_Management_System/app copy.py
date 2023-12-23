from flask import Flask, request, jsonify
from pydantic import BaseModel
from joblib import dump, load
import pickle
import pymysql.cursors
import pymysql
# from sklearn.preprocessing import LabelEncoder
from flask_cors import CORS

# Load the trained model from the Pickle file
# with open('rf_model.pkl', 'rb') as file:
#     model = pickle.load(file)
model = load('rf_joblib.joblib') 

with open('label_encoders.pkl', 'rb') as file:
    model_1 = pickle.load(file)

# Create a FastAPI instance
app = Flask(__name__)
CORS(app)

# Define a data model for input
class TicketInput(BaseModel):
    airline: str
    source_city: str
    departure_time: str
    stops: str
    destination_city: str
    class_x: str
    days_left: int

# Define the endpoint to predict ticket price
@app.route("/predict_price", methods=["POST"])
def predict_price():
    print(request.json)
    ticket = request.json
    #Convert input data into a format that the model expects
    data =  [model_1['airline'].transform([ticket["airline"]])[0],
        model_1['source_city'].transform([ticket["source_city"]])[0],
        model_1['departure_time'].transform([ticket["departure_time"]])[0],
        model_1['stops'].transform([ticket["stops"]])[0],
        model_1['destination_city'].transform([ticket["destination_city"]])[0],
        model_1['class'].transform([ticket["class_x"]])[0],        
        ticket["days_left"]
    ]
    
    
    # Use the model for prediction
    predicted_price = model.predict([data])[0]  # Assuming the model is ready for predictions
    print(predicted_price)
    connection = pymysql.connect(host='34.139.11.207',
                             user='root',
                             password='Adi*06tya*06',
                             db='FLight_Management_System', ##add your schema name here
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
    cur = connection.cursor()
    sql = """insert into `Persons` (Name, Price)
         values (%s, %s)
    """
    cur.execute(sql,(ticket["name"], str(predicted_price)))
    connection.commit()

    # sqlQuery    = "select * from Persons"
    # cur.execute(sqlQuery)
    # rows = cur.fetchall()
    # for row in rows:
    #     print(row)
    return jsonify({"prediction": predicted_price})

@app.route("/submits", methods=["GET"])
def read_submits():
    connection = pymysql.connect(host='34.139.11.207',
                             user='root',
                             password='Adi*06tya*06',
                             db='FLight_Management_System', ##add your schema name here
                             charset='utf8mb4',
                             cursorclass=pymysql.cursors.DictCursor)
    cur = connection.cursor()
    sqlQuery = "select * from Persons"
    cur.execute(sqlQuery)
    rows = cur.fetchall()
    return jsonify({"rows": rows})

@app.route("/", methods=["GET"])
def read_root():
    return jsonify({"Hello": "World"})

app.run()