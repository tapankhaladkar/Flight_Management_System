import { useEffect, useState } from "react";
import axios from 'axios';


function BasicButtonExample() {
    const [airline, setAirline] = useState("");
    const [scity, setScity] = useState("");
    const [dcity, setDcity] = useState("");
    const [dtime, setDtime] = useState("");
    const [days_left, setDaysleft] = useState("");
    const [clas, setClas] = useState("");
    const [stops, setStops] = useState("");
    const [message, setMessage] = useState("");
    const [name, setName] = useState("");
    const [rows, setRows] = useState([])

    // axios.get("http://127.0.0.1:5000/")
    // .then((res) => {
    //     console.log(res.data.Hello);
    //     setMessage(res.data.Hello)}
    // )
    useEffect(() => refreshTable(), [])

    let handleSubmit = async (e) => {
        e.preventDefault();
        axios.post(`http://127.0.0.1:5000/predict_price`, {
            "airline":airline,
            "source_city":scity,
            "destination_city":dcity,
            "departure_time":dtime,
            "days_left":days_left,
            "class_x":clas,
            "stops":stops,
            "name": name
        
    })
        .then(res => {
            setMessage(res.data.prediction);
            refreshTable();
        })
      };

      function refreshTable() {
        axios.get("http://127.0.0.1:5000/submits")
        .then((res) => {setRows(res.data.rows)}
        )
      }

  return (
    <div class="jumbotron" style={{width: "80vw", marginLeft: "10vw"}} id="formLink">
  <h1 class="display-4">Unlocking Skies: Predicting Airfare, One Algorithm at a Time</h1>
  <p class="lead">
    Please fill your desired information for the fields given below and find the best possible price for your journey. We aim to leverage travel data and provide our customers with the best possible pricing prediction based on the desired locations, class, stops etc.
  </p>
  <p class="lead">&#x20B9; {message}</p>
  <hr class="my-4"/>
    <section>
        <form onSubmit={handleSubmit}>
        <br/>
        <div class="form-group row">
        <div class="input-group mb-2 p-2">
                <input type="text" class="form-control" placeholder="Full Name" aria-label="Username" aria-describedby="basic-addon1" onChange={(e) => setName(e.target.value)} value={name} required/>
        </div>
            <div class="row">
                <div class="col-6">
                    <div class="form-group row p-2">
                        <select class="form-select" aria-label="Default select example" onChange={(e) => setAirline(e.target.value)} value={airline} required>
                        <option selected>Airline</option>
                            <option value="Indigo">Indigo</option>
                            <option value="Air_India">Air India</option>
                            <option value="SpiceJet">SpiceJet</option>
                            <option value="Vistara">Vistara</option>
                        </select>
                    </div>
                </div>
                <div class="col-6">
                    <div class="form-group row p-2">
                        <select class="form-select" aria-label="Default select example" onChange={(e) => setClas(e.target.value)} value={clas} required>
                        <option selected>Class</option>
                            <option value="Economy">Economy</option>
                            <option value="Business">Business</option>
                            {/* <option value="First-Class">First-Class</option>                 */}
                        </select>
                    </div>
                </div>
            </div>
        <br/>
        <div class="row">
            <div class="col-6">
                <div class="form-group row p-2">
                    <select class="form-select" aria-label="Default select example" onChange={(e) => setScity(e.target.value)} value={scity} required>
                    <option selected>Source City</option>
                        <option value="Mumbai">Mumbai</option>
                        <option value="Goa">Goa</option>
                        <option value="Kolkata">Kolkata</option>
                        <option value="Chennai">Chennai</option>
                        <option value="Bangalore">Bangalore</option>
                        <option value="Hyderabad">Hyderabad</option>
                        <option value="Delhi">Delhi</option>
                        <option value="Indore">Indore</option>
                    </select>
                </div>
            </div>
            <div class="col-6">
            <div class="form-group row p-2">
            <select class="form-select" aria-label="Default select example" onChange={(e) => setDcity(e.target.value)} value={dcity} required>
            <option selected>Destination City</option>
                <option value="Mumbai">Mumbai</option>
                <option value="Goa">Goa</option>
                <option value="Kolkata">Kolkata</option>
                <option value="Chennai">Chennai</option>
                <option value="Bangalore">Bangalore</option>
                <option value="Hyderabad">Hyderabad</option>
                <option value="Delhi">Delhi</option>
                <option value="Indore">Indore</option>
            </select>
        </div>
            </div>
        </div>
        <br/>
        <div class="row">
            <div class="col-6">
                    <div class="form-group row p-2">
                    <select class="form-select" aria-label="Default select example" onChange={(e) => setDtime(e.target.value)} value={dtime} required>
                    <option selected>Departure Time</option>
                        <option value="Early_Morning">Early Morning</option>
                        <option value="Morning">Morning</option>
                        <option value="Afternoon">Afternoon</option>
                        <option value="Evening">Evening</option>
                        <option value="Night">Night</option>
                    </select>
                </div>
            </div>
            <div class="col-6">
                <div class="form-group row p-2">
                <select class="form-select" aria-label="Default select example" onChange={(e) => setStops(e.target.value)} value={stops} required>
                <option selected>Stops</option>
                    <option value="zero">Zero</option>
                    <option value="one">One</option>
                    <option value="two_or_more">Two or more</option>
                </select>
            </div>   
            </div>
        </div>
        <br/>
        <div class="form-outline">
            <label class="form-label" for="typePhone">Days Left</label>
            <input type="tel" id="typePhone" class="form-control" name='days' onChange={(e) => setDaysleft(e.target.value)} value={days_left} required/>
        </div>
        <br/>
        <div class="form-group row">
            <div class="col-12 mt-3">
            <button type="submit" class="btn btn-primary" style={{width: "100%"}}>Submit</button>
            </div>
        </div>
        </div>
        </form>
        <br/>
        <br/>
        <h3 class="display-5">User Submissions Database</h3>
        <br/>
        <div class="flex justify-content-center">
        <table class="table">
            <thead class="thead-dark">
                <tr>
                <th scope="col">Name</th>
                <th scope="col">Price</th>
                </tr>
            </thead>
            <tbody>
                {rows.map((e) => (
                    <tr>
                        <td>{e.Name}</td>
                        <td>&#x20B9; {e.Price}</td>
                    </tr>
                ))}
            </tbody>
            </table>
            </div>
    </section>
</div>
  );
}

export default BasicButtonExample;