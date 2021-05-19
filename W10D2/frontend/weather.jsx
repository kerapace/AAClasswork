import React from "react";

export default class Weather extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      currentCity: "",
      temperature: ""
    };
  }

  componentDidMount() {
    this.location = navigator.geolocation.getCurrentPosition((loc) => {
      const xhr = new XMLHttpRequest();
      xhr.onload = () => {this.updateWeather(JSON.parse(xhr.response));}
      xhr.open("GET", 
      `http://api.openweathermap.org/data/2.5/weather?lat=${loc.coords.latitude}&lon=${loc.coords.longitude}&APPID=43433c239ca63b595bca38181855e909&units=imperial`);
      xhr.send();
    });
  }

  updateWeather(data) {
    this.setState({currentCity: data["name"], temperature: data["main"]["temp"]});
  }
  
  render() {
    return (
      <div className="weather">
        <h2>The current temperature in {this.state.currentCity} is {this.state.temperature}°F</h2>
      </div>
    );
  }
}