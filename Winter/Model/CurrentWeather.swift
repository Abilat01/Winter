//
//  CurrentWeather.swift
//  Winter
//
//  Created by Danya on 13.10.2021.
//

import Foundation

struct CurrentWeather {
    
    let cityName: String
    
    let temperature: Double
    var temperatureString: String {
        return "\(temperature.rounded())"
    }
    
    let feelLikeTempirature: Double
    var feelLikeTempiratureString: String {
        return "\(feelLikeTempirature.rounded())"
    }
    
    let humidity: Double
    var humidityString: String {
        return "\(humidity.rounded())"
    }
    
    let pressure: Double
    var pressureString: String {
        return "\(pressure.rounded())"
    }
    
    let tempiratureMin: Double
    var tempiratureMinString: String {
        return "\(tempiratureMin.rounded())"
    }
    
    let tempiratureMax: Double
    var tempiratureMaxString: String {
        return "\(tempiratureMax.rounded())"
    }
    
    let conditionCode: Int
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        temperature = currentWeatherData.main.temp
        feelLikeTempirature = currentWeatherData.main.FeelsLike
        humidity = currentWeatherData.main.humidity
        pressure = currentWeatherData.main.pressure
        tempiratureMin = currentWeatherData.main.tempMin
        tempiratureMax = currentWeatherData.main.tempMax
        conditionCode = currentWeatherData.weather.first!.id
        
    }
    
}
