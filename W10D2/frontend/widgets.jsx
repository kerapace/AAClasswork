import React from "react";
import ReactDOM from "react-dom";
import Clock from "./clock.jsx";
import Tabs from "./tabs.jsx";
import Weather from "./weather.jsx";
import Autocomplete from "./autocomplete.jsx";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root")
  ReactDOM.render(<Root/>,root);
});

const Root = (props) => (
  <div><Tabs tabs={TabList}/></div>
);

const NameList = ["Jon","Jonathan","Jonathon","Jonothon","Yonatan","Johnathan","John","Jean","Nathan","Jonatan"];

const TabList = [
  {
    title: "Homepage",
    content: <h3>Welcome to our webpage!</h3>
  },
  {
    title: "Clock",
    content: <Clock/>
  },
  {
    title: "Weather",
    content: <Weather/>
  },
  {
    title: "Autocomplete",
    content: <Autocomplete names={NameList}/>
  }
];