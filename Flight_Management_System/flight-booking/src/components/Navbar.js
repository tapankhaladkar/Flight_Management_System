// src/components/Navbar.js
import React from 'react';

function Navbar() {
    return (
        <nav>
            <div className="nav__logo">Udaan</div>
            <ul className="nav__links">
                <li className="link"><a href="#">Home</a></li>
                <li className="link"><a href="#">About</a></li>
                <li className="link"><a href="#">Offers</a></li>
                <li className="link"><a href="#">Seats</a></li>
                <li className="link"><a href="#">Destinations</a></li>
            </ul>
            <button className="btn2" style={{width: "10vw"}}>Contact</button>
        </nav>
    );
}

export default Navbar;
