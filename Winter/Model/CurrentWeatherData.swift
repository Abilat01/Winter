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
    
    enum CodingKeys: String, CodingKey {
        case temp
        case FeelsLike = "feels_like"
        case pressure
        case humidity
    }
}

struct Weather: Decodable {
    let id: Int
}
