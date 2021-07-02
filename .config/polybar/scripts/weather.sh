#!/bin/bash

# Current temperature in celsius:
# exec = busctl --user -j call io.ntfd /weather openweathermap.strings CurrentTemperature s "celsius" | jq -r '.data[0]'
# Forecast temperature in fahrenheit:
# exec = busctl --user -j call io.ntfd /weather openweathermap.strings CurrentTemperature s "fahrenheit" | jq -r '.data[0]'
# exec = busctl --user -j get-property io.ntfd /weather openweathermap.strings RenderedTemplate | jq -r .data

weather_data=$(busctl --user -j get-property io.ntfd /weather openweathermap.strings RenderedTemplate 2>/dev/null)
echo "$weather_data" | jq -r .data
