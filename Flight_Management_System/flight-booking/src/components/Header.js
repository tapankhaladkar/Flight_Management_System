// src/components/Header.js
import React from 'react';
import head from '../assets/header.jpg'

function Header() {
    return (
        <header className="section__container header__container">
            {/* <h1 className="section__header">Find And Book<br />A Great Experience</h1> */}
            {/* <img src={head} alt="header" className="header-image" /> */}
            <div class="container">
            <img src={head} alt="Snow" style={{width:"80vw", maxHeight: "80vh"}}/>
            <div class="centered">
            <h1 className="section__header">Find And Book<br />A Great Experience</h1>
            </div>
            </div>
        </header>
    );
}

export default Header;
