//
//  CurrentWeatherData.swift
//  Winter
//
//  Created by Danya on 12.10.2021.
//

import Foundation

struct CurrentWeatherData: Decodable {
    
    let name: String
    let main: Main
    let weather: [Weather]
    
    
}

struct Main: Decodable {
    let temp: Double
    let FeelsLike: Double
    let pressure: Double
    let humidity: Double
    let tempMin: Double
    let tempMax: Double
    
    enum CodingKeys: String, CodingKey {
        case temp
        case FeelsLike = "feels_like"
        case pressure
        case humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}

struct Weather: Decodable {
    let id: Int
}
