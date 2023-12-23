from fastapi import FastAPI
from pydantic import BaseModel
import pickle
from sklearn.preprocessing import LabelEncoder
from fastapi.middleware.cors import CORSMiddleware


# Load the trained model from the Pickle file
with open('rf_model.pkl', 'rb') as file:
    model = pickle.load(file)

with open('label_encoders.pkl', 'rb') as file:
    model_1 = pickle.load(file)

# Create a FastAPI instance
app = FastAPI()

origins = [
    "http://localhost:3000",
    "localhost:3000"
]


app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

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
@app.post("/predict_price")
def predict_price(ticket: TicketInput):
    #Convert input data into a format that the model expects
    data =  [model_1['airline'].transform([ticket.airline])[0],
        model_1['source_city'].transform([ticket.source_city])[0],
        model_1['departure_time'].transform([ticket.departure_time])[0],
        model_1['stops'].transform([ticket.stops])[0],
        model_1['destination_city'].transform([ticket.destination_city])[0],
        model_1['class_x'].transform([ticket.class_x])[0],        
        ticket.days_left
    ]
    
    
    # Use the model for prediction
    predicted_price = model.predict([data])[0]  # Assuming the model is ready for predictions
    print(predicted_price)
    # Return the predicted price
    #return {"predicted_price": predicted_price}
    return {"prediction": predicted_price}

@app.get("/")
def read_root():
    return {"Hello": "World"}

# import requests

# url = 'http://127.0.0.1:8000/predict_price/'
# data = {
#     "airline": "Vistara",
#     "source_city": "Mumbai",
#     "departure_time": "Morning",
#     "stops": "one",
#     "destination_city": "Goa",
#     "class_x": "ECONOMY",
#     "days_left": 5
# }

# response = requests.post(url, json=data)
# print(response.json())  # Get the predicted price