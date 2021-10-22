//
//  NetworkManager.swift
//  Winter
//
//  Created by Danya on 12.10.2021.
//

import Foundation
import CoreLocation

struct NetworkManager {
    
    let session = URLSession(configuration: .default)
    
    enum RequestType {
        case cityName(city: String)
        case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    }
    
    var onComplition: ((CurrentWeather) -> Void)?
    
    func fetchCurrentWeather(forRequestType requestType: RequestType) {
        var urlString = ""
        switch requestType {
        case .cityName(let city):
            urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(APIKey)&units=metric&lang=ru"
        case .coordinate(let latitude, let longitude):
            urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(APIKey)&units=metric&lang=ru"
        }
        perfomeRequest(withURLString: urlString)
    }
    
    func perfomeRequest(withURLString urlString: String) {
        guard let url = URL(string: urlString) else { return }
        
        let task = session.dataTask(with: url) { (data, response, error) in
            
            if let data = data {
                if let currentWeather = self.parseJSON(withData: data) {
                    self.onComplition?(currentWeather)
                }
            }
            
        } //запрос данных
        task.resume()
    }
    
    func parseJSON(withData data: Data) -> CurrentWeather? {
        let decoder = JSONDecoder()
        
        do {
            let currentWeatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            guard let currentWeather = CurrentWeather(currentWeatherData: currentWeatherData) else {
                return nil
            }
            return currentWeather
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return nil
    }
    
}
