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
        return String(format: "%.0f", temperature) //убираем знаки после запятой
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
    var sistemIconNameString: String {
        switch conditionCode {
        case 200...232: return "cloud.bolt.rain.fill"
        case 300...321: return "cloud.drizzle.fill"
        case 500...531: return "cloud.rain.fill"
        case 600...622: return "cloud.snow.fill"
        case 701...781: return "smoke.fill"
        case 800: return "sun.min.fill"
        case 801...804: return "cloud.fill"
        default:
            return "nosing"
        }
    }
    
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
