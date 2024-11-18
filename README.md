![Simulator Screen Recording - iPhone 16 Pro - 2024-11-18 at 13 20 47](https://github.com/user-attachments/assets/2fa95ba4-6230-49c3-813c-ac0ece1f089a)
## Overview
The WeatherApp is a simple and user-friendly iOS application that provides real-time weather updates for any city. Users can enter the name of a city to fetch current weather data, including temperature, weather conditions, wind speed, and humidity. The app also updates the display with corresponding weather icons to visually represent conditions like sunny, cloudy, rainy, or snowy weather.
## Key Features
   1.Real-Time Weather Data: Fetches live weather information from the OpenWeatherMap API.
   
   2.City-Based Search: Users can search for weather conditions in any city worldwide. 
   
   3.Default Location Handling: Displays weather for a default city (e.g., Delhi) if no city is entered.
   
   4.Dynamic UI Updates:
          Displays weather details like temperature, weather description, wind speed, and humidity.
         Automatically updates weather icons based on the weather condition.
         Readable Timestamps: Converts weather update timestamps into user-friendly date and time formats.
         
  5.Error Handling: Gracefully handles errors, such as network issues or invalid city inputs.

## Technology Used
Frontend
    UIKit: For designing the user interface, including labels, text fields, buttons, and image views.
    Auto Layout: Ensures responsive design across different screen sizes and orientations.
    Dynamic UI Elements: UILabels, UITextFields, and UIImageViews for live data display.
    
Backend:
  OpenWeatherMap API: Provides real-time weather data in JSON format.
  NSURLSession: Fetches weather data from the API via asynchronous networking.
  JSON Parsing: Converts JSON response into usable data structures using NSJSONSerialization.

Helper Classes:
   NSDateFormatter: Formats timestamps into readable dates and times.
   String Matching: Dynamically updates weather icons based on keyword matching in weather descriptions.
   
Other Tools:
  Xcode: For application development and debugging.
  Asset Catalog: Stores weather condition images (e.g., sunny, cloudy, rainy).
