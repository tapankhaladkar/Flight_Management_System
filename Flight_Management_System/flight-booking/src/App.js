// src/App.js
import React from 'react';
import './App.css';
import Navbar from './components/Navbar';
import Header from './components/Header';
import BookingSection from './components/BookingSection';
import PlanSection from './components/PlanSection';
import BasicButtonExample from './components/Dropdown';
//import MemoriesSection from './components/MemoriesSection';


// Import other components similarly

function App() {
    return (
        <div>
            <Navbar />
            <Header />
            {/* <BookingSection /> */}
            <div>

            <BasicButtonExample/>
            </div>
            <PlanSection />
            {/* Render other components here */}
        </div>
    );
}

export default App;
