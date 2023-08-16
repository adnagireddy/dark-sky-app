//
//  WeatherManager.swift
//  dark-sky-app
//
//  Created by Ananya Nagireddy on 8/11/23.
//

import Foundation
import CoreLocation

class WeatherManager{
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> Response {
        //---------------attempt to retreve from this URL enpoint from Weather API
        let apiKey = "6ec8fe2d2f49e9532853131c50175a01"
        
                        //request requires, lat, long, and the api key variables
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(apiKey)&units=imperial") else {fatalError("URL not found")}
        
        //----------------creating server request and decoding the JSON file result
        let urlRequest = URLRequest(url: url)
                        //
        let (weatherData, response) = try await URLSession.shared.data(for: urlRequest)
                        // if request goes through, returns 200 status code, then save in var "response", else return error
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error grabbing weather from server")}
        
        let decodedWeatherData = try JSONDecoder().decode(Response.self,from: weatherData)
        
        return decodedWeatherData
    }
}


//--------"Response" is the swift object translation of the JSON data from OpenWeather
struct Response: Decodable {
    var coord: CoordinatesResult
    var weather: [WeatherResult]
    var main: MainResult
    var name: String
    var wind: WindResult

    struct CoordinatesResult: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResult: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResult: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResult: Decodable {
        var speed: Double
        var deg: Double
    }
}
